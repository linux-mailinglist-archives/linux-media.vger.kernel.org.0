Return-Path: <linux-media+bounces-11873-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7202E8CF0A4
	for <lists+linux-media@lfdr.de>; Sat, 25 May 2024 19:53:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A360B1C20FA0
	for <lists+linux-media@lfdr.de>; Sat, 25 May 2024 17:53:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90FEF1292E1;
	Sat, 25 May 2024 17:52:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="pBsJfdMM"
X-Original-To: linux-media@vger.kernel.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B136A127E2D;
	Sat, 25 May 2024 17:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716659574; cv=none; b=YahmbhXGsy+qVf8giSpTbnFhzUkr1X+NpGEtsU8OnSgYoz7pOqLqg6sYH3FsBmp/0nRK9uZgnENTGDBp37YlJ5/0JHSnY//UQXDQCXxefytY5YbY1JQAMIx87NHUtQMCIXUfK8v8VwMuK/m7osxX3/0Zec+/8jqX3xctHnnEA+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716659574; c=relaxed/simple;
	bh=VGqT8+ANTTSxIllZKF7XYwLnlMY9zfu2eB8jhUy4KTU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rj1Xa3E6DwOqMiclrM4wx7yzEHRHYtbd9u4GPYcFKwf0PC9/XoPWAxvrVYrLISzDdXQd2BfawbukE7XntrXU2fgA82kAPbElKiJGlVLMIzXdulwQ9NZOeBjLJjqblvunx5v0MXGIkiG9F32f0RPizkbASpN5ukyOT8wauvP2R7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=pBsJfdMM; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
	:Subject; bh=vkUPOCqjOJNixqbovJCTAg37YSIHfYkepx5YIQTAeZA=; b=pBsJfdMMqb4bVd3W
	ksk3FUqNIC2heMLY8SqxPMUKoBGrwQIgcvuKfvZdjxCDjHr6/Q2X4Ffm3jOfpIYKT4bhzGrlV2JIF
	3gNcudPHZ/3KwIy32KtbYq5bsxUQXLDnNfiomQklzMLQOYWz2bPNP2ZnnCQnAfHP9DvUv73V9c9+L
	tNpSK0ps7YbEztY4gkC37XH7biErNMsTAiXwUKoRy2+ZuHyIYKyh3Q/NjzcBRwdBbbonj1kwWd0rG
	ZYSdqFD7njVPo9HxPJZ6DClwdV2mqBV0H+l7UCNH1bQtsw/UIJvFN00PshdqDz5ID5utQvJVCXEC6
	yBonKG/SvELEXqmNaA==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
	by mx.treblig.org with esmtp (Exim 4.96)
	(envelope-from <linux@treblig.org>)
	id 1sAvZW-002Wcl-0j;
	Sat, 25 May 2024 17:52:46 +0000
From: linux@treblig.org
To: mchehab@kernel.org,
	charles-antoine.couret@nexvision.fr,
	isely@pobox.com
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH 3/3] media: pvrusb2: remove unused struct 'debugifc_mask_item'
Date: Sat, 25 May 2024 18:52:29 +0100
Message-ID: <20240525175229.100559-4-linux@treblig.org>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240525175229.100559-1-linux@treblig.org>
References: <20240525175229.100559-1-linux@treblig.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Dr. David Alan Gilbert" <linux@treblig.org>

'debugifc_mask_item' is unused since
commit 681c73994401 ("V4L/DVB (6691): pvrusb2: Rework pipeline state
control").

Remove it.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 drivers/media/usb/pvrusb2/pvrusb2-debugifc.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/media/usb/pvrusb2/pvrusb2-debugifc.c b/drivers/media/usb/pvrusb2/pvrusb2-debugifc.c
index 84cfb5ce8b8d..81d711269ab5 100644
--- a/drivers/media/usb/pvrusb2/pvrusb2-debugifc.c
+++ b/drivers/media/usb/pvrusb2/pvrusb2-debugifc.c
@@ -9,11 +9,6 @@
 #include "pvrusb2-hdw.h"
 #include "pvrusb2-debug.h"
 
-struct debugifc_mask_item {
-	const char *name;
-	unsigned long msk;
-};
-
 
 static unsigned int debugifc_count_whitespace(const char *buf,
 					      unsigned int count)
-- 
2.45.1


