Return-Path: <linux-media+bounces-18094-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 76552973E19
	for <lists+linux-media@lfdr.de>; Tue, 10 Sep 2024 19:07:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1F6011F26322
	for <lists+linux-media@lfdr.de>; Tue, 10 Sep 2024 17:07:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAF3D1A3BC1;
	Tue, 10 Sep 2024 17:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jLhkHbz3"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86F7F1A2C1A;
	Tue, 10 Sep 2024 17:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725987984; cv=none; b=iAnHLks2GZOF7vpSTv7a+AAObW7MJIrxkrxgQydJ7AwyT+hjKZkYhYwkCFhP3MyGINuYhCtKxF/W79lsCH7L2l6LjDKHMuWZkcOpiLi1t5EO6N3Ww0B85vtsQfBAPzIs36dGw7XtUQOCl/eExm9+M5+VpzNoQIJHhR672vhqUSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725987984; c=relaxed/simple;
	bh=ZShCPWFSW/sqGfuamWtEEwCfgDxJvKsb2CpN+xf6TmM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FMFKxFJQzmfnKYL57EUJORk96Z9z5LDxd7Rvhbt4M+8fCQDbpdvss0uT7n1jNzWXuVtKyJfdyE4RYMDxFUI6oOPLc/vs0msXU+bJcK1QRm2W/U5Ox31oePcs4RgIfyfj2qZ4YRZOe1VXlO1bllmbS2A8qvePtxmtHYDKkgC9u5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jLhkHbz3; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-374bd0da617so673227f8f.3;
        Tue, 10 Sep 2024 10:06:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725987981; x=1726592781; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bviiKkM7wyJK2q4unJEl7wvx3EhZ5MDlCK2md31apcY=;
        b=jLhkHbz3vZDr+Un5Gdm1L9poYwmQBnVGx2kVz+Gj8keLorkEBkhDtBQ5NVUmmzHDvO
         O0ipz6ynmdfcovhiiTKvB0Olv3+nVPvIuhe6uus2UVr4Zr+SAAWA7Fjcto759K5B3a2b
         1Q3JPed+LlLpNP0CMy5fdKHpPhre2fRPF2VsA5+r8MBoQViLAQ+SItk70tKDBGLHaC5v
         bfxTnLHcccjDxNtSJCquz9BEiskXSk96VhwoKZcqOgNwvd/rPGqEZUdFyYQ/0AIHu2UJ
         7Ev8TafmW4CkPEQg2XgI+mCYVbMDoq5FE57y3hIoKv8X5GsxF3GcHixNVCG6S97g8g/q
         isDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725987981; x=1726592781;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bviiKkM7wyJK2q4unJEl7wvx3EhZ5MDlCK2md31apcY=;
        b=msyJee3gcQMCh0XsvsNMPJgb64fXaVNb2nItoEpKzcMu5Fn9yt0OMwebJbN+UoTSMz
         OknTs7jmUikd5soZpDEa7rgG1WP9PAhtBf9t/sGog1UqURdt4ClxkF/9IG+Ju8ykaBq1
         GivPI5ExQA+SLhKQkzrSgOVbWGI6699LqrIrmI4qpkQeiz2u8Cj5ZQcQ4t+HMBiSR7J8
         axrUsY7CWzEp7nA0kRI+wSVYvHRIfsMdISiAqpsVCy68mZh3dN/VXcNcK3Ym9vaaebh5
         sI7/r8cHUoJ/e+/3l39dMU6VGXyV4yWXrLpelND2R1+DyB8akyrrJ0tl8863sq9hivVe
         mVdg==
X-Forwarded-Encrypted: i=1; AJvYcCVswAo/aCrRLbDHLsRPXMsAPuqD1DXv+70vh7ELsRibZdYGMVgL3wgwbDYN2BaUFYx+GVPcLWwb7wqHxppuub3thaA=@vger.kernel.org, AJvYcCWNXwT/rYJrLahqyMNcgiQ88lAfSUdBWJlOX0QY71mQZQ3sjvFepjX3bFlWlVi/383EJJDyQ/DtLKuiXzw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5ZMERjPA3seFlItMJ89WAex2FZ44ciyv1QmqdhfzYYG5oklSG
	ds5Xt/rQo7ae3kb1fBxKqlLmn+LMhF4v49kJV0glRcoKo1rU+UfbL1rJiQ==
X-Google-Smtp-Source: AGHT+IHIMx6tyFVJQibpsTviFVHZe9gUQGJCjmx48HNpYgN76ScWzQY/1kw2EAhKoYszBGEPkNhcWQ==
X-Received: by 2002:a05:6000:50f:b0:378:7dc1:b22 with SMTP id ffacd0b85a97d-378b0791de5mr262940f8f.12.1725987980749;
        Tue, 10 Sep 2024 10:06:20 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:94a6:1e64:e5a2:2b2a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-378956de4b9sm9438925f8f.111.2024.09.10.10.06.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 10:06:19 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 03/11] media: i2c: ov5645: Enable runtime PM after v4l2_async_register_subdev()
Date: Tue, 10 Sep 2024 18:06:02 +0100
Message-Id: <20240910170610.226189-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240910170610.226189-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240910170610.226189-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

To simplify the probe error path, enable runtime PM after the
v4l2_async_register_subdev() call.

This change ensures that runtime PM is only enabled once the subdevice
registration is successful, avoiding unnecessary cleanup in the error
path.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/media/i2c/ov5645.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/media/i2c/ov5645.c b/drivers/media/i2c/ov5645.c
index ab3a419df2df..78b86438c798 100644
--- a/drivers/media/i2c/ov5645.c
+++ b/drivers/media/i2c/ov5645.c
@@ -1239,18 +1239,17 @@ static int ov5645_probe(struct i2c_client *client)
 		goto power_down;
 	}
 
-	pm_runtime_set_active(dev);
-	pm_runtime_get_noresume(dev);
-	pm_runtime_enable(dev);
-
 	ov5645_init_state(&ov5645->sd, NULL);
 
 	ret = v4l2_async_register_subdev(&ov5645->sd);
 	if (ret < 0) {
 		dev_err(dev, "could not register v4l2 device\n");
-		goto err_pm_runtime;
+		goto power_down;
 	}
 
+	pm_runtime_set_active(dev);
+	pm_runtime_get_noresume(dev);
+	pm_runtime_enable(dev);
 	pm_runtime_set_autosuspend_delay(dev, 1000);
 	pm_runtime_use_autosuspend(dev);
 	pm_runtime_mark_last_busy(dev);
@@ -1258,9 +1257,6 @@ static int ov5645_probe(struct i2c_client *client)
 
 	return 0;
 
-err_pm_runtime:
-	pm_runtime_disable(dev);
-	pm_runtime_put_noidle(dev);
 power_down:
 	ov5645_set_power_off(dev);
 free_entity:
-- 
2.34.1


