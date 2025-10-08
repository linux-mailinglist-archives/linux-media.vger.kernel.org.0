Return-Path: <linux-media+bounces-43915-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 1008BBC39F8
	for <lists+linux-media@lfdr.de>; Wed, 08 Oct 2025 09:34:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id B094334D160
	for <lists+linux-media@lfdr.de>; Wed,  8 Oct 2025 07:34:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDBB62F5A18;
	Wed,  8 Oct 2025 07:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XZp4dH0J"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4F1E2F531C
	for <linux-media@vger.kernel.org>; Wed,  8 Oct 2025 07:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759908690; cv=none; b=sthm2m/RnNAhSSWRcHuUTjSVJuTXtPPaLIlbkUoGybC/tX3zTU2PY0PZHfvA7UipLnUUPE/ogAwVoDar7Xdlg9r95xWMNRvSYl84e+5qNZ25ZCTb+PyB9S+uhmFCfQkfRggeijuFwTsODnEWlwA+cZnlWZSy/gE/G1wQrfGtouY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759908690; c=relaxed/simple;
	bh=u+qJVWyapenrodgmMyyh5sdeoJQIHo+UHZurPNrBBEU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pAVYO/dk7/Yqdm0qEwpGUJSbLXAetBjT2M88OM8itHC8NiTzU8yzVFmB3vxifB4VU9LKfTBlhcEWS/vovycYDp7sL/icyppMVpykAXJgQ/V5qyNxvmkqlcFRf8c0ZhqvLDxjUFyg1z7qflXM/G+tN6iUB24K+aiXKQ1NVRT2Nxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XZp4dH0J; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-58afb2f42e3so8512983e87.2
        for <linux-media@vger.kernel.org>; Wed, 08 Oct 2025 00:31:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759908686; x=1760513486; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oNnZ9HXiG4U5oHkge6rfZLR0dPMVP9tD5A0n1Dg/8XI=;
        b=XZp4dH0JeMzACxra9xMEXeith1ww6pTvU/algkbvi55/gYT25Cxm7hd3I0bsxnmEXU
         Meiu5CSJo1pxv4Mqg5LKKIvzv/QALv3GosKzBSaBxex7sGtODHMNuW7qzKs1LeLli+Gi
         BYu3Ymjw/8EljTKVskvvRx3Tma+D17ZEg6gtv8IXmdPmj+JjZ9k0/Vc6dZkbQF98amB0
         Y04yB200yXmG3mlHxDCYd6pLvpIoqsFCupUepTl1Vr+meTKT0VxEtcTc0ARxfJtxirOI
         xlz6XrNy0yQK05IGyJDm7vHLcGqRMHYuX97ly+cVGW6lW+o3HI6Sa9eIi71pBCc+ViEP
         KdVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759908686; x=1760513486;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oNnZ9HXiG4U5oHkge6rfZLR0dPMVP9tD5A0n1Dg/8XI=;
        b=vjhhunPKQGKTrjMtXVQaNxPgdA/Bjj/zoUttvo4WrNLM+R+xQklhNBO7EcTrMxhTLp
         6EVYwq77yLxgE0xHuq7sfZikZq7Ahqydi3KPCh1U5+k2kHJb9xmD4I7oVjlxo+mbFO10
         NrBzUJhcNOPQRdb9F0Q8p07mMw1XbRB9PIWn38ecTxnrzDjBDbVngxVjBegNRbcQnyR2
         AqiPOP8j5OChCU+i/tiGJXT91PnNNwH1+HCLsUYBPO9KLh1KJ7pOagFAoHNlROk2v0Sk
         824eVG6ao0ctVOi7sT+YoUY7j0GcE/m+uP6gDe8sdsoMeNfAKcfl4sstMWixWaCN5o7w
         Pd3w==
X-Forwarded-Encrypted: i=1; AJvYcCWwmzwxiaJzkgOQVYRFOFBhrB0Bo4EskjOwedMw+BL454AIc+I1FnUhE2sds6YD8lA3q3+xycDMswbK3g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyic5sQRNfK1W4bTf9n0W1QmaeiY6s7XtsvrHD8ZQqJ+2bPnz79
	VOs2NNpy/Y/jkqd7HBZeRyFBEX81fnmk2HQsa1rqcAz3W6+yMtYZB5Ts
X-Gm-Gg: ASbGncug63nbd+m3jhCdg5I8z1vnB2RjJpmpj/qRulH++hwTDJK2sfxH1fywxu1b4kL
	9+k24OqV0zXF1AJ0m/n26ZQx0Yr+oDuJQWCBb87VMFY3B7l7lFj8fgNkx2cWNH88kMjNWrrL/8M
	vRtN3M1/0aA7ny/Wax9OgRgLm5ugKqLPXb9tTsy6KB53ez+fplKub/xLCD8PYEwkDO17TKd0wKu
	7RhCn9vGPcVjFf/PmVH8GXAC82lOOnQFIOUa+RK+r+9uucGl4ALBPDjJEWB9RAurUYtjSYUl3Yj
	fO3n+CmUxkmojNdRhJEwL6qeh/kDlJHQkdJqOXKZFNFOpmsOqaZfOlZiVVID7WjJyIDorDc5D+i
	hIZ4wMkzoUGIgjrjb+4FB4SohfbXYA0hBlUyt8A==
X-Google-Smtp-Source: AGHT+IFR32lh8FtdUEL6SphWqMKGIHQLehIZkE6OfQDikiDPLeDxw8CjYdXaviYneZ6ag7JJ8WYzTQ==
X-Received: by 2002:a05:6512:ad0:b0:57b:1ca2:ab60 with SMTP id 2adb3069b0e04-5906de89076mr686708e87.52.1759908685358;
        Wed, 08 Oct 2025 00:31:25 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58b0118d22bsm6911016e87.85.2025.10.08.00.31.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 00:31:25 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	=?UTF-8?q?Jonas=20Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>,
	Dmitry Osipenko <digetx@gmail.com>,
	Charan Pedumuru <charan.pedumuru@gmail.com>,
	Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>,
	Aaron Kling <webgeek1234@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v4 07/24] staging: media: tegra-video: vi: adjust get_selection op check
Date: Wed,  8 Oct 2025 10:30:29 +0300
Message-ID: <20251008073046.23231-8-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251008073046.23231-1-clamor95@gmail.com>
References: <20251008073046.23231-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Get_selection operation may be implemented only for sink pad and may
return error code. Set try_crop to 0 instead of returning error.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/staging/media/tegra-video/vi.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
index 7c44a3448588..856b7c18b551 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -476,15 +476,11 @@ static int __tegra_channel_try_format(struct tegra_vi_channel *chan,
 	fse.code = fmtinfo->code;
 	ret = v4l2_subdev_call(subdev, pad, enum_frame_size, sd_state, &fse);
 	if (ret) {
-		if (!v4l2_subdev_has_op(subdev, pad, get_selection)) {
+		if (!v4l2_subdev_has_op(subdev, pad, get_selection) ||
+		    v4l2_subdev_call(subdev, pad, get_selection, NULL, &sdsel)) {
 			try_crop->width = 0;
 			try_crop->height = 0;
 		} else {
-			ret = v4l2_subdev_call(subdev, pad, get_selection,
-					       NULL, &sdsel);
-			if (ret)
-				return -EINVAL;
-
 			try_crop->width = sdsel.r.width;
 			try_crop->height = sdsel.r.height;
 		}
-- 
2.48.1


