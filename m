Return-Path: <linux-media+bounces-40506-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CDCF3B2E950
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 02:10:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AAFDD7AABC8
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 00:09:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B111617B505;
	Thu, 21 Aug 2025 00:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="BdgFHiYc"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA60E15ADB4;
	Thu, 21 Aug 2025 00:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755735028; cv=none; b=Nd0C1tgPkE8R9OCpkCkIMTtZcxMZsSSfpNsipm0rqRGr22DzFmmTLX7CtNFdJBnzy3N01VnbsONokeT7INKGjDCsEqiiXfnBDmyJJ7N5M24rLJzxe86lAauxOB/MrUdE5tusQw9aWA63gJFxyX5sN+XrPLst5nGYsGiJ/eidv4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755735028; c=relaxed/simple;
	bh=th2PRuCatd86a+Pytbui/3QBHsiPNEur1r522M2FuVM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gGA8mdtDcYHK3iEFRpiZcGJOSLtrbeTPCCy5evvguKx5Q7gFzUVKq0QAKdTkAfeRxkKzNuysVmQ09ONGaCVkrZIPKF2opwLT52YdBo8tpt/FShFVcyThrt118yHqQ+ujC4/3pqb6x8XFAK8jr/wnIVj0ZFnJUzX3Ap78LiHStzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=BdgFHiYc; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 273FB1026;
	Thu, 21 Aug 2025 02:09:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755734965;
	bh=th2PRuCatd86a+Pytbui/3QBHsiPNEur1r522M2FuVM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BdgFHiYcLLWr1Cy99ndodj3Kjn/XQzuCTdbwqkOhADNJdTCpagEqAV/wp68QJ+CkQ
	 FBbxhw2tcSQ9GX2pmUe9Yb1Wp8aR1PKPNnI2VBFVQHSuQP5n5yJfPb2RJDQ7EZdtrv
	 X23JqWYQX/+Fz9930kNNzFUPs2X00WJqb9FIi9Rg=
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
Subject: [PATCH v2 10/12] dt-bindings: media: nxp,imx-mipi-csi2: Add fsl,num-channels property
Date: Thu, 21 Aug 2025 03:09:42 +0300
Message-ID: <20250821000944.27849-11-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250821000944.27849-1-laurent.pinchart@ideasonboard.com>
References: <20250821000944.27849-1-laurent.pinchart@ideasonboard.com>
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

Using the compatible string to infer the number of channels has been
considered, but multiple instances of the same CSIS in the same SoC
could conceptually be synthesized with a different number of channels.
An explicit property is therefore more appropriate.

The only known SoC to have more than one channel is the i.MX8MP. As the
binding examples do not cover that SoC, don't update them.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
Changes since v1:

- Expand commit message
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


