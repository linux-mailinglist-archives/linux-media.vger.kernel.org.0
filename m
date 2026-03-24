Return-Path: <linux-media+bounces-56789-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SAbpLEDywWkgYAQAu9opvQ
	(envelope-from <linux-media+bounces-56789-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 03:09:04 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 544F4300F6B
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 03:09:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9D77331065C9
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 02:01:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61AE037B010;
	Tue, 24 Mar 2026 02:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mwO6qEY0"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF87E37B41A
	for <linux-media@vger.kernel.org>; Tue, 24 Mar 2026 02:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774317714; cv=none; b=KNovQ40SmlFOHcxK2Jshf64zK6BV/2rjMSP22KXPSzSRdlzJd+19Zr6fq1lvrztiRXVq/DjLL05bOJZoxKddI4lkowa8AV20Gvso2xNbs6INN/PuNRjmSZYJHCpib8d4bxJC83PGD7HHXlknacO7M+aWnrUbxT+VCAdHsWq1aF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774317714; c=relaxed/simple;
	bh=CAjUME/AsJT8A/Pl3H28E0ZFy9j0BTNKFTGVCJ4aUUc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CZVhw7t6Kdhstyas1ZdAgQfcyiRpyLHMF6epcXZN5sKyOUs/oUxafB1r618tzN4URjM87V3EyrdJ8T9yuFAKyiYqbs6MJHSgl58ci+trxCbbivVIINnM1+kZZeCtXqNKh355jlq0SH7PCExxXa1Nl4Bx8peBgfPxPNzAzPIGrkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mwO6qEY0; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-506bcb23a78so37175351cf.3
        for <linux-media@vger.kernel.org>; Mon, 23 Mar 2026 19:01:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774317712; x=1774922512; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mGH91dl4ZX2yNvM8AEp89yLHvfpni10RrWd7dl5M2dg=;
        b=mwO6qEY0xLZlJYVrd8gNnhnK34A/U0fJKoDVPgEynyaRWFM770OV6N1N/M4FGz6guY
         70SXxUNvyy6n6p+DF5OsBWP4F4IxyWtmDBj8IEXLygeTD3ksGUX/Mlsc5mhbZcOCruuL
         poq3cpnDBF1rp/yF1KzFUzh7ybP/hI575VFYZK+soqh1wMKJzt1Z2fwhBfjhNoQZhLBT
         vZ2NJBWWlGT4cHeznOQELjYxQejvP6N2MCOgyLcupcYp/IiraEIL55hTHuBdHsJiaoIw
         Gv3G2s+BmG0TIfp9enYzEl0WsHZUJ4iB6qEXhRugBPRxTWYxGisNxil3qADF91yDdcpg
         /UtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774317712; x=1774922512;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mGH91dl4ZX2yNvM8AEp89yLHvfpni10RrWd7dl5M2dg=;
        b=nd8d0pL+ikqUytf/PMUc3cBUjRlre7lF0uWstg4HMoWUreituIzPlIwHkadT72l4Z0
         IYc2tBpSs8hN/ONmOigAPt/XYdOBkQO7AOICYh5xJq0Se9sNgJ+08YDJz/dWq+4ppedD
         YmAB85Rre2ANW6NdbjJa/LQ+bDvm8AsVBgWApOej86KGuIbbSjLDicrE+fhIIZeFYMBw
         EAFE2DI7LIWXARva5KoFi5QPGm0mhr83kX1AQ45tVFASce7kSOua3qzh1jurLHgC+RNA
         xgbK4uQs/wjF1IJDeB3Poa2QXaKIaGJRGIjZ9YFDB55SG+JdSMHAcp5j2TVL3zcpGn7q
         BIpg==
X-Forwarded-Encrypted: i=1; AJvYcCWGTvkm4sd8lgAcfrG5DOC4M5+8+R+iHON6NQ4lUQ+L93FliR5kdKMojjiBI4GlOzgpP8bwT6+qdzvGrw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxZwvsZSdScWrfZQDgCsOfFPe1jXlGtPdkIn3ktvsNBm0g7O+b8
	jOwfy81604c+kGrN1DAyanOPzZGfaFfB19M0u/KwKI+TtCcvSbucWQ+e
X-Gm-Gg: ATEYQzyKKsmFXOwe9pXi6KZOcTEAH8HA1OoWeYkwrTKAG1tF4Bwl9ZKxfCYy5s8lhyK
	/kYy8WYrqbvZsthtRX3R0nWs3OOJTtf0JZTuB3qXv8km260bcbFeyl8f4qWuIu32t3T9wm7NUag
	sgsoDu2h83ik//SGqK62/HNLXn+dJ84j11gVlJggl+F7J9daUA4Loi4ys34GMwbazQEDac71sVc
	KoHFRwNlj+s4cVQWb221IcxbHUri8a6+tLhYHtQs4KK0mFMACDvbQgQWGrm0D7SHfkBky7E2YU/
	P8JDLv/F5ZDuquw/Zg94yeuAt8qasJalv4mbITJ5jr4GY52vNR3aWHhWhoRg9PBmQKi2AwGBG+u
	Pcm5g1Kk579JL6UiT5K4DG6eg7DOuPLmLDk9YIa00bDjfVZTJu7knw44Gs8bnu4vDOe7F6gOi4I
	Ews6gwd+wvnW3JqAksg+Pij4itjw==
X-Received: by 2002:a05:622a:14cb:b0:509:d76:fe5f with SMTP id d75a77b69052e-50b373f5c94mr208736801cf.17.1774317712536;
        Mon, 23 Mar 2026 19:01:52 -0700 (PDT)
Received: from localhost ([184.144.58.243])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50b36e5b98bsm97534401cf.20.2026.03.23.19.01.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 19:01:51 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"Bryan O'Donoghue" <bod@kernel.org>,
	Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Cc: Robert Mader <robert.mader@collabora.com>,
	David Heidelberg <david@ixit.cz>,
	phone-devel@vger.kernel.org,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v11 5/7] arm64: dts: qcom: sdm670: label the camss ports instead of endpoints
