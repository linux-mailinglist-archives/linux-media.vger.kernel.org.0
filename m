Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0AF20215E5
	for <lists+linux-media@lfdr.de>; Fri, 17 May 2019 11:06:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728436AbfEQJFq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 May 2019 05:05:46 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:64726 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727338AbfEQJFq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 May 2019 05:05:46 -0400
X-UUID: 7e0adf44dfaf4e61a3e5cfc579ddbcb2-20190517
X-UUID: 7e0adf44dfaf4e61a3e5cfc579ddbcb2-20190517
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by mailgw02.mediatek.com
        (envelope-from <ck.hu@mediatek.com>)
        (mhqrelay.mediatek.com ESMTP with TLS)
        with ESMTP id 492930839; Fri, 17 May 2019 17:05:35 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs03n1.mediatek.inc (172.21.101.181) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 17 May 2019 17:05:34 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Fri, 17 May 2019 17:05:34 +0800
Message-ID: <1558083934.29098.6.camel@mtksdaap41>
Subject: Re: [PATCH v3 09/13] [media] mtk-mipicsi: add ISR for writing the
 data to buffer
From:   CK Hu <ck.hu@mediatek.com>
To:     Stu Hsieh <stu.hsieh@mediatek.com>
CC:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "Matthias Brugger" <matthias.bgg@gmail.com>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>, <srv_heupstream@mediatek.com>
Date:   Fri, 17 May 2019 17:05:34 +0800
In-Reply-To: <1557814430-9675-10-git-send-email-stu.hsieh@mediatek.com>
References: <1557814430-9675-1-git-send-email-stu.hsieh@mediatek.com>
         <1557814430-9675-10-git-send-email-stu.hsieh@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK:  N
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi, Stu:

