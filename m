Return-Path: <linux-media+bounces-60124-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cIQ3Gup59GmLBgIAu9opvQ
	(envelope-from <linux-media+bounces-60124-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 01 May 2026 12:01:14 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BDA3E4AB7B3
	for <lists+linux-media@lfdr.de>; Fri, 01 May 2026 12:01:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6535F3051C83
	for <lists+linux-media@lfdr.de>; Fri,  1 May 2026 09:57:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2150B382F34;
	Fri,  1 May 2026 09:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LG6Ce19Q"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 323373822AD
	for <linux-media@vger.kernel.org>; Fri,  1 May 2026 09:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777629474; cv=none; b=fMhvihR91WajkbWaA3DPWqgv8HTvV2pQCHzJp0fT561/HejD7O+LGwGezH3oQQpbbN6Wu0mzrQ9z1BWmZMjdSTtyfTeOKHfCQjP1S2Z8NQY7RXNXmewR2gpuEQTzhRlnfyw+dgRmFtvz0eFK+79zR/phqteFq4V18QjkmLI3Os8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777629474; c=relaxed/simple;
	bh=u0+cl5+Er6WaymYzamEFJC39ZKeWrnJt8oCo63e9YIE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B04dOFNDtWpJstjmaSj/4wkROeRcW+0VFP08UFHx49AMU0bzqnlmaIC2F/jXryhM9fYZn+WlWU0PDbTJvC8phi2PTNAAfDUJLTbymlkuvrbsJxliRBbeJ/ASITjT9MIvVuMxBEE1aJ4xC0+E9I1EhDUDw3CDtxy2U1tUhVqlaFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LG6Ce19Q; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-834f1075805so1309655b3a.2
        for <linux-media@vger.kernel.org>; Fri, 01 May 2026 02:57:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777629469; x=1778234269; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N8cBbebvkgmNYiigpFW0uBFgVevOeLSPr7Jmw5f7oUM=;
        b=LG6Ce19QKUjyUE7KNfuoAZrL7Ob4MIFnreDowrGA8I8t1L9zt6D0ieahInWDOdZWXn
         jEH0Rij6oVCip3U1KSQM4IZoATJBd4N0r7bdqJZOOvoEsWUpRxEGBmEnR9EfdokC4eLh
         CfVpb+lbG9Xwn5JmZGTK0obviVZ5CG17s2J+arAKYk0Rn3owGQ1fE7BBQSEmMDfeAD7L
         mp99mi/Jwv80c00t5YQAuQpA7CqYZzsjFUGT3/rIO5lROmDLRPHGzRpNbpZhSEhT0+wT
         TwT/f0RpFKEwB0N0vEM6K8W0oePVgC22Kes2XNsPescpVcagV/iccJHRkxp33DqWjQlU
         tdsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777629469; x=1778234269;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=N8cBbebvkgmNYiigpFW0uBFgVevOeLSPr7Jmw5f7oUM=;
        b=L5stIzh8otdGbOV02MdfxvI1W+PNcOreaIIA0EmlOIorcLhO85Bwg1q1ksHGF7KhKh
         hem/01AR3+nFG5RusORBTuv1xEFzrz72zbLPWexZL0lJLUqrpkwGRRpymRx4gOtLU1Ex
         F1Y/2LPR3jIqJqHWyODPbd24j06Otht5U86aSpfFXQzwYJo3FPnK9DIKe1wNWX3/r39o
         ZMMIl4gI6yvPdlO4vC7P6Ngo2aAHCKXvWGYKKSnyC1hhG4d1q/MabmH39rjo3fY3BlJB
         whchWc4FI93rB3Qjb+VLCYpEgDn5pXBxGrQGEMpOpvPXUyiv0uUxTKKiLy6s2NvIr6Fa
         088Q==
X-Forwarded-Encrypted: i=1; AFNElJ+N55vGIJ9xSwzgoTppQuj9Iq5K0P1mtpDvoAE+vjWLC012sNx+EnSZeWlXz2HyOAbHItjr3ppbc0/Ccg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwYIw1xvwYVnyOXmgoHtsgTj6wKJlef73ttOcOM6Nok+l7f1jH4
	couqcXQUv2X/VBy2rRREyKwCBlzYRH2EcZri8NyMZDj1Ad4wMaQWnYKp
X-Gm-Gg: AeBDiesL22VwI7MCcd8dzjkIJmy5AYq6hPT8dktpucRwegE5KNmTBLLpU/2EtuPl4GZ
	X55E53TMHwfbrbjb9pgiHok11iLKLSBTXwgFokcFLyluA/Sds/JQLJkXDy9B8MeOzEo4FJUMkhy
	4m5uC0birZgvvJsD6z+3wIbeWMy6zGVzjLPLB75zSBvXKAeO8a9Q1tzvMJlayPtdIg9NJx1Tf0O
	jf5tZPY1VkrboScUmbuH18TRxd+dJdllweBLaPwxQ2z6Howj0R/sIRxTVu5wfMKTlA41kOdz1oI
	1ivrilc59uDjM98LZzHGPv/uRQC9ivhjnPEALBPdjhS6w2UvY9ZhtLRfARBljiDHvlpz/9Xhywu
	CCuxEuH+828LjZpiZUvuoEaiMihJDLIikiytSpPM40wpPB2IUSUMYniV1hATJz18e8EGahBuORD
	SKruz0xTd36rNsCQ==
X-Received: by 2002:a05:6a20:258e:b0:398:a1ca:7a2a with SMTP id adf61e73a8af0-3a3cf8d8f18mr8009215637.48.1777629469654;
        Fri, 01 May 2026 02:57:49 -0700 (PDT)
Received: from nuvole ([2409:8a34:5f36:7c14::f7f])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7ffbcac2cfsm1731381a12.32.2026.05.01.02.57.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 02:57:49 -0700 (PDT)
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
	Hans Verkuil <hverkuil@kernel.org>
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Pengyu Luo <mitltlatltl@gmail.com>
Subject: [PATCH v2 4/4] arm64: dts: imx8mq-librem5: Correct link frequency list
Date: Fri,  1 May 2026 17:54:33 +0800
Message-ID: <20260501095433.1609309-5-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260501095433.1609309-1-mitltlatltl@gmail.com>
References: <20260501095433.1609309-1-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: BDA3E4AB7B3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.linux.dev,lists.infradead.org,gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-60124-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,nxp.com,pengutronix.de,gmail.com,linux.intel.com,posteo.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mitltlatltl@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media,dt];
	NEURAL_HAM(-0.00)[-0.989];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

According to the hi846 datasheet and the register lists, they are

mclk / prediv * multiplier / post_div1 / post_div2 =
25Mhz / 3 * 90 / 1 / {1,2} = 187.5Mhz, 375Mhz

for the detail, please check PATCH 2/4.

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


