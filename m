Return-Path: <linux-media+bounces-43917-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D81A4BC399C
	for <lists+linux-media@lfdr.de>; Wed, 08 Oct 2025 09:32:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 87AFF403D7E
	for <lists+linux-media@lfdr.de>; Wed,  8 Oct 2025 07:32:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D6DB2F2606;
	Wed,  8 Oct 2025 07:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YXuEKwYT"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 193162F5A19
	for <linux-media@vger.kernel.org>; Wed,  8 Oct 2025 07:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759908693; cv=none; b=Ez6ucb3hmq06FVdryjYjU5EPSpM1r8TPsayuHN0+IlUmO1wcp6cDp3/LicQSeM8VFYey8ru3uwwwcebSzdJ56D3chL9tWLyGu0oQL9t/IQR3ofsjnT752xunOdSC6IxU5KaroOTC8KgUlXLgzpi+CcMC4e4i+kxfKqC3+kVhfU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759908693; c=relaxed/simple;
	bh=EkGBXhItwLWxgQ/aIBX1I+SuRG7//x8trI9XTwjIFpA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d3S6bff78SJPdNrXcDfNB92ls6oX0COD0Rf56C47d7nItDhU7rGggQLqJJntYPaMkgIQGHJAT4OFz7RU/0fPVRnOPLGVSsP5XelbdaidAeRPASbwWw9d7ySboX7sUwUrV4jaaryhVDUajNw9GnDZW9/nEV/jWefY4V4oUTyXtE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YXuEKwYT; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-58affa66f2bso8727495e87.1
        for <linux-media@vger.kernel.org>; Wed, 08 Oct 2025 00:31:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759908689; x=1760513489; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PboKxjSSvW6h8IWsKUFqt3oWZleCNVGyc+XkVJL1pxE=;
        b=YXuEKwYTbVzzkwo12hN63x+Ha6PFjTVrU25TB1zHtsKkg7rVDVeUf0NOGdgLPMkaqd
         YrwyObPA9KfdAJM0AW9sN2mhMjnTGG86m1TIe/UFC6lBL20ftKBsN4Hbk9iT99fsy6/p
         diEp+RNcfS0z/KTHSeKUhLSWQD3az+RdfMWB2tJ3QEHj2gxA8DyspjDOkzMUEAyAHd4E
         w/k34cx7SmlTLH/Q0gMNC08P9LpWx67PQy5oyS1JeY4Acq0tCOZt0TGY9r2wymZ/CZh3
         pKXgrud6y555vky0c8jafKPWStn3HF7Gh9/Phi/EejQK/1xaShJRoQqAhrn8d14q9U4x
         cZ6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759908689; x=1760513489;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PboKxjSSvW6h8IWsKUFqt3oWZleCNVGyc+XkVJL1pxE=;
        b=daPznJ6MMUsfe1gz3LJag7KH2RWe1S9YPwFg8jHjZivce9kyHBzswasYimG38oVkj2
         jZvLnAPV9GEqbUtHFJBpxtXzDcGzlXBtnRYKTmRMMPzoTdzAMl/DR8khhVi+rqcS32VJ
         2P1xb8TwbwYdm4gvTCos5WqbfD1jeIuzMNp4LkFi7g+8xF8JNp/b3b1va00lgERfvoQK
         +MjT4qzXTQtYAI3ZjSPAdncvEECf5302tEaRZV7vawrHkpLRG6ujuqpKmhk0sh876nGh
         u/+sDY56q6R5GzGBvWTZhf0vOOH+UQX7MjYAfvHrgYML8GpjAm8iG9m7MQeJI9Ec6QbN
         HczQ==
X-Forwarded-Encrypted: i=1; AJvYcCX2bGVh3YmXMY1Vat+0XnRfc+sJ592X0ZDZHI9dOCYzrtSaxUK4+F7THbxHyGAP8pqdOVEzbOd14r4d9w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxC8A1+IOW/m+eMJ7ffnycauHMOkFansbMtCEuCM7P1Rcox7hNQ
	F0+Lmd/HSJcaI/8cW0gvRXts1+EHnZm8VIeIzNT6k5BOFHMIWpBjeTjU
