Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 16D9F36ECC0
	for <lists+linux-media@lfdr.de>; Thu, 29 Apr 2021 16:51:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234862AbhD2Ovt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Apr 2021 10:51:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232989AbhD2Ovt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Apr 2021 10:51:49 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 697D9C06138C
        for <linux-media@vger.kernel.org>; Thu, 29 Apr 2021 07:51:02 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id n2so14074184wrm.0
        for <linux-media@vger.kernel.org>; Thu, 29 Apr 2021 07:51:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kynesim-co-uk.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:references:in-reply-to
         :user-agent:mime-version:content-transfer-encoding;
        bh=0snjfriunXokbhjSMJ9Eyiap4guJwiDtJ6KT7smyyik=;
        b=zZuvgHd91qgQwjw10MKn4hrMbBJwZ/VIUK2nLx6HRcitCkkzaZtGkyAJUgUI4Aet1g
         wyTdxhA2NL7uTPT2v3OoLOQTp+Uw+KBC13mIBQb07A7NfrpOiECd/kO4dDlwwr3jpNwv
         5Y44aLLZ0lheYTLUioJBmD5//UBatavi2PwfoPIk/0LkFx25xI3gGo+EqwTFElyrot6S
         Pe4kotbwcdBCM4az9Ak0Lvcc4un9xQOc7na5Z2Vq5cK4YhWgcv2Y8Zt92uI+l7rEVkES
         uWFEby+By7MjeuLaNm7ruUSy7Kx3V3ilZYyVuUKVLZO075FXuHGOXQQvTx8riRiZR03Z
         /sjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:references
         :in-reply-to:user-agent:mime-version:content-transfer-encoding;
        bh=0snjfriunXokbhjSMJ9Eyiap4guJwiDtJ6KT7smyyik=;
        b=p7A8SsSjV6+yXl2X8u+zvtPej1Pkc+WnNYU6tFBBxv2s24aUXAWfsYt25zSYMvHT8o
         OfZswhjBKoENMLfZpg8npGQvCoD11Cuu6vXDQZh86ixYvpIU4rPKQSy5M+6B5YTz1fQu
         k4makg1afQHgUY8USKCck6zLrlFI0lXnueZtKRAak+1k7uk40s7BqSXgO++mTSyAzNJV
         xg/idc5vdVJtNKHgoF0wNXl2LU2mMHVhmcirjPHVhASg052oF2GCtJ6JuVW37ktXsquk
         kpndJHLEXIZkl+b9/zQOSRWuW/Mf6xB+59H16LaZlGdGWmbGhjxUFOMMeu3rcsK8LqJy
         j0UQ==
X-Gm-Message-State: AOAM533FtGqi9xVxtKJhGSqHx+PmfkBtVH1+jdbnSchPvJ9JcdRUadUm
        GvCZqABEshNARHDcgN0rWyaSlQ==
X-Google-Smtp-Source: ABdhPJzj4vvtS0ITy4N2nOoIEmto/xNvRB0C1X+g/W+l+SSz8bMWSXmMg681Oss3TiWJNDLomY4WSA==
X-Received: by 2002:a5d:6d48:: with SMTP id k8mr155304wri.93.1619707861191;
        Thu, 29 Apr 2021 07:51:01 -0700 (PDT)
Received: from CTHALPA.outer.uphall.net (cpc1-cmbg20-2-0-cust759.5-4.cable.virginm.net. [86.21.218.248])
        by smtp.gmail.com with ESMTPSA id n7sm3245336wri.14.2021.04.29.07.51.00
        (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
        Thu, 29 Apr 2021 07:51:00 -0700 (PDT)
From:   John Cox <jc@kynesim.co.uk>
To:     Jernej Skrabec <jernej.skrabec@siol.net>
Cc:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl, mripard@kernel.org,
        paul.kocialkowski@bootlin.com, wens@csie.org,
        ezequiel@collabora.com, benjamin.gaignard@collabora.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-staging@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH] media: hevc: Fix dependent slice segment flags
Date:   Thu, 29 Apr 2021 15:51:00 +0100
Message-ID: <lrhl8gl392tcpss5rcpkqr1cahujnlqq9k@4ax.com>
References: <20210427071554.2222625-1-jernej.skrabec@siol.net>
In-Reply-To: <20210427071554.2222625-1-jernej.skrabec@siol.net>
User-Agent: ForteAgent/8.00.32.1272
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

