Return-Path: <linux-media+bounces-11859-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 16A6A8CE8E7
	for <lists+linux-media@lfdr.de>; Fri, 24 May 2024 18:49:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8AE93B212C0
	for <lists+linux-media@lfdr.de>; Fri, 24 May 2024 16:49:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C67C1304B5;
	Fri, 24 May 2024 16:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="pITMiLCY"
X-Original-To: linux-media@vger.kernel.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FF7912CD81;
	Fri, 24 May 2024 16:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716569363; cv=none; b=Ax0hw/DQJUE3E9RMMTFAii13nwu/ctSbyu4qY8OYo3dt1o/W00W87SFoAY3OpuSq4Lt9m0WGfQ5P6h515pUVOmCN6ls93z+R8Kvb5l8+kZi126mdoutvI6CX5901wGxuGErZT2fGds/Ex1XT3480alTp/maghHKpj3t643xJvHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716569363; c=relaxed/simple;
	bh=Yh+fPWg2r4W5B79paWxjEZDEWxaJwokaetMuPAbhpHE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rKlfbVjt7h9+wKs4HlPKivbblvuZ+U7qStb+FXyJsThrSdnpRrCrL8mUwaZ2wFjb7mhvogkeOVs+LceG0OLCyLT4mZ9sh4OTAMa0tBEQV67RPN1eox59Lg6jNAO057jw4j4uygw++DvG+0WWLg9NtZFat+EaRhYL8RWI+5kOpSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=pITMiLCY; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
	:Subject; bh=Fip7Ho/tBEx5A/Z27iMKzCUw0laCGmOUi0bIAEeLW3Y=; b=pITMiLCYfhhtuABB
	FCvfAOaNfs+ueIfiDrCV5rPrtqsF5CTss+rM66oyuNBmRbBfSWkN3IH58ZUJBjoizNU+CtMmn5HqE
	NnugQN6TUKcrVsNZzcVD2CZDcPHad68CB30UWgIQEVFo2UBVqM9dsODlNmybHyJUVllA9NPihIawz
	w70W/Tn7qlycc5PnNWLyEJUxx7O75N/3iK8b5dugEJ8m4FWKZDnv9NAHPQP2xvltB4JbNVKosP/Ya
	7TKYFL4NIn73ed4duF8SZh8y8GNUE6TEuyvEn7f4HOe+SuMZqwMoMfDIbpb9UuvHjShSKerENKZtI
	JNng4uUsacmPiTgTgA==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
	by mx.treblig.org with esmtp (Exim 4.96)
	(envelope-from <linux@treblig.org>)
	id 1sAY6W-002Qpy-10;
	Fri, 24 May 2024 16:49:16 +0000
From: linux@treblig.org
To: mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	hverkuil-cisco@xs4all.nl
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH 2/4] media: i2c: ks0127: remove unused struct 'adjust'
Date: Fri, 24 May 2024 17:48:49 +0100
Message-ID: <20240524164851.184467-3-linux@treblig.org>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240524164851.184467-1-linux@treblig.org>
References: <20240524164851.184467-1-linux@treblig.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Dr. David Alan Gilbert" <linux@treblig.org>

'adjust' has been unused since original
commit fbe60daac4c3 ("V4L/DVB (3916): AverMedia 6 Eyes AVS6EYES
support").

Remove it.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 drivers/media/i2c/ks0127.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/media/i2c/ks0127.c b/drivers/media/i2c/ks0127.c
index 5c583f57e3f3..9d0a763cd503 100644
--- a/drivers/media/i2c/ks0127.c
+++ b/drivers/media/i2c/ks0127.c
@@ -175,14 +175,6 @@ MODULE_LICENSE("GPL");
 * mga_dev : represents one ks0127 chip.
 ****************************************************************************/
 
-struct adjust {
-	int	contrast;
-	int	bright;
-	int	hue;
-	int	ugain;
-	int	vgain;
-};
-
 struct ks0127 {
 	struct v4l2_subdev sd;
 	v4l2_std_id	norm;
-- 
2.45.1


