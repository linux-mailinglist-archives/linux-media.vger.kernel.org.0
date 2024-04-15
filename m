Return-Path: <linux-media+bounces-9449-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BA05A8A5B35
	for <lists+linux-media@lfdr.de>; Mon, 15 Apr 2024 21:45:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1F03FB24B28
	for <lists+linux-media@lfdr.de>; Mon, 15 Apr 2024 19:45:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BACF16ABC3;
	Mon, 15 Apr 2024 19:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="RKkbhxx8"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB0191649BF
	for <linux-media@vger.kernel.org>; Mon, 15 Apr 2024 19:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713209706; cv=none; b=WNmMXORuVAbCYNifK/d4pYtdONh+sQ1eu4B4aNa0yI/RnYabExKu+tgthA99I1fZ4034fU/1QiSYVxkyZ6Xv8uEoWnV2j6CQljT8nBt5mTY988j98wgM6oXbDNZDdJ5GRlj0FpOIi93/UR5SUr9QO5g2ZkCFtaYkAbNC0EvNXVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713209706; c=relaxed/simple;
	bh=XZhwvXRbcWKSHFSPcZ7MTtPfoRGwp5KRtZGpZNte2nU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MI2LTLLZyUdoMK3EsmJeKvHg1addtw0dEuVwLT3cvFRBe707wx2Uy9UZjbBC3to261nJO/9N1eqCgmAD7i0iO49BtxA/oqZt79XrUYzMcoow26IrwHJgRVURgviCzDWaGpv1GrqAU95xv9d5kjD09s2cctlp6qWjWCJHXfzOlgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=RKkbhxx8; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-617e6c873f3so39447307b3.2
        for <linux-media@vger.kernel.org>; Mon, 15 Apr 2024 12:35:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1713209702; x=1713814502; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jt2XKVmYwRsbqiFBuUwX1RfD+QA2xOHKpcd2HjFMj/E=;
        b=RKkbhxx8/nD2gu72sVDXiA2L3ZsemLRvHQAOhyZx0+oDckJDWUwJxo8Zilq/WRybIQ
         OfRIlhjMbNr60hcHzq863/1zI7lw1c+9hVTUql0GLfe19SiRssxXEQdOuRQ7SHDHYNoL
         h0vwG0aeenOjDdPp8U5FtKb2brE0UpAWQwPbY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713209702; x=1713814502;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jt2XKVmYwRsbqiFBuUwX1RfD+QA2xOHKpcd2HjFMj/E=;
        b=Af3XKAf+q0apt/dslgMVPz3R7NrGa41GhU83nme5XxcDqN8T7J6rv3TPxrTCsoGt3p
         iwnUEU1ySZqdzx6Ci4yWnw3kkNrFLhL9GMrTo4XJF/VPOMUKKJRvloY++QOLs5DBr7gA
         JOPd1gtDGGmBOs1RuhdWKWDJ90SM6bkjEPFWxMJOMjmxByrBVlkSnb3ipJwcs+IW0mDl
         A5Kwk9d0cTrYNryjSTvmz34wAan0/aywu7db/xz+/s1rZPHK3FODzcyZ7pyG32VGefIW
         hcnYrsX0eq/Tc0y652grLQt5hSW76OdQ1vPkm/WE4QvfqLBx5lnJ5no2fKW/Qt/iqX6P
         UZmQ==
X-Gm-Message-State: AOJu0YxDWHmLthf5MrhRyla6sHTKd2szWAzg0t7HGL87rQx6170ze1/3
	UJYvl7A+LKns2sLewozZjNG5ET8zbHnBSm/fp+LtUDSvyTeSH8uLVIcStfM2Nw==
X-Google-Smtp-Source: AGHT+IEHr8lEllDyip6pAkUMGURPdINr08Mt5MZfIhMi3nIR8h+wyIaxQ16q8BBaKyR8INXB42ugWw==
X-Received: by 2002:a0d:e292:0:b0:615:2078:9c0b with SMTP id l140-20020a0de292000000b0061520789c0bmr10298321ywe.40.1713209701695;
        Mon, 15 Apr 2024 12:35:01 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id s26-20020ae9f71a000000b0078d3b54eb76sm6718055qkg.78.2024.04.15.12.35.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 12:35:01 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 15 Apr 2024 19:34:47 +0000
Subject: [PATCH 30/35] media: i2c: et8ek8: Refator return path
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240415-fix-cocci-v1-30-477afb23728b@chromium.org>
References: <20240415-fix-cocci-v1-0-477afb23728b@chromium.org>
In-Reply-To: <20240415-fix-cocci-v1-0-477afb23728b@chromium.org>
To: Martin Tuma <martin.tuma@digiteqautomotive.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 Hugues Fruchet <hugues.fruchet@foss.st.com>, 
 Alain Volmat <alain.volmat@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Sowjanya Komatineni <skomatineni@nvidia.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Hans Verkuil <hverkuil@xs4all.nl>, Sergey Kozlov <serjk@netup.ru>, 
 Abylay Ospan <aospan@netup.ru>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Dmitry Osipenko <digetx@gmail.com>, 
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
 Sylvain Petinot <sylvain.petinot@foss.st.com>, 
 Jacopo Mondi <jacopo+renesas@jmondi.org>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
 Pavel Machek <pavel@ucw.cz>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev, 
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.12.4

This is a nop, but let cocci now that this is not a good candidate for
min()

drivers/media/i2c/et8ek8/et8ek8_driver.c:255:13-14: WARNING opportunity for min()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/i2c/et8ek8/et8ek8_driver.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/et8ek8/et8ek8_driver.c b/drivers/media/i2c/et8ek8/et8ek8_driver.c
index e932d25ca7b3..c7984f90ae4d 100644
--- a/drivers/media/i2c/et8ek8/et8ek8_driver.c
+++ b/drivers/media/i2c/et8ek8/et8ek8_driver.c
@@ -252,7 +252,9 @@ static int et8ek8_i2c_buffered_write_regs(struct i2c_client *client,
 
 	rval = i2c_transfer(client->adapter, msg, wcnt);
 
-	return rval < 0 ? rval : 0;
+	if (rval < 0)
+		return rval;
+	return 0;
 }
 
 /*

-- 
2.44.0.683.g7961c838ac-goog


