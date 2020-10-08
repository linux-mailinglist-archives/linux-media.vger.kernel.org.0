Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A6CE4287501
	for <lists+linux-media@lfdr.de>; Thu,  8 Oct 2020 15:12:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728969AbgJHNMo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Oct 2020 09:12:44 -0400
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:36041 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725874AbgJHNMo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 8 Oct 2020 09:12:44 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id QVinkWY5s4gEjQViqk6qK8; Thu, 08 Oct 2020 15:12:40 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1602162760; bh=Flc3efsyrca9ViFVEyMOrzNBEntNBJ4FvOljhB5l+gc=;
        h=Subject:From:To:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=I209MuCUu8rUivwltkv6iIh3pYExwPXMsNjB2ZB++m5GfeMIr7GBECGvXWZWmYe1H
         CpC5/2LKHkWLduoTVnpBRWWtLGLAIaHlY4RHbtEfgJzFTN/M+6f5DMAPsb7rZScyhB
         2PJEV9YpV/kwQRYiKu5BDnZe/elIIilO/RKWm+D7oXL9H7UDSCTX/popPjBHHXWn7f
         qWKWApDN3eKhhP0TsT06vyVHo4ntJCLE/ZsaBvrVHNJkdHed0RTks1I2xqu9e9u9eF
         /aYemJFCPjPtTzK4ZsaAHx/nmEnKqHVBKflaEmxqpw00rzuO3Hjt+2NqaFOa7YAPJC
         U3IK7XbcznXVg==
Subject: Re: [PATCH v2] media: mtk-vcodec: fix builds when remoteproc is
 disabled
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     Alexandre Courbot <acourbot@chromium.org>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tomasz Figa <tfiga@chromium.org>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        Randy Dunlap <rdunlap@infradead.org>
References: <20201004122234.802044-1-acourbot@chromium.org>
 <c3e1c20a-7729-9f48-ce66-41e67f195fc7@xs4all.nl>
Message-ID: <cda40a8e-4dd2-5fd7-c5ff-8b048475164b@xs4all.nl>
Date:   Thu, 8 Oct 2020 15:12:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <c3e1c20a-7729-9f48-ce66-41e67f195fc7@xs4all.nl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfJklLhmWFmtOHjdepWvgt0ev6PFrUMV1TNa/8JwSwcv1+UQ84D2XeNy3X7S3AZ5891tuYXhfxc7Vh1jAFQtgBCqwqq+C1j24+LXX0q0Zp3BcIuZwBOQP
 vLKm/6kpVpfA1XiJCBnAucSHdvRxf4K6IMOKgUakrnH0x8/rT3/fBMfbnmjeL2VYgQTMIPWtEo16ldj67eAjLo20//Wb5/+67oGcDBPRP+kU+4avZorU6E3I
 0He7qD1QjEdzN7t7DqyuZzsrTqGx7ZauV/L6xs3NN3AL6jXK0IhrZhEsSKAk147TGGlaQrhUVNBpIsSUd27X0zPAWr4/cE/XM0UlkWVi7IIfXflSJSbpzlR3
 rewV6MtVSHkDrUHh4RO6QC9hRiePJWNMHXtxQdqsHjasx6fD5T6inQUewL5x6EZ8zrnFVMjHB2jOjbe1Q6+01NsaUTxHnSs9iC3v2XKnICBOSFiaKetZYjgC
 7IQSGSe+jqLzi+YNYHYnzaHQ/zA6hJLfNwJ98g==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 08/10/2020 15:07, Hans Verkuil wrote:
> Hi Alexandre,
> 
> On 04/10/2020 14:22, Alexandre Courbot wrote:
>> The addition of MT8183 support added a dependency on the SCP remoteproc
>> module. However the initial patch used the "select" Kconfig directive,
>> which may result in the SCP module to not be compiled if remoteproc was
>> disabled. In such a case, mtk-vcodec would try to link against
>> non-existent SCP symbols. "select" was clearly misused here as explained
>> in kconfig-language.txt.
>>
>> Replace this by a "depends" directive on at least one of the VPU and
>> SCP modules, to allow the driver to be compiled as long as one of these
>> is enabled, and adapt the code to support this new scenario.
>>
>> Also adapt the Kconfig text to explain the extra requirements for MT8173
>> and MT8183.
>>
>> Reported-by: Sakari Ailus <sakari.ailus@linux.intel.com>
>> Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
>> Acked-by: Randy Dunlap <rdunlap@infradead.org> # build-tested
>> ---
>>  drivers/media/platform/Kconfig                | 10 +--
>>  .../media/platform/mtk-vcodec/mtk_vcodec_fw.c | 72 ++++++++++++-------
>>  2 files changed, 54 insertions(+), 28 deletions(-)
>>
>> diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
>> index a3cb104956d5..98eb62e49ec2 100644
>> --- a/drivers/media/platform/Kconfig
>> +++ b/drivers/media/platform/Kconfig
>> @@ -253,14 +253,16 @@ config VIDEO_MEDIATEK_VCODEC
>>  	depends on MTK_IOMMU || COMPILE_TEST
>>  	depends on VIDEO_DEV && VIDEO_V4L2
>>  	depends on ARCH_MEDIATEK || COMPILE_TEST
>> +	depends on VIDEO_MEDIATEK_VPU || MTK_SCP
> 
> Close, but no cigar.
> 
> If VIDEO_MEDIATEK_VPU=y and MTK_SCP=m, then VIDEO_MEDIATEK_VCODEC can be configured
> to y, and then it won't be able to find the scp_ functions.
> 
> To be honest, I'm not sure how to solve this.