On Tue, 2019-05-14 at 14:13 +0800, Stu Hsieh wrote:
> This patch add ISR for writing the data to buffer
> 
> When mipicsi HW complete to write the data in buffer,
> the interrupt woulb be trigger.
> So, the ISR need to clear interrupt status for next interrupt.
> 
> Signed-off-by: Stu Hsieh <stu.hsieh@mediatek.com>
> ---
>  .../media/platform/mtk-mipicsi/mtk_mipicsi.c  | 110 ++++++++++++++++++
>  1 file changed, 110 insertions(+)
> 
> diff --git a/drivers/media/platform/mtk-mipicsi/mtk_mipicsi.c b/drivers/media/platform/mtk-mipicsi/mtk_mipicsi.c
> index 44c01c8d566b..af5655345754 100644
> --- a/drivers/media/platform/mtk-mipicsi/mtk_mipicsi.c
> +++ b/drivers/media/platform/mtk-mipicsi/mtk_mipicsi.c
> @@ -36,6 +36,7 @@
>  #include <linux/pm_runtime.h>
>  #include <linux/iommu.h>
>  #include <linux/of.h>
> +#include <linux/of_irq.h>
>  #include <linux/of_platform.h>
>  #include <media/v4l2-common.h>
>  #include <media/v4l2-dev.h>
> @@ -93,6 +94,8 @@
>  #define CAMSV_MODULE_EN					0x10
>  #define CAMSV_FMT_SEL					0x14
>  #define CAMSV_INT_EN					0x18
> +#define CAMSV_INT_STATUS				0x1C
> +#define PASS1_DONE_STATUS				10
>  #define CAMSV_SW_CTL					0x20
>  #define CAMSV_CLK_EN					0x30
>  
> @@ -122,6 +125,8 @@ struct mtk_mipicsi_dev {
>  	struct platform_device *pdev;
>  	unsigned int camsv_num;
>  	struct device *larb_pdev;
> +	unsigned int		irq[MTK_CAMDMA_MAX_NUM];
> +	bool irq_status[MTK_CAMDMA_MAX_NUM];
>  	void __iomem		*ana;
>  	void __iomem		*seninf_ctrl;
>  	void __iomem		*seninf;
> @@ -132,6 +137,7 @@ struct mtk_mipicsi_dev {
>  	spinlock_t		lock;
>  	spinlock_t		queue_lock;
>  	struct mtk_mipicsi_buf	cam_buf[MAX_BUFFER_NUM];
> +	bool			is_enable_irq[MTK_CAMDMA_MAX_NUM];

Useless, so remove it.

>  	bool streamon;
>  	unsigned int link;
>  	u8 link_reg_val;
> @@ -911,9 +917,96 @@ static const struct dev_pm_ops mtk_mipicsi_pm = {
>  		mtk_mipicsi_pm_resume, NULL)
>  };
>  
> +static int get_irq_channel(struct mtk_mipicsi_dev *mipicsi)
> +{
> +	int ch;
> +	u32 int_reg_val;
> +
> +	for (ch = 0; ch < mipicsi->camsv_num; ++ch) {
> +		int_reg_val = readl(mipicsi->camsv[ch] + CAMSV_INT_STATUS);
> +		if ((int_reg_val & (1UL << PASS1_DONE_STATUS)) != 0UL)
> +			return ch;
> +	}
> +
> +	return -1;
> +}
> +
> +static void mtk_mipicsi_irq_buf_process(struct mtk_mipicsi_dev *mipicsi)
> +{
> +	unsigned int i = 0U;
> +	struct mtk_mipicsi_buf *new_cam_buf = NULL;
> +	struct mtk_mipicsi_buf *tmp = NULL;
> +	unsigned int index = 0U;
> +	unsigned int next = 0U;
> +
> +	for (i = 0U; i < MTK_CAMDMA_MAX_NUM; ++i)
> +		mipicsi->irq_status[i] = false;
> +
> +	i = 0;
> +
> +	/* only one buffer left */
> +	if ((&(mipicsi->fb_list))->next->next == &(mipicsi->fb_list))
> +		return;
> +
> +	/*for each fb_lst 2 times to get the top 2 buffer.*/
> +	list_for_each_entry_safe(new_cam_buf, tmp,
> +		&(mipicsi->fb_list), queue) {
> +		if (i == 0U) {
> +			index = new_cam_buf->vb->index;
> +		} else {
> +			next = new_cam_buf->vb->index;
> +			break;
> +		}
> +		++i;
> +	}
> +
> +	/*
> +	 * fb_list has one more buffer. Free the first buffer to user
> +	 * and fill the second buffer to HW.
> +	 */
> +	vb2_buffer_done(mipicsi->cam_buf[index].vb,
> +		VB2_BUF_STATE_DONE);
> +
> +	list_del_init(&(mipicsi->cam_buf[index].queue));
> +}
> +
> +static irqreturn_t mtk_mipicsi_isr(int irq, void *data)
> +{
> +
> +	struct mtk_mipicsi_dev *mipicsi = data;
> +	unsigned long flags = 0;
> +	int isr_ch;
> +	u8 irq_cnt = 0, i = 0;
> +
> +	spin_lock_irqsave(&mipicsi->lock, flags);
> +
> +	isr_ch = get_irq_channel(mipicsi);

I think you should pass data as camsv instance, so you need not to
search the camsv instance, and each camsv instance could pointer to the
same misicsi instance.

> +	if (isr_ch < 0) {
> +		spin_unlock_irqrestore(&mipicsi->lock, flags);
> +		return IRQ_HANDLED;
> +	}
> +
> +	/* clear interrupt */
> +	writel(1UL << PASS1_DONE_STATUS,
> +		mipicsi->camsv[isr_ch] + CAMSV_INT_STATUS);
> +	mipicsi->irq_status[isr_ch] = true;
> +	for (i = 0U; i < MTK_CAMDMA_MAX_NUM; ++i) {
> +		if (mipicsi->irq_status[i])
> +			++irq_cnt;
> +	}
> +
> +	if (irq_cnt == mipicsi->link)
> +		mtk_mipicsi_irq_buf_process(mipicsi);

I think mtk_mipicsi_irq_buf_process() should not be processed in irq
handler. In irq handler, do as few things as possible.

Regards,
CK

> +	spin_unlock_irqrestore(&mipicsi->lock, flags);
> +
> +	return IRQ_HANDLED;
> +}
> +
>  static int seninf_mux_camsv_node_parse(struct mtk_mipicsi_dev *mipicsi,
>  		int index)
>  {
> +	int ret;
> +	int irq;
>  	struct clk *clk = NULL;
>  	struct device *dev = NULL;
>  	struct resource *res = NULL;
> @@ -951,6 +1044,23 @@ static int seninf_mux_camsv_node_parse(struct mtk_mipicsi_dev *mipicsi,
>  	}
>  	mipicsi->clk[index] = clk;
>  
> +	irq = of_irq_get(np, 0);
> +	if (irq <= 0) {
> +		dev_err(dev, "get irq fail in %s node\n", np->full_name);
> +		return -ENODEV;
> +	}
> +	mipicsi->irq[index] = irq;
> +
> +	ret = devm_request_irq(dev, irq,
> +			mtk_mipicsi_isr, 0,
> +			mipicsi->drv_name, mipicsi);
> +	if (ret != 0) {
> +		dev_err(dev, "%s irq register failed\n", np->full_name);
> +		return -ENODEV;
> +	}
> +	disable_irq(mipicsi->irq[index]);
> +	mipicsi->irq_status[index] = false;
> +
>  	res = platform_get_resource(camdma_pdev, IORESOURCE_MEM, 0);
>  	if (res == NULL) {
>  		dev_err(dev, "get seninf_mux memory failed in %s node\n",


