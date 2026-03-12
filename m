Return-Path: <linux-media+bounces-55518-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4HRSISr1smmLRAAAu9opvQ
	(envelope-from <linux-media+bounces-55518-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2026 18:17:30 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E921B2767AA
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2026 18:17:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D8F5930382B8
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2026 17:16:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 850A13F7A89;
	Thu, 12 Mar 2026 17:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="Wig5FNg4"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-106118.protonmail.ch (mail-106118.protonmail.ch [79.135.106.118])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED4E13C7E1A
	for <linux-media@vger.kernel.org>; Thu, 12 Mar 2026 17:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.118
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773335794; cv=none; b=mwHruUPTFaZzs5ICZF3OCr+YeRI2Jjg3l/BV4gczhVyB1FMXGNwjst2Ng+RV/c0/FQR7ADPDqODrgV+BjvFdn+7KD3K6sbFaWhPsrQY9ODbt9/Rjg3qbrRt4kQl4ph+OEogJvUgGWNaF6okRMztxJth+oZx63VC4i+G1oh7bN3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773335794; c=relaxed/simple;
	bh=lcD0ZteKT5GGJo1t9L6bhlmJGNVueQby9aT0dEX2fx8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bo2t72YfUtqdtfMOEYQLa7W+oSpchyPSEpxmpc26tOpTyPQ/nINhwy4k0US9JNal1oyKiXOOZ6AVuLIfiEH67XIv0FqDOBLMPSoS9t3+K7bw7nhz0gZg/luIJYo6/mhaFUDB+Z8MSYrNBH8L4543oPF9r8uh5SpnMs6DxOe8jUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=Wig5FNg4; arc=none smtp.client-ip=79.135.106.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1773335788; x=1773594988;
	bh=n7d0VsbBwYG6FHREX5HIxATigiqtht2U3hbiXwAHuOc=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=Wig5FNg4mARli+IRk83KuuSdFkGsQ5fY/sOM9K15//2nnmiFZdRdd788Xn6O33hxu
	 Y+pLx9un/qKnd9alJe8ro6D3G1hoCVL1WXH6UIJOQrckVuhO8XE92efYF1PxGOObaT
	 tnJ1LtiKvLgnG9SjR+Zfb262cYlHjszaBZMllH9kvIjflxCJ6BHgu/Hl2SUJ32TqD1
	 HkbSqZ4VjNH9f+XCO2y4wESek+p5ca08zSfAyfWoA6gA3vRR5WI4DNcsEUyBXFZK+u
	 kl78Eh66L9W1kZ8z7KursRKSsEljHQdIqVotDXmlbIb5kHNJriclO/puAu3p7r9GUI
	 Fn//VpuFDqY/Q==
Date: Thu, 12 Mar 2026 17:16:24 +0000
To: Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Ben Kao <ben.kao@intel.com>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, Alexander Koskovich <akoskovich@pm.me>, Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 2/3] media: dt-bindings: ovti,ov8856: Allow orientation & rotation props
Message-ID: <20260312-ov8856-v4l2-props-v3-2-3771ab40a4c0@pm.me>
In-Reply-To: <20260312-ov8856-v4l2-props-v3-0-3771ab40a4c0@pm.me>
References: <20260312-ov8856-v4l2-props-v3-0-3771ab40a4c0@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: 69488b2c521ee5f71a8952091e04ad3de31a3888
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55518-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akoskovich@pm.me,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[pm.me:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt,samsung];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,pm.me:dkim,pm.me:email,pm.me:mid,qualcomm.com:email]
X-Rspamd-Queue-Id: E921B2767AA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Allow the orientation and rotation properties from video-interface-devices
to be specified. The sensor can be front or rear facing and can be mounted
at any rotation.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
---
 Documentation/devicetree/bindings/media/i2c/ovti,ov8856.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov8856.yaml b=
/Documentation/devicetree/bindings/media/i2c/ovti,ov8856.yaml
index fa71f24823f2..d0f577363f93 100644
--- a/Documentation/devicetree/bindings/media/i2c/ovti,ov8856.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov8856.yaml
@@ -18,6 +18,9 @@ description: |-
   through I2C and two-wire SCCB. The sensor output is available via CSI-2
   serial data output (up to 4-lane).
=20
+allOf:
+  - $ref: /schemas/media/video-interface-devices.yaml#
+
 properties:
   compatible:
     const: ovti,ov8856
@@ -57,6 +60,9 @@ properties:
       This corresponds to the hardware pin XSHUTDOWN which is physically
       active low.
=20
+  orientation: true
+  rotation: true
+
   port:
     $ref: /schemas/graph.yaml#/$defs/port-base
     additionalProperties: false

--=20
2.53.0



