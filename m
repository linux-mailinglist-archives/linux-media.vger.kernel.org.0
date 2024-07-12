Return-Path: <linux-media+bounces-14970-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F95792FC17
	for <lists+linux-media@lfdr.de>; Fri, 12 Jul 2024 16:04:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4114D1C20EF6
	for <lists+linux-media@lfdr.de>; Fri, 12 Jul 2024 14:04:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB45917084C;
	Fri, 12 Jul 2024 14:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="r7L+kr3r"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9589016C69E
	for <linux-media@vger.kernel.org>; Fri, 12 Jul 2024 14:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720793056; cv=none; b=Jg2N4sg+eCeJ9EadN8hI6MT7cah0z067nuGz3B/TQBPDnZd7DeeNCW773sPYdK9c4iTB0/z4mMzzoaS4dzje9RcSsAY7RzgZR4VlcZQrkeuFqozOnFZMB7t8DjqHkaBA0XnRHda3Fj30MSqea7MB+GzQVbGpgbmEzWt+HbBUgQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720793056; c=relaxed/simple;
	bh=F3ACGQ4JF1jy3fOMiWVggI+EkqlyR+19czz33KcG2iQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UcENfJEvEE2USuPhQF54RzsZolWMvFoIhl7NoxMo3LRnye2pFs/VHYhtqc/AAA+La0/ivhkn9oik+7QNnCVx4USJv6aeQxlqx+YfTT+qE7fpNgqQSuAiJzZIuYgPtS6PPLtEtTSWxFYBcqQPZZ+G2cSWxaH2dkXrlqhR3/MdUF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=r7L+kr3r; arc=none smtp.client-ip=209.85.167.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-3c9cc681e4fso1064862b6e.0
        for <linux-media@vger.kernel.org>; Fri, 12 Jul 2024 07:04:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720793053; x=1721397853; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wE58H/KuRaxcAiHNSS12XU0UrNQnBDOL8QV+zXyBMB4=;
        b=r7L+kr3rXGQyA52dBQPyHqYsSjj/BULfyZ++7eSwc2il8YelebDranMhANR+X7Y95G
         Ri2oago81cAm5NI8KBUqJUORyZfL3TeTaGcdfy/iPxPnaRgiPo518w2ITmgN/s8/nYUG
         OFboAcF70/1EFpjJFgZSkE9Vdc6I7g4FyTjvswRi6YSzUVHcmxHk3nuzmEN4AIjghLzN
         bSgdnPXDt+K4xhvhGE+lUCjsTNZ/baIY/Me2H7gtboR3/gAHS+gGhZzSTRj6epl2WYm/
         bbdAY0KxNHwkAC3subVpOhaHnJsd/F2C+3kKYf+uezzHXkU8PNgJqD6M2mcv09zsVwMh
         7DaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720793053; x=1721397853;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wE58H/KuRaxcAiHNSS12XU0UrNQnBDOL8QV+zXyBMB4=;
        b=Ho+LETnvdCMoVUIqUzXWY6s0BX8xAYUreMYABGIs1XXb7r4vY9OADeWdOPFG9EzbfY
         4GmXzmeXjdGszXifu5ukhdHMXqXXDebZyk2WlX8VmS+RRvKvNnsXFJC/0eaOlu+bdxTF
         f1+ZTy9PkFdS4rDZcEg5GSw3LBYmdoFO5uB1tNmJMPg3sjVBosAxkLYbJ1KEkLbs1r58
         8iJCKcHnBSgmtZUI81wBDiqVzhPtXZsYjoZLavs/JywLBSgE7B9uSf5Za+Bj9dDp7+4i
         olGA/OiWJJjMxYNT6FrhiYo6Ets5v02XFCCHY5I13ORXkOpm3SbY3tem4bMphA3breg7
         P39A==
X-Gm-Message-State: AOJu0YwClQ7n1mdvLVRSL54jKwrpmbI74db4g66e4oilzXJLyW48cQsO
	Zag6QkjkWjiGZuQ84KqgJ5GsxUdgjCWjwxw6lCk5K5SJ1WzQ2rC95bD1yqsyARGJ59hg9VZy0o8
	5
X-Google-Smtp-Source: AGHT+IFv6mqZndS7M1xO7bUKtCrvWNOVZcLLFtVWFJ5wLiujvwuWMiwkifTUWmFjr0WibbYLjFskRw==
X-Received: by 2002:a05:6870:819b:b0:25d:ff4c:bc5f with SMTP id 586e51a60fabf-25eae9dee79mr9848895fac.29.1720793053492;
        Fri, 12 Jul 2024 07:04:13 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:d26:9826:56eb:a2e5])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-25ea9f8792fsm2237962fac.4.2024.07.12.07.04.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jul 2024 07:04:13 -0700 (PDT)
