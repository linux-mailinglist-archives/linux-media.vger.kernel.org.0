Return-Path: <linux-media+bounces-16386-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB8779548D3
	for <lists+linux-media@lfdr.de>; Fri, 16 Aug 2024 14:33:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EF8041C21822
	for <lists+linux-media@lfdr.de>; Fri, 16 Aug 2024 12:33:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 267AD1B32CD;
	Fri, 16 Aug 2024 12:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="bjIVjfix"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 662B81BB68E
	for <linux-media@vger.kernel.org>; Fri, 16 Aug 2024 12:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723811531; cv=none; b=CXnj9DdwGb/BZqWCCuRZTbHKyMlkJQAZwPEbQCWE5uDRrXm6DlsAa9XMi2JG9tXwGsJhmuQCKhhDRolZj2nKf/YwoDV1U+nJF8U10wu6gzRmYyaq4SeFNiOA3RHJCAGYTM7SkL/KePzXz9mmiN3P0aq0qmqWPg+w2vzIuMGRgPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723811531; c=relaxed/simple;
	bh=SXKvsjbb6kOB2MdaooRMUXOmM0k8Y5hLTe9Sfpiqp9o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RMbn1UpClCC9zeC5qe+06RjAodFU4dhwS4/zPLLWRF+0Ncq20NqyKvRx04oaWlIdcmbJyP1iT1/DV7CEkiwc30pZMwR9ubkeigZ/wggOvaK1ZZa4Ahc6XHC9D28KhK2G2IZ3OfADHhORuz/8lfN9+5VUn93gzAyGx+U0QN6bMg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=bjIVjfix; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-6b7a3773a95so10619076d6.2
        for <linux-media@vger.kernel.org>; Fri, 16 Aug 2024 05:32:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1723811528; x=1724416328; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yVxZXuTJqaJ10E0yGjjv9nH2alidPK1Y4VYj7sM9de4=;
        b=bjIVjfixAjoNTOBjf1pxaMlk+ojJ7ZT1vD1I2XAZYYKr8Z1II1+/Jp154BtHHatZN1
         bb0sSVeKztDB8h3aNQrNokYafwn65w/2slYNlXXL46f8McD4z8y/BV6+/YSrLHxU5fbz
         unqfLSLCsr7kWyVOvSmvtJcsKB3pilCQ6sGxo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723811528; x=1724416328;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yVxZXuTJqaJ10E0yGjjv9nH2alidPK1Y4VYj7sM9de4=;
        b=AFsNNfxVod5pNsG8qcN4oZpKTFAYNAfzPJ2TksIMMkd501xgZkAPuGXYVhbNjzDOCd
         wYL2+l+WfBiceCMreuuy2qY53lzhaRnbhpAGYz8XdD0L4kt7Rh/v+fLmkSh8DWwacv79
         hiGF6bBZTtEG4WlcIg3tZiZpr2yk2kd2RC7gnOFanynhV0vR8daA4NppyihKeQjosRVz
         T8ulmaaMj/spUcfrWP0xDXm8WdVIjDPRfl51pjD9ozOPTNUlvvqueKouNWKeKAkm18Lx
         vnnW/nJGjJRN425JhMadU7eRxCM7wgCHlpKVbfJgW+Zd1hZeY7VPGbCVUB4N8FxJhald
         tl+Q==
X-Forwarded-Encrypted: i=1; AJvYcCU2yNYLE6glszNmJMj37wO8kFwNlugFRtW1zhdPND+N5bLcTIc3I+uPwMFh6W7t579Q90fl5vpRQxPr53wjkqZoswYssNbdV5IHcn0=
X-Gm-Message-State: AOJu0Yw6UK15EkS8N1D7L4uw0uREMaoA1xfHub6hahYYsHGbvBMZQG+C
	BrP4gQn3lyPWqcDA1sNaWHCQ9bqxr8kt4T+PfkI99rdwjRroRzwTSYhdCYWX6g==
X-Google-Smtp-Source: AGHT+IHxo1lFSQMX1cM/4MwpLU2TEtbVsyk63XfQG/g27+OnQuVnbh1zDXFyHf9x2ZFHVGoE5m/EQQ==
X-Received: by 2002:a05:6214:540a:b0:6bf:700f:a3b7 with SMTP id 6a1803df08f44-6bf7cd7ac78mr23067056d6.9.1723811528290;
        Fri, 16 Aug 2024 05:32:08 -0700 (PDT)
Received: from denia.c.googlers.com (123.178.145.34.bc.googleusercontent.com. [34.145.178.123])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6bf6fef3107sm16881426d6.121.2024.08.16.05.32.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Aug 2024 05:32:07 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 16 Aug 2024 12:32:04 +0000
Subject: [PATCH v2 6/6] media: meson: vdec: hevc: Refactor vdec_hevc_start
 and vdec_hevc_stop
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240816-smatch-clock-v2-6-c63105db07e8@chromium.org>
References: <20240816-smatch-clock-v2-0-c63105db07e8@chromium.org>
In-Reply-To: <20240816-smatch-clock-v2-0-c63105db07e8@chromium.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 =?utf-8?q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.13.0

