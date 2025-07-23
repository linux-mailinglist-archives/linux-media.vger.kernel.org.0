Return-Path: <linux-media+bounces-38233-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4169EB0EDE3
	for <lists+linux-media@lfdr.de>; Wed, 23 Jul 2025 10:59:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E8078965DED
	for <lists+linux-media@lfdr.de>; Wed, 23 Jul 2025 08:58:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBCDE283C9D;
	Wed, 23 Jul 2025 08:58:35 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61C3E281371
	for <linux-media@vger.kernel.org>; Wed, 23 Jul 2025 08:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753261115; cv=none; b=tBXVGmXFqRhFutpfkqYlI32UEJhIkjPCTsmcin4D9Lpfrx6GsdsrjBsJKGDYnZSU+IPey94MrllgxmEa6kDe1IdOTug204C/f+GowrUEDGkud4BvHCcMDt7DBqYLBBBByIltiuN3RtmHg9mgV/rkVFftbWvdwCBQ7t8KBxHPW0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753261115; c=relaxed/simple;
	bh=NcWEOTDXj6f4kIBljalpFYQyrelfrCFtuzcgHNWiYlE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JKzP92tz8CFT+TWcTY2d2/hFX30Q1j//NhisNRe3DdiV0klY3JPJemFzEstDnQaF+d2N/UIZ1nDoRQB+wDsbJJzm05mW47itgVsqfmqmB48n6DodEOgjSBM65AQOoj9UOaMx5hWWy0QF6BjDU/1SnYij8H/yoBz12N96VeZ3Gz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <f.pfitzner@pengutronix.de>)
	id 1ueVJ0-0004xI-II; Wed, 23 Jul 2025 10:58:30 +0200
From: Fabian Pfitzner <f.pfitzner@pengutronix.de>
Date: Wed, 23 Jul 2025 10:58:29 +0200
Subject: [PATCH 1/2] media: dt-bindings: add flip properties
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250718-fpf-media-dt-flip-v1-1-75b3a938b4be@pengutronix.de>
References: <20250718-fpf-media-dt-flip-v1-0-75b3a938b4be@pengutronix.de>
In-Reply-To: <20250718-fpf-media-dt-flip-v1-0-75b3a938b4be@pengutronix.de>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jacopo Mondi <jacopo@jmondi.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, entwicklung@pengutronix.de, 
 Fabian Pfitzner <f.pfitzner@pengutronix.de>
X-Mailer: b4 0.12.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::54
X-SA-Exim-Mail-From: f.pfitzner@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org

There are cameras containing a mirror on their optical path e. g. when
mounted upside down.

Introduce two options to change the device's flip property via device tree.

As there is already support for the panel-common driver [1], add it for cameras as well.

[1] commit 3c0ecd83eee9 ("dt-bindings: display: panel: Move flip properties to panel-common")

Signed-off-by: Fabian Pfitzner <f.pfitzner@pengutronix.de>
---
 .../devicetree/bindings/media/video-interface-devices.yaml        | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/video-interface-devices.yaml b/Documentation/devicetree/bindings/media/video-interface-devices.yaml
index cf7712ad297c0..36d766992b271 100644
--- a/Documentation/devicetree/bindings/media/video-interface-devices.yaml
+++ b/Documentation/devicetree/bindings/media/video-interface-devices.yaml
@@ -383,6 +383,14 @@ properties:
                         |                    |
                         +--------------------+
 
+  flip-horizontal:
+    description: boolean to flip image horizontally
+    type: boolean
+
+  flip-vertical:
+    description: boolean to flip image vertically
+    type: boolean
+
   orientation:
     description:
       The orientation of a device (typically an image sensor or a flash LED)

-- 
2.39.5


