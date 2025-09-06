Return-Path: <linux-media+bounces-41904-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 42FBCB46FB6
	for <lists+linux-media@lfdr.de>; Sat,  6 Sep 2025 16:01:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AF2E317726E
	for <lists+linux-media@lfdr.de>; Sat,  6 Sep 2025 14:01:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BB9C303A2B;
	Sat,  6 Sep 2025 13:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Az5WLtck"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6683302746;
	Sat,  6 Sep 2025 13:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757166874; cv=none; b=H9kp/KcjA/2Zeh+fDSKq76TG55bRJ6magHWeGPbDr17sctnJbFsOd77KNxhgVg2RKI0RREEkbqEOR8JqYo5x8oSTt82CxexLz9Rh3jqlU9hn9tGJDtkmtzjunDJ2G5N3DaPBWwzPh3mPxxhFsiy5XPJawPUBGWQB5XjsiQqyiXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757166874; c=relaxed/simple;
	bh=8tnFIzYEyxTw/7CgQvAPM+N5YfXOp0o7es7fwYlU3MI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k8Cf5a2Um/CocQqxyVfUmX0DBxbmeUjwou5a9IxROnahXqS0ycn6W8Mq6sVogc4na1iYdgT3fyFm7Oo+jYfnCTu0OJqajQA7iTeAaZf99dOnk5nyO8S6Tti1nqSMMw2OGmc3tDJ4yfSydZ1Be3JZU4ICNnnOC/p/VuIPdJ9uyd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Az5WLtck; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5608b619cd8so3567823e87.2;
        Sat, 06 Sep 2025 06:54:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757166871; x=1757771671; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7mhDgiHOnOUHFnbDg3vpOrqddC2vZG0fv0IytpHCc+Y=;
        b=Az5WLtckFdGreI5BGil/sAijhMpRrV+pf0Q9WRUGju4xMvqZY7O49tWwxscsxS0Oib
         G3uLnSIdJpVf4rupfrgjIuO01OaqOiZN7MyCdBG8XI7Qx6u3yJgC9oI1xxpq5b9PV3g4
         P3LtRotl7vNJ/OMlU2vIyHdlgISVaw3aHDNxhUrNmOBMHoLiXK3d8TZi0grARh8k/v49
         moeR0jH7xjUWtpV1wfCJ+T0sy7uJx5QvLmYDA8oH1Nv/BrqAgWDGP5DQmYsuJONgcFzG
         UUJRZAf3SS4mBhSVaL7fPcgH0HF60jeHIZP8PSQBsV/WGbdBIGzerb0r+0BStI0LrzU4
         maNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757166871; x=1757771671;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7mhDgiHOnOUHFnbDg3vpOrqddC2vZG0fv0IytpHCc+Y=;
        b=QjT9zCHaz/uhuln9of5XwYltDlBo3a3VBWjIHp4D/mCWgJHYqqJFP3zZEuxvX1HicF
         cGvNSDqrsWLRYMjqptCl1V8BOY+gCbssnWCW37ODHRwLe60+gcLpc6AowXyxwr2+8uDe
         AZh7cvdZpZS+xh/qQIKM/YjQoQOOfcrNKZV18+IjtbHWnvpDL7laVwDVQ2fMcg3Bc2g3
         aIOyEWMovX+qw4bum2Qg7Sp3ab5Sy9hjmWVpP9t+4sdgW8wvyS7RTH8Sfxz9Z/FiJg5F
         PO9OM7kpPgo081ypC083iMVFK0MR6WVoolGgSDlK/tBGO5X185BSoCRa7GAShy9yC2+N
         oOeA==
