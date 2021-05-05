Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E680373E4D
	for <lists+linux-media@lfdr.de>; Wed,  5 May 2021 17:18:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233460AbhEEPTG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 May 2021 11:19:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233338AbhEEPTF (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 5 May 2021 11:19:05 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2737EC061761
        for <linux-media@vger.kernel.org>; Wed,  5 May 2021 08:18:08 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id k4-20020a7bc4040000b02901331d89fb83so1352952wmi.5
        for <linux-media@vger.kernel.org>; Wed, 05 May 2021 08:18:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kynesim-co-uk.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:references:in-reply-to
         :user-agent:mime-version:content-transfer-encoding;
        bh=TfAnoiyhV+Z09G0GA+tcCNjs/YV2vvtrOh2X+fFwA7A=;
        b=UyzvQD43RrH8HN0tRXh+S4kPKxLLqTxcAsoAzHIlVsqJGmrIFeDVHf/QgT13vdRJFx
         3xOJa6Ucez9q2GObA0jOjUJfFQsrCJ/WapRgcOs08uE/2eTes1FZrAIUMK9Ci9HxSusI
         rzrj02MCjK/eZtWqF9AH1oQSWGEqgAeq+uhmYd1joS7snD9lXUMBqyqGSbWCeNAXI2UC
         AI1QWUr5Ks8meduoKRF+pSSniBQjkM1sxIfDUCLe+JQLv514GldGM+lTjzCLGo+BaxRn
         zblddZUMOk1zGS+qPYmko93lZ85kFypxtb/XvVC+upJa/XFgqOno/L0ggZCBQ4InZWUb
         00Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:references
         :in-reply-to:user-agent:mime-version:content-transfer-encoding;
        bh=TfAnoiyhV+Z09G0GA+tcCNjs/YV2vvtrOh2X+fFwA7A=;
        b=l0/pQp7YP2W3PendsUHOF8OXbSe63bN9FIHXhOeZguZ0MVU+kB2sOhHaBx1Fzcmfo3
         FS7kATc3Cbyy1ciXQwdMWbBqt0HRyprHCJc6yXjU2mQJemZ/yWzad2wQepRGqLQBBwLx
         wpEBPHl5/dTuNp6Pei0IEUl6UqPvs1mj0SbZE0xuT3X2DJiMBv6KMP+mLX/NRDMUlOLA
         fhl+mH5Ym1YwzJCXYhjWMgYSxKTEaMpHez+qnulEOuVoLCmjcqjM/nRMMmjlNvhv3iCv
         QtKfiEjzOnGK/M7ySUflrrSJFH0XiP+CHDOo7ipuVZrnNPo8K4Ct88EQCsjHbDLu5q/5
         p68g==
X-Gm-Message-State: AOAM53050DcgdC+CKHgb7cWihAdI+9BzGMZYRa+QVlVXTzF+0VpR8PYe
        g+dczVqxrrTQXRTsj8wNAAhiIw==
X-Google-Smtp-Source: ABdhPJyHndaGkURk6bVTdnyc6vFbT0sT8jqvwJ4aoftxCkncVRQimQ9YzkMukIQrIcenRhYqY439CQ==
X-Received: by 2002:a05:600c:284:: with SMTP id 4mr20003728wmk.88.1620227886676;
        Wed, 05 May 2021 08:18:06 -0700 (PDT)
Received: from CTHALPA.outer.uphall.net (cpc1-cmbg20-2-0-cust759.5-4.cable.virginm.net. [86.21.218.248])
        by smtp.gmail.com with ESMTPSA id l21sm6008566wme.10.2021.05.05.08.18.05
        (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
        Wed, 05 May 2021 08:18:06 -0700 (PDT)
From:   John Cox <jc@kynesim.co.uk>
To:     Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc:     ezequiel@collabora.com, p.zabel@pengutronix.de, mchehab@kernel.org,
        robh+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
        festevam@gmail.com, lee.jones@linaro.org,
        gregkh@linuxfoundation.org, mripard@kernel.org,
        paul.kocialkowski@bootlin.com, wens@csie.org,
        jernej.skrabec@siol.net, hverkuil-cisco@xs4all.nl,
        emil.l.velikov@gmail.com, kernel@pengutronix.de, linux-imx@nxp.com,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devel@driverdev.osuosl.org,
        kernel@collabora.com, cphealy@gmail.com,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: Re: [PATCH v10 6/9] media: uapi: Add a control for HANTRO driver
Date:   Wed, 05 May 2021 16:18:06 +0100
Message-ID: <6bd59glrp4fq3j3ngmbl5p4u7aethvrv34@4ax.com>
References: <20210420121046.181889-1-benjamin.gaignard@collabora.com> <20210420121046.181889-7-benjamin.gaignard@collabora.com>
In-Reply-To: <20210420121046.181889-7-benjamin.gaignard@collabora.com>
User-Agent: ForteAgent/8.00.32.1272
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

>The HEVC HANTRO driver needs to know the number of bits to skip at
>the beginning of the slice header.
>That is a hardware specific requirement so create a dedicated control
>for this purpose.
>
>Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
>---
> .../userspace-api/media/drivers/hantro.rst    | 19 +++++++++++++++++++
> .../userspace-api/media/drivers/index.rst     |  1 +
> include/media/hevc-ctrls.h                    | 13 +++++++++++++
> 3 files changed, 33 insertions(+)
> create mode 100644 Documentation/userspace-api/media/drivers/hantro.rst
>
>diff --git a/Documentation/userspace-api/media/drivers/hantro.rst =
b/Documentation/userspace-api/media/drivers/hantro.rst
>new file mode 100644
>index 000000000000..cd9754b4e005
>--- /dev/null
>+++ b/Documentation/userspace-api/media/drivers/hantro.rst
>@@ -0,0 +1,19 @@
>+.. SPDX-License-Identifier: GPL-2.0
>+
>+Hantro video decoder driver
>+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
>+
>+The Hantro video decoder driver implements the following =
driver-specific controls:
>+
>+``V4L2_CID_HANTRO_HEVC_SLICE_HEADER_SKIP (integer)``
>+    Specifies to Hantro HEVC video decoder driver the number of data =
(in bits) to
>+    skip in the slice segment header.
>+    If non-IDR, the bits to be skipped go from syntax element =
"pic_output_flag"
>+    to before syntax element "slice_temporal_mvp_enabled_flag".
>+    If IDR, the skipped bits are just "pic_output_flag"
>+    (separate_colour_plane_flag is not supported).

What happens if it is a dependant_slice_segement or
output_flag_present_flag?  Those flags are all dependant on
dependant_slice_segement being false.  I'm guessing 0 but it maybe
should be documented.
Likewise if output_flag_present_flag is false pic_output_flag will not
be coded, so maybe express it as "after slice_type" rather than "before
pic_output_flag"?

Regards

John Cox

>+.. note::
>+
>+        This control is not yet part of the public kernel API and
>+        it is expected to change.
>diff --git a/Documentation/userspace-api/media/drivers/index.rst =
b/Documentation/userspace-api/media/drivers/index.rst
>index 1a9038f5f9fa..12e3c512d718 100644
>--- a/Documentation/userspace-api/media/drivers/index.rst
>+++ b/Documentation/userspace-api/media/drivers/index.rst
>@@ -33,6 +33,7 @@ For more details see the file COPYING in the source =
distribution of Linux.
>=20
> 	ccs
> 	cx2341x-uapi
>+        hantro
> 	imx-uapi
> 	max2175
> 	meye-uapi
>diff --git a/include/media/hevc-ctrls.h b/include/media/hevc-ctrls.h
>index 8e0109eea454..b713eeed1915 100644
>--- a/include/media/hevc-ctrls.h
>+++ b/include/media/hevc-ctrls.h
>@@ -224,4 +224,17 @@ struct v4l2_ctrl_hevc_decode_params {
> 	__u64	flags;
> };
>=20
>+/*  MPEG-class control IDs specific to the Hantro driver as defined by =
V4L2 */
>+#define V4L2_CID_CODEC_HANTRO_BASE				(V4L2_CTRL_CLASS_CODEC | 0x1200)
>+/*
>+ * V4L2_CID_HANTRO_HEVC_SLICE_HEADER_SKIP -
>+ * the number of data (in bits) to skip in the
>+ * slice segment header.
>+ * If non-IDR, the bits to be skipped go from syntax element =
"pic_output_flag"
>+ * to before syntax element "slice_temporal_mvp_enabled_flag".
>+ * If IDR, the skipped bits are just "pic_output_flag"
>+ * (separate_colour_plane_flag is not supported).
>+ */
>+#define V4L2_CID_HANTRO_HEVC_SLICE_HEADER_SKIP	=
(V4L2_CID_CODEC_HANTRO_BASE + 0)
>+
> #endif
