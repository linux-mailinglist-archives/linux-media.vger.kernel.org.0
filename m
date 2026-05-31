Return-Path: <linux-media+bounces-63174-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GIYRI43/G2o3IQkAu9opvQ
	(envelope-from <linux-media+bounces-63174-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 31 May 2026 11:29:49 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AAA7615610
	for <lists+linux-media@lfdr.de>; Sun, 31 May 2026 11:29:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A677A30060A2
	for <lists+linux-media@lfdr.de>; Sun, 31 May 2026 09:29:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 504E234D93B;
	Sun, 31 May 2026 09:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ORENTZ64"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89A95349CD6
	for <linux-media@vger.kernel.org>; Sun, 31 May 2026 09:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780219779; cv=none; b=h0pwh+R+Xh0wOZJN+t1CG5jlr9pPud6PQadfH/8lWjdwAOBG7IjgGNAr9NhZ669jSGKflTQM9ENHzi22Wfny90KaaJRnpL5F06J5ApCNdYHwqQWpzyldYadkpek/V9OeS8wcBjk9A7YsALAZCxsr/vl2TRjqrMtI+c0IqNcasac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780219779; c=relaxed/simple;
	bh=er0ubEXqc5SkXg9dCN53ES8cWYd71tCmkqSVLbDGaBk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HrHayibRgA5uUVTS8mkHNxFHRIs2+WApfOzTdpblVNPGs8oJcJZvqHSU1hABgWFpf2z44Nd1n629ISfKRlEsmZCD0rvJKORjbHZLn9XMDKp2Qmn0nDUZv2aP6g/sfEkyZ4Y5LY0W2gXBe2ksjZk+VWnGZFzehifRMApiIvlikow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ORENTZ64; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-45eea68dd6fso1536403f8f.2
        for <linux-media@vger.kernel.org>; Sun, 31 May 2026 02:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780219777; x=1780824577; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Iew4XenhKOLgBtnmmbivz3Klyz0GTJLb8N3yaWb7V4k=;
        b=ORENTZ64LfIYZyuQm1fJWTlwqVlD9VAVGS8j8uTNWNbkqm1AMPHvUngXLIvN186Nn/
         5R0PxbHTi3u1J02rH2Cf3UWHWqQE9YPWRs2yF7srzOY50LnVC01CCbgz8zgDLtmXzIsH
         lEvkM8nzh9MnWiqHh9ka1W0R6/M5FAU8AbQHL4QkJCDqnURosUGmYItw7O0Brpd7RT/5
         U0TJH6srB0vWBlX/7vYg8QRxzJOCNIJyaGkObY6qMAlqpCbife2d4A0TfpP8aT8h0OXD
         /ykzD1Xyc6krxZG7+/UPyzfbqNpcYweKI4rM9Fjlqq29Mqft+4178EfiT+JPR7FlGoo2
         mbTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780219777; x=1780824577;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Iew4XenhKOLgBtnmmbivz3Klyz0GTJLb8N3yaWb7V4k=;
        b=tXwNd57Yiwo3dqrH4tm+EQ5kFyz+Kdgb8SUpInMTJ3Bfsh0cp3yQo6+Xn86C80X+VH
         H7zH1rlm/LcQSbmiuAiksrIxcsS94kEoiaxHqoJR5bYBw5GBhBZrHBmFxfWQ9rhaAviV
         Y9yLbUyqnF3fInFj6o5rkhRNTmJdpTpfbdKJ+vI9YzGNRJ7ThRPg3cBgEXb0N5dmYiVZ
         u/v5mTZRUTcDS/riMXozK5k0tD8CoJtpq9Bj5NAp1VLacepBO6biqRXrcjL8k/ECfAR8
         6Cd50csoawFR7CeFfAMfaO61knOni/yCj0jD53P/YjxQnBEYmIYsDfKq9VQZfLiKf43V
         oIvw==
X-Gm-Message-State: AOJu0Yx81X+ABFHHVHc0RMxyQPt02ia80aQwqgLfbz2V4MmaehDK0dsr
	fHfcQRkcg0Vu1izTtc9g0vHIH44SEETk+DdkQ+mEUoU/HTtAXtl4nc70
X-Gm-Gg: Acq92OHFePOZtDz/Z8VK5G7+dtPWrtFv6DJooECSUkVu9NIq85iIDbdKSEI7X4klAuF
	zX5F91/0uwstuMxyX2V6MoIygnuzs+iygKRJMclu5Uh9AY+jo3uvoItA3lhOM32dqqKGYWi1zDa
	WrBK7bNutBRx8tNf4jNHknTmeecwxrggnoPfKDz+2KP69r/9F4MBrrVW4TziDs9ErF7NuP9DMYH
	8G9QPgtr0QoHnUb1Ms4d0Q11zyZjo2tt8Z7L0GL+/XoNvrOZjVyLeg+wJUW/8u/GQQOQp2C9ofR
	TyOQsNhvZhl+AaK2AIuqFPpC+F6apQIlxu+xiae01PMPOaw/Og+c9bV9RWVlsTEo/IzZzp5UWmI
	DPkggXY80gr/IORloSSzQz0TsS1178InGy0nM4lF28U+JjQXoMvRSI5h4oVsB38gK1qecH1JyAp
	S/Ylwk7q9mcNzuVmhES6MQZRQ=
X-Received: by 2002:a05:600c:4f53:b0:490:3b8b:6ba2 with SMTP id 5b1f17b1804b1-490a290bbc9mr125178125e9.8.1780219776830;
        Sun, 31 May 2026 02:29:36 -0700 (PDT)
Received: from xeon ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef34a03f8sm17671313f8f.7.2026.05.31.02.29.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2026 02:29:36 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/1 RESEND] dt-bindings: media: mt9m114: document common video device properties
Date: Sun, 31 May 2026 12:29:23 +0300
Message-ID: <20260531092924.12929-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260531092924.12929-1-clamor95@gmail.com>
References: <20260531092924.12929-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[ideasonboard.com,kernel.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-63174-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 9AAA7615610
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Document common video interface device properties, such as rotation and
orientation.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../devicetree/bindings/media/i2c/onnn,mt9m114.yaml          | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/onnn,mt9m114.yaml b/Documentation/devicetree/bindings/media/i2c/onnn,mt9m114.yaml
index e896f4db2421..2b39614f5cbf 100644
--- a/Documentation/devicetree/bindings/media/i2c/onnn,mt9m114.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/onnn,mt9m114.yaml
@@ -15,6 +15,9 @@ description: |-
   an I2C interface and outputs image data over a 8-bit parallel or 1-lane MIPI
   CSI-2 connection.
 
+allOf:
+  - $ref: /schemas/media/video-interface-devices.yaml#
+
 properties:
   compatible:
     enum:
@@ -90,7 +93,7 @@ required:
   - vaa-supply
   - port
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
-- 
2.51.0