Make a new function __vdec_hevc_start(), that does all the
initialization, except the clock initialization for G12A and SM1.

Factor out all the stop logic, except the clk_disable_unprepare(), to a
new function __vdec_hevc_stop. This allows vdec_hevc_start() to
explicitly celan-out the clock during the error-path.

The following smatch warnings are fixed:

drivers/staging/media/meson/vdec/vdec_hevc.c:227 vdec_hevc_start() warn: 'core->vdec_hevc_clk' from clk_prepare_enable() not released on lines: 227.
drivers/staging/media/meson/vdec/vdec_hevc.c:227 vdec_hevc_start() warn: 'core->vdec_hevcf_clk' from clk_prepare_enable() not released on lines: 227.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/staging/media/meson/vdec/vdec_hevc.c | 43 +++++++++++++++++++++-------
 1 file changed, 32 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/media/meson/vdec/vdec_hevc.c b/drivers/staging/media/meson/vdec/vdec_hevc.c
index afced435c907..1939c47def58 100644
--- a/drivers/staging/media/meson/vdec/vdec_hevc.c
+++ b/drivers/staging/media/meson/vdec/vdec_hevc.c
@@ -110,7 +110,7 @@ static u32 vdec_hevc_vififo_level(struct amvdec_session *sess)
 	return readl_relaxed(sess->core->dos_base + HEVC_STREAM_LEVEL);
 }
 
-static int vdec_hevc_stop(struct amvdec_session *sess)
+static void __vdec_hevc_stop(struct amvdec_session *sess)
 {
 	struct amvdec_core *core = sess->core;
 	struct amvdec_codec_ops *codec_ops = sess->fmt_out->codec_ops;
@@ -142,6 +142,13 @@ static int vdec_hevc_stop(struct amvdec_session *sess)
 	else
 		regmap_update_bits(core->regmap_ao, AO_RTI_GEN_PWR_SLEEP0,
 				   GEN_PWR_VDEC_HEVC, GEN_PWR_VDEC_HEVC);
+}
+
+static int vdec_hevc_stop(struct amvdec_session *sess)
+{
+	struct amvdec_core *core = sess->core;
+
+	__vdec_hevc_stop(sess);
 
 	clk_disable_unprepare(core->vdec_hevc_clk);
 	if (core->platform->revision == VDEC_REVISION_G12A ||
@@ -151,20 +158,12 @@ static int vdec_hevc_stop(struct amvdec_session *sess)
 	return 0;
 }
 
-static int vdec_hevc_start(struct amvdec_session *sess)
+static int __vdec_hevc_start(struct amvdec_session *sess)
 {
 	int ret;
 	struct amvdec_core *core = sess->core;
 	struct amvdec_codec_ops *codec_ops = sess->fmt_out->codec_ops;
 
-	if (core->platform->revision == VDEC_REVISION_G12A ||
-	    core->platform->revision == VDEC_REVISION_SM1) {
-		clk_set_rate(core->vdec_hevcf_clk, 666666666);
-		ret = clk_prepare_enable(core->vdec_hevcf_clk);
-		if (ret)
-			return ret;
-	}
-
 	clk_set_rate(core->vdec_hevc_clk, 666666666);
 	ret = clk_prepare_enable(core->vdec_hevc_clk);
 	if (ret) {
@@ -223,10 +222,32 @@ static int vdec_hevc_start(struct amvdec_session *sess)
 	return 0;
 
 stop:
-	vdec_hevc_stop(sess);
+	__vdec_hevc_stop(sess);
+	clk_disable_unprepare(core->vdec_hevc_clk);
 	return ret;
 }
 
+static int vdec_hevc_start(struct amvdec_session *sess)
+{
+	struct amvdec_core *core = sess->core;
+	int ret;
+
+	if (core->platform->revision == VDEC_REVISION_G12A ||
+	    core->platform->revision == VDEC_REVISION_SM1) {
+		clk_set_rate(core->vdec_hevcf_clk, 666666666);
+		ret = clk_prepare_enable(core->vdec_hevcf_clk);
+		if (ret)
+			return ret;
+
+		ret = __vdec_hevc_start(sess);
+		if (ret)
+			clk_disable_unprepare(core->vdec_hevcf_clk);
+		return ret;
+	}
+
+	return __vdec_hevc_start(sess);
+}
+
 struct amvdec_ops vdec_hevc_ops = {
 	.start = vdec_hevc_start,
 	.stop = vdec_hevc_stop,

-- 
2.46.0.184.g6999bdac58-goog


