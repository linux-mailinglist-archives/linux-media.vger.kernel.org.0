Return-Path: <linux-media+bounces-61064-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ULPRKoShAWpKgwEAu9opvQ
	(envelope-from <linux-media+bounces-61064-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 11:29:40 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AB8D50AE5E
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 11:29:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 28EDF308656E
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 09:12:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0E533C345A;
	Mon, 11 May 2026 09:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cJNuZPyc"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 086C83C3450
	for <linux-media@vger.kernel.org>; Mon, 11 May 2026 09:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778490714; cv=none; b=n44+9UQpns+OoOg6X/zoqChW2gz6qqM5usAdoZ4bnpbbQ2yciNFqyRMKup6Czi9eRov3mUaMr4ruS5zN7N5r8txzCNUn5Zzqp2+jVzKTC+T60wPqfpKrTcb7EeD5M8nDk/IcMUKupMrEJQyXxMgb2B/q4wnOIls2PNyJHmAM22s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778490714; c=relaxed/simple;
	bh=iazWrLtJH0ZvfQXHNMDmWoeTvLKqPTMtY7iZ5ZxXJzU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nTmBhy3EZUpGvQTWokmj+fIFJwoC7X8iznGsPGv4nsAy42eccQA7oblu0crD3VJO0sj+xGC2YdzHgCO1UkkcfKE97xUNrjEW5/W0zStJ4ArJqInTCM5LGqp7owxTtE3e5dJBpRblrO13Xj3yT5PXlppUeVqy1rqkQigNIeCBsA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cJNuZPyc; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-8367df48711so1791575b3a.1
        for <linux-media@vger.kernel.org>; Mon, 11 May 2026 02:11:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778490712; x=1779095512; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4EVdxV8Se2LiyuEjyoag3giBCPKNVKgEYji5bgopuUQ=;
        b=cJNuZPycB1GywWBSMI9WH2uRmcF0kM1NZo56HHDH2xoWTYszJy/Khtvqxn1ffca3OD
         WmexjKGfbNHHWDok85UbaoJzNMwS5rgufEidM2pqkLdp644nHkUlQq3SSyjW55llbmpO
         lF3KqNOO4DXMBB7v7JP2K/FV+Q8k2A9yeIenySJgOp8Sp8r72wzW9jSok4Fybkep3zwR
         aBmkJD6v5nmsEI2gEFuEoptvovixVCugacdIPp/4CVzT5Ca9Jwc+3J8P0H0pWxL50Hil
         U7ysu0g2KC+n0E6vjOH1XuovAlDCZ1bkhGREuYVdRLUh99pZ/jxGwIpN6w1zYPMZ1pMs
         dakw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778490712; x=1779095512;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4EVdxV8Se2LiyuEjyoag3giBCPKNVKgEYji5bgopuUQ=;
        b=HMA23lezERKgYq1uo6Gk9CQ0eAD/9USF9w0LtjOw9xgJ1N0wUke2kOzgAFqQTlKFeP
         aPwMbn9t35m9RR45qxxmVV8OwXYhhBvO8Eua1VqsKsnSNTuzS8z1jRqBLL/Lhet+TwJb
         EmtsdDSBSJLwe5pzWUNUu67GbxdoW7V6MBttaNv4pyNd20M5UQQ/B2ir0/Q/DmWOAW4Y
         NFOllJjVmUYb+DL3IhEqvbmmaKEhfzLoLYIXoj5l1HluCzU3lSAyoxgf5+22P7b3c5cE
         9TPRmtyC3VP+HCdSpt2O5y74UJJkS3Xuhce0EyqW+k4QpFs2wJdJGJSVDM+i/1jUGSrI
         T8zA==
X-Forwarded-Encrypted: i=1; AFNElJ9szeTLoNpiTzoYxU7dqTLby+Q6XuxtU47qAMLwEJOetxF7SBkCELKxgyvjM3X/8SYgydMKZfOwnFKo6A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyfSOtmY0mKQUjT6QHS39oIOHkuVuefdz2R8AiSE9Ydkw+1mXEt
	yHj/fXzBHLE6NMcfMtHmbG3MBPTmHEl+ir+towS63QTUgf2Mhovz4B2d
X-Gm-Gg: Acq92OF25iheSnIwXYhHvrZCdw4+zKrtElgngqrSd+mN2ZGTn5t7REKsGV0Q765H2eT
	Zrei3yXhJQ+Qk+SGz3TDy7uw5Z5UvQt5NaN/7UVHg4b6MwsEKXqOzILXb8ov7XpwuxzmstjJUKc
	hm53v7PRJDRcs+Av3wfW/gv6YLDbpgo0DcBhiQKp/N7wn5XQXK1wwHdEzH5iaDwO+q5rOO95w/V
	dGncNg6fanDC4AG6NVHjQnnPDYsqn3VqjEKntITxghqHv5NODgbpOB6d+dpE1OvzHJ5m32dvKWW
	qAM+JqGux43WopGegancoLQqJ41hncsD/URAgg+ktNibbFcs9/HTXj7nYI72FGaOIacfOkFQCrA
	RDiAMOtdAaA6STa429S0IojXXMEFRWPLv0S+rehd+LpyrwILC9b7CUQG2tZjE/UWGY3LFc3ts9y
	yregUE1t4wn3YCrakkW6wSXXg=
X-Received: by 2002:a05:6a00:a93:b0:829:8cfb:df45 with SMTP id d2e1a72fcca58-83a5bec54f7mr22142513b3a.15.1778490712503;
        Mon, 11 May 2026 02:11:52 -0700 (PDT)
Received: from nuvole ([2409:8a34:5f37:1974:abc5:99cd:a924:4e86])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8396563f11csm24775517b3a.3.2026.05.11.02.11.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 02:11:52 -0700 (PDT)
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
Subject: [PATCH v3 5/5] arm64: dts: imx8mq-librem5: Correct link frequency list
Date: Mon, 11 May 2026 17:09:24 +0800
Message-ID: <20260511090924.269106-6-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260511090924.269106-1-mitltlatltl@gmail.com>
References: <20260511090924.269106-1-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 2AB8D50AE5E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.linux.dev,lists.infradead.org,gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-61064-lists,linux-media=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.985];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
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


