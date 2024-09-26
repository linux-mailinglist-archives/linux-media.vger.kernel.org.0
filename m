Return-Path: <linux-media+bounces-18661-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 83B2B987B21
	for <lists+linux-media@lfdr.de>; Fri, 27 Sep 2024 00:25:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9E0761C22877
	for <lists+linux-media@lfdr.de>; Thu, 26 Sep 2024 22:25:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2CFD17C233;
	Thu, 26 Sep 2024 22:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=everestkc-com-np.20230601.gappssmtp.com header.i=@everestkc-com-np.20230601.gappssmtp.com header.b="F0ZI7/Xg"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4DB018E76F
	for <linux-media@vger.kernel.org>; Thu, 26 Sep 2024 22:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727389501; cv=none; b=eQUvdGgvEvF1JUgDA91s0fG2P5uCMLix/mHMr2s5qAT1LUJHuRsydRlXXR4ef3RASIVpgMiLyacBlI5GiENhyZTF0uqXVo4IxbqgYfqu/7/vEm/WiRXJzCXTbgMvEU51KbgJTDQ0qqBl3+OBTuSV3gxF4lJ/HpSlLrgv/PegL5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727389501; c=relaxed/simple;
	bh=9LWxw0GkDNKQzpLWJEw8INCGvjdnC+s0GVdlJVVvbaI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=clTd2Bq8cvMYMH6Y2t67t6BpYuJ+AgWIXrvllYI6eHFXHBkt0n0GKoLgXfyCcnjHr/VobBhfPwjTC10x/LTf0s5GARGyEFVSBZrYLXqfVNhFZUFFOPn92gAjk4kGBJCQXRkKCTwBpuc5Us/ytpRBS4paBBQIsfs/Cu8vrxf7U/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everestkc.com.np; spf=none smtp.mailfrom=everestkc.com.np; dkim=pass (2048-bit key) header.d=everestkc-com-np.20230601.gappssmtp.com header.i=@everestkc-com-np.20230601.gappssmtp.com header.b=F0ZI7/Xg; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everestkc.com.np
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=everestkc.com.np
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2068bee21d8so15986425ad.2
        for <linux-media@vger.kernel.org>; Thu, 26 Sep 2024 15:24:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=everestkc-com-np.20230601.gappssmtp.com; s=20230601; t=1727389499; x=1727994299; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nwvdoFGxm3KhCqcwA7uNn+nsr1FJVT8Rrylkxk+BHzY=;
        b=F0ZI7/XgFHmE1EWCmdDGM7o2SV8DiQ2ici+lgrln1f0YwNgrg9uYCPCjvPf5qK0UT6
         mRLMpIwXcO5NaxDnXmYj95PcdSD5bW04q20DyxjHgZQfx8VptyU1sn1B0gwReZiqZ16G
         B0mHdqrE/McNE0115vOUZ/ssarVmR+sHq2iBXVJx8jQRQxCesAyt5MIl3CMeLeX3bX1h
         kS43Y0qJATkoaDm8boAXK87+nUTvmc+w7NCMy0PhEQk09KrdSn97I20I+HBW5t7KYv4d
         hvWQjGjbzyi6DwFjES71UanLooVklt0SgL+AXY469kDZAhcjo+LSAN0mnV9em7XnMfBS
         z3CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727389499; x=1727994299;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nwvdoFGxm3KhCqcwA7uNn+nsr1FJVT8Rrylkxk+BHzY=;
        b=S2ZgA4IRCvg+qdnQYcD9YFhHZCvagwOcDAHS4CN+TMirMS6IHghSAJbaHfoveGxE8z
         uRu1ihLW0OvkkpDaF7dA35Ck87CA6wZ2h7LPdeH6RDptk1FUNFf3bUaYyX1psr8kWWki
         +gZbqNtbPR/DfRW50kjM3fOTQF4ja+hDVIsyxtBR4opACdTHmMaPa31Dch7NVRshFN5j
         xOlC+2m8hVYSbF5+DGXKN/+TkfjzX00W/KZfEEt8H8C3vwFpTcK5j9+lrks3Knr4E+Yk
         1SyOL+ajAIXRULk+NNNks9XHDaWb36ZD3xmXtrr3Y5T9nX5Q+fQCWhVzqbpByzLuyp9x
         3bZw==