X-Gm-Gg: ASbGncvQsoiXYj6kcTNGfKGxqXjoaL4DX9qJ1UXK4b0S5krnvlmZ60Ert+zm7jvzBdw
	A13kkaDCuxtV71fBtO/oOfxGjeo8IjyseFarKyfNEGKLyK4mo+6X3pooMrxs/PrfAGlGuE0Axox
	1mj97ox1mMbKJ+VMjroo8hV/LGhxHFJq5IYiVEVDiAKaFUvqN2IOh3sB/LNUhlPqINyBYEe9hvX
	1loIDYRVKxUYTyo7kQ8+PlGaWgzlxpYiQumhoxi4MRcAJAgG7PwzcCzfJN9djAk+LvwMzm1jStW
	JWplsvuGEAsObivSju2Cr+7caL9zfviYIa6Ci8YELDo534lLJod8WVEr3n80NmxwmIrK2bu1zPY
	YIJjUVPQcC7cbn+0wfQvF83wK7P/K1Md7hWme+Q==
X-Google-Smtp-Source: AGHT+IGnZcqKqG0CeOtJ+fmzvG5biXeb/ChpdaHmR1TP85hnqOnS5yRC3IE90h8eaQFZIrYCt7o/qw==
X-Received: by 2002:a05:6512:b96:b0:579:fbe5:449d with SMTP id 2adb3069b0e04-5906dc14a3dmr717226e87.24.1759908688715;
        Wed, 08 Oct 2025 00:31:28 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58b0118d22bsm6911016e87.85.2025.10.08.00.31.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 00:31:28 -0700 (PDT)
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
Subject: [PATCH v4 09/24] staging: media: tegra-video: csi: move CSI helpers to header
Date: Wed,  8 Oct 2025 10:30:31 +0300
Message-ID: <20251008073046.23231-10-clamor95@gmail.com>
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

Move CSI helpers into the header for easier access from SoC-specific video
driver parts.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/staging/media/tegra-video/csi.c | 11 -----------
 drivers/staging/media/tegra-video/csi.h | 10 ++++++++++
 2 files changed, 10 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/media/tegra-video/csi.c b/drivers/staging/media/tegra-video/csi.c
index 604185c00a1a..74c92db1032f 100644
--- a/drivers/staging/media/tegra-video/csi.c
+++ b/drivers/staging/media/tegra-video/csi.c
@@ -20,17 +20,6 @@
 
 #define MHZ			1000000
 
-static inline struct tegra_csi *
-host1x_client_to_csi(struct host1x_client *client)
-{
-	return container_of(client, struct tegra_csi, client);
-}
-
-static inline struct tegra_csi_channel *to_csi_chan(struct v4l2_subdev *subdev)
-{
-	return container_of(subdev, struct tegra_csi_channel, subdev);
-}
-
 /*
  * CSI is a separate subdevice which has 6 source pads to generate
  * test pattern. CSI subdevice pad ops are used only for TPG and
diff --git a/drivers/staging/media/tegra-video/csi.h b/drivers/staging/media/tegra-video/csi.h
index 3e6e5ee1bb1e..3ed2dbc73ce9 100644
--- a/drivers/staging/media/tegra-video/csi.h
+++ b/drivers/staging/media/tegra-video/csi.h
@@ -151,6 +151,16 @@ struct tegra_csi {
 	struct list_head csi_chans;
 };
 
+static inline struct tegra_csi *host1x_client_to_csi(struct host1x_client *client)
+{
+	return container_of(client, struct tegra_csi, client);
+}
+
+static inline struct tegra_csi_channel *to_csi_chan(struct v4l2_subdev *subdev)
+{
+	return container_of(subdev, struct tegra_csi_channel, subdev);
+}
+
 void tegra_csi_error_recover(struct v4l2_subdev *subdev);
 void tegra_csi_calc_settle_time(struct tegra_csi_channel *csi_chan,
 				u8 csi_port_num,
-- 
2.48.1


