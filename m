Return-Path: <linux-media+bounces-15443-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F0BB93F395
	for <lists+linux-media@lfdr.de>; Mon, 29 Jul 2024 13:05:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9DD5F1C21F48
	for <lists+linux-media@lfdr.de>; Mon, 29 Jul 2024 11:05:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B90C145FF8;
	Mon, 29 Jul 2024 11:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="c1iqrUCF"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03013145A01;
	Mon, 29 Jul 2024 11:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722251097; cv=none; b=chFApXR1+AzU0EJtkzngQy8aTThlTrksOTvMpPtOddKje3THxyvmjOPx98GT/e8ZKVO99/AYTDMOMlmiegBCfPAEnrGH+yT8yKFsENFLeSXvKaawVOiJ1SRKyf+mtmAXB38zMRyCWHGrGt+39t1EosVXNMOppqZ37kIRCbVPPBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722251097; c=relaxed/simple;
	bh=mdLnBpRdG1GaeLq99YJ4+5GBhadS0Kk0jpPIEyLssgY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AyjzSkvVqanrzt4VW6Aaq6wXAGeCFb0RUNQhTcbw0F/BzT8sf7/qFiwjBIzE0c+gccUKFQCtBKGkTYhmqDltOTZzJKZ2AQJhQCM7WwdyC33Do5i/JVftVdSKuXJkvJ+GJMMe9MTKd/TDje3O/w8N8FVPwDAvTz5P1g/q8vRunic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=c1iqrUCF; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from localhost.localdomain (unknown [IPv6:2405:201:2015:f873:55f8:639e:8e9f:12ec])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7C6BB596;
	Mon, 29 Jul 2024 13:04:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1722251048;
	bh=mdLnBpRdG1GaeLq99YJ4+5GBhadS0Kk0jpPIEyLssgY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=c1iqrUCF9LyTYH1oXCh9OKjrWulyRctctq30xI0cMNob4E9Iv1LDxHA8JkanddmFI
	 BmbCa1jOzySWuLxCV5BSfEgAkQxBoXxPjuL0tsEEyckBavgTUVkvP0gQs7+7bJcdCR
	 hpko1HZFFGG59hUoCVuR3PWDQd/dlaTb3JqoOF5U=
From: Umang Jain <umang.jain@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: stable@vger.kernel.org,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Umang Jain <umang.jain@ideasonboard.com>
Subject: [PATCH v2 1/2] dt-bindings: imx335: Mention reset-gpio polarity
Date: Mon, 29 Jul 2024 16:34:36 +0530
Message-ID: <20240729110437.199428-2-umang.jain@ideasonboard.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240729110437.199428-1-umang.jain@ideasonboard.com>
References: <20240729110437.199428-1-umang.jain@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Mention the reset-gpio polarity in the device tree bindings.
It is GPIO_ACTIVE_LOW according to the datasheet.

Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
---
 Documentation/devicetree/bindings/media/i2c/sony,imx335.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx335.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx335.yaml
index 106c36ee966d..fb4c9d42ed1c 100644
--- a/Documentation/devicetree/bindings/media/i2c/sony,imx335.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/sony,imx335.yaml
@@ -92,6 +92,8 @@ examples:
             ovdd-supply = <&camera_vddo_1v8>;
             dvdd-supply = <&camera_vddd_1v2>;
 
+            reset-gpios = <&gpio 50 GPIO_ACTIVE_LOW>;
+
             port {
                 imx335: endpoint {
                     remote-endpoint = <&cam>;
-- 
2.45.0