Found it. Add this:

        depends on MTK_SCP || !MTK_SCP
        depends on VIDEO_MEDIATEK_VPU || !VIDEO_MEDIATEK_VPU

Ugly as hell, but it appears to be the correct incantation for this.

Regards,

	Hans

> 
> Regards,
> 
> 	Hans
> 
>>  	select VIDEOBUF2_DMA_CONTIG
>>  	select V4L2_MEM2MEM_DEV
>> -	select VIDEO_MEDIATEK_VPU
>> -	select MTK_SCP
>>  	help
>>  	    Mediatek video codec driver provides HW capability to
>> -	    encode and decode in a range of video formats
>> -	    This driver rely on VPU driver to communicate with VPU.
>> +	    encode and decode in a range of video formats on MT8173
>> +	    and MT8183.
>> +
>> +	    Note that support for MT8173 requires VIDEO_MEDIATEK_VPU to
>> +	    also be selected. Support for MT8183 depends on MTK_SCP.
>>  
>>  	    To compile this driver as modules, choose M here: the
>>  	    modules will be called mtk-vcodec-dec and mtk-vcodec-enc.
>> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_fw.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_fw.c
>> index 6c2a2568d844..23a80027a8fb 100644
>> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_fw.c
>> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_fw.c
>> @@ -13,6 +13,7 @@ struct mtk_vcodec_fw_ops {
>>  			    mtk_vcodec_ipi_handler handler, const char *name, void *priv);
>>  	int (*ipi_send)(struct mtk_vcodec_fw *fw, int id, void *buf,
>>  			unsigned int len, unsigned int wait);
>> +	void (*release)(struct mtk_vcodec_fw *fw);
>>  };
>>  
>>  struct mtk_vcodec_fw {
>> @@ -22,6 +23,8 @@ struct mtk_vcodec_fw {
>>  	struct mtk_scp *scp;
>>  };
>>  
>> +#if IS_ENABLED(CONFIG_VIDEO_MEDIATEK_VPU)
>> +
>>  static int mtk_vcodec_vpu_load_firmware(struct mtk_vcodec_fw *fw)
>>  {
>>  	return vpu_load_firmware(fw->pdev);
>> @@ -64,6 +67,27 @@ static int mtk_vcodec_vpu_ipi_send(struct mtk_vcodec_fw *fw, int id, void *buf,
>>  	return vpu_ipi_send(fw->pdev, id, buf, len);
>>  }
>>  
>> +static void mtk_vcodec_vpu_release(struct mtk_vcodec_fw *fw)
>> +{
>> +	put_device(&fw->pdev->dev);
>> +}
>> +
>> +static void mtk_vcodec_vpu_reset_handler(void *priv)
>> +{
>> +	struct mtk_vcodec_dev *dev = priv;
>> +	struct mtk_vcodec_ctx *ctx;
>> +
>> +	mtk_v4l2_err("Watchdog timeout!!");
>> +
>> +	mutex_lock(&dev->dev_mutex);
>> +	list_for_each_entry(ctx, &dev->ctx_list, list) {
>> +		ctx->state = MTK_STATE_ABORT;
>> +		mtk_v4l2_debug(0, "[%d] Change to state MTK_STATE_ABORT",
>> +			       ctx->id);
>> +	}
>> +	mutex_unlock(&dev->dev_mutex);
>> +}
>> +
>>  static const struct mtk_vcodec_fw_ops mtk_vcodec_vpu_msg = {
>>  	.load_firmware = mtk_vcodec_vpu_load_firmware,
>>  	.get_vdec_capa = mtk_vcodec_vpu_get_vdec_capa,
>> @@ -71,8 +95,13 @@ static const struct mtk_vcodec_fw_ops mtk_vcodec_vpu_msg = {
>>  	.map_dm_addr = mtk_vcodec_vpu_map_dm_addr,
>>  	.ipi_register = mtk_vcodec_vpu_set_ipi_register,
>>  	.ipi_send = mtk_vcodec_vpu_ipi_send,
>> +	.release = mtk_vcodec_vpu_release,
>>  };
>>  
>> +#endif  /* IS_ENABLED(CONFIG_VIDEO_MEDIATEK_VPU) */
>> +
>> +#if IS_ENABLED(CONFIG_MTK_SCP)
>> +
>>  static int mtk_vcodec_scp_load_firmware(struct mtk_vcodec_fw *fw)
>>  {
>>  	return rproc_boot(scp_get_rproc(fw->scp));
>> @@ -107,6 +136,11 @@ static int mtk_vcodec_scp_ipi_send(struct mtk_vcodec_fw *fw, int id, void *buf,
>>  	return scp_ipi_send(fw->scp, id, buf, len, wait);
>>  }
>>  
>> +static void mtk_vcodec_scp_release(struct mtk_vcodec_fw *fw)
>> +{
>> +	scp_put(fw->scp);
>> +}
>> +
>>  static const struct mtk_vcodec_fw_ops mtk_vcodec_rproc_msg = {
>>  	.load_firmware = mtk_vcodec_scp_load_firmware,
>>  	.get_vdec_capa = mtk_vcodec_scp_get_vdec_capa,
>> @@ -114,23 +148,10 @@ static const struct mtk_vcodec_fw_ops mtk_vcodec_rproc_msg = {
>>  	.map_dm_addr = mtk_vcodec_vpu_scp_dm_addr,
>>  	.ipi_register = mtk_vcodec_scp_set_ipi_register,
>>  	.ipi_send = mtk_vcodec_scp_ipi_send,
>> +	.release = mtk_vcodec_scp_release,
>>  };
>>  
>> -static void mtk_vcodec_reset_handler(void *priv)
>> -{
>> -	struct mtk_vcodec_dev *dev = priv;
>> -	struct mtk_vcodec_ctx *ctx;
>> -
>> -	mtk_v4l2_err("Watchdog timeout!!");
>> -
>> -	mutex_lock(&dev->dev_mutex);
>> -	list_for_each_entry(ctx, &dev->ctx_list, list) {
>> -		ctx->state = MTK_STATE_ABORT;
>> -		mtk_v4l2_debug(0, "[%d] Change to state MTK_STATE_ABORT",
>> -			       ctx->id);
>> -	}
>> -	mutex_unlock(&dev->dev_mutex);
>> -}
>> +#endif  /* IS_ENABLED(CONFIG_MTK_SCP) */
>>  
>>  struct mtk_vcodec_fw *mtk_vcodec_fw_select(struct mtk_vcodec_dev *dev,
>>  					   enum mtk_vcodec_fw_type type,
>> @@ -143,16 +164,22 @@ struct mtk_vcodec_fw *mtk_vcodec_fw_select(struct mtk_vcodec_dev *dev,
>>  
>>  	switch (type) {
>>  	case VPU:
>> +#if IS_ENABLED(CONFIG_VIDEO_MEDIATEK_VPU)
>>  		ops = &mtk_vcodec_vpu_msg;
>>  		fw_pdev = vpu_get_plat_device(dev->plat_dev);
>>  		if (!fw_pdev) {
>>  			mtk_v4l2_err("firmware device is not ready");
>>  			return ERR_PTR(-EINVAL);
>>  		}
>> -		vpu_wdt_reg_handler(fw_pdev, mtk_vcodec_reset_handler,
>> +		vpu_wdt_reg_handler(fw_pdev, mtk_vcodec_vpu_reset_handler,
>>  				    dev, rst_id);
>>  		break;
>> +#else
>> +		mtk_v4l2_err("no VPU support in this kernel");
>> +		return ERR_PTR(-ENODEV);
>> +#endif
>>  	case SCP:
>> +#if IS_ENABLED(CONFIG_MTK_SCP)
>>  		ops = &mtk_vcodec_rproc_msg;
>>  		scp = scp_get(dev->plat_dev);
>>  		if (!scp) {
>> @@ -160,6 +187,10 @@ struct mtk_vcodec_fw *mtk_vcodec_fw_select(struct mtk_vcodec_dev *dev,
>>  			return ERR_PTR(-EPROBE_DEFER);
>>  		}
>>  		break;
>> +#else
>> +		mtk_v4l2_err("no SCP support in this kernel");
>> +		return ERR_PTR(-ENODEV);
>> +#endif
>>  	default:
>>  		mtk_v4l2_err("invalid vcodec fw type");
>>  		return ERR_PTR(-EINVAL);
>> @@ -180,14 +211,7 @@ EXPORT_SYMBOL_GPL(mtk_vcodec_fw_select);
>>  
>>  void mtk_vcodec_fw_release(struct mtk_vcodec_fw *fw)
>>  {
>> -	switch (fw->type) {
>> -	case VPU:
>> -		put_device(&fw->pdev->dev);
>> -		break;
>> -	case SCP:
>> -		scp_put(fw->scp);
>> -		break;
>> -	}
>> +	fw->ops->release(fw);
>>  }
>>  EXPORT_SYMBOL_GPL(mtk_vcodec_fw_release);
>>  
>>
> 

