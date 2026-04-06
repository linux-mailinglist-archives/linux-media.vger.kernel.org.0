Return-Path: <linux-media+bounces-58091-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sBKHKQCJ02lEiwcAu9opvQ
	(envelope-from <linux-media+bounces-58091-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 06 Apr 2026 12:20:48 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 98E443A2C83
	for <lists+linux-media@lfdr.de>; Mon, 06 Apr 2026 12:20:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A60AA300B9F4
	for <lists+linux-media@lfdr.de>; Mon,  6 Apr 2026 10:20:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F46D323417;
	Mon,  6 Apr 2026 10:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="dsRm4+XZ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-244116.protonmail.ch (mail-244116.protonmail.ch [109.224.244.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49CA4329E40
	for <linux-media@vger.kernel.org>; Mon,  6 Apr 2026 10:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775470798; cv=none; b=DgTJ8Aa2eg/NnHpbSplILbnZ6X5X9AexsMLLszLVTu+CHTz53qkOSAHBguthhPSuDiLUGqsrHEpni8z+YvKxPgaHlpRsRElOAIv8NsRaw/R4hh0dBfLX9qTTVg0OzLqYMtdR6JZR6MKR6w71Y5PHnSXWQ/1WxDcpg1eRlxpOjp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775470798; c=relaxed/simple;
	bh=EAOndGzg5SeHnZrOPq2utAwld0EaSk59a8CbrPbEzLk=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TPfN2bU3rincNNh5gUJNKEPhScucSPt4z+UUr3FvIwUq71wknAdmrbxv7Fod0qyx1UIXY6vmkbkIArnfz3OjRPDdLydVkUemWLHf+gu9mRFxvlr0klxPiIWuD2IuP/mcu98S/jv7G2PHi6dIUZj6MPalEwsxCPsqPYjLpykndJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=dsRm4+XZ; arc=none smtp.client-ip=109.224.244.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1775470795; x=1775729995;
	bh=2FDa4FbKQRT0D69gXEO+/YnhJ9jnvzn9vQZ7iyZ7f+I=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=dsRm4+XZwDA67L6jfP3v9+XO2W6Vzhfuccrck/elicBjA9gWneMqA7py6tnkqqX4e
	 Zr0ekKrrAxgTOlNB50r7gfvfDQfi4kuQJ28QECJRgbdha/oup3yeMtr8rQGM5Ul7Sd
	 p5Z9/YnA4t4qLQi7h8FKz0PTGngkKBA8Z5b+I/L4LR9F3zpHD4Dq7c158x68vddBoi
	 y/9UAidhM2JbQBhSjhDfXvRxsVugaLjVLkk7ip0t0udJE8LPz5PjG6PD9UI7wyoK4o
	 3ZrEirdzIIam42z7h1zERPe3dZzA1gB7aXJUpslgi67vL3b/xovJz7kohrb45Y5DnY
	 i4sqRTbP2EDFA==
Date: Mon, 06 Apr 2026 10:19:50 +0000
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>, Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: Luca Weiss <luca.weiss@fairphone.com>, linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Koskovich <akoskovich@pm.me>
Subject: [PATCH 3/3] arm64: dts: qcom: milos: Add Iris VPU v2.0
Message-ID: <20260406-milos-iris-v1-3-17ed0167ba6f@pm.me>
In-Reply-To: <20260406-milos-iris-v1-0-17ed0167ba6f@pm.me>
References: <20260406-milos-iris-v1-0-17ed0167ba6f@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: 166f561c1a48f6cef99ff39d402798d53e5c3291
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
	TAGGED_FROM(0.00)[bounces-58091-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,pm.me:dkim,pm.me:email,pm.me:mid]
X-Rspamd-Queue-Id: 98E443A2C83
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add devicetree nodes for the Iris codec (VPU 2.0) found on the Milos
platform.

Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
---
 arch/arm64/boot/dts/qcom/milos.dtsi | 85 +++++++++++++++++++++++++++++++++=
++++
 1 file changed, 85 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/milos.dtsi b/arch/arm64/boot/dts/qcom=
/milos.dtsi
index e1a51d43943f..07aa398c9695 100644
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
@@ -1517,6 +1518,90 @@ usb_1_dwc3_hs: endpoint {
 =09=09=09};
 =09=09};
=20
+=09=09iris: video-codec@aa00000 {
+=09=09=09compatible =3D "qcom,milos-iris";
+=09=09=09reg =3D <0 0x0aa00000 0 0xf0000>;
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
+=09=09=09=09=09=09=09<&rpmhpd_opp_low_svs>;
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
+=09=09=09=09=09=09=09<&rpmhpd_opp_svs_l1>;
+=09=09=09=09};
+
+=09=09=09=09opp-444000000 {
+=09=09=09=09=09opp-hz =3D /bits/ 64 <444000000>;
+=09=09=09=09=09required-opps =3D <&rpmhpd_opp_nom>,
+=09=09=09=09=09=09=09<&rpmhpd_opp_nom>;
+=09=09=09=09};
+
+=09=09=09=09opp-552000000 {
+=09=09=09=09=09opp-hz =3D /bits/ 64 <552000000>;
+=09=09=09=09=09required-opps =3D <&rpmhpd_opp_turbo>,
+=09=09=09=09=09=09=09<&rpmhpd_opp_turbo>;
+=09=09=09=09};
+=09=09=09};
+=09=09};
+
 =09=09videocc: clock-controller@aaf0000 {
 =09=09=09compatible =3D "qcom,milos-videocc";
 =09=09=09reg =3D <0x0 0x0aaf0000 0x0 0x10000>;

--=20
2.53.0