X-Forwarded-Encrypted: i=1; AJvYcCXubwk3uH9+pHEebt+CH0eDIMOwFZNlYobtpF3YTkPvJh8WVwSam9QU2pi8joHQmg+qCySnDOLO/Lmbjg==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywkf7NPowlRtk5BesD9byTcStmlv5nw+GgJOgBUiVeK0EYcjZYw
	600pMP+lRIEMv3sGXJdY86LwBvNV/Vrl41/yl2SNztgUmhi//aULLaIFUslqCHY=
X-Google-Smtp-Source: AGHT+IFm/tktsslJFScr7N0Z8rSDXeabptEUKFyK1ckvN8vsNqDXTzaPkw22+7tUHK36g8LVTD4Xmg==
X-Received: by 2002:a17:903:2287:b0:205:43b8:1aa4 with SMTP id d9443c01a7336-20b36ad3bcemr12377615ad.19.1727389499047;
        Thu, 26 Sep 2024 15:24:59 -0700 (PDT)
Received: from localhost.localdomain ([132.178.238.27])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-20b37da334asm3064755ad.105.2024.09.26.15.24.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Sep 2024 15:24:58 -0700 (PDT)
From: "Everest K.C." <everestkc@everestkc.com.np>
To: hdegoede@redhat.com,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org,
	andy@kernel.org,
	hverkuil-cisco@xs4all.nl,
	kieran.bingham+renesas@ideasonboard.com,
	benjamin.gaignard@collabora.com
Cc: "Everest K.C." <everestkc@everestkc.com.np>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev
Subject: [PATCH] media: atomisp: Fix spelling errors reported by codespell
Date: Thu, 26 Sep 2024 16:23:37 -0600
Message-ID: <20240926222351.7116-1-everestkc@everestkc.com.np>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixed spelling errors as follows:
	unkonwn ==> unknown
	Stablization ==> Stabilization
	previouly ==> previously
	acknowlede ==> acknowledge

Signed-off-by: Everest K.C. <everestkc@everestkc.com.np>
---
 drivers/staging/media/atomisp/pci/atomisp_ioctl.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
index d7e8a9871522..1e42a8ca68f5 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -43,7 +43,7 @@ static const char *CARD = "ATOM ISP";	/* max size 31 */
 
 /*
  * FIXME: ISP should not know beforehand all CIDs supported by sensor.
- * Instead, it needs to propagate to sensor unkonwn CIDs.
+ * Instead, it needs to propagate to sensor unknown CIDs.
  */
 static struct v4l2_queryctrl ci_v4l2_controls[] = {
 	{
@@ -112,7 +112,7 @@ static struct v4l2_queryctrl ci_v4l2_controls[] = {
 	{
 		.id = V4L2_CID_ATOMISP_VIDEO_STABLIZATION,
 		.type = V4L2_CTRL_TYPE_INTEGER,
-		.name = "Video Stablization",
+		.name = "Video Stabilization",
 		.minimum = 0,
 		.maximum = 1,
 		.step = 1,
@@ -678,7 +678,7 @@ static int atomisp_g_fmt_cap(struct file *file, void *fh,
 
 	f->fmt.pix = pipe->pix;
 
-	/* If s_fmt was issued, just return whatever is was previouly set */
+	/* If s_fmt was issued, just return whatever is was previously set */
 	if (f->fmt.pix.sizeimage)
 		return 0;
 
@@ -1028,7 +1028,7 @@ void atomisp_stop_streaming(struct vb2_queue *vq)
 	/*
 	 * ISP work around, need to reset ISP to allow next stream on to work.
 	 * Streams have already been destroyed by atomisp_css_stop().
-	 * Disable PUNIT/ISP acknowlede/handshake - SRSE=3 and then reset.
+	 * Disable PUNIT/ISP acknowledge/handshake - SRSE=3 and then reset.
 	 */
 	pci_write_config_dword(pdev, PCI_I_CONTROL,
 			       isp->saved_regs.i_control | MRFLD_PCI_I_CONTROL_SRSE_RESET_MASK);
-- 
2.43.0


