Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D9A8A43E352
	for <lists+linux-media@lfdr.de>; Thu, 28 Oct 2021 16:18:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230442AbhJ1OUj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 28 Oct 2021 10:20:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230401AbhJ1OUi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 28 Oct 2021 10:20:38 -0400
Received: from mail-qv1-xf36.google.com (mail-qv1-xf36.google.com [IPv6:2607:f8b0:4864:20::f36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62001C061745
        for <linux-media@vger.kernel.org>; Thu, 28 Oct 2021 07:18:11 -0700 (PDT)
Received: by mail-qv1-xf36.google.com with SMTP id t1so4147184qvb.1
        for <linux-media@vger.kernel.org>; Thu, 28 Oct 2021 07:18:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20210112.gappssmtp.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=nMYUF74sjEpWHuRRud5MO5ghjCJajD1UAWLtkFjebQ8=;
        b=AcFOcYEDEke9Cr2Fcbyz6T2cnXP+xdgvJ8vghHGrZbzEU3F07oJ/V14ct6GmQNYz3s
         6cyUL7cLYDNHnbdk6roOf1RTDn3xyb7P8OS91ur27mmleQQYQptZ+s5WCpDAgH/g0FJ9
         AYqCyCy9d13ljbw1IxaRE/3E86w9sCVNSvtC9o/wsXM5HDbSqPWiD7tPMx3Yyq8NwpNy
         Kvm+b7a/94i519ok4wznMccqQOiwdEwi06gJEU84vJRNHbV6k9EOy3H/jscwydkkuJqC
         qmkhJitRJck0Ztji1DbeBKGPEeu1d6Sr7J9jX2gx5krNOBfdiPtsisZa6AbWjnBA8Lue
         H6Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=nMYUF74sjEpWHuRRud5MO5ghjCJajD1UAWLtkFjebQ8=;
        b=a523hCvU2A9s4PqidTYxTsvSTMHeIdVpMkgGiV4A3PnrKmSy9ur1pLWx0fWeHUcrkW
         OGXZhqE7Sec+Ck2BhMMoVvDpYNpMZtd/PoHt5Z4+Apa13ltCkwn4xsofHw3fZr0C69ZJ
         i2xOFD1SQseoeNZZskkRdhnIOCyO/uTAbw0m2y3zSfVpU+cwYCJ4HOfQc7wE11BTxS2K
         rbKZ0iLc/NIsDFDUPTah355dWJK7JMR0jyoRV/kmp1fuePWMW0Imwjy91yKIcRC+Rdt9
         JnPvhPRNuLBX822E0PYyqYOFOe7iS7oBW4UvvBaOQVM3Oj2Y9dJLoDTWGSZtQI8Ee7M+
         Kflw==
X-Gm-Message-State: AOAM531ZnCZvkKsElzd801b2OTHicvzx41OuLhG3gdYJkjXanDfXjPyS
        1HNaesMhKYA/zxYk2oS3RMctjQ==
X-Google-Smtp-Source: ABdhPJx6zHTHcttN+FeVTgYVhZ3L9lDybi5HnFGUMp6gMgU8UhioTK5yvPn19Ra2Kzh8chqzs12gXA==
X-Received: by 2002:a0c:b412:: with SMTP id u18mr4729682qve.14.1635430690565;
        Thu, 28 Oct 2021 07:18:10 -0700 (PDT)
Received: from nicolas-tpx395.localdomain (173-246-12-168.qc.cable.ebox.net. [173.246.12.168])
        by smtp.gmail.com with ESMTPSA id v15sm1406288qtx.54.2021.10.28.07.18.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Oct 2021 07:18:10 -0700 (PDT)
Message-ID: <34a3f0e40c5248472d072d2a06cc4370e08ea9ff.camel@ndufresne.ca>
Subject: Re: [PATCH 1/3] media: mtk-vcodec: enc: add vp8 profile ctrl
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
Date:   Thu, 28 Oct 2021 10:18:08 -0400
In-Reply-To: <20211022150410.29335-2-dafna.hirschfeld@collabora.com>
References: <20211022150410.29335-1-dafna.hirschfeld@collabora.com>
         <20211022150410.29335-2-dafna.hirschfeld@collabora.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 (3.40.4-2.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le vendredi 22 octobre 2021 à 17:04 +0200, Dafna Hirschfeld a écrit :
> In order for the encoder to work with gstreamer
> it needs to have the V4L2_CID_MPEG_VIDEO_VP8_PROFILE
> ctrl. This patch adds that ctrl with only profile 0
> supported.
> 
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>

I confirm starting from GStreamer 1.18 profile (and level for other codecs) are
needed. This is to allow proper fallback to other decoders (including software)
when the HW is not capable.

Acked-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
>  drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
> index 8998244ea671..87a5114bf680 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
> @@ -103,6 +103,13 @@ static int vidioc_venc_s_ctrl(struct v4l2_ctrl *ctrl)
>  		p->gop_size = ctrl->val;
>  		ctx->param_change |= MTK_ENCODE_PARAM_GOP_SIZE;
>  		break;
> +	case V4L2_CID_MPEG_VIDEO_VP8_PROFILE:
> +		/*
> +		 * FIXME - what vp8 profiles are actually supported?
> +		 * The ctrl is added (with only profile 0 supported) for now.
> +		 */
> +		mtk_v4l2_debug(2, "V4L2_CID_MPEG_VIDEO_VP8_PROFILE val = %d", ctrl->val);
> +		break;
>  	case V4L2_CID_MPEG_VIDEO_FORCE_KEY_FRAME:
>  		mtk_v4l2_debug(2, "V4L2_CID_MPEG_VIDEO_FORCE_KEY_FRAME");
>  		p->force_intra = 1;
> @@ -1394,6 +1401,9 @@ int mtk_vcodec_enc_ctrls_setup(struct mtk_vcodec_ctx *ctx)
>  	v4l2_ctrl_new_std_menu(handler, ops, V4L2_CID_MPEG_VIDEO_H264_LEVEL,
>  			       h264_max_level,
>  			       0, V4L2_MPEG_VIDEO_H264_LEVEL_4_0);
> +	v4l2_ctrl_new_std_menu(handler, ops, V4L2_CID_MPEG_VIDEO_VP8_PROFILE,
> +			       V4L2_MPEG_VIDEO_VP8_PROFILE_0, 0, V4L2_MPEG_VIDEO_VP8_PROFILE_0);
> +
>  
>  	if (handler->error) {
>  		mtk_v4l2_err("Init control handler fail %d",