X-Forwarded-Encrypted: i=1; AJvYcCVPcWSJ0ggTKhDyts3PGLEGhG3C8KZQyEm2ofI7cDc0/XVG1JiTLc4Hpqop7Bo8fHGSF4ywDT5V8Jay@vger.kernel.org, AJvYcCVq1jvIKYqBPeCQm10HBxG9UjtSnPFuaSvMwc/ZOCRmw1QW7hYVi6fXXW0Q7EnvfAZiO/8HXqUCpJxG/yZY@vger.kernel.org, AJvYcCWRd5HscDDtBxtIkUgZo6z3eIlLsYFtT1pnZ4vGa+ZwsUTL8xj7Kjf3UbHsfChbR5ivwiCygj8kFhNIehQ=@vger.kernel.org, AJvYcCWnLfPbSXgcb5S8250Tk/67n7QEbvaEU1MkJ3od3bAhPm3QHy2spazX1dlQOoU384+sPpGSbAwmLianIJI=@vger.kernel.org, AJvYcCX22gC8Me18Cq7bh6HW5f5q2+GOzbzyzJEOC4E9ysomEQsCznashvJ3sHHCiQ1yrlxLaYqRkNggAOG/@vger.kernel.org
X-Gm-Message-State: AOJu0YwepUKevkO0OIUmhU/83zfu8K1U1LtRgMWvsXlCgfmwmvTRdS3a
	usAAvitbghTrgt5jFhEhdVahq+1QUapnFejr/QCLiL3G/IoTGww1ja7T
X-Gm-Gg: ASbGncv3dT1wW+c3xaeal1l3E9fJ9g6/9GJevNjqC9ccEkv7Vf4YQe+jbyM07CK8U42
	2s+pz/4FnA1tFx2gzbc0A4s6eIo9s88goHHNt/FGAiz3YLM4OiCxKrVL4QoW+nUFSpAzPc4NPhM
	zqUzRsu3bf4td+MPMVjHVVKK7Za18Wh83FUAzoYlVEa4oJR5yVENgDQqDU2uLPbzbxoL57FjM52
	f08OIcYn/mNOl3eHC1V6mj558TQ1676EmRrlC+D3HarsTDEb/qbIGp2V07lCIBlRpEWtrBY8UAc
	qpRL/zMD92Vm2TBebDWmDL5hEumD5OwLHOa067VyqvESC66wh4RMubMBnCwG8yBdP1oYbkXUKXB
	nH2jGOgMo7RSR1sQHvpzxqtDB6YFpuehOds0=
X-Google-Smtp-Source: AGHT+IHEazhMUm4QC3TD/od78UfhCFya+ZuB6sMvgFxZAijLSg9k4+KtNdbKBe2GJTxtOek8Ckzs1A==
X-Received: by 2002:a05:6512:b87:b0:55f:3a96:936 with SMTP id 2adb3069b0e04-5625f90ee59mr671609e87.15.1757166870721;
        Sat, 06 Sep 2025 06:54:30 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5608ace9c65sm2357467e87.85.2025.09.06.06.54.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Sep 2025 06:54:30 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	Thierry Reding <treding@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Dmitry Osipenko <digetx@gmail.com>,
	=?UTF-8?q?Jonas=20Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>,
	Charan Pedumuru <charan.pedumuru@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v2 18/23] staging: media: tegra-video: tegra20: increase maximum VI clock frequency
Date: Sat,  6 Sep 2025 16:53:39 +0300
Message-ID: <20250906135345.241229-19-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250906135345.241229-1-clamor95@gmail.com>
References: <20250906135345.241229-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Increase maximum VI clock frequency to 450MHz to allow correct work with
high resolution camera sensors.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/staging/media/tegra-video/tegra20.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/staging/media/tegra-video/tegra20.c
index e0da496bb50f..3c5bafebfcd8 100644
--- a/drivers/staging/media/tegra-video/tegra20.c
+++ b/drivers/staging/media/tegra-video/tegra20.c
@@ -590,7 +590,7 @@ const struct tegra_vi_soc tegra20_vi_soc = {
 	.ops = &tegra20_vi_ops,
 	.hw_revision = 1,
 	.vi_max_channels = 2, /* TEGRA_VI_OUT_1 and TEGRA_VI_OUT_2 */
-	.vi_max_clk_hz = 150000000,
+	.vi_max_clk_hz = 450000000,
 	.has_h_v_flip = true,
 };
 
-- 
2.48.1


