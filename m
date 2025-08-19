Return-Path: <linux-media+bounces-40273-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B1C23B2C361
	for <lists+linux-media@lfdr.de>; Tue, 19 Aug 2025 14:23:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 489B41BC2F8A
	for <lists+linux-media@lfdr.de>; Tue, 19 Aug 2025 12:21:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB1C43570BC;
	Tue, 19 Aug 2025 12:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZYjQgfrA"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85A3B350843;
	Tue, 19 Aug 2025 12:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755605833; cv=none; b=CFxxgE9XCyxDUlj2Vl2sL8uW1PjVjTySdH8pOkF0RcWBEih+2iTreCM+FIHGPnbG8Ao4kO3c+ke/hCMplhxz/Rry5cOrjzSshEQ9ZuUauzriGXaXGcdjJHueuRAcFb9ZYo8iO3SAqsyr3gn9oN6VkUWMmJnzT7rSXc4S52eT4ZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755605833; c=relaxed/simple;
	bh=K9nKCMbcMP0yXHmTeB74OB3Tdfhh/E/inXnAw8T6vUM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W7ymW3nkhgoMNWmx8Peiwv/V6HaBS8EejiZD8bVHIA8CkMUJKtFphW44ebEO/p42WbZAytpT8VevUB2qlTK5uJR31ddG2U82y2lacVUk8Da5tkyPPq0RTer4rqmVCQVMHrBDlDzHWS0Uro4BMUimoKDgx8423ggz0i74OwDUJWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZYjQgfrA; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-afcb73394b4so782628066b.0;
        Tue, 19 Aug 2025 05:17:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755605830; x=1756210630; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rwi6FW5tkDofq2KfQKNu3LIz9dY4yfYtr7joa3HTroQ=;
        b=ZYjQgfrAeWlI3LRWFCOcY3zFzWKcFXpcfzwmWruISPzuYF66TCg/ECYpkCQw4k0pVp
         w+P1FVgOGp1oPu8++EVWh3Jf/ufCmcC2YZSzHf29PdLXY/C+NQzlNElFRGS5BDeIzKTm
         dQQ/SJioGnGjo2T5Moly1E0lTUerx4tLxLhkAZ01e0Hm6rsn/j9exIM+HuOL8Ktt9Sb1
         jM2MItCqjbHxoPXZbJfOLFdP1bdanOwAucqD1094hz+JrktSKEliPNm/ZD4XZbbDRDhl
         vkT85c7dUrMxaTiJjW/vzlvKHMNWaz4/z7mAqCH0GPkijJoVPSaKnD1XJyzEr06MZIUD
         r69A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755605830; x=1756210630;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rwi6FW5tkDofq2KfQKNu3LIz9dY4yfYtr7joa3HTroQ=;
        b=f6YzGcdz9K+GWdSOCq0fb+twz2WwmKgbFmUXnAIwmjpWnuuUkN1lt+u3JRQnQYv9Z2
         SeaI9IMUUlfrqbpJG0v7gb5xP95tUGJx1GerP+BUQxTPuyH35WnQBCbHPF9o+oOHCd/M
         3P1J701E2X+Noug8B/8Xjhe2yu6bVNEa/OM5ywG0JeJE+/fb8a5FCAV4vkLN1fv73LSI
         hLH9dkCX5Lf2aYmzMEJH4PKY1ejeYFobw9dscg33beocttSUZ4h49yZz8DkHcBwGtSox
         mdjBP1KMrUeisgOfHhPp7pLwH4/Tw9wPMkZzLt+zy2RiKZMatxaqYj+OyRmV1DPEza/z
         qo2Q==
