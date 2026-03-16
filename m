Return-Path: <linux-media+bounces-55827-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SLjYHJ5Wt2lyQAEAu9opvQ
	(envelope-from <linux-media+bounces-55827-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 02:02:22 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F2A829333E
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 02:02:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0662A30065D8
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 01:02:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D12DC23F417;
	Mon, 16 Mar 2026 01:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kMDspcoJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9475E222582
	for <linux-media@vger.kernel.org>; Mon, 16 Mar 2026 01:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773622924; cv=none; b=hurIZRyMqvkRANqv3Zkn/QE8kmBs3vrfo1UkNJFAKDipLg+rJ1guL/YiIfaWGJmH5A4Hl+sNrSZHgq49rdgFfbHEDIKEfDQx5ewaTbrdq8f7eYOFcSWtGRqUPTKH+8ttRh2RmC7n2sBXTHn2WYIePxdvcWYqKaRgOq+bpQK1+i0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773622924; c=relaxed/simple;
	bh=oAZeYp7NfN4Ch40Jvo2x/a/56aus/5DjsiPO86eV1KA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FnIfWQD0Wt5LxowWbiEodzZuiQN9OTG2lTNEXilh8j7m0o3J0Dbh08Q2foIOyDQYDjfDqRT/adr5wAxEjsfufrV+PMBym+2jRmxHnKkNkKWS+fiOwAfseoKOpHL1WjnuuXeMVoe7+7QV9BuPeCp18fDjwEbz4WfbpDjkSYqcTY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kMDspcoJ; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4852afd42ceso35105265e9.2
        for <linux-media@vger.kernel.org>; Sun, 15 Mar 2026 18:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773622921; x=1774227721; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d4EnNcwv+9HLoV1oCcE9hg7Uth97xpmXg0NPNWImA9A=;
        b=kMDspcoJmTnoSXy/ekmFJb1wCA5uawOKEIDIb2j27H7XIZ/ZyxBx9Y7AJV+FHN13hg
         bH6R9YW7GQtKhS78yga0LBtbtiXZdFFpc1/04JFcM5lbP8tdnbJlwHFQeuSuHvNzhuNO
         EoFmc1i15XZ59rDMd71ayHZQG6RZMgcExQm26lGG3SXxYMnGjRr7X44ja16RLmrtHhsw
         /l4X8ar+V/q3xYkb0xOsACjGb3+WOU8eUMNi3rlUXLPb0dDNdnhCDBwRCPuPmG6hxDjA
         dOZATfap6sakpCbHmv/MMM5WEztG3znqt61qS/sl4Hu/WcmPn4EBYH4av3AH2GJ3fHLO
         cvUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773622921; x=1774227721;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=d4EnNcwv+9HLoV1oCcE9hg7Uth97xpmXg0NPNWImA9A=;
        b=Vgz6GSqaHquqyRQSJPn1WwFumohe7EY97rCRoZr2TCjAMRAePaAc4miw8Ehecy5jIB
         mpKJ7sCJvHqOS4LTkW/1ruLvMc1obMT4wm0NVryPTK/0Rpmv3ZhN1rjhDiW368NwuAPz
         jzia9ZSlpJRoiORLYMQFfKSa6MvpoROjVPnwTvrVVL5B551CNbv5kwuO4sfrqQnVVvdh
         s2N4LcMEfOaEKrrjKgrKpFyRNP+Bk3mxdusLpzmRf5h1ChVfXIA0omanKWTTDM09svF5
         YI+9CtC8z/gDoXfFY9HHXqFU6hs7OdnTIat6p+AZrOQVu9ZGS4/11jOJdV5HG+eXeVjU
         LAgA==
X-Forwarded-Encrypted: i=1; AJvYcCVh+HXyH6cwMq/sA8thdffxZiE6EvT9S9JaqitmcC8Snd8Yc2fwOIYhDF1QcgqabSKJG1ORu7yVVH6ySw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8K9D3HY5lTI1Fsbf4swytj3uF2PlykVJ/UNsgZ49cjH1BNbr4
	xN5qguWg7Nhn7kTUEjnTpr7SbNaqACJ3Gue6BjQoBp9WYZrx6Ouq4dCQr6PAZEUJzVY=
X-Gm-Gg: ATEYQzyj7756fd2sIEnWPJTEJB/CfNN0q5eZEQZ7i111I1E56QD/ICrmEdlN7y9KV3Z
	fWcqeiiy49wxxc6AViFI8yuBOrHk9HUGDVWTYbOKDWrq5I+qIlljhnOyZb7GqQ0PellD9Ot5HgF
	1fSnSe5xcwkrp/Tbcpr1+ijNxwn0kCpO9Y2Wtr/yx/D4acJVHQwiFNIKfAWKJu0Rx6L/iDasVR9
	+vpZ1q+1ek0F17GHmH95IoW2ijp2GdvWaytBUcl5oxg+jLiUOAnA8rHF765NBFWR2cyBbJj4j/G
	ezwzTfwXlOpj5b2XvkUrE2L3RrNJOb3j7oVp6Y8DmU4EuikXrsuyuvzsfp3A7bUHKg2GKlQoeEv
	J5VckyPOOxgLaw4aXmtRy5EtI+xgMJ/tYlzlYdBf3SgH2n4MwmMHx+PNo1mOjkkstA7qC692EJR
	DSECwdL5uup3eNtaAhcPNskhSi/eXVRYRHRoY=
X-Received: by 2002:a05:6000:4014:b0:439:5c75:dc08 with SMTP id ffacd0b85a97d-43a04d83f48mr19743351f8f.10.1773622920856;
        Sun, 15 Mar 2026 18:02:00 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.190.215])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe228986sm34729700f8f.35.2026.03.15.18.01.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2026 18:01:59 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Mon, 16 Mar 2026 01:02:01 +0000
