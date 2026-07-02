Return-Path: <linux-media+bounces-66416-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id DLO9BJzcRmr4egsAu9opvQ
	(envelope-from <linux-media+bounces-66416-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 02 Jul 2026 23:48:12 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A3586FD09B
	for <lists+linux-media@lfdr.de>; Thu, 02 Jul 2026 23:48:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=Vf2poGAI;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66416-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66416-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A20DE30193AA
	for <lists+linux-media@lfdr.de>; Thu,  2 Jul 2026 21:48:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 692B2312834;
	Thu,  2 Jul 2026 21:48:08 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ADA73ACA79
	for <linux-media@vger.kernel.org>; Thu,  2 Jul 2026 21:48:06 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783028887; cv=none; b=M3IFBTuyytUddFVZXc9sD78X2Bx20TEBKBgI+xGP5guglXyt8/TWkVnG318j9xspAdOoPsww8NmdNp526C45+nvtcnB67r5pbK6/qCgnzT94c3RST5fSvAZgAJ9RFGDUyCpAhXFDxgifY8n09s2OH8iNyn33Y/lskaLcHzyAuMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783028887; c=relaxed/simple;
	bh=GwobjMKNuoBExZjl/NvFuogoEu7HMJewkr2hte/pKZQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D7c97mEH1Tu+NVEwwc7Sw8AB6A/fG0iVxsO/I35x9lCyJPoVBsRZ8puO3xjcMtSDQ83J9Vf6pF1AC1wDssoD7R8/+8uRpndnchB/og1ir3pDYriwtulUrtd5cENsgJX4BPj+vAbwf/5128rqYLy8Gb6lIDdiHuDoeud0potlzDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vf2poGAI; arc=none smtp.client-ip=74.125.224.54
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-66493875766so3201795d50.0
        for <linux-media@vger.kernel.org>; Thu, 02 Jul 2026 14:48:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783028885; x=1783633685; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/TChm7zMrIm1e2zF/qvsCr3qRkxhMbyISPQm5ZZUS90=;
        b=Vf2poGAIw3Yj4Xss9kvSpcplf48Dx2vjBqueudr6fwWhVMJO/cJMdzyXtDTVhizHL0
         qXKUAbNu6stfUCfN0/sNNiZ2bTcqvCH14bdELHd842e0zpFqpRTj68ql82QnQQ3UXifH
         7+5IcJXbef0C/nAsLv0Q9leTxMyuUtBQ4f2FlZNNQKqAfOwPs3KlpHQ5HZNZ5+XVYMXY
         lKMiwjBQxBcXkT8aQLFeb9yybnOBcsgmnPplKgAjEwIs1o+EKDP/ASc+ONSm5Ijuqcjp
         2kGUEARqw0H4kBNd7yJww4//vLDztUZyh0Dt/PsDqB7P/ygZ9e9WDf+tKmN/D8mUehJv
         0I/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783028885; x=1783633685;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/TChm7zMrIm1e2zF/qvsCr3qRkxhMbyISPQm5ZZUS90=;
        b=Iqj1N4FLH02nX005EIz7sujwZBY5yD3B+zhsKaYvEus7Xtoa6PetbHVvbX+K3QFQzw
         Iii54YAKMP1ZtdC5wGezYWVUP9ACEaSq+M4gzg1umKkAFrPkoOZtsvx0DHynl5X7AMOu
         XalsnKErMFiaG1IJQ2Ja7JrBc/qAhcBlg9xX8UbTi6DG8YG+XZ4fcJfWcQXLlI7dzPSd
         n7PRwUhFhAGcK4vhAil9jOkmG3kzP4A6nqr3pLD6Qmew4yJKSyNLfcCO6hvcGu5fEqL+
         5oLJJvmWQhj1LONdJzZdgRRlA045JoJcptE0iEQY4cCZ4/g48B88NSc4X6clmCMdWil2
         oFMg==
X-Gm-Message-State: AOJu0YyFUnAC6udV9QO0xaLAD8wtrIW8UZAOxQLuhr4kCh6MDX6yImnD
	WFINLYg5OecRDw5TlqWP5s91Rc/06ATrtSR5fYnoZzLw55oxfsB6gJyI
X-Gm-Gg: AfdE7cn6yWzYZ2AqJIuiVYEArhcpaKQZmlFHZptt/17MHRZ+VxHfjxk7pVR24wspFSs
	RAsEfVbBrDxwmh2+1gMJBi6cX65FnyrD2LJNMT17RE1qW87XitfIShnbJt0I0Uc4S3KLg025AI4
	WOIP1/30BGHvb7qx4eWpV+ivefafoSgVQSnbgvaWzDlXOyi3mrXPCOvdlt7PO9P7fKS3BX1SNeR
	P9IWEINcVFKTGyT25jIjalS9zhpCdL4tmA871I3SHf2uRBVIeQRJeT6nns3vNytKa4+2w9Vooud
	h2gCLrJVOay1+CO5z13K4gq4Jo+E59+XWCbRI0hQNJZzTwNRk2+hpOZk+zgXk00ktn6LoZgFFQF
	V7Zv1OoPfB6+gAtYlT7qfn38zDCZ0YHn8jfXeMgXH34Jq12vfNte25244PJxJ6I7ApBiQq8plXY
	l+Q3VpEJHLE0CMqEhPVOhhcj52Xc21cTyZLtdaZkNcw/V0K38=
X-Received: by 2002:a53:ac96:0:b0:665:a0c:654a with SMTP id 956f58d0204a3-66521a0c7cdmr9753722d50.27.1783028884812;
        Thu, 02 Jul 2026 14:48:04 -0700 (PDT)
Received: from zenbox ([2600:1700:18fb:6011:169a:36bf:d0a4:1d7c])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66624021a75sm1631772d50.11.2026.07.02.14.48.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 14:48:04 -0700 (PDT)
From: Justin Suess <utilityemal77@gmail.com>
To: Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	Sashiko <sashiko-bot@kernel.org>,
	Justin Suess <utilityemal77@gmail.com>
Subject: [PATCH 3/4] arm64: dts: allwinner: a523: add IR receiver node
Date: Thu,  2 Jul 2026 17:47:49 -0400
Message-ID: <20260702214750.3428694-4-utilityemal77@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260702214750.3428694-1-utilityemal77@gmail.com>
References: <20260702214750.3428694-1-utilityemal77@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-66416-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[mess.org,kernel.org,gmail.com,sholland.org];
	FORGED_SENDER(0.00)[utilityemal77@gmail.com,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:sean@mess.org,m:mchehab@kernel.org,m:wens@kernel.org,m:jernej.skrabec@gmail.com,m:samuel@sholland.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mripard@kernel.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-sunxi@lists.linux.dev,m:sashiko-bot@kernel.org,m:utilityemal77@gmail.com,m:jernejskrabec@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.infradead.org,lists.linux.dev,kernel.org,gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[utilityemal77@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7A3586FD09B

The A523 has a CIR receiver in the RTC power domain, clocked from the
R-CCU, with its RX signal available on PL11.

Clock the module directly from the 24 MHz host oscillator; the driver
selects a /256 sample divider on this SoC, giving a sample period
close to the legacy 8 MHz / 64 configuration of older SoCs.

Keep the node disabled by default; boards with an IR receiver can
enable it.

Signed-off-by: Justin Suess <utilityemal77@gmail.com>
---
 .../arm64/boot/dts/allwinner/sun55i-a523.dtsi | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
index ca6a16807049..5e46c4b1ee61 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
@@ -927,6 +927,25 @@ r_i2c_pins: r-i2c-pins {
 				allwinner,pinmux = <2>;
 				function = "r_i2c0";
 			};
+
+			r_ir_rx_pin: r-ir-rx-pin {
+				pins = "PL11";
+				allwinner,pinmux = <2>;
+				function = "s_cir";
+			};
+		};
+
+		r_ir: ir@7040000 {
+			compatible = "allwinner,sun55i-a523-ir";
+			reg = <0x07040000 0x400>;
+			interrupts = <GIC_SPI 167 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&r_ccu CLK_BUS_R_IR_RX>, <&r_ccu CLK_R_IR_RX>;
+			clock-names = "apb", "ir";
+			clock-frequency = <24000000>;
+			resets = <&r_ccu RST_BUS_R_IR_RX>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&r_ir_rx_pin>;
+			status = "disabled";
 		};
 
 		pck600: power-controller@7060000 {
-- 
2.54.0