X-Forwarded-Encrypted: i=1; AJvYcCWkGEHWqrdJJaRHWnrdwGZzgj4pthmI28qx9icuMdly3F8p88NW95Fkll6Nvj2yEeMgtvJeEvButx+q@vger.kernel.org, AJvYcCWp8PNTMuhsvKxuAbG4VSfmk+xPbGOK5StDvcviJARMqlf1gczZ9f8A6KEZXOdtbbHWuJw53bspTN27kLM=@vger.kernel.org, AJvYcCX0lRsW5xJ0AdSoLIVTS1KVWbMQpDyV7V0GHKQNPEDjbN6jr+7HNZXSwJGmbTTW0/9uvPXmYaNx4rpv9CRf@vger.kernel.org, AJvYcCX9sebIhkLzQqVoBr7UXH5kEtq3q3aEwesN2Gq+xkP+ecQGFG/crqZEmiVmzI352HU6tbQN9gFuU4cC@vger.kernel.org
X-Gm-Message-State: AOJu0YyV0NTW8qEmqxdF2Q3wKBRxILxyhAb+byUYrzr00acUKoEGBrYo
	Ky76TaIRVb2JkHq3tOxCtmDoQvwi8A+xpfP2AFlh9e1cutwY+gVWBtxT
X-Gm-Gg: ASbGnctptb1N3tiSnLXNEuTowEMShc6YPfPGsET3v9uDu9hYat88hbSdYRSGnqWTTYT
	+GZ9pGMH53F5a+P4wV/7PyxU2O9sw0nXj16TnwOmIB5wkRjPozRFNcKCdnJM2PZfY+te3UZXpcW
	uRpi41mFFkaBysmnFLq1T1o7f2G0egB9hJxqX7AEzrAZb/uOLhB9WOOeoHdPZM41ub7/xs19MXj
	3j1QJ/jWOlzV0gBzvF7RdB90I/yswhHA/Hk+TnYFVde/0A5Ma2u4gZijDJBu8ikhFrYmS877Onj
	Sm6AQvlMFZmE2zcCVVRlHkAA4VRl6ANco+7UxXR3Mhe1QateJv4wO0SsZR1IBUCWWWGzuJyetvr
	cQMbKnzfzzveAJQzh2cPnZufj
X-Google-Smtp-Source: AGHT+IGR21hvJiBGCH6Sbixi0M+53WC3OCr/Sk/5ODegpiy06wxb3jQkbalpqFcJAtPFjRUjEnbGKg==
X-Received: by 2002:a17:906:6a17:b0:ae6:d47a:105d with SMTP id a640c23a62f3a-afddd208983mr230691466b.55.1755605829730;
        Tue, 19 Aug 2025 05:17:09 -0700 (PDT)
Received: from xeon.. ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afcdce72cbbsm1012018666b.35.2025.08.19.05.17.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 05:17:09 -0700 (PDT)
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
	Peter De Schrijver <pdeschrijver@nvidia.com>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Dmitry Osipenko <digetx@gmail.com>,
	Charan Pedumuru <charan.pedumuru@gmail.com>
Cc: linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v1 16/19] staging: media: tegra-video: tegra20: adjust luma buffer stride
Date: Tue, 19 Aug 2025 15:16:28 +0300
Message-ID: <20250819121631.84280-17-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250819121631.84280-1-clamor95@gmail.com>
References: <20250819121631.84280-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Luma buffer stride is calculated by multiplying height in pixels of image
by bytes per line. Adjust that value accordingly.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/staging/media/tegra-video/tegra20.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/staging/media/tegra-video/tegra20.c
index b466fe7f4504..a06afe91d2de 100644
--- a/drivers/staging/media/tegra-video/tegra20.c
+++ b/drivers/staging/media/tegra-video/tegra20.c
@@ -496,7 +496,7 @@ static void tegra20_camera_capture_setup(struct tegra_vi_channel *chan)
 	u32 data_type = chan->fmtinfo->img_dt;
 	int width  = chan->format.width;
 	int height = chan->format.height;
-	int stride_l = chan->format.bytesperline;
+	int stride_l = chan->format.bytesperline * height;
 	int stride_c = (output_fourcc == V4L2_PIX_FMT_YUV420 ||
 			output_fourcc == V4L2_PIX_FMT_YVU420) ? 1 : 0;
 	int output_channel = (data_type == TEGRA_IMAGE_DT_RAW8 ||
-- 
2.48.1


