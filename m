Return-Path: <linux-media+bounces-54262-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aF1cJG2fpmk4SAAAu9opvQ
	(envelope-from <linux-media+bounces-54262-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 03 Mar 2026 09:44:29 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E3D8E1EAFBC
	for <lists+linux-media@lfdr.de>; Tue, 03 Mar 2026 09:44:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EBAF030AF653
	for <lists+linux-media@lfdr.de>; Tue,  3 Mar 2026 08:43:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35E1C37AA91;
	Tue,  3 Mar 2026 08:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bC27k3DP"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D4AC388E6A
	for <linux-media@vger.kernel.org>; Tue,  3 Mar 2026 08:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772527377; cv=none; b=OPKT67hm5fMv084CZEikPWU6zOlo53ssS2SfZHye/fRKmUpAlGuDZoGYYXl7cf3jDG/vt9b6miJzmIAVU9mBmmowJ/s6f/aioKEsaJgC895kl8SH3+x6HUngdRDdbjGteHRdsc5acN9LC4LoIp1ohQ0w1OuJNXHGTKJsu58biGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772527377; c=relaxed/simple;
	bh=UKEDgSoNiWITE5rlNAFBVxpTjkZzbRTCWfb1BLNAxdw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EF6aGbv3aI8u3W5Cv6hBacvG9bA/lWBm6AXq61zvFh4NJX2hcQww7c1C74QgWotRUNymINBJixuvVhbI/QV9weFsIHFmuakHdhfUDGKVb1GVDpZntrHTklOIi4agH4pWrwWqrL00TpB6vTMRXNZWli0kekT7Jla1hMX24Tn8rHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bC27k3DP; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-389fa0d1040so76322151fa.2
        for <linux-media@vger.kernel.org>; Tue, 03 Mar 2026 00:42:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772527374; x=1773132174; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tq2yeiELH2O2leNzpOSOy0DgLmB+c4y6g32iEDIZZWE=;
        b=bC27k3DPJXmP7l2zDb8woXq8pYwGxoItoBWPFYGR2Q8EhaA6uixePRayudhFz/Vnpe
         g7i9+lohA1Yay4cNGW2t2H8Q7a5pSarasfzdMWyO0yHEUX2Qb+xbUMSwHyVdlEUrIaqj
         NuTtBMfsibsWeKPltFS0SwllithcH05inndP5UJwgXXRPjeMinKcChYFxH43ycJw98lW
         D9wV3yck+kdrAA2x81FFO+Tlmn0qx8/AuKaE4jn+rpx2NxRR9qEGYbBrqaYgdJ1Hxbz0
         GppmAePG9JnZI6B9RJcjK2JWB7rGVmo4IDo08qtL+FCSdKLb5z/ArRE0khOi1jcMfGTa
         Oh5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772527374; x=1773132174;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tq2yeiELH2O2leNzpOSOy0DgLmB+c4y6g32iEDIZZWE=;
        b=YigQrAfQCNKJmUesKOI32hKcvCyvmhSxYfYydGE1gW1tFpQK4kWTp3gDSZAW828/xx
         IJa03GwrY5LkkaPCqOHKQSTSJE4L+geeQKMDpiXmnxPI4NOSFjghZlBMnD7V8+n4M4ik
         5eB6SzpfNPLhDatWTeTuAvRgTMrF5YNrF19NCvCJTYRmrNH2Xzrf/1Qj5pYy3bLALVHU
         IBYEo2luu3w/qglH4wbruK6PuMlMzo5vpNCt0YnOFH+dJOCZSp7M5kHGupGvmf0J5ehG
         mJu+ANnXJvIDvr8wOQPT/kVR8R8uajckbZQlcrOc6YnNiX5FGnowFckMzsAYOmBEtN2U
         16VA==
X-Forwarded-Encrypted: i=1; AJvYcCWS6FQVH89FhLHpRRbmyfntTkquxjlEaddIBc0tRU02bxaak/Q9FF0zp4SzrisWZmn9/lRmBwfqm3a3QQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyyqFNB3Z2RxhIjjPeeFwXoBYGOGHIvipum2mFdR2tdx2wQgUEM
	c053AwgB/RJd4X36MGKpr2giopFh8TpEEdUN15Yo9zQ1MDsDeygdiF8O
X-Gm-Gg: ATEYQzxmIpcmtAYYXMmv2qJ2cr4immbWXYH1+MHEoX/Pc+/y+SRbxsubx1m9h8AwFbY
	CGKv4SdLosziqZ1she1uTTf0p35dwnwLZKkBsBmhyvcRIQxiDVpfc4PK4x4MxowEaFw7xVPy50/
	dNSR5ILyOQRuR7MWyrbyJ7eBM6MvBcvLMS7me2fjohGFitKckhEkvQHp82i7AjqHDB5AvQaZ+mY
	vp3Rq4jriyjICVtcDQp5U8Kn1grN9+O7AosBp2VMPbH9OtpKd/kaMTa3cjHgBJ3BwzJYJYtYhpR
	1qgzkm9jvjmTS/Gub4WL3QgMlmLKOz20ytPdc9/Ryz1qLGOKycBZzPvvuGJXvr/CIup7Q/sbINs
	DeaEpfSXwb/Ghe5zWkZoZViEBoYa/4ktlCRR2hMailtyo8HKFK7/BTRf8fI1/MbMebXGOTdtqUC
	dovJog8O0zCbQt
X-Received: by 2002:a05:651c:2120:b0:383:26ac:4fd8 with SMTP id 38308e7fff4ca-389ff07fd9amr102630141fa.0.1772527374144;
        Tue, 03 Mar 2026 00:42:54 -0800 (PST)
Received: from xeon ([188.163.112.72])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-389f30227a9sm32599471fa.42.2026.03.03.00.42.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 00:42:53 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	Thierry Reding <treding@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-tegra@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v7 03/15] staging: media: tegra-video: vi: add flip controls only if no source controls are provided
Date: Tue,  3 Mar 2026 10:42:26 +0200
Message-ID: <20260303084239.15007-4-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260303084239.15007-1-clamor95@gmail.com>
References: <20260303084239.15007-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: E3D8E1EAFBC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-54262-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_TO(0.00)[gmail.com,nvidia.com,ffwll.ch,bootlin.com,kernel.org,linuxfoundation.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,bootlin.com:email]
X-Rspamd-Action: no action

