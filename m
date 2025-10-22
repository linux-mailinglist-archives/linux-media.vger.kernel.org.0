Return-Path: <linux-media+bounces-45261-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 08053BFC807
	for <lists+linux-media@lfdr.de>; Wed, 22 Oct 2025 16:26:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id A854B34BBA9
	for <lists+linux-media@lfdr.de>; Wed, 22 Oct 2025 14:26:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FA983557EC;
	Wed, 22 Oct 2025 14:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hYXZiVV+"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 335CD34C83D
	for <linux-media@vger.kernel.org>; Wed, 22 Oct 2025 14:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761142922; cv=none; b=RcgDbvO6PitxcvIUgTHHDvb6NHRKs/mRlO6YqliE8yg1PFlTOD6DEZkCyo1TrmhmvoO+RKOAtazL93u3U/l5mzpbIFzruG5eEdgETjvFz8iPWtsgZrDXYzx9gEwf6N9shonsenuJhLSnxLMXOxsi8y3uH3iKFwkz/cMUVut7x/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761142922; c=relaxed/simple;
	bh=vH0xJgN2W2szoe//wNhYvtT1BAPozP86dafTWttSucw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uE1K+Vp/in5RPTun9fR8bUyEeNDrdN3ipEwmlEJDuGKd/m1lqRR5HHaTFkZSEGYG7VRv7mToucxQrW9Py770+qio98MuP7SE2wHfoQ93xS8+J5lYDOmbj3bRMYPhAHehqcFwrLgXLRCKdFvUktZux+EYOm31fWkqarGa5QHbUjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hYXZiVV+; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-426fd62bfeaso3182503f8f.2
        for <linux-media@vger.kernel.org>; Wed, 22 Oct 2025 07:21:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761142914; x=1761747714; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PAqyge5iPysoNexKPCog6vdhewd7fraGc+GRNda+uus=;
        b=hYXZiVV+NzC/JWaAHkyCwNcer5ruwq1gcoFh+6avL7XUhe8n45TZnlY/mQ8FvXhbYA
         lXt+DD/etB3MZv2gqG6R+inWhzJ6XRSlk9BnHuEYZR7usExKaT5zuii9JnVMJnOaVSsM
         mPnIa9jW3mx4B83CVlyxIwaE26GagxUHfJbQ14K02msYBfNow7xxrd055DOygP+t7/hk
         p7+uWgfihLdmY8+rqSjk3ZNMxRfcMLoPeEfcB45AHVcrQxw3wKirzY0gczw6uUGCpbj9
         Izh6i0RQAMdyLKN8cXds4YsPpd1sK7yHj/ipOE1+ChL9eXVPwsidHO6O6Wn2qpzFge7R
         V5xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761142914; x=1761747714;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PAqyge5iPysoNexKPCog6vdhewd7fraGc+GRNda+uus=;
        b=vwANWEBsAhU+CfvH7OxOEQxEpPeCVoHXbsWOdtyD4M4p0b0TGx3JxHlQ8PECvOf7Y/
         e3gUjq0nmB3EQFL9qbQC8LEelGCqHSwia24yd+F418RrMlbf/8cJ9TH2K5rfP3+8l+IH
         mxpT4VLTAWpoyWYNHCgWVK4WO+iMpQNnETP8fTlmDLQwcSndsmiPK/Eikng0hgk8MueR
         CQVHjkJ0/P5X7UsteebwUAuqGO2dVqn57DOg084psmrNjI9a2U7pJOJE8yKRJodsn0l1
         xHrnwgSdYxUuW5WkZN51KduCvojMxL8lSEFzwMZeRQ1489xWcReg98oCILG/OfalxkGq
         Zh7A==
X-Forwarded-Encrypted: i=1; AJvYcCXFjXW9dVvQW3lVWyG5mgNfH7MSc+RBbo10bKGmUSvxVI0bIrZpurlpQdlX9LmMZ6HuwhQmerSLR2jsiA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyR+h7brBGscCOTJkLNJaXtbr78Z50iekXqTUmaf5cncEpWPbw0
	nlQo0HtPp6gE7fBo065zNGJAoJm6oVIZa1rtx7x5XuzRZXguoSoLYhiN
X-Gm-Gg: ASbGnctrypWKvMGJxEeNa9mXWR4Kvo2BEgLzUzsl8mtUoGKCCw3dLY+piDEr0YLidIF
	PD1oBq+S/YjOR6KniD+gr3g0b+ccCQlThHo6LQCeYcqQ+YDl33Olgpa3IuX4MpH917ltqzsbA8R
	/i4Y9eIkN0WVZtUm98omW6Qy2y7BtkUcvYbCmd1I6BorGW4+XYMxvntrGuupqz2+IAylL1Nl0eF
	uIpgC9hfdjzXhnNcOtXseEXtbUvX2hp0RJdC/UtnpTDVnyA8WwsQ5l9OH6W1qGfWF7px1jFvuMP
	qThhw+TwtOnDiFW+0983/8t0Wcfkd/xysv5X5BWu5Cg7cucwAMveU3ebAq4WQO0/1RSWivSW64Q
	mITWDONs3r0SCobxs649lcuttHe9O6/5xeIer2eagoXVw8nUxaf6zXHDF/KEDN/5mxtbYVkSmGR
	Vamg==
X-Google-Smtp-Source: AGHT+IGVyh/0Lq21fHxZjLwl88/dShL76QWY1ZVpGVbU3hFOea3guFlvCdv+uCzmXqru7Kjn7g1lZA==
X-Received: by 2002:a05:6000:612:b0:426:dbee:3d06 with SMTP id ffacd0b85a97d-42704d55398mr14180974f8f.22.1761142913609;
        Wed, 22 Oct 2025 07:21:53 -0700 (PDT)
Received: from xeon.. ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427ea5b3d4csm24803518f8f.19.2025.10.22.07.21.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 07:21:53 -0700 (PDT)
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
Subject: [PATCH v5 17/23] staging: media: tegra-video: tegra20: set VI HW revision
Date: Wed, 22 Oct 2025 17:20:45 +0300
Message-ID: <20251022142051.70400-18-clamor95@gmail.com>
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

According to TRM Tegra20, Tegra30 and Tegra114 have VI revision 1,
Tegra124 has revision 2 and Tegra210 has revision 3. Set correct revision
in tegra20_vi_soc like tegra210 does.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/staging/media/tegra-video/tegra20.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/staging/media/tegra-video/tegra20.c
index ffaaa2bb8269..93105ed57ca7 100644
--- a/drivers/staging/media/tegra-video/tegra20.c
+++ b/drivers/staging/media/tegra-video/tegra20.c
@@ -596,6 +596,7 @@ const struct tegra_vi_soc tegra20_vi_soc = {
 	.nformats = ARRAY_SIZE(tegra20_video_formats),
 	.default_video_format = &tegra20_video_formats[0],
 	.ops = &tegra20_vi_ops,
+	.hw_revision = 1,
 	.vi_max_channels = 2, /* TEGRA_VI_OUT_1 and TEGRA_VI_OUT_2 */
 	.vi_max_clk_hz = 150000000,
 	.has_h_v_flip = true,
-- 
2.48.1


