Return-Path: <linux-media+bounces-57812-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4PmZDgYkzGllQQYAu9opvQ
	(envelope-from <linux-media+bounces-57812-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 21:44:06 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D28F5370BD0
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 21:44:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E0148304288F
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 19:44:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 549E33F7E65;
	Tue, 31 Mar 2026 19:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dP6gLtul"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84ACC3AA4E5
	for <linux-media@vger.kernel.org>; Tue, 31 Mar 2026 19:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774986240; cv=none; b=A95gKOrzIIw7ClZdWhtWRvn2zSOFJPAA7/uSLt6FDHWO00WWpF+LeZTwKQfYS0wzMDRSy4hPlQEFGAqCiLh++n6U2nd3hZSX+rYmcD9/fdUmsghtqLbGuNTj+6Xu6hW+Mj8oNMvMgArbQxgYcEktWesyjxLAaGCdYxHz+BcWN0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774986240; c=relaxed/simple;
	bh=CAjUME/AsJT8A/Pl3H28E0ZFy9j0BTNKFTGVCJ4aUUc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TgNdAgcRCBU7pz/Oo/bZqJ7u7LALkVhCgrGX9chK8PhyTZpXNeZZdmr7H5Q2pgF2SKkU5Hd5bcOvh3228tkiMzJw4rdF8FJ1CLH7fCGz01YCk6yC+qsV9e9dkXXlbx+fSkMf4SUuhF90mgXoNaoUUwr1U8i9g3kOcgqScrmqRKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dP6gLtul; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-8a110e06b4cso23816716d6.1
        for <linux-media@vger.kernel.org>; Tue, 31 Mar 2026 12:43:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774986237; x=1775591037; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mGH91dl4ZX2yNvM8AEp89yLHvfpni10RrWd7dl5M2dg=;
        b=dP6gLtuln/IZSDxo/kWBz41QZgJX+/7sqtBbwV2cuAq5Bf3rUGfa9RR3xsbDVDNldT
         dW9EDRPEN1z2WvWV/ONGSS+68g05llkuZYMKIZ2X7mLaC/oJ7MsqD4b2GmUQ9H5Jeb7e
         dY+F3Ceekmur1iItQPwgX62iErJBCiCTEwtzbNmz6vyte+CLQvs+KEgUBncoco1PHWlo
         rpeIT8TbW1X+T8t8ozFZGIji+pNZ+EQMb7CCXvEfeeliC1TIieJ75LQtZTl/jgg7MlEH
         EcI/au3Hz/VAIIi0GojmhUArTherpYcPeaRAdmhUeDuiz5KKm68aoIRTLFbndJpmsG6M
         vNbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774986237; x=1775591037;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mGH91dl4ZX2yNvM8AEp89yLHvfpni10RrWd7dl5M2dg=;
        b=V5dcZCpVkQdUYJzFRCJRgta9Dke9S+FmJHjJrKRzqvVidftQrTjp9jTZIjhpMGDVLZ
         OmUUX3/Fk7gjgT6omQR3BTzqhF8Xx8ct//Pcn5X856eBrAX16PtC1/CZFuZ+zalNt9dH
         mClqExkWXhJpQGwB19jvC16dIMp17KoGTZBF7pKZpN6oE0hOTiErp+tUGbyFnj4yHB3t
         Zz4HcPrKTiP78e2foFreRZyZFTxqBaD/4psKfD6rGhGwZtqS7rmiEGy4i6EQsDNA+lsv
         2PFSRtbcioc0QLikTJOXEUdjtasrEE0NwQ1PXFSQG+i7l5h60OK7MUts7lhIp783Xdi1
         IOkA==
X-Forwarded-Encrypted: i=1; AJvYcCWjk5wCSp0/obSMcAzcXB4DoGHea19dpXEDEqg8IisjFFQ3Z6pUjq6TlwUHBZ8sEjirw8dim4o+268hCg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyoLFlhQXS0PbfM8LiDK1ZuBciEXRXv1l/2qELeKmOkPkxcvhLF
	1MbKQnRax06rRH97bmgTItYjuKJpB+PcxoFs98uP+Oi2rgaC5u87yc09
X-Gm-Gg: ATEYQzy8TZcFvbakrr0noPpBTpD2y4g7fkDbVhDWxvdHvpP9xD3Ll4gF9+Pllxufycw
	uOTugEk4ASpa08BRgwXQCoZWRGhL4sLSz/g0v/z6L8KxINHl9seMUWZIMBVVyzkVLc4ttEoX69+
	PevyVMR1SjYSvZbCZwnlqWp8re89mFqle/PoBJJhNbDUmV8gUhuFzv0ekSSZa0013CaXG5X1yyG
	FAcWlnQmtFCwbJw6Yk5Go4PQ/Fc4MWSfpiy54iwXNOq8NMus8U5ODeKm15MjiusPQSFl1u9NaK8
	WHPP8qSXaSRnuN5WY8xPyZiWGfUgpwn9jEh/Thpfuo5MSjsVxHBySCCvRksU30xl6BNE6xweL9D
	YIqca1CmQ7Iok98mhTgVKLPFNYvOH+JMtsesY+LXTbXwQ2s8p5JcRFsOwGhJL+/JUCR/ThD7j6Q
	aCk2NuuxjEE+rBFGE9fllbp0nR
X-Received: by 2002:a05:6214:19c6:b0:89a:649:f88c with SMTP id 6a1803df08f44-8a43b50f422mr12425006d6.52.1774986237402;
        Tue, 31 Mar 2026 12:43:57 -0700 (PDT)
Received: from localhost ([199.7.157.124])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89ecbc9e086sm99969476d6.12.2026.03.31.12.43.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 12:43:56 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	"Bryan O'Donoghue" <bod@kernel.org>,
	Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org,
	Robert Mader <robert.mader@collabora.com>,
	David Heidelberg <david@ixit.cz>,
	phone-devel@vger.kernel.org,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v12 1/3] arm64: dts: qcom: sdm670: label the camss ports instead of endpoints
Date: Tue, 31 Mar 2026 15:44:35 -0400
Message-ID: <20260331194437.41041-2-mailingradian@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260331194437.41041-1-mailingradian@gmail.com>
References: <20260331194437.41041-1-mailingradian@gmail.com>
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
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,linaro.org,intel.com,linux.intel.com,vger.kernel.org,collabora.com,ixit.cz];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-57812-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[mailingradian@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	DBL_PROHIBIT(0.00)[0.0.0.2:email];
	TAGGED_RCPT(0.00)[linux-media,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,linaro.org:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,0.0.0.1:email]
X-Rspamd-Queue-Id: D28F5370BD0
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


