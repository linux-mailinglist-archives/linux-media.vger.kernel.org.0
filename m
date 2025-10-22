Return-Path: <linux-media+bounces-45258-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 38D22BFC912
	for <lists+linux-media@lfdr.de>; Wed, 22 Oct 2025 16:35:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 998246E0AD5
	for <lists+linux-media@lfdr.de>; Wed, 22 Oct 2025 14:26:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB77E35504E;
	Wed, 22 Oct 2025 14:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U0iDgEC4"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DF7C34F27D
	for <linux-media@vger.kernel.org>; Wed, 22 Oct 2025 14:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761142917; cv=none; b=AdV/XlVg7tipDLAFmxZasVBp641onUNM2Y+RDpgKH8ATLE8Ji2GqbS/398wVwRuQFjvnnKRWWfLmhp6Ujgzm6v/FNuIn4Qu1m9bqu8M3N+VviaKt4OSHiKZg+LySfnwRcCnELfdSnTeG0sNcjrNjv5qyZazYcr16PjafVNmOO7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761142917; c=relaxed/simple;
	bh=RyMqVUMoRxnLE2+LH/uDoKbsjsXYMu268PiHdfObUHs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AKYlImQp74ASz01kF5dw4bS93LlIb1vMwbnGHm/FVeqNLxRByKYHe9XMuN6pASghdX9MA7mxxd92QSjoBS8nf1Rm+ch2OcbZe0Xprk6VCcqQUs7jsAZ+WEkS5AvKdgsz2K5FzKFRdYzYZU+wpLwslGTtVfzoVjPbnOfS7gJZAb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U0iDgEC4; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-421851bca51so5745874f8f.1
        for <linux-media@vger.kernel.org>; Wed, 22 Oct 2025 07:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761142908; x=1761747708; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hswO6VHAbXRS9t5lyAgR5F2WC+ilzEfgsXiR8FyXf7w=;
        b=U0iDgEC4ll1KzUailgHGuGg2dvZyYCcri8Ik2xZvDn4/tK8FExWCzrToiAITWWja5V
         4jA3X4YERXMM9ose00DPofRZvynA0plLfBdirZ+SLHMXJDhxw038TC+K4JWDaExEV8fZ
         fE9zZoLkSlqs6q9fItnenRl5Yfz6XTV5qf3ZY1Hhfuk6ufYWP0V1hvxwFN207DqgjV7s
         FVrvLOEccT6+4RkEzP4SfokwquimM/ZnYXqIjE3zKrKNaaeAVprEYqS+0GdE/gFxgJd+
         YzSmsWK+zrVU2RpXgH8LYJ1C5rkqUWt4hgBjFrOyBIFg4rYhMu9vxk804vRtX4fXX5i+
         xbvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761142908; x=1761747708;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hswO6VHAbXRS9t5lyAgR5F2WC+ilzEfgsXiR8FyXf7w=;
        b=Kj7muPas3EuJ8Uc7sptV1RZZ9sOrC4Xmsg4NuNSj8BvTj9PmZoXGXs8h2RxDsyXTxK
         90Wh/lEHazU9iF3oXGcdA9ZD3tg37AzTWpUOl4/uwFb9KYcChbRQSP1fYQ7gQdx8W0De
         gBPG8FlAHy3dPFXHwfgPT71MGUVpmsgagO7iBizPXCZk54wseoQ5OLvKktTZXo7jOJgc
         OktozXrXAfGLbmmXVzRjqkVrEad4hWaS7YJsU6cX0f74FpCnIzzUDP76LxgTZVTKITzP
         Jm/Z5UHNi5is7ZTA59yuS7DWeKXHMqlS+F6FItalYbR8VCnS0tVNwZqkHjvd7Zb8OE0S
         fNqg==
X-Forwarded-Encrypted: i=1; AJvYcCX24lhWZ1k/ZiFPOm3Lp43sDRo/R/qcmx8PXEMhkP8vJXnB2NSCYBSX/0J9heo4lQiNq1M6jy6DbVw8JQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzC8WZAFPNzjwyHYN5G8gmVc32nMa85Ryp6xTViQc3AqDD3EKiH
	Nkd1U0SO86CYiKJ4b4t8/a+XfSzzARWt66XkVK65SOE24BC86UTR7I9+
X-Gm-Gg: ASbGncvDkCd+ve557OA9AXKd2Vo1z0VlC0Im6eR6nQYZRT0LHbKZx4VH/SdDsCIIo67
	Gjih51kuDdlcm+/OyvLTNuRfgUM6fuDRsHzbPYdx5MMw4cYWUqo/F1Oz7K5MXVA4USjmBPACxl3
	oUNGzxIcIDj2Qm0wLC7DgHRHLEBDae1VKxLAxTw+Yw8EKOuUnrhUDCdi01R3H4toEM1WdaTnzJd
	LiJm17EMz1UTnjiNktXlYTzPQi5K/Y1iZy08zMbGEOpQxNtYN3uXRADdcxOzAI6TFI78FuzlBrU
	KkJBqKlVYz6S6oJQ5tfxTV4zcvrwFOLx1/VaPbb5+VYyv7cZHSss16pJIgqc3WEzoSznB+S8mBz
	l/JpDuS+fui2gTHXhDXzvefdG2BSHKVTN55dIQ14KoN0h6BZr+fw1i8TbdmmffxY+yXS8aDeFBc
	5X7A==
X-Google-Smtp-Source: AGHT+IFq9V87Zw7qGeTmSRrPB3JwZR7jtskG/uf8ikZdxsnRyJSInvVy1UaH8yLg4G5ahmvQ9XgogQ==
X-Received: by 2002:a05:6000:186f:b0:3f9:6657:d05 with SMTP id ffacd0b85a97d-42704d7eb23mr14938377f8f.12.1761142908345;
        Wed, 22 Oct 2025 07:21:48 -0700 (PDT)
Received: from xeon.. ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427ea5b3d4csm24803518f8f.19.2025.10.22.07.21.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 07:21:47 -0700 (PDT)
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
	linux-staging@lists.linux.dev
Subject: [PATCH v5 14/23] staging: media: tegra-video: tegra20: set correct maximum width and height
Date: Wed, 22 Oct 2025 17:20:42 +0300
Message-ID: <20251022142051.70400-15-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251022142051.70400-1-clamor95@gmail.com>
References: <20251022142051.70400-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Maximum width and height for Tegra20 and Tegra30 is determined by
respective register field, rounded down to factor of 2, which is 8191U
rounded down to 8190U.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/staging/media/tegra-video/tegra20.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/staging/media/tegra-video/tegra20.c
index 7b8f8f810b35..3e2d746638b6 100644
--- a/drivers/staging/media/tegra-video/tegra20.c
+++ b/drivers/staging/media/tegra-video/tegra20.c
@@ -23,11 +23,10 @@
 
 #define TEGRA_VI_SYNCPT_WAIT_TIMEOUT			msecs_to_jiffies(200)
 
-/* This are just good-sense numbers. The actual min/max is not documented. */
 #define TEGRA20_MIN_WIDTH	32U
+#define TEGRA20_MAX_WIDTH	8190U
 #define TEGRA20_MIN_HEIGHT	32U
-#define TEGRA20_MAX_WIDTH	2048U
-#define TEGRA20_MAX_HEIGHT	2048U
+#define TEGRA20_MAX_HEIGHT	8190U
 
 /* --------------------------------------------------------------------------
  * Registers
-- 
2.48.1


