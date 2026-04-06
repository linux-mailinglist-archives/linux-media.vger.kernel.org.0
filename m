Return-Path: <linux-media+bounces-58086-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wGDdJGdr02lViAcAu9opvQ
	(envelope-from <linux-media+bounces-58086-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 06 Apr 2026 10:14:31 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 144453A22AA
	for <lists+linux-media@lfdr.de>; Mon, 06 Apr 2026 10:14:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 86660301F9D2
	for <lists+linux-media@lfdr.de>; Mon,  6 Apr 2026 08:13:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52FF430FC12;
	Mon,  6 Apr 2026 08:13:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J1aOGBzc"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10CE530C610
	for <linux-media@vger.kernel.org>; Mon,  6 Apr 2026 08:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775463222; cv=none; b=I1z2po9Ls9SR76dhExYWs1EeXjO5KdWFny9s9v1RClljTGiaDD4DC1gvv4KyUgU4OQ0Hsc8EFZWD1pIhHBtNBldoMtqVSV27DD7q8XkooXVPzmMzp6rTGPgUoNIGA3Mm33RgpDPZAJxj5yx8IyfaVSHLuUIEgeDoM259QdIRlQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775463222; c=relaxed/simple;
	bh=er0ubEXqc5SkXg9dCN53ES8cWYd71tCmkqSVLbDGaBk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nFvvG1X2iC4L5VxE7lDUKoIsdm+nC6W5BMMYIPvcfUd4/GkWdT4nt22uw1IilHHNRBPZOCyz+U3q/FbffOR1vwkjblGZrVBkZ3fRXbyBorGFM+wYhjxIV6tzV6FBbyw4rhw/9maUtbJ7dyjZawFFdNRaAQ5uot7OCCjYebK/fHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J1aOGBzc; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4888244e9f9so34274735e9.0
        for <linux-media@vger.kernel.org>; Mon, 06 Apr 2026 01:13:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775463219; x=1776068019; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Iew4XenhKOLgBtnmmbivz3Klyz0GTJLb8N3yaWb7V4k=;
        b=J1aOGBzcomMsCm0wnmDI+4DsR2CFetO5JspbsyuQPCyhB67KM3ce/RqcjEM2DjoHvG
         VgogXH4wq21Fkxxgh1yRVKll3RyNEkYvJo/SFulgrzkRSWMO9l9ZlGnaNkwLJ56CxCGH
         ufvfk3sE851MsITniQ5x5ICNNiDcNlx2qS+lYKpLhvgP5AgAU6I0rRhKSOYhij/fCSA4
         zU0pBjM7MoEqjjTVHO5ZYHC6XdA/c+j/T+bSCBW+jRpMm4bCPdK+g85sZuMxmEv8YTnX
         72mKQkAyxtFK2L/FCmArLEEnqDb2e6nQ+ImSdrkV0MPDH88uBAq63pVbppFnTGo8k/dE
         nF/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775463219; x=1776068019;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Iew4XenhKOLgBtnmmbivz3Klyz0GTJLb8N3yaWb7V4k=;
        b=jWkebis2qmVbrW7PdqUG4fyw7Dx8C+3qUaflSDnJE51+r/Bfvoo2GCBXw/jncUEKvI
         dGNyzNpnPx+u659alELMkhwrYpaBN7FLxHKEdGXgeIyS4F0zAMK7uppZy8xzrOISqm+X
         CkHG04BnNJtrNe/+azb5ANNOPgkTEqTQrlGQZdGmbTRlESLkcZbOJrQe5ENIMIxlqZS2
         mPsfVmWfd/r8vnTLOsJ4V3yQvcSpOr6ELn7lfAdJK6NjR/En0BKTNPQ10ApI2Sds+vOD
         Lgt7JZdmOny1ObMredTwf8sC/o1Jtl5dn+czl1ICRzqTn5P3oR0QHct4bx8B4SUaqOhS
         5mEA==
X-Gm-Message-State: AOJu0YxccSAoG98RmIWQIK63/g5drTVZaKjMZy8okbbw16bCnsOn4g/E
	XVHLWe+sUqQTOZzhBJ7SwOXLxRJRLBykKCYyOdTJKQ40KO4QtWZTxkX/
X-Gm-Gg: AeBDiesJcmbKyHUThAztnaExYBwLKTIduczfEvBi4UPS2IMm2SptIUc8FkUC2XpS9cQ
	l9TfOx7xPpwUWBlkF2ajZBwvqTMT9BVdrP8S8UDFVMFdUSz6kNDDBCfVqxAXo/CmcymLVRAhdTr
	POHOwpyA4bdI0ABK5LkWib+Yx+rDu9KSVjr6wqaiYK/RWfPnmBOSN8lBTU1/4n0AeMVpvgJSZqH
	u5N1uK/KeoiohmRogYnuN2I49we0oO87YvL7danD7Cpu6iPCz4RPsdfTIWehdE/SdKRn1eo9EZa
	QkIByOiUgscCfyJb3/0+CmYn3WD6ceof8yA7S6oUsQSaiDuv7PG51SqiGLvhYkbnsEZJfGZeuMs
	goN6ZnG8Qqu+JqD4ic3axmYFu1Aji6tmvuwUR9nztBHYaqEWpUQ6W9JY9GsPmtnPI/sTPQFigyp
	M28vGBOW8iYDTL
X-Received: by 2002:a05:600c:4886:b0:488:a797:f0ac with SMTP id 5b1f17b1804b1-488a797f2d4mr49829105e9.28.1775463219396;
        Mon, 06 Apr 2026 01:13:39 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e2a720dsm39408519f8f.4.2026.04.06.01.13.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 01:13:39 -0700 (PDT)
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
Subject: [PATCH v1 1/1] dt-bindings: media: mt9m114: document common video device properties
Date: Mon,  6 Apr 2026 11:13:30 +0300
Message-ID: <20260406081330.30362-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260406081330.30362-1-clamor95@gmail.com>
References: <20260406081330.30362-1-clamor95@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[ideasonboard.com,kernel.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58086-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 144453A22AA
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


