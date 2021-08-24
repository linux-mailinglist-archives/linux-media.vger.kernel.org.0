Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3F0D3F6945
	for <lists+linux-media@lfdr.de>; Tue, 24 Aug 2021 20:55:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233794AbhHXSzo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Aug 2021 14:55:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233802AbhHXSzo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Aug 2021 14:55:44 -0400
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3CEEC061764
        for <linux-media@vger.kernel.org>; Tue, 24 Aug 2021 11:54:59 -0700 (PDT)
Received: by mail-pf1-x431.google.com with SMTP id 2so5121200pfo.8
        for <linux-media@vger.kernel.org>; Tue, 24 Aug 2021 11:54:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ejbmRhsl8eEDMqOR7QsW6DWjxRhBPlTC6UD85b2Pd5Q=;
        b=kNsugfaWB0H/9sPnfoLhZ9nefDvQnoBFWQuUmPR4LiwAcXn1pIl0qkofQVNOXvPMB+
         kCgEniCrmIVdYtN1JwtMGOxMgerr/LA+FfrCAAsCmO7vLcYY7/F2tKGWorVgzQLWXa3z
         pAFhAFub+AMG/T5C54Wim81sLTRYtleoU2FRwpFJb67XTrBPUpbTzxWpKGQ/q2Rljoy4
         SyZWHqHMs0jl743Bo4Vpt+ifIxfC/B+xQhdQfKLkbMNsiY2aZWNw7w2g1gtCmDeqb8+5
         P0Mz8G/9zcMUuTT0RgBeWyiAIakQnfWpHop8hyjmIP0D3AgOkjoXjBFhSXNBzCES38tM
         iUMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ejbmRhsl8eEDMqOR7QsW6DWjxRhBPlTC6UD85b2Pd5Q=;
        b=OFDc6+rINBDRGCXX3IxcbaLkJhUfym0rSfK871msBDCfivYoEyHT9YwpSkjN3kkuRo
         aZeQ5MkNj6o7pN/mBj8qEw1zxZK7tlq+x0TAHykBhCNXzrJDwn6p2rwNnRwJCctt0Sj/
         i1s15Tm0dw6N/Ymzp/jHMLrkD6vC0c3wjqBhsnpXCZOnbYyT+LsRlnm2Vgy15DRMAiAr
         QiXk+S6o8TODtWujkzZtd1zQ4HGuNCOTaCpZ/qBF5By7t3SCBHTQsNadF6+E+0CqH0+L
         jdHvEAChh8EogMtmkkI44wcU6anv/j7rNsn3iFgrMEqkMkiFaq6TCKVcNWq03+4/CYLd
         ZBpw==
X-Gm-Message-State: AOAM531SlWwvZECdZCDy/kwljoX4JPyKerstrOXS7BeLwAzQdNfJPw+8
        X59hk9NfJvSoZKUPmpevxsqkWg==
X-Google-Smtp-Source: ABdhPJzluksJ5TfJKXl7vWcFB/DM2Kcv0sl121p0v3FHEV7C+1JBJSeJc28kJ4/SuoYwwAVqlQOtnw==
X-Received: by 2002:a62:5c6:0:b029:341:e0b1:a72c with SMTP id 189-20020a6205c60000b0290341e0b1a72cmr40745680pff.71.1629831298934;
        Tue, 24 Aug 2021 11:54:58 -0700 (PDT)
Received: from google.com ([2401:fa00:1:10:4a93:46f4:da9a:4371])
        by smtp.gmail.com with ESMTPSA id 21sm19775743pfh.103.2021.08.24.11.54.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Aug 2021 11:54:58 -0700 (PDT)
Date:   Wed, 25 Aug 2021 02:54:53 +0800
From:   Tzung-Bi Shih <tzungbi@google.com>
To:     Irui Wang <irui.wang@mediatek.com>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Tzung-Bi Shih <tzungbi@chromium.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Tomasz Figa <tfiga@google.com>, Yong Wu <yong.wu@mediatek.com>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        Maoguang Meng <maoguang.meng@mediatek.com>,
        Longfei Wang <longfei.wang@mediatek.com>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        Fritz Koenig <frkoenig@chromium.org>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        srv_heupstream@mediatek.com, linux-mediatek@lists.infradead.org,
        Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH 6/9] media: mtk-vcodec: Add new venc drv interface for
 frame_racing mode
Message-ID: <YSVAfbC93/PzPuuZ@google.com>
References: <20210816105934.28265-1-irui.wang@mediatek.com>
 <20210816105934.28265-7-irui.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210816105934.28265-7-irui.wang@mediatek.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Aug 16, 2021 at 06:59:31PM +0800, Irui Wang wrote:
> Frame-racing mode encoding need more venc working buffers, it
> will break the compatibility if we just add venc_vsi in AP-Kernel
> but not in firmware, so add a new venc driver interface to
> distinguish the sigle_core_mode and frame_racing mode.
> 
> The new driver interface can be used for different codecs in
> the future.
The patch contains more code than the commit message explains that I couldn't understand.  Only find some nits.

> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_util.c
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_util.c
> @@ -9,6 +9,7 @@
>  
>  #include "mtk_vcodec_drv.h"
>  #include "mtk_vcodec_util.h"
> +#include "mtk_vcodec_enc_hw.h"
Please try to maintain the order.

