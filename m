Return-Path: <linux-media+bounces-48093-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id B3600C9C28C
	for <lists+linux-media@lfdr.de>; Tue, 02 Dec 2025 17:14:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 24DB8346856
	for <lists+linux-media@lfdr.de>; Tue,  2 Dec 2025 16:14:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01989289378;
	Tue,  2 Dec 2025 16:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VtBbk8Iz"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com [209.85.214.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CC6428468B
	for <linux-media@vger.kernel.org>; Tue,  2 Dec 2025 16:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764692070; cv=none; b=uC5/mT/F7dw/ry5OgmrOIJWqVxx1SRKZoeh/zNx0xXieXgzBUMelmpku/2Qe6/PuNREU5D99z9l+8bUKH38wXQXHpTuS6+FTtPKExHMA1fzPjn/BSE/pFG9ohyp2po5O/mi6xYnHoaaR7Pl07D2gnNPgT2hoobepFpgE6Qhea1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764692070; c=relaxed/simple;
	bh=Q93r5XsVAYH01/IaXbrD/ulOS3CSAoNRbx5rmSy1IKs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TNCtIpTeJod0mYbHNP2V79ci49d6JYEMpN8M/+UhMy9t3UA+nY3yOQ7yfuM6JZsP+ijft84oxvD0Y6KHMdw+3ZF6pG7jjXGLwXDmkJgfx7PZGURIOmo6vlEpWMpcD8xe3hoOBidErEpYNIsRy1KQrIeErWh0LvFpiHd0H1AJ3k0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VtBbk8Iz; arc=none smtp.client-ip=209.85.214.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f194.google.com with SMTP id d9443c01a7336-299d40b0845so91902665ad.3
        for <linux-media@vger.kernel.org>; Tue, 02 Dec 2025 08:14:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764692068; x=1765296868; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ujAnw4eyXMXxdoX4FR6nN3wY45XQHoiz/qHdt7YVd04=;
        b=VtBbk8IzGcgHdnQpQVFLaS/Mx+kUkiBiujSM7fFGJkt11wiAUvCZD4df8cw4uifx7W
         xjy61WyTiIdNYczje00AR4oTnj5QBmVHCpIjD7gmWi/+ADJD0Y/2+2PWQAKr56TW98bq
         351uN+M0n4EF6DdKXlU0xLbeVsxKIYEDUan78oXmHYmsUuA8haFaQv4zqEnwo9RdevQZ
         7ON9khph4PbxOJxAi+bQT8pjdiXEWPQh3TaU8W2b/unchU760s8CMHV9kkuoeqYicOHo
         ynZT9OfcBNH1PVixKzQh0IMVWHioubXl1isE7+WjFIj08sYl3PKYTLlk9k+aX97vc4XE
         aNhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764692068; x=1765296868;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ujAnw4eyXMXxdoX4FR6nN3wY45XQHoiz/qHdt7YVd04=;
        b=TPmyDfwNfSrMOrsVuLcBPpETm3GPbLhTy7yWkN1nzis440TS2G9P2Gq7QVscGDArkW
         fDqF60C/RJG53L+L67VhTL2EvGhnDNSiRzCa48ARIoidm5emO0Rai6ROwdTRrPSK1jfz
         QFngHMO+ecwU12jA2Gt0WgaZQ73DAa9tqyZVbT9O620cw33tFZQul36SXJrCzOMc/4nK
         6HzIALhE0HP5KzMnix0taaoI22sLG9iTL+vKekjO0R821v97FEyoXldH0t3WgpMoUUde
         F5TinpQK3Wl9wKOpLPMRvQ3AaCen1XqhGTHJQpN/jpcqFUrnf3qiEHnKi+TGaacgfL+F
         TTOA==
X-Forwarded-Encrypted: i=1; AJvYcCWjaGWAWbheyOQbLdLIUIKiUttZnqE3xQqywYb8yx3EhvPB4xwBYQWlwHqCGYflkvUyc3VA5V8RHYjwSA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyrpNI9Pp2MaU4XRw6x9yytCMuIk85wKhTmqYnXVENxhfPhqJn4
	1Q9bGQ27SgCgNdxPWot3w6/7NrixOvOD2xpGxrVasx6liICeH1mWOEsi