>Dependent slice segment flag for PPS control is misnamed. It should have
>"enabled" at the end. It only tells if this flag is present in slice
>header or not and not the actual value.
>
>Fix this by renaming the PPS flag and introduce another flag for slice
>control which tells actual value.
>
>Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
>---
> Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst | 5 ++++-
> drivers/staging/media/sunxi/cedrus/cedrus_h265.c          | 4 ++--
> include/media/hevc-ctrls.h                                | 3 ++-
> 3 files changed, 8 insertions(+), 4 deletions(-)
>
>diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst =
b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
>index 7b90cb939e9d..5ed343ddd1ea 100644
>--- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
>+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
>@@ -3059,7 +3059,7 @@ enum v4l2_mpeg_video_hevc_size_of_length_field -
>     :stub-columns: 0
>     :widths:       1 1 2
>=20
>-    * - ``V4L2_HEVC_PPS_FLAG_DEPENDENT_SLICE_SEGMENT``
>+    * - ``V4L2_HEVC_PPS_FLAG_DEPENDENT_SLICE_SEGMENT_ENABLED``
>       - 0x00000001
>       -
>     * - ``V4L2_HEVC_PPS_FLAG_OUTPUT_FLAG_PRESENT``
>@@ -3274,6 +3274,9 @@ enum v4l2_mpeg_video_hevc_size_of_length_field -
>     * - =
``V4L2_HEVC_SLICE_PARAMS_FLAG_SLICE_LOOP_FILTER_ACROSS_SLICES_ENABLED``
>       - 0x00000100
>       -
>+    * - ``V4L2_HEVC_SLICE_PARAMS_FLAG_DEPENDENT_SLICE_SEGMENT``
>+      - 0x00000200
>+      -
>=20
> .. raw:: latex
>=20
>diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h265.c =
b/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
>index 397a4ba5df4c..6821e3d05d34 100644
>--- a/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
>+++ b/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
>@@ -479,8 +479,8 @@ static void cedrus_h265_setup(struct cedrus_ctx =
*ctx,
> 				slice_params->flags);
>=20
> 	reg |=3D =
VE_DEC_H265_FLAG(VE_DEC_H265_DEC_SLICE_HDR_INFO0_FLAG_DEPENDENT_SLICE_SEG=
MENT,
>-				V4L2_HEVC_PPS_FLAG_DEPENDENT_SLICE_SEGMENT,
>-				pps->flags);
>+				V4L2_HEVC_SLICE_PARAMS_FLAG_DEPENDENT_SLICE_SEGMENT,
>+				slice_params->flags);
>=20
> 	/* FIXME: For multi-slice support. */
> 	reg |=3D =
VE_DEC_H265_DEC_SLICE_HDR_INFO0_FLAG_FIRST_SLICE_SEGMENT_IN_PIC;
>diff --git a/include/media/hevc-ctrls.h b/include/media/hevc-ctrls.h
>index b713eeed1915..dc964ff7cd29 100644
>--- a/include/media/hevc-ctrls.h
>+++ b/include/media/hevc-ctrls.h
>@@ -83,7 +83,7 @@ struct v4l2_ctrl_hevc_sps {
> 	__u64	flags;
> };
>=20
>-#define V4L2_HEVC_PPS_FLAG_DEPENDENT_SLICE_SEGMENT		(1ULL << 0)
>+#define V4L2_HEVC_PPS_FLAG_DEPENDENT_SLICE_SEGMENT_ENABLED	(1ULL << 0)
> #define V4L2_HEVC_PPS_FLAG_OUTPUT_FLAG_PRESENT			(1ULL << 1)
> #define V4L2_HEVC_PPS_FLAG_SIGN_DATA_HIDING_ENABLED		(1ULL << 2)
> #define V4L2_HEVC_PPS_FLAG_CABAC_INIT_PRESENT			(1ULL << 3)
>@@ -166,6 +166,7 @@ struct v4l2_hevc_pred_weight_table {
> #define V4L2_HEVC_SLICE_PARAMS_FLAG_USE_INTEGER_MV		(1ULL << 6)
> #define V4L2_HEVC_SLICE_PARAMS_FLAG_SLICE_DEBLOCKING_FILTER_DISABLED =
(1ULL << 7)
> #define =
V4L2_HEVC_SLICE_PARAMS_FLAG_SLICE_LOOP_FILTER_ACROSS_SLICES_ENABLED (1ULL=
 << 8)
>+#define V4L2_HEVC_SLICE_PARAMS_FLAG_DEPENDENT_SLICE_SEGMENT	(1ULL << 9)
>=20
> struct v4l2_ctrl_hevc_slice_params {
> 	__u32	bit_size;

Happy to see this flag finally making it

Many thanks

John Cox