Because the current Tegra video driver is video-centric, it exposes all
controls via /dev/video. If both the camera sensor and the VI provide
hflip and vflip, the driver will fail because only one control is allowed.
To address this, hflip and vflip should be added from the SoC only if the
camera sensor doesn't provide those controls.

Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com> # tegra20, parallel camera
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/staging/media/tegra-video/vi.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
index e0961bc0a017..19eebfdae221 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -962,6 +962,7 @@ static int tegra_channel_setup_ctrl_handler(struct tegra_vi_channel *chan)
 	}
 #else
 	struct v4l2_subdev *subdev;
+	struct v4l2_ctrl *hflip, *vflip;
 
 	/* custom control */
 	v4l2_ctrl_new_custom(&chan->ctrl_handler, &syncpt_timeout_ctrl, NULL);
@@ -987,11 +988,13 @@ static int tegra_channel_setup_ctrl_handler(struct tegra_vi_channel *chan)
 		return ret;
 	}
 
-	if (chan->vi->soc->has_h_v_flip) {
+	hflip = v4l2_ctrl_find(subdev->ctrl_handler, V4L2_CID_HFLIP);
+	if (chan->vi->soc->has_h_v_flip && !hflip)
 		v4l2_ctrl_new_std(&chan->ctrl_handler, &vi_ctrl_ops, V4L2_CID_HFLIP, 0, 1, 1, 0);
-		v4l2_ctrl_new_std(&chan->ctrl_handler, &vi_ctrl_ops, V4L2_CID_VFLIP, 0, 1, 1, 0);
-	}
 
+	vflip = v4l2_ctrl_find(subdev->ctrl_handler, V4L2_CID_VFLIP);
+	if (chan->vi->soc->has_h_v_flip && !vflip)
+		v4l2_ctrl_new_std(&chan->ctrl_handler, &vi_ctrl_ops, V4L2_CID_VFLIP, 0, 1, 1, 0);
 #endif
 
 	/* setup the controls */
-- 
2.51.0


