Return-Path: <linux-media+bounces-22601-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C8659E385A
	for <lists+linux-media@lfdr.de>; Wed,  4 Dec 2024 12:08:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C649E282111
	for <lists+linux-media@lfdr.de>; Wed,  4 Dec 2024 11:08:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E84E1B3954;
	Wed,  4 Dec 2024 11:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="h4j4YHdE"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00E2B1B3922;
	Wed,  4 Dec 2024 11:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733310363; cv=none; b=MJjZeV/62EcFM3ntudCu0DZlNfncfRQm2cietAOp71vpu3knUHfwz+wjgMZEI1YVjOSgz/fmDggJvTGsX3pqbsy6jB9i3n8JmehI2/oz5T1HrIzc5ihjr7rvdRcsi39r5bVRjUjoIDjdm2tGOtZERjcLniXOu+m+vAHJwG1oqfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733310363; c=relaxed/simple;
	bh=heR8KYwFA0qbODgROfqUDYupEapASDH6h0/td17hWK0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jtaQykhhH70GFCZdHpt/8R7tlLbF0QHO/iFyTiSLXBiMTWtRk6VRHgZmdVxWyF3zJZLApSF3A34BubmXopI6HDgfnF/0dOnMwNR0Bzw2R7JbyAYtXGPykhEMB67PIWgyI9eQKGD+Z818cSr9SrOcrhNwpn8xK3uNsf2zT5ZzX18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=h4j4YHdE; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-157-155-49.elisa-laajakaista.fi [91.157.155.49])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0F06B9FC;
	Wed,  4 Dec 2024 12:05:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1733310322;
	bh=heR8KYwFA0qbODgROfqUDYupEapASDH6h0/td17hWK0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=h4j4YHdEdqk5YmTRH+SpsrbjAEysy4ZHLxadpHZnu/czpjuq7C6+RH22w+raF1dXd
	 YkTXG8lUJZTqHMhpjwN5VDLByjWgFUYliqzq/HTkOaK+ZjuVpkrbfMfOc80DDTCPYW
	 s6Lof7pwhjbcQRKthFTOmLf1FmyLIUTL+iZQN/dc=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Wed, 04 Dec 2024 13:05:24 +0200
Subject: [PATCH v3 10/15] media: i2c: ds90ub960: Drop unused indirect block
 define
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241204-ub9xx-fixes-v3-10-a933c109b323@ideasonboard.com>
References: <20241204-ub9xx-fixes-v3-0-a933c109b323@ideasonboard.com>
In-Reply-To: <20241204-ub9xx-fixes-v3-0-a933c109b323@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=855;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=heR8KYwFA0qbODgROfqUDYupEapASDH6h0/td17hWK0=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnUDeFknKjkMmuZJRKMzfjngbiy02y66IPxiWE+
 auFOJZ19xiJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ1A3hQAKCRD6PaqMvJYe
 9dF+D/99Aaa26m+WQTcSqvC/fB17RTs/2bqMwyEt/xIpW1boFzFEmR8ucr8mbUELCgoT2FEnnQh
 Vv8oJBPcmpq4aZu2uYGDsZwGsEe94vufd3BWCSdng7kBUw337aGNla4kWk2e4HUUOtmFZTGGDXY
 Q0IDSK8kNG2KlHJ4uXdzKKXUaxAg4qMMqYKvLM5j/fOivkwA5846q510dpDozX4FUF6XJgqQPMI
 iNg/GATgGmgu4a0FEkrV4yWADzzxIepCWQPf09QTf+Nz7LTk3WeY1z8IXhGFzF4+cGuRVx1+/gj
 rJwCII+eOv2uTh+8Mug8nehqGi8n36o6MuJpFJcI5omeGQWEtVpnL2EESx9tFPetXGRDqg3HQya
 /g6HfQsgWAlrvXSTkkXXrdVsnoOB7g32AOA1O0PVjJhBPiXvRDQKlP/F0/a70Z9pUYddK2CmHlQ
 EnfmSBu8FZCaG9dWO9QFZRfHg+kxctkhmjRQELgwCYnt23RV1ByNJ2/Sz9kx39WCjayWaslivLP
 hQxDZjerqmsTOLu0Z1v5r/4IMSj/b0WWAfIVzh5xJBLEs6IVEm2hTZYpaAroQ49xDwySqGNdVYX
 iklTJjbsKSihB4uTWAKcHBQqlQPvq7JUU0q0E4kSjnJ25dj+kiKrsp5m4dco00E8hl39bI4WLF+
 1vBNGj6BD+RJL1g==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

Drop the unused UB960_IND_TARGET_CSI_CSIPLL_REG_1 define. It does not
even match to any block in the more recent documents, so it's possible
it is not only unused but also wrong.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/i2c/ds90ub960.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/i2c/ds90ub960.c b/drivers/media/i2c/ds90ub960.c
index c2035cabf579..a4a624816d8b 100644
--- a/drivers/media/i2c/ds90ub960.c
+++ b/drivers/media/i2c/ds90ub960.c
@@ -367,7 +367,6 @@
 /* Indirect register blocks */
 #define UB960_IND_TARGET_PAT_GEN		0x00
 #define UB960_IND_TARGET_RX_ANA(n)		(0x01 + (n))
-#define UB960_IND_TARGET_CSI_CSIPLL_REG_1	0x92	/* UB9702 */
 #define UB960_IND_TARGET_CSI_ANA		0x07
 
 /* UB960_IR_PGEN_*: Indirect Registers for Test Pattern Generator */

-- 
2.43.0