> +void __iomem *mtk_get_venc_comp_reg_addr(struct mtk_vcodec_ctx *data,
> +					 unsigned int hw_id)
> +{
> +	struct mtk_vcodec_ctx *ctx = (struct mtk_vcodec_ctx *)data;
typeof(ctx) == typeof(data), rename the function argument 'data' to 'ctx'.

> +static int venc_alloc_work_buf(struct venc_common_inst *inst)
> +{
> +	int i;
> +	int ret = 0;
It doesn't need to be initialized.  See comment below.

> +	mtk_vcodec_debug_leave(inst);
> +
> +	return ret;
It is more clear if just return 0 here.  In the meantime, ret doesn't need to be initialized.

> +static unsigned int venc_wait_comp_done(struct venc_common_inst *inst,
> +					unsigned int hw_id)
> +{
> +	unsigned int irq_status = 0;
> +	struct mtk_vcodec_ctx *ctx = (struct mtk_vcodec_ctx *)inst->ctx;
No need to cast.

> +static int venc_encode_sps(struct venc_common_inst *inst,
> +			   struct mtk_vcodec_mem *bs_buf,
> +			   unsigned int *bs_size)
> +{
> +	int ret = 0;
Same.

> +	*bs_size = venc_read_reg(inst, VENC_PIC_BITSTREAM_BYTE_CNT,
> +				 MTK_VENC_CORE0);
> +	mtk_vcodec_debug(inst, "bs size %d <-", *bs_size);
> +
> +	return ret;
Same.

> +static int venc_encode_pps(struct venc_common_inst *inst,
> +			   struct mtk_vcodec_mem *bs_buf,
> +			   unsigned int *bs_size)
> +{
> +	int ret = 0;
Same.

> +	*bs_size = venc_read_reg(inst, VENC_PIC_BITSTREAM_BYTE_CNT,
> +				 MTK_VENC_CORE0);
> +	mtk_vcodec_debug(inst, "bs size %d <-", *bs_size);
> +
> +	return ret;
Same.

> +static int venc_encode_header(struct venc_common_inst *inst,
> +			      struct mtk_vcodec_mem *bs_buf,
> +			      unsigned int *bs_size)
> +{
> +	int ret = 0;
Same.

> +	memcpy(bs_buf->va + bs_size_sps, inst->pps_buf.va, bs_size_pps);
> +	*bs_size = bs_size_sps + bs_size_pps;
> +
> +	return ret;
Same.

> +static int venc_encode_frame(struct venc_common_inst *inst,
> +			     struct venc_frm_buf *frm_buf,
> +			     struct mtk_vcodec_mem *bs_buf,
> +			     unsigned int *bs_size,
> +			     int hw_id)
> +{
> +	int ret = 0;
Same.

> +	++inst->frm_cnt;
> +	mtk_vcodec_debug(inst, "frm %d bs_size %d key_frm %d <-",
> +			 inst->frm_cnt, *bs_size, inst->vpu_inst.is_key_frm);
> +
> +	return ret;
Same.

> +static void h264_encode_filler(struct venc_common_inst *inst, void *buf,
> +			       int size)
> +{
> +	unsigned char *p = buf;
> +
> +	if (size < H264_FILLER_MARKER_SIZE) {
> +		mtk_vcodec_err(inst, "filler size too small %d", size);
> +		return;
> +	}
> +
> +	memcpy(p, h264_filler_marker, ARRAY_SIZE(h264_filler_marker));
Replace ARRAY_SIZE(h264_filler_marker) to H264_FILLER_MARKER_SIZE.

> +static int venc_init(struct mtk_vcodec_ctx *ctx)
> +{
> +	int i;
> +	int ret = 0;
> +	struct venc_common_inst *inst;
> +
> +	inst = kzalloc(sizeof(*inst), GFP_KERNEL);
> +	if (!inst)
> +		return -ENOMEM;
> +
> +	inst->ctx = ctx;
> +	inst->vpu_inst.ctx = ctx;
> +	inst->vpu_inst.id = SCP_IPI_VENC_H264;
> +
> +	mtk_vcodec_debug_enter(inst);
> +
> +	ret = vpu_enc_init(&inst->vpu_inst);
> +
> +	inst->vsi = (struct venc_vsi *)inst->vpu_inst.vsi;
No need to cast.

> +static int venc_encode(void *handle,
> +		       enum venc_start_opt opt,
> +		       struct venc_frm_buf *frm_buf,
> +		       struct mtk_vcodec_mem *bs_buf,
> +		       struct venc_done_result *result)
> +{
> +	int ret;
> +	struct venc_common_inst *inst = (struct venc_common_inst *)handle;
No need to cast.

> +	default:
> +		mtk_vcodec_err(inst, "venc_start_opt %d not supported", opt);
> +		return -EINVAL;
> +	}
> +
> +	return ret;
It is more clear if just return 0 here.

> +static int venc_set_param(void *handle,
> +			  enum venc_set_param_type type,
> +			  struct venc_enc_param *enc_prm)
> +{
> +	int ret = 0;
> +	struct venc_common_inst *inst = (struct venc_common_inst *)handle;
No need to cast.

> +static int venc_deinit(void *handle)
> +{
> +	int ret = 0;
Same.

> +	struct venc_common_inst *inst = (struct venc_common_inst *)handle;
No need to cast.

> +	mtk_vcodec_debug_leave(inst);
> +	kfree(inst);
> +
> +	return ret;
Same.
