Return-Path: <linux-media+bounces-9734-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 39E9A8AABE2
	for <lists+linux-media@lfdr.de>; Fri, 19 Apr 2024 11:49:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CC3E11F221EC
	for <lists+linux-media@lfdr.de>; Fri, 19 Apr 2024 09:49:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE3647E579;
	Fri, 19 Apr 2024 09:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="e8JZWmxy"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B466E7C0AA
	for <linux-media@vger.kernel.org>; Fri, 19 Apr 2024 09:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713520163; cv=none; b=f88XEcOMvcqE2S8SEy9QxXuODm5aHnvp4U64+Y/F1+VbDsjHkTvzFgNa/JiG2s5n0PwMx0Jw8X6P3kc7DsBdpM/Tb4573d3Ojr8nXF8YNfjX2yE1/mC393AIW0Qp0im9ndyE+vO7i7dpbG0fV4jZzX8+Wz/x46O1pO7oPtDlB8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713520163; c=relaxed/simple;
	bh=Oy36FoyBGe72y+nQ9C/xUGn3HkAwEUaNB0CeLr8vc+w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Tk686wlBrmrbv1dFItW/nV5llZ7mWAl09jwNoq5yoTchg0I7Pwixhrg0BT5vXc6sjKSopGHyM9qfEY3WdPIdgriJVtMyQdzxxz/gxyjEpYsoX4Hihm44Y3z68g/0fpe8n7Lno2+7THwm2E7E/a9vkulnt5hLAm8VDzGDNGiNShI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=e8JZWmxy; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-78f02c96c52so109304985a.1
        for <linux-media@vger.kernel.org>; Fri, 19 Apr 2024 02:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1713520160; x=1714124960; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xe5eM9+2rh+qYMrEZDkgx2/xN2LnDn/yiZVZC6+s6fs=;
        b=e8JZWmxyofnDazG93BvCeq1J2pZysTZUwMS2Obi4PMx42Tytz857AQxhLTiXRWNKWG
         SN2u/My91DWhbn0tZ20qRZTwm/Zi5RAlaLv0Tzkv9ljd55QRfWDhmhdLtl9ONFLnI2nm
         iq5wk46Ex3bKFLxs6uDzoUXtpn92IFrS5Gm9Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713520160; x=1714124960;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xe5eM9+2rh+qYMrEZDkgx2/xN2LnDn/yiZVZC6+s6fs=;
        b=DDyxiqpsaSSIZjJlrn6XZURKvf0Z6DsmcFKsGOXx1phgnPtqkO70/RolnqeGZr71zH
         B9J13XzZ+2k6wi/706gpJIsEKUWU92DaG0KOXNMb0ZhL0VNy2XXHtCCjWg5B1NEsrlEM
         85XbRG0YCON+doQ230U1lHcoWd7zST6OI+NmmyFJEZoNHmELTa7TdpfJSIe1j1FlDGOb
         d+NWfp6T1gXw2jffQyOcod01+VpGw0JNwGmrdfE5d401mepDk4WPR56r+ctEPSL1NI6t
         QyoofoEQvPPhCES2PmmSvU9EBZ8xFdrqLDFEUY1NthW0sZXiR/LlHzkf98xpLFbdEw5S
         81+Q==
X-Gm-Message-State: AOJu0Yz91bsYnu+uYjn0PKWpoXcZLRPUi2jSdxLnyQczysRuhrN2aDLD
	fEX3DfaaL+SUeMGIv7MoiI9p+uTaskCEI9VhX0/aHeGJnZPo+emVGTNR0oQ64Unxqc5b0YA03MB
	uiA==
X-Google-Smtp-Source: AGHT+IHKE5I6bNN/ygxYDQdIMuWr0dmGCsznmTcTgLl7Ioa5cL0u9qYtPjL85KqnZCORUNl4F1qURw==
X-Received: by 2002:ae9:c119:0:b0:78e:ca95:81c5 with SMTP id z25-20020ae9c119000000b0078eca9581c5mr1646405qki.77.1713520160591;
        Fri, 19 Apr 2024 02:49:20 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id dt14-20020a05620a478e00b0078d735ca917sm1434532qkb.123.2024.04.19.02.49.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Apr 2024 02:49:19 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 19 Apr 2024 09:47:48 +0000
Subject: [PATCH v2 02/26] media: stb0899: Simplify check
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240419-fix-cocci-v2-2-2119e692309c@chromium.org>
References: <20240419-fix-cocci-v2-0-2119e692309c@chromium.org>
In-Reply-To: <20240419-fix-cocci-v2-0-2119e692309c@chromium.org>
To: Martin Tuma <martin.tuma@digiteqautomotive.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
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
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
 Sylvain Petinot <sylvain.petinot@foss.st.com>, 
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev, 
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.12.4

chip_id is an unsigned number, it can never be < 0

Fixes cocci check:
drivers/media/dvb-frontends/stb0899_drv.c:1280:8-15: WARNING: Unsigned expression compared with zero: chip_id > 0

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/dvb-frontends/stb0899_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/dvb-frontends/stb0899_drv.c b/drivers/media/dvb-frontends/stb0899_drv.c
index 2f4d8fb400cd..35634f9a8ab5 100644
--- a/drivers/media/dvb-frontends/stb0899_drv.c
+++ b/drivers/media/dvb-frontends/stb0899_drv.c
@@ -1277,7 +1277,7 @@ static int stb0899_get_dev_id(struct stb0899_state *state)
 	dprintk(state->verbose, FE_ERROR, 1, "Demodulator Core ID=[%s], Version=[%d]", (char *) &demod_str, demod_ver);
 	CONVERT32(STB0899_READ_S2REG(STB0899_S2FEC, FEC_CORE_ID_REG), (char *)&fec_str);
 	fec_ver = STB0899_READ_S2REG(STB0899_S2FEC, FEC_VER_ID_REG);
-	if (! (chip_id > 0)) {
+	if (!chip_id) {
 		dprintk(state->verbose, FE_ERROR, 1, "couldn't find a STB 0899");
 
 		return -ENODEV;

-- 
2.44.0.769.g3c40516874-goog


