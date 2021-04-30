Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3710C36FFBB
	for <lists+linux-media@lfdr.de>; Fri, 30 Apr 2021 19:36:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230495AbhD3Rha (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Apr 2021 13:37:30 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56]:2974 "EHLO
        frasgout.his.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229750AbhD3Rh3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Apr 2021 13:37:29 -0400
Received: from fraeml714-chm.china.huawei.com (unknown [172.18.147.200])
        by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4FWztB25k8z6wjs0;
        Sat,  1 May 2021 01:30:58 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml714-chm.china.huawei.com (10.206.15.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 30 Apr 2021 19:36:39 +0200
Received: from localhost (10.52.125.96) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Fri, 30 Apr
 2021 18:36:38 +0100
Date:   Fri, 30 Apr 2021 18:35:03 +0100
From:   Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
CC:     <linuxarm@huawei.com>, <mauro.chehab@huawei.com>,
        Jean-Christophe Trotin <jean-christophe.trotin@st.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>
Subject: Re: [PATCH v4 58/79] media: sti/hva: use
 pm_runtime_resume_and_get()
Message-ID: <20210430183503.00002a9e@Huawei.com>
In-Reply-To: <58543e7897c8700b5529182343e189a6345ff5d2.1619621413.git.mchehab+huawei@kernel.org>
References: <cover.1619621413.git.mchehab+huawei@kernel.org>
        <58543e7897c8700b5529182343e189a6345ff5d2.1619621413.git.mchehab+huawei@kernel.org>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; i686-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.52.125.96]
X-ClientProxiedBy: lhreml721-chm.china.huawei.com (10.201.108.72) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 28 Apr 2021 16:52:19 +0200
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> Commit dd8088d5a896 ("PM: runtime: Add pm_runtime_resume_and_get to deal with usage counter")
> added pm_runtime_resume_and_get() in order to automatically handle
> dev->power.usage_count decrement on errors.
> 
> While the hva driver does it right, there are lots of errors
> on other drivers due to its misusage. So, let's change
> this driver to also use pm_runtime_resume_and_get(), as we're
> doing similar changes all over the media subsystem.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Bit of a fiddly one, but looks right to me.
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

> ---
>  drivers/media/platform/sti/hva/hva-hw.c | 17 +++++++++--------
>  1 file changed, 9 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/media/platform/sti/hva/hva-hw.c b/drivers/media/platform/sti/hva/hva-hw.c
> index f59811e27f51..77b8bfa5e0c5 100644
> --- a/drivers/media/platform/sti/hva/hva-hw.c
> +++ b/drivers/media/platform/sti/hva/hva-hw.c
> @@ -270,9 +270,8 @@ static unsigned long int hva_hw_get_ip_version(struct hva_dev *hva)
>  	struct device *dev = hva_to_dev(hva);
>  	unsigned long int version;
>  
> -	if (pm_runtime_get_sync(dev) < 0) {
> +	if (pm_runtime_resume_and_get(dev) < 0) {
>  		dev_err(dev, "%s     failed to get pm_runtime\n", HVA_PREFIX);
> -		pm_runtime_put_noidle(dev);
>  		mutex_unlock(&hva->protect_mutex);
>  		return -EFAULT;
>  	}
> @@ -386,10 +385,10 @@ int hva_hw_probe(struct platform_device *pdev, struct hva_dev *hva)
>  	pm_runtime_set_suspended(dev);
>  	pm_runtime_enable(dev);
>  
> -	ret = pm_runtime_get_sync(dev);
> +	ret = pm_runtime_resume_and_get(dev);
>  	if (ret < 0) {
>  		dev_err(dev, "%s     failed to set PM\n", HVA_PREFIX);
> -		goto err_pm;
> +		goto err_clk;
>  	}
>  
>  	/* check IP hardware version */
> @@ -462,6 +461,7 @@ int hva_hw_execute_task(struct hva_ctx *ctx, enum hva_hw_cmd_type cmd,
>  	u8 client_id = ctx->id;
>  	int ret;
>  	u32 reg = 0;
> +	bool got_pm = false;
>  
>  	mutex_lock(&hva->protect_mutex);
>  
> @@ -469,12 +469,13 @@ int hva_hw_execute_task(struct hva_ctx *ctx, enum hva_hw_cmd_type cmd,
>  	enable_irq(hva->irq_its);
>  	enable_irq(hva->irq_err);
>  
> -	if (pm_runtime_get_sync(dev) < 0) {
> +	if (pm_runtime_resume_and_get(dev) < 0) {
>  		dev_err(dev, "%s     failed to get pm_runtime\n", ctx->name);
>  		ctx->sys_errors++;
>  		ret = -EFAULT;
>  		goto out;
>  	}
> +	got_pm = true;
>  
>  	reg = readl_relaxed(hva->regs + HVA_HIF_REG_CLK_GATING);
>  	switch (cmd) {
> @@ -537,7 +538,8 @@ int hva_hw_execute_task(struct hva_ctx *ctx, enum hva_hw_cmd_type cmd,
>  		dev_dbg(dev, "%s     unknown command 0x%x\n", ctx->name, cmd);
>  	}
>  
> -	pm_runtime_put_autosuspend(dev);
> +	if (got_pm)
> +		pm_runtime_put_autosuspend(dev);
>  	mutex_unlock(&hva->protect_mutex);
>  
>  	return ret;
> @@ -553,9 +555,8 @@ void hva_hw_dump_regs(struct hva_dev *hva, struct seq_file *s)
>  
>  	mutex_lock(&hva->protect_mutex);
>  
> -	if (pm_runtime_get_sync(dev) < 0) {
> +	if (pm_runtime_resume_and_get(dev) < 0) {
>  		seq_puts(s, "Cannot wake up IP\n");
> -		pm_runtime_put_noidle(dev);
>  		mutex_unlock(&hva->protect_mutex);
>  		return;
>  	}