Subject: [PATCH v10 1/7] dt-bindings: media: qcom,x1e80100-camss: Add
 simple-mfd compatible
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v10-1-fdfe984fe941@linaro.org>
References: <20260316-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v10-0-fdfe984fe941@linaro.org>
In-Reply-To: <20260316-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v10-0-fdfe984fe941@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>, 
 Todor Tomov <todor.too@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Bryan O'Donoghue <bod@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1254;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=oAZeYp7NfN4Ch40Jvo2x/a/56aus/5DjsiPO86eV1KA=;
 b=kA0DAAoBInE7s6GNyDoByyZiAGm3VoyiZNseu9UYoYC6eu33PYlElYW9JtR6Z9+S+cofJeDRy
 IkCMwQAAQoAHRYhBOaT+yqro23hF6tvtCJxO7Ohjcg6BQJpt1aMAAoJECJxO7Ohjcg6qWsP/RgS
 BHzfWTj1wcBuU+6PV3S0jVOIvoI86H6pdK+pjyAky1grBTPY26KE3LPamd3au9EZGClSU7SCuAI
 VcSaNrxpPGBbO2vZPWUZHgAsTd/DyHvkjUAKajPx4/SBy5gtbAzOapGesptckgbfdv5hLv/nFir
 CNIQlbH3UJnxbZUjVyRC08fn1HNlL+5Aqtbh0wYJTqo+mX85OgIyZL/qSSWqYej5P1fQvMtZNIU
 BR1gycYTalGd7hZp3toIe+UEsNexPfdF5h7RfC6MthoONUIDKbribA25cJFrFsieJAmlARWfiGh
 fAqsDlvgoM7Jdrkgt30UfP244qrOvON5N9VfBMoc2xi0EGkzKlBCJzaUHAhsN7OxLyf/zjLLimy
 ukbYdDQv0TQyC32y195OjR9pO5s7oIIuw0df2vKVSkrs+zS/5AxkG74hxRAvw6X+S2boht11wbT
 YNSFibbBS0IiMS0li/8tdwN0nngNmbnODico41Ls/GN5VpsD0Ad0j3GbqXrzp7gibQsEhEJnheK
 bxkSZxEioXkdEdCrvBfaLkAun4KhEMHP47SWOFqHGy1AjB93OHhBv7dHOUaMwIWA6mcbOqJnytp
 FXQ/csnLAM7c5JamgRhkWAEvJsOQUXN7tGZXiV6PY/3dbntLJiT6NmLjzKjUUozIH3xHy83f2a+
 KjRQP
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-55827-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,baylibre.com,gmail.com,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,linaro.org:email,linaro.org:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,acb7000:email]
X-Rspamd-Queue-Id: 1F2A829333E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add "simple-mfd" as a second compatible string to allow child nodes
within the CAMSS block to probe as individual platform devices.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
index 2d1662ef522b7..b5654ef71bd89 100644
--- a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
@@ -14,7 +14,11 @@ description:
 
 properties:
   compatible:
-    const: qcom,x1e80100-camss
+    oneOf:
+      - const: qcom,x1e80100-camss
+      - items:
+          - const: qcom,x1e80100-camss
+          - const: simple-mfd
 
   reg:
     maxItems: 17
@@ -191,7 +195,7 @@ examples:
         #size-cells = <2>;
 
         camss: isp@acb7000 {
-            compatible = "qcom,x1e80100-camss";
+            compatible = "qcom,x1e80100-camss", "simple-mfd";
 
             reg = <0 0x0acb7000 0 0x2000>,
                   <0 0x0acb9000 0 0x2000>,

-- 
2.52.0


