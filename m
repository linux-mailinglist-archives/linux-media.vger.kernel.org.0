Return-Path: <linux-media+bounces-32185-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 54966AB1F67
	for <lists+linux-media@lfdr.de>; Fri,  9 May 2025 23:52:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 743D81C42EE7
	for <lists+linux-media@lfdr.de>; Fri,  9 May 2025 21:52:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C95825D1FC;
	Fri,  9 May 2025 21:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="DuAvBW2a"
X-Original-To: linux-media@vger.kernel.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6485C2609D6;
	Fri,  9 May 2025 21:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746827512; cv=none; b=twy7+1ua6YPazKcdF21VHQDgHu0LBmeenS7Di81YYgJYL9qyOFNbwWKZdyUVMFQfyVnUEnvkmfxU8G5Sh7abM4FlpxQRdAFPOdGkopSmD1wfTpdevG06htU7en30MNwxDtpZC8fAOuU1VCNTR+3RkLq/Aw01cnYJYOP5UCf/haE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746827512; c=relaxed/simple;
	bh=AuaIb3ruDv7nsexX/iERftB8Li/WOEKZA+5sWAq8MzE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Bp9JEnKQMbQD4RA0GHGv7x7/LXyx5qU67lnX+2VRREB57gKJGat23jx1GDtupgd3jkkGD+2TWgyoxMI8S0FFI4MfzSZt7P/6vC8iNUK32hUl6mHdavC+k35qj115qCkCN95dZyJN979A442LRZfofo1E5JbGmc/NnIK9OhmfYqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=DuAvBW2a; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3FA711FCEB;
	Fri,  9 May 2025 21:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1746827508;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PLGPh2FOP5gBSogplBe5Hi56djbiBKOKubmlNQeIoYo=;
	b=DuAvBW2avA9oLpCRX/ei5YvsWsVt2aowNBGfR8oOyJv7oSim+SjO4usuuoYiEfDH328Whl
	5m/N+eMfGbCg3Kwf4PKkBf9g84kWhMsMiQPznvaGVSadI9BlfCNHb0LDLvU+nrF/P4FfCG
	EHdgX/L4OW5wxuCIuDUkmZsy5yQuBTnlkw67j3+UujPVTCzbTMGFLTA42GNjVPIqMdKbVA
	9fMUS+1D1iLMosWOZAhb+Bk8zpoSsK+klX+5W0sP1p6+gpbi0in0CbTlJrGzj8Z7OtQa/T
	J1zf90J7tI+VgRtX+g+ndJo6+dDfCRM9oSjDQiTln1N9973tXF04vCXldhOW4w==
From: Olivier Benjamin <olivier.benjamin@bootlin.com>
Date: Fri, 09 May 2025 23:51:37 +0200
Subject: [PATCH v3 1/4] dt-bindings: media: ov8858: inherit
 video-interface-devices properties
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250509-camera-v3-1-dab2772d229a@bootlin.com>
References: <20250509-camera-v3-0-dab2772d229a@bootlin.com>
In-Reply-To: <20250509-camera-v3-0-dab2772d229a@bootlin.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Nicholas Roth <nicholas@rothemail.net>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 imx@lists.linux.dev, Olivier Benjamin <olivier.benjamin@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvleefjeegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhepqfhlihhvihgvrhcuuegvnhhjrghmihhnuceoohhlihhvihgvrhdrsggvnhhjrghmihhnsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeegueegiedvvdevveevvddufeejvefftdeugfffkeeileehheefieehgfelfeeileenucfkphepvdgrtddumegvfeegmegvtgefkeemvdegvgdtmehfhegtvgemfhefgedvmeeiheekjeemfheiheeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegvfeegmegvtgefkeemvdegvgdtmehfhegtvgemfhefgedvmeeiheekjeemfheiheeipdhhvghloheplgduledvrdduieekrddurddvtdgnpdhmrghilhhfrhhomhepohhlihhvihgvrhdrsggvnhhjrghmihhnsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvuddprhgtphhtthhopehkvghrnhgvlhesphgvnhhguhhtrhhonhhigidruggvpdhrtghpthhtohepihhmgieslhhishhtshdrlhhinhhugidruggvvhdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrt
 ghpthhtohepshdrhhgruhgvrhesphgvnhhguhhtrhhonhhigidruggvpdhrtghpthhtohepfhgvshhtvghvrghmsehgmhgrihhlrdgtohhmpdhrtghpthhtohepkhhriihksehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhrohgtkhgthhhipheslhhishhtshdrihhnfhhrrgguvggrugdrohhrgh
X-GND-Sasl: olivier.benjamin@bootlin.com

Update the OV8858 binding to inherit properties defined in the
video-interface-devices binding.

Signed-off-by: Olivier Benjamin <olivier.benjamin@bootlin.com>
---
 Documentation/devicetree/bindings/media/i2c/ovti,ov8858.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov8858.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov8858.yaml
index a65f921ec0fd24e449331772e39a16cadd73a868..491f2931e6bcdf5a1ad2cd4f9eb187055c3a7a2d 100644
--- a/Documentation/devicetree/bindings/media/i2c/ovti,ov8858.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov8858.yaml
@@ -15,6 +15,8 @@ description: |
   controlled through an I2C-compatible SCCB bus. The sensor transmits images
   on a MIPI CSI-2 output interface with up to 4 data lanes.
 
+$ref: /schemas/media/video-interface-devices.yaml#
+
 properties:
   compatible:
     const: ovti,ov8858
@@ -69,7 +71,7 @@ required:
   - clocks
   - port
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |

-- 
2.48.1


