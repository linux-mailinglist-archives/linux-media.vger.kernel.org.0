Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EA2C11B2CF
	for <lists+linux-media@lfdr.de>; Mon, 13 May 2019 11:25:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728180AbfEMJYu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 May 2019 05:24:50 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:53385 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727568AbfEMJYu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 May 2019 05:24:50 -0400
Received: from [192.168.2.10] ([46.9.252.75])
        by smtp-cloud8.xs4all.net with ESMTPA
        id Q7COhiHa00YQeQ7CRhcWle; Mon, 13 May 2019 11:24:48 +0200
Subject: Re: [PATCH v2 13/15] [media] mtk-mipicsi: add the function for
 Get/Set PARM for application
To:     Stu Hsieh <stu.hsieh@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, CK Hu <ck.hu@mediatek.com>
Cc:     Mark Rutland <mark.rutland@arm.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com,
        Sakari Ailus <sakari.ailus@linux.intel.com>
References: <1555407015-18130-1-git-send-email-stu.hsieh@mediatek.com>
 <1555407015-18130-14-git-send-email-stu.hsieh@mediatek.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <8dcbaa14-29bb-8469-fc36-82e34df81737@xs4all.nl>
Date:   Mon, 13 May 2019 11:24:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1555407015-18130-14-git-send-email-stu.hsieh@mediatek.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfCfMFdvufpYlAoVkC6/FNWW97drMNqs9zzMyTIveUsIjoRhTAZz6jCYP+N8X20c09w4lo8FUspQkD+2oPhGYQTZzu2WEOh90nYKhmU2CmuyX13+n5SQv
 NtTtQ9ZiNK3Y7OWRJ14rFaq/zJtplNwHlvOGFMWE4ZQnbgMLmavgsMicqnqpWIz2uWzArRDsFKFNbDURDhXxN0TA5+Xhvk64qcRfTazx4EC409QcFbmxSMF6
 j2HyUMdR4qhn7uSi+aO5gW40JlUQKs7avOGmfq0+NLiZVjoYJ0nP9Oc/rlwfjmCC0aIHDvGfhKGoJq/zvYMucPHM1lg2Lhlmb5eQE6o1BonMkhsfzcdd8OtT
 GJVYq7W71fFh3Ysj4zzDuHbDB+RitRSZLvtBChQ2afHKdB64JHAgKxjv2XaGBgHkiD9GPYeDey6zwfPh1JsBhMBghUtrHXso+Ao5vyfH+RRy1OXyX0UiwN+y
 haivmh+uBdjzm82CPSAbZA2doMljXSuT0mP+5r1piFnfZaNR8Q+o/CByF54fRcRL6i0K0lycDgoZeXJwAQIbCS7zyv7AFUX7tWX7ABnHAIpEsZNq+8735Neu
 Re1DepiL6jzJfYazFiwy865SDnmZgaW8JwSYCPO6US6aqw==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 4/16/19 11:30 AM, Stu Hsieh wrote:
> This patch add the function for Get/Set PARM for application.
> 
> Application can get the information about number of link.
> 
> Signed-off-by: Stu Hsieh <stu.hsieh@mediatek.com>
> ---
>  .../media/platform/mtk-mipicsi/mtk_mipicsi.c  | 34 +++++++++++++++++++
>  1 file changed, 34 insertions(+)
> 
> diff --git a/drivers/media/platform/mtk-mipicsi/mtk_mipicsi.c b/drivers/media/platform/mtk-mipicsi/mtk_mipicsi.c
> index 5e4028d0d5e1..5db9c68b0da9 100644
> --- a/drivers/media/platform/mtk-mipicsi/mtk_mipicsi.c
> +++ b/drivers/media/platform/mtk-mipicsi/mtk_mipicsi.c
> @@ -346,6 +346,38 @@ static int get_subdev_link(const struct soc_camera_device *icd,
>  	return 0;
>  }
>  
> +static int mtk_mipicsi_get_parm(struct soc_camera_device *icd,
> +	struct v4l2_streamparm *a)
> +{
> +	unsigned int link = 0U;
> +	u8 link_reg_val = 0x0U;
> +	int ret = 0;
> +
> +	/*get camera link number*/
> +	ret = get_subdev_link(icd, &link, &link_reg_val);
> +	if (ret < 0)
> +		return ret;
> +
> +	a->parm.capture.timeperframe.numerator = 1;
> +	a->parm.capture.timeperframe.denominator = 30;
> +	a->parm.capture.reserved[0] = link_reg_val;
> +	a->parm.capture.reserved[1] = (u32)(icd->use_count);

No, no, don't use G/S_PARM for that. It's an awful API and other than
getting/setting the frame period it shouldn't be used for anything else.

I've CC-ed Sakari, he is the CSI specialist. I think some work was done
(or is in progress) regarding providing more CSI lane information.

> +	dev_info(icd->parent, "use count %d\n", icd->use_count);
> +
> +	return 0;
> +}
> +
> +static int mtk_mipicsi_set_param(struct soc_camera_device *icd,
> +	struct v4l2_streamparm *a)
> +{
> +	struct soc_camera_host *ici = to_soc_camera_host(icd->parent);
> +
> +	if (ici->ops->get_parm == NULL)
> +		return ici->ops->get_parm(icd, a);

This clearly was never tested since ici->ops->get_parm is NULL when
you call it. I'd drop this function altogether since there is no
point if you can make changes.

Regards,

	Hans

> +
> +	return 0;
> +}
> +
>  static u32 get_bytesperline(const u32 fmt, const u32 width)
>  {
>  	u32 bytesperline = 0;
> @@ -884,6 +916,8 @@ static struct soc_camera_host_ops mtk_soc_camera_host_ops = {
>  	.poll			= vb2_fop_poll,
>  	.querycap		= mtk_mipicsi_querycap,
>  	.set_bus_param		= mtk_mipicsi_set_bus_param,
> +	.get_parm		= mtk_mipicsi_get_parm,
> +	.set_parm		= mtk_mipicsi_set_param,
>  };
>  
>  static void mtk_mipicsi_ana_init(void __iomem *base)
> 

