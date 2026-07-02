Return-Path: <linux-media+bounces-66417-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id mn05MObcRmoFewsAu9opvQ
	(envelope-from <linux-media+bounces-66417-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 02 Jul 2026 23:49:26 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2017F6FD0C6
	for <lists+linux-media@lfdr.de>; Thu, 02 Jul 2026 23:49:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=jva85NTY;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66417-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66417-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ECF503062C38
	for <lists+linux-media@lfdr.de>; Thu,  2 Jul 2026 21:48:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4E19380FE0;
	Thu,  2 Jul 2026 21:48:09 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D55813ACA4E
	for <linux-media@vger.kernel.org>; Thu,  2 Jul 2026 21:48:07 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783028889; cv=none; b=gFnBkhuZY05/aTJPuBz6o3qoqAhWmPoElGx14za8dq4p5WF2NNVLza2cW5DJZRJgNx3fexsE3wyUVPkWhIEPhzbpVab+sESzbtPpP/EUOle1O1jK5syILHRhAkb7jxXISi11XZAXWRWZ8sWO9UqBtABKYsEPhTR9HQMhLZiCBeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783028889; c=relaxed/simple;
	bh=+HAMBaZcdBrjRhj9S5KxkVE10MrfH1DGewIu3JXAVXE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r2JkUePnIT1FIbm4pqfpNyevM4KnguVhCaqO5Bt0Hb7b9PhBW1DNYM4qLV0F0kC9G1pYjked1qxdqm2oKOpjS8F0gls0iTXjCSzUytmVEsMvXyRL33hFe7ZeXvibegBdgVD/8aYhns/rbdm3Xqk1HFt+I4ZOXtoBlK+sPlkapoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jva85NTY; arc=none smtp.client-ip=74.125.224.48
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-664a04eb233so760285d50.1
        for <linux-media@vger.kernel.org>; Thu, 02 Jul 2026 14:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783028887; x=1783633687; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Tpj+MtbD1Voe05dyT9Fd9S36++WsVidg7tbKtFQLZbU=;
        b=jva85NTYn72I8reMdrUtXzNicXkZmtnAg0mafYfOEzfmWnn/c/qQFs46HE0T9E/4WR
         FmUxI25Hu10hJ/NVqtI6snaWrmBDljSIXa5ye95stsA9hXDsZGwCH3/80xgA4Tb25bpw
         NAW+cBotNphjdyezdidsAGQCW9AU//G3TjVorAG78vM/b8wiMJZPLdw/b5iwLsPVfEQi
         izVKJcXswpFk/lF7ZLMXbyBYC9Hm/RnJ99DYqJAyV8LnjAvMM+KHuRJLnCshyrUer7td
         6t6e5CRdA7qVXO4Af3Xpip5absVYRlFSe528g3YV2w0WssfUQT+ctYAsDJ0haatIsVg1
         tUwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783028887; x=1783633687;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Tpj+MtbD1Voe05dyT9Fd9S36++WsVidg7tbKtFQLZbU=;
        b=gL/ylDYByW7JxfW0qzcm+S3UVcbFoMnqw9Uq4SpRmogqa2R6CQZ+P21EDpOV1nLin1
         QlhGr/yBIaS18Z8/5lgeLp7HPFEZsM9ozu0b2Ekl0UINSru2cfRpf1rSEfUbFCxWUwPY
         iPRl2sgNOmNQRzh2PQXjGxffgZqCCAlersUklXJeyvRDQFdvPaRrNurNpBvAmvpjVxzv
         skMlDAAx8Lz2EoFVELrjd5xJDYdfIh/wdif+fv6w8Q/IJE9deKCn09iMFk30p5sxBha/
         1ojbe+egzf2BXU3HTGTvLQ89svi7ZFLrVWVh2ENDaYEl5eceVejLQLJiKE5yHRombR9S
         /ZqQ==
X-Gm-Message-State: AOJu0Yyxp0qCvSU4m8Ec591JO2UOthz2L96YCwDjLC7GaR0z7QgtIzKB
	qoU1XBf9fec6tmmFK3BtM8k1K434zN36IlYH0zseQFXte8P83kQ1Exa3
X-Gm-Gg: AfdE7cmuNICkwoM4JsfLwbNDkYQj+M0CSw7WSCZ4K87UqSeikbGG6H5lwUeGy/zWjQv
	9MiZ8JQrBZlGJsJFES+5Z5BoPeyOSTFnpsaGmXV8Bi9FNu0dzw57TgkQtdAwJ5AzX+NXo0c5e0V
	9h1YB0SwNoXAKPyKF74F/YTdpLlMxtmKwDyfj3wCHTd+GCrn+TTw6mGAmThHr4MaKhf2y4Xn3rp
	7QnvKLFkXf7WO/u4aowFQFlFlfQgS6NM61BhYottLgRzRjmCVi3Kw0ktap9WL+GZvzHkBWw5DQP
	T2VUu6xSt8IRXOdxnv4ckJhjAP5ixYP4TeqizIkbOSkyKyPnKAG+B7GpBQP6ONx53jekVPTMrgQ
	2lgGe9hCx2zmgC3/tDH+/WTpyqQr7ZuNpMl1wPY2riqLDt9PKgv/n52012psfZMMHc1A3tZRbh+
	77m0RZdZXVEeOGtv7sH1weWTdJoYSWOHVChnzlxNDxlmOSo7w=
X-Received: by 2002:a05:690e:440c:b0:664:a0c8:f956 with SMTP id 956f58d0204a3-665916762d3mr4471470d50.15.1783028886926;
        Thu, 02 Jul 2026 14:48:06 -0700 (PDT)
Received: from zenbox ([2600:1700:18fb:6011:169a:36bf:d0a4:1d7c])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66624021a75sm1631772d50.11.2026.07.02.14.48.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 14:48:06 -0700 (PDT)
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
Subject: [PATCH 4/4] arm64: dts: allwinner: a523: enable IR receiver on the X96Q Pro+
Date: Thu,  2 Jul 2026 17:47:50 -0400
Message-ID: <20260702214750.3428694-5-utilityemal77@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-66417-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2017F6FD0C6

The X96Q Pro+ TV box has an IR receiver window on the front panel,
wired to the SoC CIR input on PL11.

Enable the CIR receiver.

Signed-off-by: Justin Suess <utilityemal77@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts b/arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts
index a96927fbdadd..de2bdc21c781 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts
+++ b/arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts
@@ -266,6 +266,10 @@ reg_dcdc3_323: dcdc3 {
 	};
 };
 
+&r_ir {
+	status = "okay";
+};
+
 &r_pio {
 /*
  * Specifying the supply would create a circular dependency.
-- 
2.54.0


