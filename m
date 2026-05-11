Return-Path: <linux-media+bounces-61087-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yekVHF6zAWr2igEAu9opvQ
	(envelope-from <linux-media+bounces-61087-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 12:45:50 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 18E1550C20A
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 12:45:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 35C4A3032F87
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 10:43:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D31D13DA7C6;
	Mon, 11 May 2026 10:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G1YBd4ez"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 149F73D6CDA
	for <linux-media@vger.kernel.org>; Mon, 11 May 2026 10:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778496226; cv=none; b=S9WyS0t2FR7Bvo9OUCjplD/0qFWH+oMLbKVlQ/wc1TRo6xIZFTaTM4ohlEnv9sl55cBnLPbtBZUQhLjC3DVsR4Kn+z8ByX7MTr4K6GzGL5I2zp5ArhBbpjlxybXjt3CPBLfP6Tzt2uenOYjaHmU/TrKJ2wO5+G3KPAMvLLAPPS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778496226; c=relaxed/simple;
	bh=iazWrLtJH0ZvfQXHNMDmWoeTvLKqPTMtY7iZ5ZxXJzU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r15kBdXyCzCKUiostpf9X+gF1et2FHRZD+y6r4nI2J/X4yxOLKI+HzZwUqQfj5n4IM206kAkQlLwVE3bvXwKQko6w2o4GYvOGoVylih/6Und82gelJAPUAhfAT4d1+yeWQeSK4SBRKz/C+hxdspncdPvvVUZSJK6KFwMLeCovsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G1YBd4ez; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-36608b2f2dcso2647776a91.2
        for <linux-media@vger.kernel.org>; Mon, 11 May 2026 03:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778496224; x=1779101024; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4EVdxV8Se2LiyuEjyoag3giBCPKNVKgEYji5bgopuUQ=;
        b=G1YBd4ez9CQtjhhETw5Njv00Z30Tw6REtL+hUEJGvTswY9Ln+ArL3qS/i4tRJ922/f
         PHiBA/ln6yrFXc87Xm+CCFfty1Ga8Q30lCnjFZlygxr6NF0QJ56c6YGi1IgSR0fxvTi3
         TZxpr6zk1s53HG+PVBMg2txKfcwAcsReejfTPMwtbIilMER1WcOWKZE/X9Z6u7mMjn+d
         HvQalqXYIF3FLUggh0eyFe/c07CAcEA/bTnKeDFL11/2/nvNDdM//0Zm8JaExAa4b2SB
         +M6al5aITPAQBNF4JH2sgtB235L20wp0pMOdGg2Ihd1NFKCzQk9B/d14O/j8PkgFE9ZE
         Gr/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778496224; x=1779101024;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4EVdxV8Se2LiyuEjyoag3giBCPKNVKgEYji5bgopuUQ=;
        b=c7oSsDhZe4HEwTY6qmcLnkcwRcPoDB7oYTbfZCeneyejQjt10lEppyiHW0XfCfM0Pu
         zWtTgdW/BVpHdqS+07e179ZCii2Ocl0AfYwO9evRMbNaXmfO8MMj8O2jr8qlWdY9EEvN
         3ECuZl0+a24YosfC5xmA/jViEOhZxEPvN86w96au3AmFLlLeoCWeoZZ3OLjTekY3x9oV
         yVIqdGsPxyL5fICFXTY2Sdfg0StHcHRCplJ1zNG+2zZPwy8Bb2ieXV8L2myNFg9Bm5Gh
         WwQbhQTk5mQeTtSD8tPl94hJAKaR6HRedGmQVPpOOXMLWjhjA7hDHDczLefqGO2hUy4d
         seZw==
X-Forwarded-Encrypted: i=1; AFNElJ/FA/BaDgV52VVTTqtnRx56BM8YCfa2LIeSXKyX8tOZT1/zVX7ewjhP1CaeX4d3K+bnlSdOq7M1ZcJmSw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy59ME51/HvN233MoJC28p2mu/HT0KxlOhlh840flSIT8wABE5J
	8jRT3XrAvKTZ6kyBmOTHTgOX4gdo3tPZn47Vy/ek37Wl7rDiZj5gq07c
X-Gm-Gg: Acq92OFRIIaGxCwNLt3Qy+1MaDkflWiFkCN1xt+qszitokXFzs+F42zqJ8r7fEBcklT
	+t7Y99c/2UJTAzPOsxQJ42SXs/sqO/wLxwh1CufJKRmFS323fKaPGiqz/PLaxRNJdvwqzsNI5Bj
	myluDdNLjCpQfDGFkW18I2ZmAkalXKXofmAIp2ClHXWtoDds5NRdRqd9cUwSpUx0mPwq7RCXKXN
	hDuHbhVGJWHdiqFpsassyJKydtGtQKnR2OK6eYKBvTDsOaMgIh6+sg7Qqt9TfaY6ouSluG3vULC
	whknyg/UPKEcIjaGLr+lqjjp3YsvuUpPR4Iv7gQDAVApylR8lXiY40d4AFziwp/4LBEj+aKcuQz
	VfTIk2A1sWhgynQQkjSkfH1FIgMVJwr8P+BTvemFwv3nfgLVrSwrxK7HnTDg+OD2IJ5oV/JR399
	qh04ey19eWJkE//xL98860gJeQC3N9E1O5KInTxTc=
X-Received: by 2002:a17:90b:57e5:b0:367:b9ed:665f with SMTP id 98e67ed59e1d1-367b9ed8035mr11528030a91.13.1778496224312;
        Mon, 11 May 2026 03:43:44 -0700 (PDT)
Received: from nuvole ([144.202.86.13])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-367d684009esm7533423a91.11.2026.05.11.03.43.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 03:43:43 -0700 (PDT)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Martin Kepplinger-Novakovic <martink@posteo.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Pengyu Luo <mitltlatltl@gmail.com>
Subject: [PATCH v4 5/5] arm64: dts: imx8mq-librem5: Correct link frequency list
Date: Mon, 11 May 2026 18:39:27 +0800
Message-ID: <20260511103927.279550-6-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260511103927.279550-1-mitltlatltl@gmail.com>
References: <20260511103927.279550-1-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 18E1550C20A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.linux.dev,lists.infradead.org,gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-61087-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,nxp.com,pengutronix.de,gmail.com,linux.intel.com,posteo.de,puri.sm];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mitltlatltl@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media,dt];
	NEURAL_HAM(-0.00)[-0.983];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Action: no action

According to the hi846 datasheet and the register lists, they are

mclk / prediv * multiplier / post_div1 / post_div2 =
25Mhz / 3 * 90 / 1 / {1,2} = 187.5Mhz, 375Mhz

Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
 arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi b/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
index f5d529c5baf3..cc5604172192 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
@@ -1122,7 +1122,7 @@ port {
 			camera1_ep: endpoint {
 				data-lanes = <1 2>;
 				link-frequencies = /bits/ 64
-					<80000000 200000000 300000000>;
+					<187500000 375000000>;
 				remote-endpoint = <&mipi1_sensor_ep>;
 			};
 		};
-- 
2.54.0


