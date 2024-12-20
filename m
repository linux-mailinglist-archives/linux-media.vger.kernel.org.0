Return-Path: <linux-media+bounces-23950-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E16579F9658
	for <lists+linux-media@lfdr.de>; Fri, 20 Dec 2024 17:23:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7F6C416C6F3
	for <lists+linux-media@lfdr.de>; Fri, 20 Dec 2024 16:23:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C49321C9EE;
	Fri, 20 Dec 2024 16:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="jgz0UNpc"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8F0B21B90F
	for <linux-media@vger.kernel.org>; Fri, 20 Dec 2024 16:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734711700; cv=none; b=phcGUcJi52VHgohmMeZkNPCp43JHYgVuTs0uhe/HfFwgRbhUvjZIlz0de/iFXw74CemyrHaj3IBcl++LeGEOWMzApWRwyTd/EYhjEE85bkb3MYm5jiqfb2CYirP1yL8Kr5B2u3uz476N31efIuH3Rd1HOTYewK62OAc0XumKY3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734711700; c=relaxed/simple;
	bh=NJ999y4VFUPfFgFWq35/1TJXhZxBUdd3LBcph8CTbTA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=g43CNLI3nU8bVfqHNuBQ3biPoI6+Kb4o26XGvttSfB4gDck9ohBopwae/M9g+3R5sKHIt+WpU3Gx+j11fMYBVd/0bHqQATx1sMYVOjaBRbcvTFl1McZJ1bphM2HeLeuH+wl0v0O8CYyWysmbCB1fr0LCIpu75p8KyOcoggypQOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=jgz0UNpc; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43618283dedso20300835e9.3
        for <linux-media@vger.kernel.org>; Fri, 20 Dec 2024 08:21:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1734711697; x=1735316497; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x7IbY/YnqtHAUDFghwcKoK/zkq5StHeb++vxI+BXHd4=;
        b=jgz0UNpcRJFobwk5hU0nqY0A4fDEVxESRltDBxGUNE/Gvv+rXho2p0YlRSLYdUtOQ7
         +e4bmvnuSyzRm08izCYAJdjcZUz3L6JDmPm8uhxy4J6zfRZhHjxUQv80FDY9F6sfcPOo
         Juc+kzz1R2IvBLYvT0qM8++QQgLRiC/54NejUmePIRHATD9jhGLCGpEJdixZEZT438Se
         aVd/9SqWxdxdfbvKivx211PkeDROTfyLwYJq9IxvcKip3VcnZpZywW4l1nXxgiqxsyjb
         qzJzeH7LscXd6DoD5ipR4U6QjDKoRbxYuNiwOMu0Wu5x0ro/mkHhpV3dZNeiDy0mN4qh
         feKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734711697; x=1735316497;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x7IbY/YnqtHAUDFghwcKoK/zkq5StHeb++vxI+BXHd4=;
        b=fJ+v9CzFUljO6KtBvG/lvIuy/nMVBcepNSldyTE0+rLaYXY9xTA17uDXFDa0DWiMit
         bZXXppyZYOJjHYu8A/7EXF4SAuyZxLOTVXX9mcCY/kPukI80wAMnS/lEm0HgINqBjxzn
         wUWWaRevCjspE+Ub5/J3lxRe/PCFeFZqe3sPD+YHbnd+zniEFijQ6lhcK8I5ZdZfjgIp
         iXfwxO4LbyiBtsCo++XqBN26CIZ0uQw3mkrqoiONTFOYB4W+kxB7JXEAfdRM8DqP7l/4
         nZt/UMl46TBL/WSk3K8WNMJJYjmCSxrDtNR8NO5B7EV5me8vyh5I0nEP/BAgNKKTpXd7
         ro5g==
X-Forwarded-Encrypted: i=1; AJvYcCWeYjuu/+DA7jtVvrgTKVJ8QfcTZ9T5y3ufR3yo8Nt9/F3QzxRlxCdTLgqfNHVJkd0EomYhggJ/WC7/qg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyLjYQxohaSPUKimP8DajttqT9ZrALcftQDTGVuechkHcYqcTPX
	KMQHXM/4JRKp5VGu5Z/jOZRv6pIstCrmSN69ZWFlCA1rFm/Wb2ZMy/FIDugwxPc=
X-Gm-Gg: ASbGncs1LEzIl4hxqonO2b7kg2lzj7BtDNn44oc5Nk6jbPWRSNwKoB5sfeQbbh8CGV8
	ciNGXd9Abm7Mr8v2NUnI79ibENx7veZSZUTq/Lv5/WWX0pryXPTaVcfCRc+JQ4rS+Xv57tXKVn4
	8QIgnItv/aPGwgHx/pbUvdjft2Ghdsz0dR9Asvah7FEslmSMw4r8GXNa6j3onJO+CQoB/2uE2oj
	ZC6Nh95nmd0pMdq+Nd3gyxgv5sKPHiG/ToOasaPj2sqZPMF
