Return-Path: <linux-media+bounces-9433-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8752D8A5AEE
	for <lists+linux-media@lfdr.de>; Mon, 15 Apr 2024 21:40:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A35151C21E47
	for <lists+linux-media@lfdr.de>; Mon, 15 Apr 2024 19:40:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A82D15E21D;
	Mon, 15 Apr 2024 19:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="AY/2PAVw"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6F3915D5D6
	for <linux-media@vger.kernel.org>; Mon, 15 Apr 2024 19:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713209686; cv=none; b=YgHbqaTKlvz/7iSSPFFTvWmKFd/DLeRKwG9UTy5mB7xjGgztFC2ZaSVMb3+TXlNxTlfM3kPgV0rrBi6ynpSvxsLH5idhuc/JTBjPAvo68Jfo4dMUMSZ+QNSRe7yuizvTUfi4vgzW5MNylkgxptQBgRI5+k+kpnkcpZKSljC00XY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713209686; c=relaxed/simple;
	bh=vSxgRS5M3phaf64us4tF/P1BMReGwUyBbCQWgHsyXyQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hAKZL2tJNXjQO/OvAYdEQl6FscnyYs3ayz/SJMuVrB7RnYpcGU1s2hGNFjfDhUilQXRoJoqE5ycfQgckwyblpB0ocGDbSM6NRJ0e0O8yjA3w6Pe8y3Js0yIlAiTzjd8KmadXbh9TG1ah91VdTKcLTOz+FCWPU63lE/aO4lCxZUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=AY/2PAVw; arc=none smtp.client-ip=209.85.210.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-6ea128e4079so2316112a34.3
        for <linux-media@vger.kernel.org>; Mon, 15 Apr 2024 12:34:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1713209684; x=1713814484; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9NumvJIfF1EvDHzhvgph+fzItnp8SRnkGAbNB8M/eao=;
        b=AY/2PAVwPVPHvVFchL3m36/jnIkqXPm8SJFJ95AtamNOHL5eS4Dl/ys+5Qn3A2rdVx
         FrdrPNVZCa65ajOTA1+S/Vevr9yE2GwOhePrq4isVF/pTyQObNcFZoJhWxvZL2ePQFn9
         pubkejZOe7gLnMkd/Qln8IU/DAcI3FYWSrpJg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713209684; x=1713814484;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9NumvJIfF1EvDHzhvgph+fzItnp8SRnkGAbNB8M/eao=;
        b=kdq55BBXyORpFDikyE0xSTdOixQxHIl+eU7aWdgEL85BXvnMiIjK3cTnR81ilE1zTF
         TkrH7SYLnm7Bo9p/8vzAJP87KBGlVgNMJfL5E834UPfZOdfaZXfttJZyoBaSFU6VbrM0
         yTRgJ7vYTI8GcauIWAIA+z7dyCHvossspdcJHXNBIEQ8aeZOLC4FzGUZQI5Gn1wizw64
         IaGQxFpG7jPyV0H9vNtuqJdF7wBDJbiL8Z/1AvAYlEaEv7Bsf6/wPdWABlH+ZanbDV0t
         rsjy+c3Zm5XQlYi/qE9c2KBw8a6og6IYAzE7biPq8DFePILYvWjgYqYyn0l3aKYO7xIS
         XxkQ==
X-Gm-Message-State: AOJu0YxiU5bxKlJvDi7DOouPnS/HbxRn0VX8gSb/BSajF1cNY8ccoAJJ
	fRWq3epBp/PMj2OV+Tgb17NUz2Mp8aXEOn3EWLEMu0jr9mbs3EzCQ6bHxxlSKg==
X-Google-Smtp-Source: AGHT+IGDpQP0lGeeTbw+d3WHAnrIlvzGQRlawHZd8kFq+13/xBXNhp6Lzy5O5V8WuY+aqcrpA2RYcw==
X-Received: by 2002:a9d:7991:0:b0:6eb:7c4f:d4d with SMTP id h17-20020a9d7991000000b006eb7c4f0d4dmr5274597otm.8.1713209683858;
        Mon, 15 Apr 2024 12:34:43 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id s26-20020ae9f71a000000b0078d3b54eb76sm6718055qkg.78.2024.04.15.12.34.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 12:34:42 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 15 Apr 2024 19:34:31 +0000
Subject: [PATCH 14/35] media: dvb-frontends: drx39xyj: Use min macro
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240415-fix-cocci-v1-14-477afb23728b@chromium.org>
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

Simplifies the code.

Found by cocci:

drivers/media/dvb-frontends/drx39xyj/drxj.c:1447:23-24: WARNING opportunity for min()
drivers/media/dvb-frontends/drx39xyj/drxj.c:1662:21-22: WARNING opportunity for min()
drivers/media/dvb-frontends/drx39xyj/drxj.c:1685:24-25: WARNING opportunity for min()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/dvb-frontends/drx39xyj/drxj.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/media/dvb-frontends/drx39xyj/drxj.c b/drivers/media/dvb-frontends/drx39xyj/drxj.c
index 19d8de400a68..d41ce75575bb 100644
--- a/drivers/media/dvb-frontends/drx39xyj/drxj.c
+++ b/drivers/media/dvb-frontends/drx39xyj/drxj.c
@@ -1444,8 +1444,7 @@ static int drxdap_fasi_read_block(struct i2c_device_addr *dev_addr,
 
 	/* Read block from I2C **************************************************** */
 	do {
-		u16 todo = (datasize < DRXDAP_MAX_RCHUNKSIZE ?
-			      datasize : DRXDAP_MAX_RCHUNKSIZE);
+		u16 todo = min(datasize, DRXDAP_MAX_RCHUNKSIZE);
 
 		bufx = 0;
 
@@ -1659,7 +1658,7 @@ static int drxdap_fasi_write_block(struct i2c_device_addr *dev_addr,
 		   Address must be rewritten because HI is reset after data transport and
 		   expects an address.
 		 */
-		todo = (block_size < datasize ? block_size : datasize);
+		todo = min(block_size, datasize);
 		if (todo == 0) {
 			u16 overhead_size_i2c_addr = 0;
 			u16 data_block_size = 0;
@@ -1681,9 +1680,7 @@ static int drxdap_fasi_write_block(struct i2c_device_addr *dev_addr,
 				first_err = st;
 			}
 			bufx = 0;
-			todo =
-			    (data_block_size <
-			     datasize ? data_block_size : datasize);
+			todo = min(data_block_size, datasize);
 		}
 		memcpy(&buf[bufx], data, todo);
 		/* write (address if can do and) data */

-- 
2.44.0.683.g7961c838ac-goog


