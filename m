Return-Path: <linux-media+bounces-34323-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F0EFAD1629
	for <lists+linux-media@lfdr.de>; Mon,  9 Jun 2025 01:59:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E5E643A9DBA
	for <lists+linux-media@lfdr.de>; Sun,  8 Jun 2025 23:59:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78050267F70;
	Sun,  8 Jun 2025 23:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="azrZvATS"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70680267700;
	Sun,  8 Jun 2025 23:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749427152; cv=none; b=AhYNpcxUdMS1pSIQk9PIsmrnWy+g6a84NpRGFvcYcR+Sefl+6e7OHuDWcOYRiZDcPvxRvkYtV5+wfRMllmWitzUV94Sa7h9RpGuM4U9lNYl9kxk0q74ON2B5T50jX/f1o1RTpe2Z37qH1o50h46xfzE5WKnhhtL376RuOh+KQTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749427152; c=relaxed/simple;
	bh=X19aP6Ck2PmPUz94aODYkmGiygQMNyXIY87Co/9lTu8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mQeGk9H5+o20qn9ErKrIK1/T0DMYCEm/hyO0uMh3djnWeLiehUeOYb7vC8bznS+/SiRfzskK5uMBS6EP4Xu2q5WbmSEYJMD5kl7sftwspteA3ICaXKoyfYjWHxOHQP0o3SonVjCwRw0ntifqPN5CJ9UlzHSnoIkW+liJ+fkYJaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=azrZvATS; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 29B9519C9;
	Mon,  9 Jun 2025 01:58:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1749427135;
	bh=X19aP6Ck2PmPUz94aODYkmGiygQMNyXIY87Co/9lTu8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=azrZvATSRLCF+H2f5jzrgVaQ0uBpMdU1qKQusuYTUn49juzrTI0AgS1Hc8UQwVof/
	 XTAvIr3ts4IAcjE3fjKpaRjubmWRaLjnCOqX4MP/xRoDh6CdI6/cK03RD0Pem5ELKn
	 XilqGGEkK+0jnn1JrnDFk4ptsF0XOf3cVJx7t7qo=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Isaac Scott <isaac.scott@ideasonboard.com>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 6/8] dt-bindings: media: nxp,imx-mipi-csi2: Add fsl,num-channels property
Date: Mon,  9 Jun 2025 02:58:38 +0300
Message-ID: <20250608235840.23871-7-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250608235840.23871-1-laurent.pinchart@ideasonboard.com>
References: <20250608235840.23871-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The CSI-2 receiver can be instantiated with up to four output channels.
This is an integration-specific property, specify the number of
instantiated channels through a new fsl,num-channels property. The
property is optional, and defaults to 1 as only one channel is currently
supported by drivers.

The only known SoC to have more than one channel is the i.MX8MP. As the
binding examples do not cover that SoC, don't update them.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../devicetree/bindings/media/nxp,imx-mipi-csi2.yaml       | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/nxp,imx-mipi-csi2.yaml b/Documentation/devicetree/bindings/media/nxp,imx-mipi-csi2.yaml
index db4889bf881e..41ad5b84eaeb 100644
--- a/Documentation/devicetree/bindings/media/nxp,imx-mipi-csi2.yaml
+++ b/Documentation/devicetree/bindings/media/nxp,imx-mipi-csi2.yaml
@@ -68,6 +68,13 @@ properties:
     default: 166000000
     deprecated: true
 
+  fsl,num-channels:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Number of output channels
+    minimum: 1
+    maximum: 4
+    default: 1
+
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
 
-- 
Regards,

Laurent Pinchart


