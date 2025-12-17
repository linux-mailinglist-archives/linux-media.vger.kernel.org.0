Return-Path: <linux-media+bounces-48957-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 06002CC662A
	for <lists+linux-media@lfdr.de>; Wed, 17 Dec 2025 08:41:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id CFC373012550
	for <lists+linux-media@lfdr.de>; Wed, 17 Dec 2025 07:40:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E78D533D6E9;
	Wed, 17 Dec 2025 07:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=emfend.at header.i=@emfend.at header.b="Sm68HnmR"
X-Original-To: linux-media@vger.kernel.org
Received: from lx20.hoststar.hosting (lx20.hoststar.hosting [168.119.41.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4881033D51E;
	Wed, 17 Dec 2025 07:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=168.119.41.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765956779; cv=none; b=ParOQSfI+IPk2j7ZJV9C2STpS9ah7Lz3eEX9iHc6bJ/SWtPt6+6IW2XRTrd+h43ISZt9IkCsg0XFOYObnyMhj4qBV93BAdQ5RxImj4QdvI/wRLdYYqskBxzfLUUk53Ar/ZWTQ+asROFKxkDPX/w9OzCtNQ+lMAkWmVXXJrR01U8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765956779; c=relaxed/simple;
	bh=ce1xcBKRstXjakRDgUmQecpdT//plUHVK5bnquOPGmc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ur/NXFCOXlU9NZxC40n6m0+BAYB66ctujEDHSDu4Sr4alTfX/Hc+/rPSMJLHXITQgizG9LKQpJF3LwTbKJhx18yR3zGplmAOUaeMAKOmp7nnruuPVyTR6caoTjffrPy+l7ITP8a/oJ5AVudbESRqiZN53/D1nj0OqjE4a1o1JZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emfend.at; spf=pass smtp.mailfrom=emfend.at; dkim=pass (1024-bit key) header.d=emfend.at header.i=@emfend.at header.b=Sm68HnmR; arc=none smtp.client-ip=168.119.41.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emfend.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=emfend.at
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=emfend.at;
	 s=mail; h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=AxpMerlN39gJmykIqfZUyd+tB9a+EvOaJBN7D7mXN0o=; b=Sm68HnmRfLDGHXzuQEwzhbpZCK
	yshT5tKCi6b3HNeJGeLqimSLF7wXxNeWk+CnqLgHvudRwMcFggV811XIOGJKWyDzpXmeC67TakMMD
	dBXtJbQ7nJt8Fehs98TuLUJhTVPJ7L/7OTL6UmVApjrK/RYP6fe9F4MyyYPup7mJQIyo=;
Received: from 194-208-208-245.tele.net ([194.208.208.245]:58335 helo=[127.0.1.1])
	by lx20.hoststar.hosting with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <matthias.fend@emfend.at>)
	id 1vVlbl-00DjfJ-Uz; Wed, 17 Dec 2025 08:06:02 +0100
From: Matthias Fend <matthias.fend@emfend.at>
Date: Wed, 17 Dec 2025 08:06:00 +0100
Subject: [PATCH 1/3] media: dt-bindings: imx283: add clock-noncontinuous
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251217-imx283-ext-v1-1-906a762f592d@emfend.at>
References: <20251217-imx283-ext-v1-0-906a762f592d@emfend.at>
In-Reply-To: <20251217-imx283-ext-v1-0-906a762f592d@emfend.at>
To: Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Umang Jain <uajain@igalia.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Matthias Fend <matthias.fend@emfend.at>
X-Mailer: b4 0.14.2
X-Spam-Score: -1.0
X-Spam-Bar: -
X-Spam-Report: Spam detection software, running on the system "lx20.hoststar.hosting",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Add support for selecting the MIPI clock mode (continuous,
    non-continuous) and general register debugging. Signed-off-by: Matthias Fend
    <matthias.fend@emfend.at> --- Matthias Fend (3): media: dt-bindings: imx283:
    add clock-noncontinuous media: i2c: imx283: add support for non-continuous
    MIPI clock mode med [...] 
 
 Content analysis details:   (-1.0 points, 5.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -1.0 ALL_TRUSTED            Passed through trusted hosts only via SMTP
  0.0 TVD_RCVD_IP            Message was received from an IP address
  0.0 KAM_DMARC_STATUS       Test Rule for DKIM or SPF Failure with Strict
                             Alignment (older systems)
  0.0 Local_hs_NotFromHoststar Sender is NOT hoststar.(ch|at|com)
  0.0 Local_hs_NotToHoststar Recipient is NOT hoststar.(ch|at|com)

Add the optional clock-noncontinuous endpoint property that allows enabling
MIPI CSI-2 non-continuous clock operations.

Signed-off-by: Matthias Fend <matthias.fend@emfend.at>
---
 Documentation/devicetree/bindings/media/i2c/sony,imx283.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx283.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx283.yaml
index e4f49f1435a5c2e6e1507d250662ea6ecbf3c7dc..a91695f5618767ac851e5bc72b347a21da77c52d 100644
--- a/Documentation/devicetree/bindings/media/i2c/sony,imx283.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/sony,imx283.yaml
@@ -59,6 +59,7 @@ properties:
                   - const: 3
                   - const: 4
 
+          clock-noncontinuous: true
           link-frequencies: true
 
         required:
@@ -99,6 +100,7 @@ examples:
                 imx283: endpoint {
                     remote-endpoint = <&cam>;
                     data-lanes = <1 2 3 4>;
+                    clock-noncontinuous;
                     link-frequencies = /bits/ 64 <360000000>;
                 };
             };

-- 
2.34.1