Date: Mon, 23 Mar 2026 22:01:30 -0400
Message-ID: <20260324020132.8683-6-mailingradian@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260324020132.8683-1-mailingradian@gmail.com>
References: <20260324020132.8683-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,linaro.org,intel.com,linux.intel.com,vger.kernel.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[collabora.com,ixit.cz,vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-56789-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[mailingradian@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	DBL_PROHIBIT(0.00)[0.0.0.1:email];
	TAGGED_RCPT(0.00)[linux-media,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,0.0.0.2:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:email]
X-Rspamd-Queue-Id: 544F4300F6B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Endpoints cannot be pre-defined since commit dcf6fb89e6f7 ("media: qcom:
camss: remove a check for unavailable CAMSS endpoint") was applied,
probing all endpoint nodes and requiring them to have a remote. There is
no sensible remote in the SoC devicetree because camera sensors are
board-specific.

The ports are meant to be extended by a board devicetree in order to
define fully configured endpoints and connect the ports to camera
sensors. For nodes that are only meaningful if extended, labels are
usually assigned. Label these ports so they can be extended directly.

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 arch/arm64/boot/dts/qcom/sdm670.dtsi | 18 +++---------------
 1 file changed, 3 insertions(+), 15 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm670.dtsi b/arch/arm64/boot/dts/qcom/sdm670.dtsi
index 746e9deba526..fbd16b1f3455 100644
--- a/arch/arm64/boot/dts/qcom/sdm670.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm670.dtsi
@@ -1776,28 +1776,16 @@ ports {
 				#address-cells = <1>;
 				#size-cells = <0>;
 
-				port@0 {
+				camss_port0: port@0 {
 					reg = <0>;
-
-					camss_endpoint0: endpoint {
-						status = "disabled";
-					};
 				};
 
-				port@1 {
+				camss_port1: port@1 {
 					reg = <1>;
-
-					camss_endpoint1: endpoint {
-						status = "disabled";
-					};
 				};
 
-				port@2 {
+				camss_port2: port@2 {
 					reg = <2>;
-
-					camss_endpoint2: endpoint {
-						status = "disabled";
-					};
 				};
 			};
 		};
-- 
2.53.0