Date: Fri, 12 Jul 2024 09:04:11 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Naushir Patuck <naush@raspberrypi.com>
Cc: linux-media@vger.kernel.org, linux-rpi-kernel@lists.infradead.org
Subject: [bug report] media: raspberrypi: Add support for PiSP BE
Message-ID: <2711c1cd-727e-4c09-be44-6898b8151a25@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Naushir Patuck,

Commit 12187bd5d4f8 ("media: raspberrypi: Add support for PiSP BE")
from Jun 26, 2024 (linux-next), leads to the following Smatch static
checker warning:

	drivers/media/platform/raspberrypi/pisp_be/pisp_be.c:1127 pispbe_try_format()
	error: undefined (user controlled) shift '(((1))) << (f->fmt.pix_mp.colorspace)'

drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
    1093 static void pispbe_try_format(struct v4l2_format *f, struct pispbe_node *node)
    1094 {
    1095         struct pispbe_dev *pispbe = node->pispbe;
    1096         u32 pixfmt = f->fmt.pix_mp.pixelformat;
    1097         const struct pisp_be_format *fmt;
    1098         bool is_rgb;
    1099 
    1100         dev_dbg(pispbe->dev,
    1101                 "%s: [%s] req %ux%u %p4cc, planes %d\n",
    1102                 __func__, NODE_NAME(node), f->fmt.pix_mp.width,
    1103                 f->fmt.pix_mp.height, &pixfmt,
    1104                 f->fmt.pix_mp.num_planes);
    1105 
    1106         fmt = pispbe_find_fmt(pixfmt);
    1107         if (!fmt) {
    1108                 dev_dbg(pispbe->dev,
    1109                         "%s: [%s] Format not found, defaulting to YUV420\n",
    1110                         __func__, NODE_NAME(node));
    1111                 fmt = pispbe_find_fmt(V4L2_PIX_FMT_YUV420);
    1112         }
    1113 
    1114         f->fmt.pix_mp.pixelformat = fmt->fourcc;
    1115         f->fmt.pix_mp.num_planes = fmt->num_planes;
    1116         f->fmt.pix_mp.field = V4L2_FIELD_NONE;
    1117         f->fmt.pix_mp.width = max(min(f->fmt.pix_mp.width, 65536u),
    1118                                   PISP_BACK_END_MIN_TILE_WIDTH);
    1119         f->fmt.pix_mp.height = max(min(f->fmt.pix_mp.height, 65536u),
    1120                                    PISP_BACK_END_MIN_TILE_HEIGHT);
    1121 
    1122         /*
    1123          * Fill in the actual colour space when the requested one was
    1124          * not supported. This also catches the case when the "default"
    1125          * colour space was requested (as that's never in the mask).
    1126          */
--> 1127         if (!(V4L2_COLORSPACE_MASK(f->fmt.pix_mp.colorspace) &
    1128             fmt->colorspace_mask))
    1129                 f->fmt.pix_mp.colorspace = fmt->colorspace_default;

The warning means that the user passes arg to

v4l_try_fmt()
-> pispbe_node_try_fmt_vid_cap
   -> pispbe_try_format()

Nothing has checked that f->fmt.pix_mp.colorspace >= BIT_PER_LONG so shift in
V4L2_COLORSPACE_MASK() could wrap.

    1130 
    1131         /* In all cases, we only support the defaults for these: */
    1132         f->fmt.pix_mp.ycbcr_enc =
    1133                 V4L2_MAP_YCBCR_ENC_DEFAULT(f->fmt.pix_mp.colorspace);
    1134         f->fmt.pix_mp.xfer_func =
    1135                 V4L2_MAP_XFER_FUNC_DEFAULT(f->fmt.pix_mp.colorspace);
    1136 
    1137         is_rgb = f->fmt.pix_mp.colorspace == V4L2_COLORSPACE_SRGB;
    1138         f->fmt.pix_mp.quantization =
    1139                 V4L2_MAP_QUANTIZATION_DEFAULT(is_rgb, f->fmt.pix_mp.colorspace,
    1140                                               f->fmt.pix_mp.ycbcr_enc);
    1141 
    1142         /* Set plane size and bytes/line for each plane. */
    1143         pispbe_set_plane_params(f, fmt);
    1144 
    1145         for (unsigned int i = 0; i < f->fmt.pix_mp.num_planes; i++) {
    1146                 dev_dbg(pispbe->dev,
    1147                         "%s: [%s] calc plane %d, %ux%u, depth %u, bpl %u size %u\n",
    1148                         __func__, NODE_NAME(node), i, f->fmt.pix_mp.width,
    1149                         f->fmt.pix_mp.height, fmt->bit_depth,
    1150                         f->fmt.pix_mp.plane_fmt[i].bytesperline,
    1151                         f->fmt.pix_mp.plane_fmt[i].sizeimage);
    1152         }
    1153 }

regards,
dan carpenter

