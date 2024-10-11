Return-Path: <linux-media+bounces-19454-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7645C99AA24
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2024 19:33:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EE95C1F27420
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2024 17:33:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5400A1D04BE;
	Fri, 11 Oct 2024 17:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AwuYw6Ps"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3AEA1D0406;
	Fri, 11 Oct 2024 17:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728667868; cv=none; b=R4qI92J5Y8EjJZWmL8/EuD/mDkMqYNmbHca3QQnA8W7z4kdd4regHVeSkkIQLoZYyNoFBnOjgqaReGkfZBX0h4geGCHcSn7kCx/Zmb+si+swe+FPpV09mXVF8I71LGiXKt7B+65nPFIiZrepREI/FN3HzbnufQjlaxIHVmboEY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728667868; c=relaxed/simple;
	bh=riQB/ps7KNocNV/AUMqu2fP1J1RbHtnimUeTAOvwnFI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Wdw430E1LKUEJtvGLOZMxYkOyOcyUrmhHewfzmqIgmGW5c9uUzjuGmVH+mxhdF599N6Jw6qsorcIymygWoj6ydR0Rveh/coD558pKmP5KDe6HBGqtBrNad3fec9CwDGDhvSDU5OxgEBQHOeCQ9jCSWTdInZbD5a98FnZAKXxTas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AwuYw6Ps; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-37d518f9abcso913432f8f.2;
        Fri, 11 Oct 2024 10:31:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728667865; x=1729272665; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZPJcAbqbEoGBWHFkHsMcRX6T1qK9wGSCrUFWEpC9TBk=;
        b=AwuYw6PszX4ppDS+/V1MDZ6kxxmNi8d42x+dvvrnBm9Y1HDci8w5JI5n2AEANOhrSH
         Jx3mIkwIOhSgU7pAgL2Von/0ToatIzyWSaytw99Mx/1k7fG7YS9t8kvMt6GIraPJZmpL
         xIZFC74erkH8wQhExnJDzwbSeUP+A5mM4us6+lWJrvcvuEIpPPoz1tLiDXGuoPS5SaZT
         KQiUTvf3D+OU09LPVb4bUUtH7KnQCMUqTtS+zHVIpDVbG3OHh3X+sBhbTZYCGaLUngdU
         gkdgL07BSYu8RxQgjO8NLH0cU/4G6zcS+E5DFvBipMQU9eNeYKLpmQ0S7JoXK9UJ/CnL
         ykDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728667865; x=1729272665;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZPJcAbqbEoGBWHFkHsMcRX6T1qK9wGSCrUFWEpC9TBk=;
        b=c+FmreIEt6x42HSnq8mNlk4wtKgxJLlIM0QR1VoQa4qYsgRZJMgY1XLGFGYvzD40GR
         499bdfiX+xKzD96MA0pT6tqniNmE3ybOCiaRTp5UKX+BkNviZPMpb9NcDLIy55mtI4wk
         Gf+imjr9jndWM1jBj9ZBy6uCAvJMFFG2KQbK0v3H/2UpOyxMYH6Kht3p82OUXsLbeUug
         s3eu5YxX1viBvZsK5VHG68AN+kx6zS/Z6ZEKXAnU6V2EIlZrMOVJfRa3Zw0OpBalaYOK
         qQmn77qAd0ycnk4yy7/5Ls99im0EDXdVQ/ga43tLA9L8ShJrSsOjtyS81tAXM/lKQuc1
         xRRw==
X-Forwarded-Encrypted: i=1; AJvYcCV0X7D7lUpPyWyAdHZ8pwlY4HxF7Tk8Hml3X9rjNzT6npThyg7surEDfA9zVnocCpZDauzoVjnTnOd4L+M=@vger.kernel.org, AJvYcCXlckh6kX78L5QIeV1ZU+HwRB5T1UiztLaVYgSR08NOArQ0hg4vFYKfr6FvHI3deh+T3igAVHPKygMSYWqR+hAhvWY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzoNgsvNXkqJnx/FOIxKr1q511451lRmlaDVm+HPU7W3+xmnbHB
	jCDUTTxr7z4d4Yl0FU3h+kx/Fe2MP+Bmy4S8wYQCnR+v5jp7SsQ/HI0WEQ==