X-Google-Smtp-Source: AGHT+IEAPTJ5m18DH1xYnQd8cUicgjor10RVrkkz1NLTlQt2JRNWxgVG080MQ9UkLDrS81AzW5xAKg==
X-Received: by 2002:a05:600c:45cf:b0:434:a781:f5e2 with SMTP id 5b1f17b1804b1-43668642289mr31526005e9.8.1734711696988;
        Fri, 20 Dec 2024 08:21:36 -0800 (PST)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43656b013e1sm82824045e9.12.2024.12.20.08.21.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 08:21:36 -0800 (PST)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Fri, 20 Dec 2024 16:21:14 +0000
Subject: [PATCH 3/7] media: ioctl: Add pixel formats NV12MT_COL128 and
 NV12MT_10_COL128
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241220-media-rpi-hevc-dec-v1-3-0ebcc04ed42e@raspberrypi.com>
References: <20241220-media-rpi-hevc-dec-v1-0-0ebcc04ed42e@raspberrypi.com>
In-Reply-To: <20241220-media-rpi-hevc-dec-v1-0-0ebcc04ed42e@raspberrypi.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 John Cox <john.cox@raspberrypi.com>, Dom Cobley <dom@raspberrypi.com>, 
 review list <kernel-list@raspberrypi.com>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: John Cox <jc@kynesim.co.uk>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1

Add V4L2_PIXFMT_NV12MT_COL128 and V4L2_PIXFMT_NV12MT_10_COL128
to describe the Raspberry Pi HEVC decoder NV12 multiplanar formats.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/v4l2-core/v4l2-ioctl.c | 2 ++
 include/uapi/linux/videodev2.h       | 5 +++++
 2 files changed, 7 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 0304daa8471d..e510e375a871 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1377,7 +1377,9 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 	case V4L2_PIX_FMT_NV16M:	descr = "Y/UV 4:2:2 (N-C)"; break;
 	case V4L2_PIX_FMT_NV61M:	descr = "Y/VU 4:2:2 (N-C)"; break;
 	case V4L2_PIX_FMT_NV12MT:	descr = "Y/UV 4:2:0 (64x32 MB, N-C)"; break;
+	case V4L2_PIX_FMT_NV12MT_COL128: descr = "Y/CbCr 4:2:0 (128b cols)"; break;
 	case V4L2_PIX_FMT_NV12MT_16X16:	descr = "Y/UV 4:2:0 (16x16 MB, N-C)"; break;
+	case V4L2_PIX_FMT_NV12MT_10_COL128: descr = "10-bit Y/CbCr 4:2:0 (128b cols)"; break;
 	case V4L2_PIX_FMT_P012M:	descr = "12-bit Y/UV 4:2:0 (N-C)"; break;
 	case V4L2_PIX_FMT_YUV420M:	descr = "Planar YUV 4:2:0 (N-C)"; break;
 	case V4L2_PIX_FMT_YVU420M:	descr = "Planar YVU 4:2:0 (N-C)"; break;
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index e7c4dce39007..f8f97aa6a616 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -687,6 +687,11 @@ struct v4l2_pix_format {
 #define V4L2_PIX_FMT_NV12MT_16X16 v4l2_fourcc('V', 'M', '1', '2') /* 12  Y/CbCr 4:2:0 16x16 tiles */
 #define V4L2_PIX_FMT_NV12M_8L128      v4l2_fourcc('N', 'A', '1', '2') /* Y/CbCr 4:2:0 8x128 tiles */
 #define V4L2_PIX_FMT_NV12M_10BE_8L128 v4l2_fourcc_be('N', 'T', '1', '2') /* Y/CbCr 4:2:0 10-bit 8x128 tiles */
+#define V4L2_PIX_FMT_NV12MT_COL128 v4l2_fourcc('N', 'c', '1', '2') /* 12  Y/CbCr 4:2:0 128 pixel wide column */
+#define V4L2_PIX_FMT_NV12MT_10_COL128 v4l2_fourcc('N', 'c', '3', '0')
+								/* Y/CbCr 4:2:0 10bpc, 3x10 packed as 4 bytes in
+								 * a 128 bytes / 96 pixel wide column */
+
 
 /* Bayer formats - see http://www.siliconimaging.com/RGB%20Bayer.htm */
 #define V4L2_PIX_FMT_SBGGR8  v4l2_fourcc('B', 'A', '8', '1') /*  8  BGBG.. GRGR.. */

-- 
2.34.1


