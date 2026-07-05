Return-Path: <linux-media+bounces-66626-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id sIX2IuEtSmpr/AAAu9opvQ
	(envelope-from <linux-media+bounces-66626-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 05 Jul 2026 12:11:45 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CC3DD709B36
	for <lists+linux-media@lfdr.de>; Sun, 05 Jul 2026 12:11:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=pm.me header.s=protonmail3 header.b=RUuC69ju;
	dmarc=pass (policy=quarantine) header.from=pm.me;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66626-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66626-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 871E93034DC0
	for <lists+linux-media@lfdr.de>; Sun,  5 Jul 2026 10:10:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9769391E72;
	Sun,  5 Jul 2026 10:10:50 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CABC1367B94;
	Sun,  5 Jul 2026 10:10:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783246250; cv=none; b=osWl86GqMhkdxA8V51w5WC8hLMW05vZy620MVLgeO6kP3gvjl/p+ypa5rIhoetX4tzIVG3eb2DE3oMsX12q+0cVkpw11EyG8EBYYm53alFvlhTMlOy5TIB3v8iaMA6nKG93P/goTiB6ihBY8bPtFc+oW3FJkHy6wR5XRnmxr7Co=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783246250; c=relaxed/simple;
	bh=fkVUfMl2OP5FqZEeUHk8kmXxpc9Qy6TEWizcllfQXA8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=J6ruyKORz0/Frvh6dw83Yf6oxrPs2TyWjyTE7GQLXv58+Ou1lR5iNDxSEfeK4rKoA6F+Lsqc5BEhpC8xuHhlm/qEuSk/0k7nc8jvWGxlmf7JIBuOlnxWB/eXSzZrvac8HaN2GvGqAMxnu20IyciyzayxWp4rlL5Ggw256OzejHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=RUuC69ju; arc=none smtp.client-ip=185.70.43.16
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1783246246; x=1783505446;
	bh=l30IVtLlztHLbVWWCNa71bHo8I21Tiqk6JX+hxBQZ84=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=RUuC69juTLM+uFOQSNP+7V2LVVzMkELIeZPE7X9SnGKWrd1yeGmKbpulK+hPHvf9u
	 LGMgc5fywgw8ckGahemnWdxPd9d4dzL/aQwi9fQq+2A+obw2ZtvMwn6g2a72HgaY4y
	 XF/bAopn18n84dkTJPSFmOJAmF3ZO3NfHz6TXdtLxKL9j9KDvUW1SvgwBNP+2BNvf7
	 fxjv361OEJ8alIHj+0eJBcBzHlZbXRGHoBcM81r/x3k4iKtHCkHH4rtTn8vIL1jFxv
	 iGj4ZualNyoooCv4kuF8vDzDv+Lp3F97N4ziKnpCIDofyQG8zf0LTjz3D4sXU/2AfB
	 SlN48LTVjyajw==
Date: Sun, 05 Jul 2026 10:10:43 +0000
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>, Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Alexander Koskovich <akoskovich@pm.me>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 3/3] arm64: dts: qcom: milos: Add Iris VPU v2.0
Message-ID: <20260705-milos-iris-v3-3-8c1353530f24@pm.me>
In-Reply-To: <20260705-milos-iris-v3-0-8c1353530f24@pm.me>
References: <20260705-milos-iris-v3-0-8c1353530f24@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: f7b94ba0fa5599cdf05390f742708b44db4405e5
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[pm.me,quarantine];
	R_DKIM_ALLOW(-0.20)[pm.me:s=protonmail3];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-66626-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:akoskovich@pm.me,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[akoskovich@pm.me,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akoskovich@pm.me,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[pm.me:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,pm.me:from_mime,pm.me:email,pm.me:mid,pm.me:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CC3DD709B36

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
index 64c493b82733..cf361476a859 100644
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
@@ -1883,6 +1884,90 @@ usb_1_dwc3_hs: endpoint {
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
+=09=09=09=09=09required-opps =3D <&rpmhpd_opp_low_svs>,
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
+=09=09=09=09=09required-opps =3D <&rpmhpd_opp_svs_l1>,
+=09=09=09=09=09=09=09<&rpmhpd_opp_svs>;
+=09=09=09=09};
+
+=09=09=09=09opp-444000000 {
+=09=09=09=09=09opp-hz =3D /bits/ 64 <444000000>;
+=09=09=09=09=09required-opps =3D <&rpmhpd_opp_nom>,
+=09=09=09=09=09=09=09<&rpmhpd_opp_svs_l1>;
+=09=09=09=09};
+
+=09=09=09=09opp-552000000 {
+=09=09=09=09=09opp-hz =3D /bits/ 64 <552000000>;
+=09=09=09=09=09required-opps =3D <&rpmhpd_opp_turbo>,
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



