Return-Path: <linux-media+bounces-52483-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iLk8IpaqimmbMwAAu9opvQ
	(envelope-from <linux-media+bounces-52483-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 10 Feb 2026 04:48:38 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E01E9116CC4
	for <lists+linux-media@lfdr.de>; Tue, 10 Feb 2026 04:48:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D2957300EF82
	for <lists+linux-media@lfdr.de>; Tue, 10 Feb 2026 03:48:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EEB428980F;
	Tue, 10 Feb 2026 03:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kDJn9C5k"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A22FF2F851
	for <linux-media@vger.kernel.org>; Tue, 10 Feb 2026 03:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770695312; cv=none; b=t8LleLlgvhghPfAYEYPhKy1wgxwK3fyzyeDE9t0rN99u7r/x5+FO9YXtVGd5NOSP6hn/qQ11wIWDGHF/cZ628iKnYhmVvQSs+kKYM8A6yXfLfGmtDOsnm0p1muld66CxMQtdSuuELTVj4kQJ4FsABGjWfuYsJAIf+HLzQ4KyUUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770695312; c=relaxed/simple;
	bh=grerL1X8PEltlDn9bZfsY+C9u7ePqpUQ4WeAgoThNzU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sfnTIHyrZyhfSj/QxuwL8NBCW/HSQaT19F7A76EBU3Xu4oWD+7Wl7YWVLYuKkdnnlnEDxLmgd6qlj1og8J4wZG3dqbIdEWXi4WwPkx5c26G5g6TAeYQBalT+nHuiSyWexvfZkOcR/LO9b4wxQ13fi4IbKSmzy4zH/R6DGC22QHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kDJn9C5k; arc=none smtp.client-ip=209.85.167.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-460f3f9fdb1so3712694b6e.0
        for <linux-media@vger.kernel.org>; Mon, 09 Feb 2026 19:48:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770695310; x=1771300110; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oHuCRRLW/wv5+lOhXnCHIBJ8PNubsec4dQmyfsYfdCc=;
        b=kDJn9C5kGGORzPT9q1B1azhNbw2KwtfrHBqd25iQj7POr3CZRFT3J9m38sfbHQi4NJ
         RWIKOI5kVjKFanHuI3K8gQ8Fo0vXkYwT5W/FB1TR0/sZicJtWk0tV1JaH50Zf6W97Wrb
         bhN5V8tws6eDma+fXhc0i3FjflBG7EC31oW+c88yaIuejVr+Kve2YzM9IOv6DGj+wLuB
         o6KBqoAPP+P19m+InBvj4S/BfAXaGilUsPU+pJgLpk2G6tDukZE8FsNgm1qOInmWFVnt
         wI2qF5S+N/ZxKZSVJ8ugE5jwgkna13YDAvSc84vpKaPyf1Z0TRW83uypxUm2JCBfD5QW
         3PFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770695310; x=1771300110;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oHuCRRLW/wv5+lOhXnCHIBJ8PNubsec4dQmyfsYfdCc=;
        b=c2qASdRbai0F1zedbhxqhgLacP3MVAKivz/fbJUfLKPWxhqen47AOp4MVmRohKUCut
         fuqO3SCb4A7Vd0f3BOsRZfSYAVHzdrUOnkdkTkIIjmLcLZY6LlloDWaL1ccUPOwCOdpU
         YnDuwYipdgJJA+toC71YTZCxEXmXWEaK/CuHaiBBTkSROQqBx0PXSiVNbayVVICLX85y
         wNMO08NLC4Zlex5bOQYqshfoOWEzaBwXX+h6rEfcQWVVZIdC08AjEwzwShP4RZNPigWD
         HqZ+ah2qoymUi8wN1gYu2dJ2DXks7Mkskqc482qNXPxwdqK9Caq1MJby2NDMij5hifyW
         BAfQ==
X-Forwarded-Encrypted: i=1; AJvYcCX8Ny2MW80SVi8H9OpJv601cfuYXh40cDtxCyaXccR1tWOpgxWax9H+fRMZGIHLLZBbCbj7nK8hnofXXQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzMzMCQ44eR2Ol82P42NUZ6MTAqgJLDaFZJNhsZmlwuF7VMEtnU
	gyo2efkrmXky93/JfkQmcYBlfPMyFe8UCXNBukXFtlMBprPqflgb7cyoBFvZmA==
X-Gm-Gg: AZuq6aKjsSzjpMXFW33JqNpPHmVErMrtgP0CghwxM7KTeQeHOvpL6Aygrd8Uki0tC2d
	V6Zb0IJt+mjIShBvL27SUGHrQnFgC+Yto4HA6MimXfiY7vyN2eJ1oOqFSgaUdOvexjejo7egOml
	Uaq8H/WC7UdojyA376g2JpmFYMPNeQHBRch1PuHAf4+h1NZDIU/oiUYdegOo2GHqIHaq3XwIpia
	fb5025yoqOQjkKivpmIDruHGnM3dLAeAuCtbzrAgaw2WXYcOde/uifXU//q0Ivo/08V39PDoJmf
	Qn1PHZP1jofQTtsHAtMqEewiIRMiKWYjQcfu8K7hoCdFe9oM78OslqLt37+hnvfrbKwRw85U/uA
	QY5Iwt7x+rwgrTRWXtiJjpQ9EQDL8Mfpnbx80d89f70IJrFwbZaB49SIrEP0A6sUIsEW6+17kal
	zZyWYSZ1WNdRiQg9BFKdwUpiGmJtzJkWkECojYdjTZdPdXhMDiGKp+5bATKqil4o4YrjudbbzDk
	jaLewa+np0gzO/W4c4GwxI85g==
X-Received: by 2002:a05:6214:c62:b0:894:6540:9112 with SMTP id 6a1803df08f44-8970d9da94emr11081586d6.33.1770688893108;
        Mon, 09 Feb 2026 18:01:33 -0800 (PST)
Received: from localhost (bras-base-toroon21-grc-75-184-144-58-243.dsl.bell.ca. [184.144.58.243])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8caf9ee8593sm926749385a.36.2026.02.09.18.01.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 18:01:32 -0800 (PST)
From: Richard Acayan <mailingradian@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
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
Subject: [PATCH v8 1/7] dt-bindings: media: qcom,sdm670-camss: Remove clock-lanes property
Date: Mon,  9 Feb 2026 21:02:00 -0500
Message-ID: <20260210020207.10246-2-mailingradian@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260210020207.10246-1-mailingradian@gmail.com>
References: <20260210020207.10246-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,linaro.org,intel.com,linux.intel.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-52483-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[collabora.com,ixit.cz,vger.kernel.org,gmail.com];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	FROM_NEQ_ENVFROM(0.00)[mailingradian@gmail.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: E01E9116CC4
X-Rspamd-Action: no action

The clock-lanes property has no effect on the hardware configuration, as
of 336136e197e2 ("media: dt-bindings: media: camss: Remove clock-lane
property"). Remove the clock-lanes property.

Suggested-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Link: https://lore.kernel.org/r/bbf0dcd9-d0f2-49a6-a2f2-6ec9376f2f59@linaro.org
Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 .../bindings/media/qcom,sdm670-camss.yaml           | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml
index 35c40fe22376..78b9e03da06b 100644
--- a/Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml
@@ -116,15 +116,11 @@ properties:
             unevaluatedProperties: false
 
             properties:
-              clock-lanes:
-                maxItems: 1
-
               data-lanes:
                 minItems: 1
                 maxItems: 4
 
             required:
-              - clock-lanes
               - data-lanes
 
       port@1:
@@ -139,15 +135,11 @@ properties:
             unevaluatedProperties: false
 
             properties:
-              clock-lanes:
-                maxItems: 1
-
               data-lanes:
                 minItems: 1
                 maxItems: 4
 
             required:
-              - clock-lanes
               - data-lanes
 
       port@2:
@@ -162,15 +154,11 @@ properties:
             unevaluatedProperties: false
 
             properties:
-              clock-lanes:
-                maxItems: 1
-
               data-lanes:
                 minItems: 1
                 maxItems: 4
 
             required:
-              - clock-lanes
               - data-lanes
 
 required:
@@ -308,7 +296,6 @@ examples:
                     reg = <0>;
 
                     csiphy_ep0: endpoint {
-                        clock-lanes = <7>;
                         data-lanes = <0 1 2 3>;
                         remote-endpoint = <&front_sensor_ep>;
                     };
-- 
2.53.0