X-Gm-Gg: ASbGncvz+f0PAI49ffOb9Mp+2Ar7MBye7wg9RCfrlBws/VOuSnAYgvuj+AAUyNpK1S9
	QuO3fiGPEcwapCsN/iKACA3PzPhoWfLtAy+d1I/C1XCYvPpIIZye36r5nhdv9WPY7LjY0FKP9J6
	zoWNNR339v6AA1wnnk0Y64GFnY4ooxMYcAu2TpNfIKO6cD/iYvVT9J0bJGj5/mfIBEyNrQc83mF
	F7tUmehuSO9qQY5+onkD3RcjS7tZ08cxsUQJinwQvyZO45PPcU2mK5TzJvoL6g/mefIWaDRgKtu
	popINVJ6+ujr2mb1X3uTm+eUK6hNPQkejOs4eiHJPXD3QnFcVwV76TX5U1D2RSF/gD3HtfpGNLH
	eKvQG9MsDwHzNG62Dgv/vgarDDn+0yWDtHkyWFEBwV8JMA+5tV8icjmM5sAf31KNlxex42mGFW+
	F5tXY2pnBN5eInAtqnquSIGE7aYpZiLdOe4XE=
X-Google-Smtp-Source: AGHT+IHKFWblm5LnaQm2d8+shTmkcU+FDf+0H06eH8nxVUhcOjJfWxAnQTwqjA0T3qIJaqWoH98RSQ==
X-Received: by 2002:a17:903:244a:b0:294:d953:6ff9 with SMTP id d9443c01a7336-29bab1ae07fmr312387985ad.47.1764692068151;
        Tue, 02 Dec 2025 08:14:28 -0800 (PST)
Received: from vivek-IdeaPad-Slim-5-16IAH8.. ([2405:201:c020:c865:ca9f:dff7:8120:8577])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bce44389bsm160814385ad.32.2025.12.02.08.14.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Dec 2025 08:14:27 -0800 (PST)
From: vivek yadav <y9.vivek@gmail.com>
To: slongerbeam@gmail.com,
	p.zabel@pengutronix.de,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: vivek yadav <y9.vivek@gmail.com>
Subject: [PATCH] staging: media: imx: fix style issues
Date: Tue,  2 Dec 2025 21:44:13 +0530
Message-ID: <20251202161413.92230-1-y9.vivek@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Applied checkpatch.pl recommendations:
- corrected whitespace
- fixed line length
- adjusted indentation

Signed-off-by: vivek yadav <y9.vivek@gmail.com>
---
 drivers/staging/media/imx/imx-media-csi.c  | 2 +-
 drivers/staging/media/imx/imx-media-vdic.c | 2 +-
 drivers/staging/media/imx/imx-media.h      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/imx/imx-media-csi.c b/drivers/staging/media/imx/imx-media-csi.c
index fd7e37d803e7..725478bc2026 100644
--- a/drivers/staging/media/imx/imx-media-csi.c
+++ b/drivers/staging/media/imx/imx-media-csi.c
@@ -1509,7 +1509,7 @@ static void csi_try_fmt(struct csi_priv *priv,
 	}
 
 	imx_media_try_colorimetry(&sdformat->format,
-			priv->active_output_pad == CSI_SRC_PAD_DIRECT);
+				  priv->active_output_pad == CSI_SRC_PAD_DIRECT);
 }
 
 static int csi_set_fmt(struct v4l2_subdev *sd,
diff --git a/drivers/staging/media/imx/imx-media-vdic.c b/drivers/staging/media/imx/imx-media-vdic.c
index 86f2b30cb06c..58f1112e28e5 100644
--- a/drivers/staging/media/imx/imx-media-vdic.c
+++ b/drivers/staging/media/imx/imx-media-vdic.c
@@ -616,7 +616,7 @@ static int vdic_set_fmt(struct v4l2_subdev *sd,
 }
 
 static int vdic_link_setup(struct media_entity *entity,
-			    const struct media_pad *local,
+			   const struct media_pad *local,
 			    const struct media_pad *remote, u32 flags)
 {
 	struct v4l2_subdev *sd = media_entity_to_v4l2_subdev(entity);
diff --git a/drivers/staging/media/imx/imx-media.h b/drivers/staging/media/imx/imx-media.h
index f095d9134fee..135daca7d55b 100644
--- a/drivers/staging/media/imx/imx-media.h
+++ b/drivers/staging/media/imx/imx-media.h
@@ -231,7 +231,7 @@ int imx_media_probe_complete(struct v4l2_async_notifier *notifier);
 struct imx_media_dev *imx_media_dev_init(struct device *dev,
 					 const struct media_device_ops *ops);
 int imx_media_dev_notifier_register(struct imx_media_dev *imxmd,
-			    const struct v4l2_async_notifier_operations *ops);
+				    const struct v4l2_async_notifier_operations *ops);
 
 /* imx-media-fim.c */
 struct imx_media_fim;
-- 
2.43.0


