Return-Path: <linux-media+bounces-64416-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id M/PqCEdIKWozTgMAu9opvQ
	(envelope-from <linux-media+bounces-64416-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 13:19:35 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id AB246668AA3
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 13:19:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=LYkVNcdG;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64416-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-64416-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8E7813165A26
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 11:12:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 361B12E2DFB;
	Wed, 10 Jun 2026 11:11:35 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BDD33CB2E7
	for <linux-media@vger.kernel.org>; Wed, 10 Jun 2026 11:11:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781089893; cv=none; b=R1z6e/DkJI4U737WKPjgua1TStqOTt91UQ1VIhMBIpSSEyMkaFrFIJlGY5xtEM64Jri3QxoPaTiZkabIjooL4c+6S7RWcWqIhkuOtUi3cnJj1lWbpIWU6tPP84WmCt93yXfiU+jFQDB8nohl0Hc25IoWDO9nfr+jQaNZVDIwaw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781089893; c=relaxed/simple;
	bh=+Hh67PVOILHaAgCMefcB+6yFoZHKO1AbWUQEUScrJW4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ScUeAuZCJGXkFjDSO6qu3gzhaOKWnH2xVJl1H9oDe5FI4XiVjd5Q1ufZkizNMHJ4kmqA+NQIbWtr63SQw725CYPjhAcwufndoa8LBFtmbEGSOVhFu0wjHw3VXseOp0uca1S4WIEEb96lw2RyBThXYbIBQ0Z47LijZAvHtUpg69M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LYkVNcdG; arc=none smtp.client-ip=209.85.214.170
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2bf77d4a4e2so40642305ad.1
        for <linux-media@vger.kernel.org>; Wed, 10 Jun 2026 04:11:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781089888; x=1781694688; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YCyEbIJgycflS2cdn+qVWDZinKExvA9S1JRweNqMeoE=;
        b=LYkVNcdGUcDVeAXSzGNmptG7XZJXWcJcLhVeJZf3egXGSf6C12Hn0vlYls1W9JUKY0
         Yog6EzplgjE5z2le1IPToUZ8wJS52ygn9czO68cKju/RF7avDdFKIphHBkCib39xc/lZ
         AGCHZg2Eqw8LjdJ2OntO/EWetH/0ahX4PV+CdgstnchFnr9tNihdmuyOIEQG2j+m20X2
         /ftmreNrruHMVw1a6ZNaW8+OvcLQ0/p97JI+QVL+e0B/NQt54yov+SZ+hvBP+9m+IVf0
         b71IKvg3XwrJ/7RdjBPIqgr0x3bhC/NCX8zRVU0ineG03okppziPQrSw+tiLjfg10lnu
         h1LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781089888; x=1781694688;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YCyEbIJgycflS2cdn+qVWDZinKExvA9S1JRweNqMeoE=;
        b=NXKlsKCwvD2XRHAKQAZWObDnBUHwjaRpp1NMJHz9zyVI1PM6GfYdcL3V7MYXrYcf3O
         3zVBB8N5/PCjYQwUDSUPNUVwBc04Orjno8qfBodv4KVjJncLcbiun/7IC+dmKevx695S
         CRL9ayLjignqt1OfWplKSlw0DPwTdzHBXF0m6YnW1ZLoBrLjzRFUgR1iHvCmVfefVwnO
         w2JRUXQUaFjcJjveB2AxktdeZV2vqVA4Es3Y26HtfBLBmpmezcp8VbYJQ6dlBy818ZuP
         9W5XfNjJG+zdavX27rPXO5kvW281+JcIxvuT9HS+YaaN6loZLjQqQi5ORA+pFWp6Vnl3
         abZw==
X-Forwarded-Encrypted: i=1; AFNElJ+85u7Fa1qimerp14/5AUATgYuo3aW09fqd0E29ixYZL73QQpgLpxmszQ5q7rrH5Cy0B6UjONlT84wmug==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2C84MTJCywJxeFQqYCL/cGT04NI1SrxBDM7Er34KuzfD5CZmv
	UolH209mwgHkrjXRiwzo/ZACQKqcwyEkb4GaEp4GaOMhF82ZJj/uv5pF
X-Gm-Gg: Acq92OGHevkg3XjaQeUfZosSqLI2QLPp8hazokA+ILUOcYCjh1JA55WyJ+yEeSascGB
	/9WAC8+nO8+n43jQ39qSWbbkyEg8LGiOyArpYBb91RAI+YpawE8KKgdpjqgleUZx1x1XkTHkkbK
	Dl1QfqNlXzwOTFZxJUdQouAt+6gHGTjyVNbbkWUdmDODndGF8FXkAVmkyQZI+XE0RY4tYJWLK+f
	IVOkL03mOrUB+YxhP6PkjWaWgz1PVngyOXsva4tod90Py3+BbkFFagUQSNAWwWEWiotd/Q2+KnJ
	DOjtP+nv7rwg0gLtmdJ7U6sWtY0l1wwLfGh9mfR147mAJHg+BTj0Y7SrLbaivw/mNmJLVNPPpZ2
	FeXo8RdwwVcfMuc01w3UYLfc3rWh/7mPv61gnM7YxKxqDKvhm4fhljUyC+2iirmw0mERuLa1fkB
	3o47oLb9b5A2gf54AFcMaG6y+FsJPzLJ+z2wadwg==
X-Received: by 2002:a17:902:d583:b0:2c0:aa5d:756f with SMTP id d9443c01a7336-2c1ec7c71cdmr207858455ad.8.1781089887644;
        Wed, 10 Jun 2026 04:11:27 -0700 (PDT)
Received: from [127.0.1.1] ([2409:40f4:4111:52c8:138e:8096:a8df:e68b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f6d37esm317175205ad.9.2026.06.10.04.11.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 04:11:27 -0700 (PDT)
From: Ramshouriesh <rshouriesh@gmail.com>
Date: Wed, 10 Jun 2026 16:39:32 +0530
Subject: [PATCH 7/9] arm64: dts: qcom: hamoa: reorder csiphy power-domains
 for v8 CSI2-PHY
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260610-a14-himax-hm1092-v1-7-0c9907da47ed@gmail.com>
References: <20260610-a14-himax-hm1092-v1-0-0c9907da47ed@gmail.com>
In-Reply-To: <20260610-a14-himax-hm1092-v1-0-0c9907da47ed@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: Aleksandrs Vinarskis <alex@vinarskis.com>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-phy@lists.infradead.org, Ramshouriesh <rshouriesh@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2717; i=rshouriesh@gmail.com;
 h=from:subject:message-id; bh=+Hh67PVOILHaAgCMefcB+6yFoZHKO1AbWUQEUScrJW4=;
 b=owEBbQKS/ZANAwAKARWVil4RHAXeAcsmYgBqKUYQGh6WahDBnQigIxX0k8AxRA7N2XoG0m/Em
 2BxmG4WFrCJAjMEAAEKAB0WIQS/0QuzNKVfvUNlNAkVlYpeERwF3gUCailGEAAKCRAVlYpeERwF
 3vLrD/474hk7I5RNcjWVILYpm4xc+LvkBOvjbeW+a2qZC9ZZl7ghSEA3SmvwCPvpAe1GAywpnBd
 zEFL/rIEbAMStB547j0/wQ55MHeR9eFnJPOY2xbbDvpVbBZ6hA/RWrgHcDSD9MqZD0Db/e4qItG
 fBm+6nPeMHl7TiJbh9wexsUFJJjJtCCPxJ/UBzdyVjKLGs1YETWgFkLRPJYm0fpcPL0ErbBan87
 nfox1FhaDgD2eL4/ZkUfb83Lr61GivS/Imdwtsiurd3YVYH9ws8+4bPAmj4KO3LhbRk9i4WqZ1l
 w8LwsK8OPHFmW+BpHBfGHx01A/d5AQMhuylrwZIrbRB3VbCcjwa04eoPAzNh/8GkBn3TPS1YbBb
 59TVbAPVExVaWxJpmkJ2bkATSa2IRUZ2v5btWN3iEMtzH1QguDwlH9yhtS/SOaLMZp5/3Oo6Uob
 4rkLXb21qBYFd1lyN7glVYmECdXOe3Gl+gA2zei5KSeYPz0Jfk7QpMZ1b6V+ectvXjfGGMTFSmD
 nXgn1ot8vTaDAObv3wAu5oCUwqYdyfs/47ViIM7WMUk1+amN2xspyk65jhorUutVGU/oMUF10IH
 uzvDEn75FlA3+/+1UBUY53ePnFcYrN7DarI5aUEdP6pJ2SLe9yKS5CVNZgATmEZdhqZ5YslB4fP
 yH2wC5HAtJ6Qg6Q==
X-Developer-Key: i=rshouriesh@gmail.com; a=openpgp;
 fpr=BFD10BB334A55FBD4365340915958A5E111C05DE
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-64416-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mchehab@kernel.org,m:bryan.odonoghue@linaro.org,m:vladimir.zapolskiy@linaro.org,m:loic.poulain@oss.qualcomm.com,m:bod@kernel.org,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:alex@vinarskis.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-phy@lists.infradead.org,m:rshouriesh@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[rshouriesh@gmail.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[vinarskis.com,vger.kernel.org,lists.infradead.org,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rshouriesh@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AB246668AA3

The v8 phy-qcom-mipi-csi2 binding mandates power-domain-names ordered
"mmcx", "mx" (MMCX first), and its driver reads each domain's required
performance state by index via dev_pm_opp_get_required_pstate(opp, i).
The v3-era camss DTSI listed them "mx", "mmcx" (MXC/MX first), which is
rejected by the v8 binding and, with the v8 driver's
devm_pm_domain_attach_list() + per-index OPP lookup, maps the wrong
pstate to the wrong rail.

Reorder all four csiphy nodes to <MMCX>, <MXC|MX> / "mmcx", "mx". The
second rail stays MXC for csiphy0/1/2 and MX for csiphy4 (the binding
explicitly allows "MXC or MXA" for the second domain); the opp-table
required-opps values are symmetric so they need no change.

Signed-off-by: Ramshouriesh <rshouriesh@gmail.com>
---
 arch/arm64/boot/dts/qcom/hamoa.dtsi | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index 4226db30e244..1200101d7bb7 100644
--- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
@@ -5853,10 +5853,10 @@ csiphy0: phy@ace4000 {
 
 				interrupts = <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>;
 
-				power-domains = <&rpmhpd RPMHPD_MXC>,
-						<&rpmhpd RPMHPD_MMCX>;
-				power-domain-names = "mx",
-						     "mmcx";
+				power-domains = <&rpmhpd RPMHPD_MMCX>,
+						<&rpmhpd RPMHPD_MXC>;
+				power-domain-names = "mmcx",
+						     "mx";
 
 				#phy-cells = <1>;
 
@@ -5876,10 +5876,10 @@ csiphy1: phy@ace6000 {
 
 				interrupts = <GIC_SPI 478 IRQ_TYPE_EDGE_RISING>;
 
-				power-domains = <&rpmhpd RPMHPD_MXC>,
-						<&rpmhpd RPMHPD_MMCX>;
-				power-domain-names = "mx",
-						     "mmcx";
+				power-domains = <&rpmhpd RPMHPD_MMCX>,
+						<&rpmhpd RPMHPD_MXC>;
+				power-domain-names = "mmcx",
+						     "mx";
 
 				#phy-cells = <1>;
 
@@ -5899,10 +5899,10 @@ csiphy2: phy@ace8000 {
 
 				interrupts = <GIC_SPI 479 IRQ_TYPE_EDGE_RISING>;
 
-				power-domains = <&rpmhpd RPMHPD_MXC>,
-						<&rpmhpd RPMHPD_MMCX>;
-				power-domain-names = "mx",
-						     "mmcx";
+				power-domains = <&rpmhpd RPMHPD_MMCX>,
+						<&rpmhpd RPMHPD_MXC>;
+				power-domain-names = "mmcx",
+						     "mx";
 
 				#phy-cells = <1>;
 
@@ -5922,10 +5922,10 @@ csiphy4: phy@acec000 {
 
 				interrupts = <GIC_SPI 122 IRQ_TYPE_EDGE_RISING>;
 
-				power-domains = <&rpmhpd RPMHPD_MX>,
-						<&rpmhpd RPMHPD_MMCX>;
-				power-domain-names = "mx",
-						     "mmcx";
+				power-domains = <&rpmhpd RPMHPD_MMCX>,
+						<&rpmhpd RPMHPD_MX>;
+				power-domain-names = "mmcx",
+						     "mx";
 
 				#phy-cells = <1>;
 

-- 
2.53.0