X-Google-Smtp-Source: AGHT+IG/ZWyxCOxL5jWFjBZFw3Xi0B+eX8Vh3VD1mw4fyQxCP9Tg9haDep7QcMgW40dKps2sJomTGQ==
X-Received: by 2002:a05:6000:b10:b0:37d:4846:42c3 with SMTP id ffacd0b85a97d-37d551b6ee1mr1992624f8f.22.1728667865102;
        Fri, 11 Oct 2024 10:31:05 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:2595:4364:d152:dff3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d4b79fa0asm4396516f8f.83.2024.10.11.10.31.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 10:31:04 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v5 06/22] media: rzg2l-cru: Retrieve virtual channel information
Date: Fri, 11 Oct 2024 18:30:36 +0100
Message-ID: <20241011173052.1088341-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241011173052.1088341-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20241011173052.1088341-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The RZ/G2L CRU needs to configure the ICnMC.VCSEL bits to specify which
virtual channel should be processed from the four available VCs. To
retrieve this information from the connected subdevice, the
.get_frame_desc() function is called.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../platform/renesas/rzg2l-cru/rzg2l-cru.h    |  5 +++
 .../platform/renesas/rzg2l-cru/rzg2l-ip.c     |  5 ---
 .../platform/renesas/rzg2l-cru/rzg2l-video.c  | 34 +++++++++++++++++++
 3 files changed, 39 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
index 174760239548..8fbd45c43763 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
@@ -31,6 +31,11 @@
 #define RZG2L_CRU_MIN_INPUT_HEIGHT	240
 #define RZG2L_CRU_MAX_INPUT_HEIGHT	4095
 
+enum rzg2l_csi2_pads {
+	RZG2L_CRU_IP_SINK = 0,
+	RZG2L_CRU_IP_SOURCE,
+};
+
 /**
  * enum rzg2l_cru_dma_state - DMA states
  * @RZG2L_CRU_DMA_STOPPED:   No operation in progress
diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
index 700d8b704689..aee7d4ba70b0 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
@@ -18,11 +18,6 @@ static const struct rzg2l_cru_ip_format rzg2l_cru_ip_formats[] = {
 	{ .code = MEDIA_BUS_FMT_UYVY8_1X16,	.datatype = 0x1e, .bpp = 16 },
 };
 
-enum rzg2l_csi2_pads {
-	RZG2L_CRU_IP_SINK = 0,
-	RZG2L_CRU_IP_SOURCE,
-};
-
 static const struct rzg2l_cru_ip_format *rzg2l_cru_ip_code_to_fmt(unsigned int code)
 {
 	unsigned int i;
diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
index bbf4674f888d..7cd33eb1939c 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
@@ -433,12 +433,46 @@ void rzg2l_cru_stop_image_processing(struct rzg2l_cru_dev *cru)
 	spin_unlock_irqrestore(&cru->qlock, flags);
 }
 
+static int rzg2l_cru_get_virtual_channel(struct rzg2l_cru_dev *cru)
+{
+	struct v4l2_mbus_frame_desc fd = { };
+	struct media_pad *remote_pad;
+	int ret;
+
+	remote_pad = media_pad_remote_pad_unique(&cru->ip.pads[RZG2L_CRU_IP_SINK]);
+	ret = v4l2_subdev_call(cru->ip.remote, pad, get_frame_desc, remote_pad->index, &fd);
+	if (ret < 0 && ret != -ENOIOCTLCMD) {
+		dev_err(cru->dev, "get_frame_desc failed on IP remote subdev\n");
+		return ret;
+	}
+	/* If remote subdev does not implement .get_frame_desc default to VC0. */
+	if (ret == -ENOIOCTLCMD)
+		return 0;
+
+	if (fd.type != V4L2_MBUS_FRAME_DESC_TYPE_CSI2) {
+		dev_err(cru->dev, "get_frame_desc returned invalid bus type %d\n", fd.type);
+		return -EINVAL;
+	}
+
+	if (!fd.num_entries) {
+		dev_err(cru->dev, "get_frame_desc returned zero entries\n");
+		return -EINVAL;
+	}
+
+	return fd.entry[0].bus.csi2.vc;
+}
+
 int rzg2l_cru_start_image_processing(struct rzg2l_cru_dev *cru)
 {
 	struct v4l2_mbus_framefmt *fmt = rzg2l_cru_ip_get_src_fmt(cru);
 	unsigned long flags;
 	int ret;
 
+	ret = rzg2l_cru_get_virtual_channel(cru);
+	if (ret < 0)
+		return ret;
+	cru->csi.channel = ret;
+
 	spin_lock_irqsave(&cru->qlock, flags);
 
 	/* Select a video input */
-- 
2.43.0


