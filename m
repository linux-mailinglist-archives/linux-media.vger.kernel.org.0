Return-Path: <linux-media+bounces-18771-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FFE0989CD6
	for <lists+linux-media@lfdr.de>; Mon, 30 Sep 2024 10:33:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D49ED284D2C
	for <lists+linux-media@lfdr.de>; Mon, 30 Sep 2024 08:33:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B27FA17BB38;
	Mon, 30 Sep 2024 08:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="DeNRvFFg"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0465178383
	for <linux-media@vger.kernel.org>; Mon, 30 Sep 2024 08:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727685206; cv=none; b=MVidjZBsEqlCXwV9m/ugo6Qt/hTqwEFmJRqDV2znyucWzG4MqTcSMKXCU9vaKJIAyzljTlOlbtxNwZOsdz756TKup/MAS5+jyINBDJXnAwNIeUTQ8Xb8XX2Rj03opG60/04PRps40BPGoWrGR980zOMwBOWeRUE+ZKLcaiD1TDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727685206; c=relaxed/simple;
	bh=VjT2AbWtHM15ox6R4Mv5lrS+pGwPNeq8U7SMe16L0qQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qIw6i9lkEd6eORa+Nx/4Exy43sqOTHSEzzFxXqEOwAkn/zcsTlLOq9rlIC0cXE67JmAgmFU8BfdFx3wDUuSfk7+eTl6sMHr8XnrtdbTjUCJLeV6CeCSyzmluUAPllIEiO6I2kyqlYnrV49bUGDBxxM+AtTRQr92I/pIkQvFqZyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=DeNRvFFg; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from fedora.local (unknown [95.131.45.214])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 73CCEA2F;
	Mon, 30 Sep 2024 10:31:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1727685111;
	bh=VjT2AbWtHM15ox6R4Mv5lrS+pGwPNeq8U7SMe16L0qQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=DeNRvFFg9h+PmZIdNDI7bFZTzv1KiyOvLNscE0Hno3OCYgvxMUa20B4mdITdkP0k/
	 oOrFf53QG0PwUXla+BmjT+KRixrVMOe+dXKht/4K288vi4IjrwyCK9R7N8NeE6AioW
	 8d76136Sstu/EbBVvUgJo/OswhKdm3rGZnP7vLhM=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Mon, 30 Sep 2024 10:32:57 +0200
Subject: [PATCH v6 1/4] media: pisp_be: Drop reference to non-existing
 function
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240930-pispbe-mainline-split-jobs-handling-v6-v6-1-63d60f9dd10f@ideasonboard.com>
References: <20240930-pispbe-mainline-split-jobs-handling-v6-v6-0-63d60f9dd10f@ideasonboard.com>
In-Reply-To: <20240930-pispbe-mainline-split-jobs-handling-v6-v6-0-63d60f9dd10f@ideasonboard.com>
To: Naushir Patuck <naush@raspberrypi.com>, 
 Nick Hollinghurst <nick.hollinghurst@raspberrypi.com>, 
 David Plowman <david.plowman@raspberrypi.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1211;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=VjT2AbWtHM15ox6R4Mv5lrS+pGwPNeq8U7SMe16L0qQ=;
 b=owEBbQKS/ZANAwAIAXI0Bo8WoVY8AcsmYgBm+mJP+Q7mt8Njljl1o0W6LGmosbJ33ed9YY0q/
 uBbhjM7hbCJAjMEAAEIAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCZvpiTwAKCRByNAaPFqFW
 PKf5EACNGmvNkmA4c582OLgD+oiOFS+OOydmlPfQ5UwrumcvFwPCQrWfttUG6oTNeLuLW+G0jh8
 FuskTmNvRLnvMwmDsPI3rlLWbnjUPX8571nCiq9YjANRXGlm2mmfwxlzCUWDmf8achyiHRiCtF4
 TiC4pDqgumg4LsXIz+LnTgTu2eO04mjbh+4SnWwf5UvB2yZAa22NnaJXuSJHfJVeK7L6wLKJOn/
 4En+7G5EzOlJE5IxorFQP2TomZPRmkTaFvV+LFkwu51qKbI/PQLzLAW3m35kdlHrtE3jz1Lo71S
 q9KF/lEX2EfcAi6SNZB9xOWxbPR1dcB2AUSJK7MVxHnqUcXpbnRJmzOfCQ8iemnnOfWZr7It9bq
 09lNs98c5TR/pzoSPnynIWP10loHeSNL23AqbuFN615ESmrOHqwilXOmxeFrj61+7Wzp+dAlYq/
 xMku+AbNfiXKVM9/waoS5F3+ufq7Zqu7SyyISZp0HZRoxkENvOCcmHoKiTRli5wW9KnoTycdXxQ
 h9NYiO4lBYCGLGZROMp0EC99JCsx4ByKMfHemzD5ZXHg05hGx+/+zcJrFRxlAGnd+FZd+jYwt2D
 UVSVQhgD/hPEgqfH61dh8USQVgFZA2jSlQWeyWX2ufQU7Dndl35bG4Y8pzf4NbEndziIBkq0SRH
 DmjclOi8ht0e5lg==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B

A comment in the pisp_be driver references the
pispbe_schedule_internal() function which doesn't exist.

Drop it.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/raspberrypi/pisp_be/pisp_be.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c b/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
index 65ff2382cffe9e9ba71c5a01b8802e700c726470..8ba1b9f43ba1590753d9601123f9261a3bf41b8e 100644
--- a/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
+++ b/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
@@ -368,10 +368,7 @@ static void pispbe_xlate_addrs(struct pispbe_dev *pispbe,
 	ret = pispbe_get_planes_addr(addrs, buf[MAIN_INPUT_NODE],
 				     &pispbe->node[MAIN_INPUT_NODE]);
 	if (ret <= 0) {
-		/*
-		 * This shouldn't happen; pispbe_schedule_internal should insist
-		 * on an input.
-		 */
+		/* Shouldn't happen, we have validated an input is available. */
 		dev_warn(pispbe->dev, "ISP-BE missing input\n");
 		hw_en->bayer_enables = 0;
 		hw_en->rgb_enables = 0;

-- 
2.46.1


