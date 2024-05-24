Return-Path: <linux-media+bounces-11861-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2976C8CE8EB
	for <lists+linux-media@lfdr.de>; Fri, 24 May 2024 18:50:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D486C1F21B58
	for <lists+linux-media@lfdr.de>; Fri, 24 May 2024 16:50:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0CB812FF9E;
	Fri, 24 May 2024 16:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="Y5OUZKrE"
X-Original-To: linux-media@vger.kernel.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0B3E12CD81;
	Fri, 24 May 2024 16:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716569379; cv=none; b=i5JH43ac6chFNKFsv6UCfNrF9XXgKpVHjqHzcoV7S5BeUD58tsVwtT7Xh35gljj+yq0ZoGwEJLSed5efqBLV4R2pNWe/Z9Qst8InHr3r3mjGkMA+s8VVaoYcdQSi5lG46bBwzR6WP4rbUH8yaWWiQl384RL2nE4plB/iPQrZrx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716569379; c=relaxed/simple;
	bh=nZiuVw2+FK3x2PUca+c6KL4a7y8UxzcuaAjOwcSH9GM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J1XwZ4sf3atnzeQAPVYvPbfJGwxo4hXGmsQX51af5k6kdeYo+1B30JrVtJNcCOavsuFgaZ81g1abdA60kn2VoZ/HZYOXVsdmoasHwXDjgP/Ax0FNKAgG45RnmbjBigsDl+hUmicpKbFCjzzUjT2bLQj26bmGyOqC+FO7fYAtHdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=Y5OUZKrE; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
	:Subject; bh=geXUP07gEPh/tWoZ5y8jkfeS43t3AQZ7yWhXEVqcMuM=; b=Y5OUZKrEDeAPTNJR
	pYRtjFzEVOj1ovQ7FRVx41MStRoKkiw2UuoZT1PBfh3Di0Fs6pAOd821iDFL2C9lV6tThfExqwhJl
	gsSYKC+jhMaqQf0dzHCGQVXk+EeLQAodnZX/H56CaFHHmwHcKlWTfga3WiCajMca8gsvcJfz5lBvN
	8htu9meoV1A8GtTtNauLugEfncallilcojfxu3ghkY05YoWOmGc2eqtH1i2bI7kZVUvAwmsgb+sWb
	+dNxFf+NC27DrnSnoeu0vvMlCgsSTKGr3IlD6S9XCRNKTTjqE7cs3RXEfv/MFL9j2M5W+1r8wPzjK
	5k0cuUqhd20ZzVAdnQ==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
	by mx.treblig.org with esmtp (Exim 4.96)
	(envelope-from <linux@treblig.org>)
	id 1sAY6m-002Qpy-2I;
	Fri, 24 May 2024 16:49:33 +0000
From: linux@treblig.org
To: mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	hverkuil-cisco@xs4all.nl
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH 4/4] media: i2c: adv7511: remove unused struct 'i2c_reg_value'
Date: Fri, 24 May 2024 17:48:51 +0100
Message-ID: <20240524164851.184467-5-linux@treblig.org>
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

'i2c_reg_value' is unused since the original
commit 5a544cce2177 ("[media] adv7511: add new video encoder").

Remove it.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 drivers/media/i2c/adv7511-v4l2.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/media/i2c/adv7511-v4l2.c b/drivers/media/i2c/adv7511-v4l2.c
index 79946e9c7401..261871be833f 100644
--- a/drivers/media/i2c/adv7511-v4l2.c
+++ b/drivers/media/i2c/adv7511-v4l2.c
@@ -62,11 +62,6 @@ MODULE_LICENSE("GPL v2");
 **********************************************************************
 */
 
-struct i2c_reg_value {
-	unsigned char reg;
-	unsigned char value;
-};
-
 struct adv7511_state_edid {
 	/* total number of blocks */
 	u32 blocks;
-- 
2.45.1


