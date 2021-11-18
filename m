Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E7B9455E38
	for <lists+linux-media@lfdr.de>; Thu, 18 Nov 2021 15:35:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233608AbhKROiX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 Nov 2021 09:38:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233374AbhKROiU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 Nov 2021 09:38:20 -0500
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com [IPv6:2607:f8b0:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8EB61C061748
        for <linux-media@vger.kernel.org>; Thu, 18 Nov 2021 06:35:20 -0800 (PST)
Received: by mail-il1-x132.google.com with SMTP id h23so6649996ila.4
        for <linux-media@vger.kernel.org>; Thu, 18 Nov 2021 06:35:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20210112.gappssmtp.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=5x6WOv0CKzpTKeVpOGLcGQsyAj8+hoUmQ/3ATUXLpb8=;
        b=2MjgmgAmYj3REgChVDTJNGL8QHEsE3+PPtuxSgy8vINofW4UBAhQVUcw4UOU+d8RrC
         a+o1tqz/hCpB5Io69nP6zofw75T3ZIYm6pMlzC58nltc6hmvlzVj+qSxaLROmDMJ3lNl
         ndAA2rW6VoMneSsjVXvkzg5W4VGDGgyg07TRjaj7XrfUxY2Nny9b2ly8pmP2D03Bmt6E
         inHnNp6UPRKLQD1ObvQbTZoUFp5y2hhMX1m4dOrgEYK2YxKhF0qegikWVdiB5t1rs1r/
         ASfO/0pXelf/7EPCloQv1ThLO3dne7GKkbE/GHlaLoncdi8DRfRL2nqvsJYSVPnuPIDx
         +4eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=5x6WOv0CKzpTKeVpOGLcGQsyAj8+hoUmQ/3ATUXLpb8=;
        b=WECUK8PX0o3qGZxXRGmqQ4ho03DZVjxrzOs7OCu5yY4P8ddjNBLBUX1GfdHznU4agM
         fNclU2sxNRh5BuAnXEfa/wLu1Sy/f4IR2ZaiAQA4JaUsv2OVHEVawefDqmLjZue0iA0Z
         I+BIGxShVXAG1dJ7pLoKdtPTvgpbb/x4Xax738Xch/3brvDKBjSWCgYRQdZJJN/S+IK9
         pBgyzY4jCN0lNKNwxBr6gYCrglArZVLRUcAgCRsAidVp6JJNj9BXFTII4c1aH4Nic+nv
         m3noSWgvXYYn9M5V2ICDBbYD4PLhFq+ksUON5XIUpnlzfmT9Dw08MAScBiVcHW5fULAq
         cGXA==
X-Gm-Message-State: AOAM533GxlrUeJnPJ264dZls23pAjccGh3J9Q1pFmdQQeICFJDMC6g4u
        GUGC5LCGqKuarreXxO0WRK9gxg==
X-Google-Smtp-Source: ABdhPJymz8ch3wnyxVw+4PkayYCDASDgAlJyqmmui95LJS0hfJMxUv7Ja6tfW2gCUadmUgqQ6wiY2w==
X-Received: by 2002:a05:6e02:1d9e:: with SMTP id h30mr16455668ila.138.1637246120025;
        Thu, 18 Nov 2021 06:35:20 -0800 (PST)
Received: from nicolas-tpx395.localdomain (mtl.collabora.ca. [66.171.169.34])
        by smtp.gmail.com with ESMTPSA id f2sm2476811ilu.54.2021.11.18.06.35.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Nov 2021 06:35:19 -0800 (PST)
Message-ID: <873eced9623809200c2d97e488a2a14df070d8f9.camel@ndufresne.ca>
Subject: Re: [PATCH v2 7/7] meida: mtk-vcodec: remove unused func parameter
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        linux-media@vger.kernel.org
Cc:     kernel@collabora.com, acourbot@chromium.org,
        andrew-ct.chen@mediatek.com, courbot@chromium.org,
        dafna3@gmail.com, eizan@chromium.org, houlong.wei@mediatek.com,
        hsinyi@chromium.org, hverkuil@xs4all.nl, irui.wang@mediatek.com,
        linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
        maoguang.meng@mediatek.com, matthias.bgg@gmail.com,
        mchehab@kernel.org, minghsiu.tsai@mediatek.com, tfiga@chromium.org,
        tiffany.lin@mediatek.com
Date:   Thu, 18 Nov 2021 09:35:17 -0500
In-Reply-To: <20211117130635.11633-8-dafna.hirschfeld@collabora.com>
References: <20211117130635.11633-1-dafna.hirschfeld@collabora.com>
         <20211117130635.11633-8-dafna.hirschfeld@collabora.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.1 (3.42.1-1.fc35) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Just noticed the headline typo: meida -> media

cheers,
Nicolas

Le mercredi 17 novembre 2021 à 15:06 +0200, Dafna Hirschfeld a écrit :
> The prarameter bs_size to function vpu_enc_encode
> is not used. Remove it.
> 
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> ---
>  drivers/media/platform/mtk-vcodec/venc/venc_h264_if.c | 9 +++------
>  drivers/media/platform/mtk-vcodec/venc/venc_vp8_if.c  | 3 +--
>  drivers/media/platform/mtk-vcodec/venc_vpu_if.c       | 1 -
>  drivers/media/platform/mtk-vcodec/venc_vpu_if.h       | 1 -
>  4 files changed, 4 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/media/platform/mtk-vcodec/venc/venc_h264_if.c b/drivers/media/platform/mtk-vcodec/venc/venc_h264_if.c
> index b6a4f2074fa5..bf03888a824f 100644
> --- a/drivers/media/platform/mtk-vcodec/venc/venc_h264_if.c
> +++ b/drivers/media/platform/mtk-vcodec/venc/venc_h264_if.c
> @@ -367,8 +367,7 @@ static int h264_encode_sps(struct venc_h264_inst *inst,
>  
>  	mtk_vcodec_debug_enter(inst);
>  
> -	ret = vpu_enc_encode(&inst->vpu_inst, H264_BS_MODE_SPS, NULL,
> -			     bs_buf, bs_size, NULL);
> +	ret = vpu_enc_encode(&inst->vpu_inst, H264_BS_MODE_SPS, NULL, bs_buf, NULL);
>  	if (ret)
>  		return ret;
>  
> @@ -394,8 +393,7 @@ static int h264_encode_pps(struct venc_h264_inst *inst,
>  
>  	mtk_vcodec_debug_enter(inst);
>  
> -	ret = vpu_enc_encode(&inst->vpu_inst, H264_BS_MODE_PPS, NULL,
> -			     bs_buf, bs_size, NULL);
> +	ret = vpu_enc_encode(&inst->vpu_inst, H264_BS_MODE_PPS, NULL, bs_buf, NULL);
>  	if (ret)
>  		return ret;
>  
> @@ -451,8 +449,7 @@ static int h264_encode_frame(struct venc_h264_inst *inst,
>  	mtk_vcodec_debug(inst, "frm_count = %d,skip_frm_count =%d,frm_type=%d.\n",
>  			 frame_info.frm_count, frame_info.skip_frm_count,
>  			 frame_info.frm_type);
> -	ret = vpu_enc_encode(&inst->vpu_inst, H264_BS_MODE_FRAME, frm_buf,
> -			     bs_buf, bs_size, &frame_info);
> +	ret = vpu_enc_encode(&inst->vpu_inst, H264_BS_MODE_FRAME, frm_buf, bs_buf, &frame_info);
>  	if (ret)
>  		return ret;
>  
> diff --git a/drivers/media/platform/mtk-vcodec/venc/venc_vp8_if.c b/drivers/media/platform/mtk-vcodec/venc/venc_vp8_if.c
> index 8267a9c4fd25..6b66957d5192 100644
> --- a/drivers/media/platform/mtk-vcodec/venc/venc_vp8_if.c
> +++ b/drivers/media/platform/mtk-vcodec/venc/venc_vp8_if.c
> @@ -302,8 +302,7 @@ static int vp8_enc_encode_frame(struct venc_vp8_inst *inst,
>  
>  	mtk_vcodec_debug(inst, "->frm_cnt=%d", inst->frm_cnt);
>  
> -	ret = vpu_enc_encode(&inst->vpu_inst, 0, frm_buf, bs_buf, bs_size,
> -			     NULL);
> +	ret = vpu_enc_encode(&inst->vpu_inst, 0, frm_buf, bs_buf, NULL);
>  	if (ret)
>  		return ret;
>  
> diff --git a/drivers/media/platform/mtk-vcodec/venc_vpu_if.c b/drivers/media/platform/mtk-vcodec/venc_vpu_if.c
> index be6d8790a41e..e7899d8a3e4e 100644
> --- a/drivers/media/platform/mtk-vcodec/venc_vpu_if.c
> +++ b/drivers/media/platform/mtk-vcodec/venc_vpu_if.c
> @@ -225,7 +225,6 @@ int vpu_enc_set_param(struct venc_vpu_inst *vpu,
>  int vpu_enc_encode(struct venc_vpu_inst *vpu, unsigned int bs_mode,
>  		   struct venc_frm_buf *frm_buf,
>  		   struct mtk_vcodec_mem *bs_buf,
> -		   unsigned int *bs_size,
>  		   struct venc_frame_info *frame_info)
>  {
>  	const bool is_ext = MTK_ENC_CTX_IS_EXT(vpu->ctx);
> diff --git a/drivers/media/platform/mtk-vcodec/venc_vpu_if.h b/drivers/media/platform/mtk-vcodec/venc_vpu_if.h
> index f9be9cab7ff7..f83bc1b3f2bf 100644
> --- a/drivers/media/platform/mtk-vcodec/venc_vpu_if.h
> +++ b/drivers/media/platform/mtk-vcodec/venc_vpu_if.h
> @@ -45,7 +45,6 @@ int vpu_enc_set_param(struct venc_vpu_inst *vpu,
>  int vpu_enc_encode(struct venc_vpu_inst *vpu, unsigned int bs_mode,
>  		   struct venc_frm_buf *frm_buf,
>  		   struct mtk_vcodec_mem *bs_buf,
> -		   unsigned int *bs_size,
>  		   struct venc_frame_info *frame_info);
>  int vpu_enc_deinit(struct venc_vpu_inst *vpu);
>  

