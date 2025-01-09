Return-Path: <linux-media+bounces-24474-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AD2DA069BA
	for <lists+linux-media@lfdr.de>; Thu,  9 Jan 2025 01:05:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 299811888CB0
	for <lists+linux-media@lfdr.de>; Thu,  9 Jan 2025 00:05:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F33F7FD;
	Thu,  9 Jan 2025 00:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q/tsVrtU"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E9C6163;
	Thu,  9 Jan 2025 00:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736381122; cv=none; b=gxb/fIVWz+rtfmDw8OEtVoKBjk9sZKxuRQgpductxcrWM+d/lPp8A5QisakjKzagnbezYAD3gGzOk9U740iiydA/2GrAUDTzGbUbz6xSPnGmOKEJaPpra5vwWTOLQa9+qblxrMt+8anfa6H8OxaOmOKhRvONmE9c8gkSoFHuQRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736381122; c=relaxed/simple;
	bh=MuybQNTD6vkBEQCACRnlGknRtbj6kNLuHuGRK6TfrFM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=DB4bEhBr/Y38q6m9whZ/OdEp4DhodT90nYqSKozckH1YfmrLBdnj3CHKaJjriiA3X8KpKeXePhMV+LLRRmFHiBde5nY8qv5IFaaqP9Gmvxj7IGVzbEs/FO6CauwmWPdQw+/Zyrr3Iq1T9iGtvtIxZBIPld5jLxac53nPRc1XmxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q/tsVrtU; arc=none smtp.client-ip=209.85.217.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-4aff04f17c7so889559137.0;
        Wed, 08 Jan 2025 16:05:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736381120; x=1736985920; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=C1fI7C+N6siuCGFLVurlsomCAwtk684DRCJ4t7sfZs8=;
        b=Q/tsVrtUg8Uv6RNbktJHG84ER0wBaXDxzGeJAlgBF8K7IVL3rvnG9vO7yY2oTxjUMF
         9+c2SrQwe/Fkb+jMRT4+nHnZmdGWeZLltjIiMeUVcFByOGs3kmQd6Q9a2kxvX+Y9BU+O
         bKiTne5EzLaAIheuJ4ekahOAqut+J9r0o57m3+CIfHQpst5211gKtu1zuPtGX0jO0OvK
         xN2CQ0/WnGC71JhlxxayBEoouY55w4DI9oijdUfG13XxuZeOgKyD4MbTHIed8s348pPV
         KJdIugf2bFe/Z419pcCNJmDFZy6Mm9BzGl5Riyj9xmtCWl2xQfNim5L45P3uZEFj0UxF
         1rlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736381120; x=1736985920;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C1fI7C+N6siuCGFLVurlsomCAwtk684DRCJ4t7sfZs8=;
        b=sAsZebOqBGIsxlFEpanWlVaN1osKukErRVMSPsBuV3ECx6G3MrsZO6nkbOXO5+XbKl
         HnKkTnJEJOASHl5aX+CXoSbcQxCLxofhlrPVXKHvaD0PoaOVDZMrghpwDgPZ7vLPa5Ac
         IBRxkuZ0H7uuHMUjixmfV/CEtt9ycoAOe29LcA8rSinDNIrRSrCPThw01QC0dHjNOaLN
         gjvW08e7IlzW4RoATCHUbubbVv8XOnS/k1F6gsa1vD5O8cDVy/QlUF3haK+DKDFK2Ix7
         foTFX73j793rPvtsbMgLlIkrSrBasGeqOx75vQLfwlWFWPdaUsiLuNiaYdHOv43V5bHW
         +5Ow==
X-Forwarded-Encrypted: i=1; AJvYcCVMCC2h6sLYukWb6FmZ21tLOYJ9e1Ac6DPDxdtDYDur+Cy3VIyqj07uCCWpvF6gcOM40SWDJ3YGHdocwRo=@vger.kernel.org, AJvYcCXyQx7OFkCOT/31Ult/sp9snBNbeU8DbYcZpUg/zFmOcGh0ARa9wLzoeW/gWWrQJEN3jr9WZdRRjSHw@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8qVyXs2PzSP/wYAwh6to2nXN1ldb6iFNjSlNi59CMvnWKW8Y8
	f2o6BHlVufC5crTgyNlbdUl/XKsqUZPMw0NtLywgyuESIAUzy+EX
X-Gm-Gg: ASbGncsjomWmdl6iuvp37zz7sZbun1J0RHX88qUsoEkwxVYS2uQ53YHXzy9qjvoJRv7
	CTfN5xPTjEZxN6UCPKv6PlORHvhWLVoILqEAovsG8p89nL/8LIc6BCbgI+Vggtlcagx3yldcmel
	Eo2v8rAuBX317Z5q3YfdPktX7vWjzgdumb5Dt9qhAVdjphuCqQuv3osdM9tAq7E8mtKjsYOt/5I
	Nr0LZq6zR+BO8E0f1AMz9DFHTeT7IsxtgOmW9zh+qDR67iwyCntiYR3lEeJP+Glh5VboQ==
X-Google-Smtp-Source: AGHT+IHveRTKTZH8gb56DQxgpcRLIxrh6qWER6qYt9jRgeCc55dTkNQkK4DkhXhIv7CyGYijYKAN8Q==
X-Received: by 2002:a05:6102:468d:b0:4b2:bc6b:c73c with SMTP id ada2fe7eead31-4b580726e29mr889658137.6.1736381120232;
        Wed, 08 Jan 2025 16:05:20 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:32cc:f64f:9e3:fa63])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-86231362217sm31166241.12.2025.01.08.16.05.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 16:05:19 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: hverkuil-cisco@xs4all.nl
Cc: mchehab@kernel.org,
	lars@metafoo.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH] media: dt-bindings: adv7180: Document the 'interrupts' property
Date: Wed,  8 Jan 2025 21:05:03 -0300
Message-Id: <20250109000503.45264-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Fabio Estevam <festevam@denx.de>

The ADV7180 family of chips have an INTRQ pin that can be connected
to a SoC GPIO.

Allow the 'interrupts' property to be described to fix the following
dt-schema warning:

camera@21: 'interrupt-parent', 'interrupts' do not match any of the regexes: 'pinctrl-[0-9]+'

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 Documentation/devicetree/bindings/media/i2c/adv7180.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/adv7180.yaml b/Documentation/devicetree/bindings/media/i2c/adv7180.yaml
index 4371a0ef2761..572f06d12a39 100644
--- a/Documentation/devicetree/bindings/media/i2c/adv7180.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/adv7180.yaml
@@ -49,6 +49,8 @@ properties:
       Indicates that the output is a BT.656-4 compatible stream.
     type: boolean
 
+  interrupts: true
+
   port:
     $ref: /schemas/graph.yaml#/$defs/port-base
     unevaluatedProperties: false
-- 
2.34.1


