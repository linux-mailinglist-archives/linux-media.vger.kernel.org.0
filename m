Return-Path: <linux-media+bounces-63073-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +O9xAE7+GWr80QgAu9opvQ
	(envelope-from <linux-media+bounces-63073-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 22:59:58 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 01C0B608BFC
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 22:59:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7BA8A30207DF
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 20:59:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45859426ED5;
	Fri, 29 May 2026 20:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="Yo0R8FKp"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-10630.protonmail.ch (mail-10630.protonmail.ch [79.135.106.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46CB642668B
	for <linux-media@vger.kernel.org>; Fri, 29 May 2026 20:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780088348; cv=none; b=ClpNWFO/G6c0PsYLFyUkHqwEg8hXKghP2LIRizz5oNz9BuMKL7g7pqyQZkWCFi2Hjr5FEh38kjP1G0qjkoW10Gj25W8/x0h1D5N2OuGNFb3qaVaPNXh6Z+uOuN80Nbt36xjWs7RpvmIZA+FdsmKrMxlKfneBsTCUu6ocTF96CuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780088348; c=relaxed/simple;
	bh=tlYJL/2ke8BUueppNiukr1+B+mrwjLADgTgpTleTGlc=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YXyBqY3Uh7H2ajjwC4Q7b9APDnDwNjXBh/gSjzw6e3aTpEfdjIqSwFYkJuovG8QGk0NII0dO6oaRMtx99jKPmOK1uZPD5KU46oBwro4cLFsM7SfA7A5yVgkiHB1W+N3+MMKF1+v3ooYa3q/uihzoHgDwnBRjclxgmKxNumyj0VE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=Yo0R8FKp; arc=none smtp.client-ip=79.135.106.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1780088339; x=1780347539;
	bh=lwldgPVSHch2FGAWosFEp3hX4DOJNqvrHvM1qg8wRrA=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=Yo0R8FKppC3HuyRikRoP2X7WLHa7RfEt5aLp2aWvGYF5FNtfmna2+beI7NRWjffeT
	 YWpL30m8Ngd093xIeC0p3mPruupekVmx7sfBqBL1V95vGu+OboYM3+sHaYl1CHS0yu
	 +qx1tRBh8xAeKK/SnefmwvGR2SYLP1882luplNGL4i/iTNK7D12Vd6eSQXUNbRLa5+
	 5oqZMUKeZnrM4M5NEmGnnrrgklsqRKi9EOozI9U4np1S4YD+ETpngVZcBKX7Wi2XOs
	 oT2CYRRASVC23pcHhqIglNLaY0vb/GnPwwI9yqbRLEtMe0Yo/QW6Uo/X3HL9tg1IFz
	 Yzywj9oUYey0g==
Date: Fri, 29 May 2026 20:58:53 +0000
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>, Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Alexander Koskovich <akoskovich@pm.me>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2 3/3] arm64: dts: qcom: milos: Add Iris VPU v2.0
Message-ID: <20260529-milos-iris-v2-3-7a763d7195ae@pm.me>
In-Reply-To: <20260529-milos-iris-v2-0-7a763d7195ae@pm.me>
References: <20260529-milos-iris-v2-0-7a763d7195ae@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: 696512aad79ae3e982608ab11b16d10f288cd25b
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[pm.me,quarantine];
	R_DKIM_ALLOW(-0.20)[pm.me:s=protonmail3];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-63073-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akoskovich@pm.me,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[pm.me:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[pm.me:email,pm.me:mid,pm.me:dkim,qualcomm.com:email,aa00000:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 01C0B608BFC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add devicetree nodes for the Iris codec (VPU 2.0) found on the Milos
platform.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
---
 arch/arm64/boot/dts/qcom/milos.dtsi | 85 +++++++++++++++++++++++++++++++++=
++++
 1 file changed, 85 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/milos.dtsi b/arch/arm64/boot/dts/qcom=
/milos.dtsi
index 4a64a98a434b..94a3c51d1d0f 100644
--- a/arch/arm64/boot/dts/qcom/milos.dtsi
+++ b/arch/arm64/boot/dts/qcom/milos.dtsi
@@ -7,6 +7,7 @@
 #include <dt-bindings/clock/qcom,milos-dispcc.h>
 #include <dt-bindings/clock/qcom,milos-gcc.h>
 #include <dt-bindings/clock/qcom,milos-gpucc.h>
+#include <dt-bindings/clock/qcom,milos-videocc.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
 #include <dt-bindings/clock/qcom,sm8650-tcsr.h>
 #include <dt-bindings/dma/qcom-gpi.h>
@@ -1835,6 +1836,90 @@ usb_1_dwc3_hs: endpoint {
 =09=09=09};
 =09=09};
=20
+=09=09iris: video-codec@aa00000 {
+=09=09=09compatible =3D "qcom,milos-iris";
+=09=09=09reg =3D <0x0 0x0aa00000 0x0 0xf0000>;
+
+=09=09=09interrupts =3D <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH 0>;
+
+=09=09=09power-domains =3D <&videocc VIDEO_CC_MVS0C_GDSC>,
+=09=09=09=09=09<&videocc VIDEO_CC_MVS0_GDSC>,
+=09=09=09=09=09<&rpmhpd RPMHPD_CX>,
+=09=09=09=09=09<&rpmhpd RPMHPD_MX>;
+=09=09=09power-domain-names =3D "venus",
+=09=09=09=09=09     "vcodec0",
+=09=09=09=09=09     "cx",
+=09=09=09=09=09     "mx";
+
+=09=09=09operating-points-v2 =3D <&iris_opp_table>;
+
+=09=09=09clocks =3D <&gcc GCC_VIDEO_AXI0_CLK>,
+=09=09=09=09 <&videocc VIDEO_CC_MVS0C_CLK>,
+=09=09=09=09 <&videocc VIDEO_CC_MVS0_CLK>;
+=09=09=09clock-names =3D "iface",
+=09=09=09=09      "core",
+=09=09=09=09      "vcodec0_core";
+
+=09=09=09interconnects =3D <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE=
_ONLY
+=09=09=09=09=09 &cnoc_cfg SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
+=09=09=09=09=09<&mmss_noc MASTER_VIDEO QCOM_ICC_TAG_ALWAYS
+=09=09=09=09=09 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+=09=09=09interconnect-names =3D "cpu-cfg",
+=09=09=09=09=09     "video-mem";
+
+=09=09=09memory-region =3D <&video_mem>;
+
+=09=09=09resets =3D <&gcc GCC_VIDEO_AXI0_CLK_ARES>,
+=09=09=09=09 <&videocc VIDEO_CC_MVS0C_CLK_ARES>;
+=09=09=09reset-names =3D "bus",
+=09=09=09=09      "core";
+
+=09=09=09iommus =3D <&apps_smmu 0x1960 0>,
+=09=09=09=09 <&apps_smmu 0x1967 0>;
+
+=09=09=09dma-coherent;
+
+=09=09=09/*
+=09=09=09 * IRIS firmware is signed by vendors, only enable on
+=09=09=09 * boards where the proper signed firmware is available.
+=09=09=09 */
+=09=09=09status =3D "disabled";
+
+=09=09=09iris_opp_table: opp-table {
+=09=09=09=09compatible =3D "operating-points-v2";
+
+=09=09=09=09opp-240000000 {
+=09=09=09=09=09opp-hz =3D /bits/ 64 <240000000>;
+=09=09=09=09=09required-opps =3D <&rpmhpd_opp_svs>,
+=09=09=09=09=09=09=09<&rpmhpd_opp_svs>;
+=09=09=09=09};
+
+=09=09=09=09opp-338000000 {
+=09=09=09=09=09opp-hz =3D /bits/ 64 <338000000>;
+=09=09=09=09=09required-opps =3D <&rpmhpd_opp_svs>,
+=09=09=09=09=09=09=09<&rpmhpd_opp_svs>;
+=09=09=09=09};
+
+=09=09=09=09opp-366000000 {
+=09=09=09=09=09opp-hz =3D /bits/ 64 <366000000>;
+=09=09=09=09=09required-opps =3D <&rpmhpd_opp_svs>,
+=09=09=09=09=09=09=09<&rpmhpd_opp_svs>;
+=09=09=09=09};
+
+=09=09=09=09opp-444000000 {
+=09=09=09=09=09opp-hz =3D /bits/ 64 <444000000>;
+=09=09=09=09=09required-opps =3D <&rpmhpd_opp_svs_l1>,
+=09=09=09=09=09=09=09<&rpmhpd_opp_svs_l1>;
+=09=09=09=09};
+
+=09=09=09=09opp-552000000 {
+=09=09=09=09=09opp-hz =3D /bits/ 64 <552000000>;
+=09=09=09=09=09required-opps =3D <&rpmhpd_opp_nom>,
+=09=09=09=09=09=09=09<&rpmhpd_opp_nom>;
+=09=09=09=09};
+=09=09=09};
+=09=09};
+
 =09=09videocc: clock-controller@aaf0000 {
 =09=09=09compatible =3D "qcom,milos-videocc";
 =09=09=09reg =3D <0x0 0x0aaf0000 0x0 0x10000>;

--=20
2.53.0



