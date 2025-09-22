Return-Path: <linux-media+bounces-42953-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 95DD3B91C4A
	for <lists+linux-media@lfdr.de>; Mon, 22 Sep 2025 16:43:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7A76C188ECD0
	for <lists+linux-media@lfdr.de>; Mon, 22 Sep 2025 14:43:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FA5A27F754;
	Mon, 22 Sep 2025 14:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HtXlnGsS"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21EEC22D4DD
	for <linux-media@vger.kernel.org>; Mon, 22 Sep 2025 14:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758552166; cv=none; b=c4lzV+4V9+kxiaX/OW2swJvgzdwmj+j4M4vQV8lKtS5ZqCy0EuzzrhGWUZmaZG2NKdt5RzMxrz6Jv59Yi4QuvCaI62X1ErdppGSOhpw1K4aGZM49stSLbywX7FWIRYcTKnwoDgsF4c6NrI52ztDvK5aWhYTXl1cg8J2ahe2sM+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758552166; c=relaxed/simple;
	bh=mr1z2WZUkV5w8wCfWL4CkLdVwBTw1uNI4CLr3JqVcps=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ULHgfa82VrfUE9CYrmA2bVazpL8jpne2qBr1N0c1HWfL6EJ5/j9X8F4sJhnr6YjdXUkzcginz7SnkUPuzzQvE00I/VelgMRxOURl9yZhYnLnXQ0nAydZnlMAenL1QWNaCdzF2/ZoNyCGbMMtQ9sOdnTag86o+y05IOpCRWy+6cA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HtXlnGsS; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-57da66e0dc9so1448510e87.0
        for <linux-media@vger.kernel.org>; Mon, 22 Sep 2025 07:42:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758552163; x=1759156963; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fSdpk6/rCEmFmOFR6iR3IWh5rll/qCku+r80HG/TWtM=;
        b=HtXlnGsS6sqRusRhxOI0c7Sw/68eTe7Opi/23HkTv3uLy3lQ1HBM9IrJXlkgrwemL3
         VgqFyuBdnshjT3sJv2P4FevriOPBHYmkQXRZM/njYjnkT90qIqByyRb+iWzWcvr37ff3
         VrP/UbHjC7ZxIAQwCukEbgo011Dy8pH0WXZ9SP0i89VDn7OZVJAqGg30twkECvDTdhcf
         2+W+tvXwXgkJFd/kr8RkQewfjZMZ3/iTl7gzWhCTXPzozZuRNCydYIxhzVNon+ES59qs
         xSHthqdha2qPTiEa5b5d7psZUS/DE3nUeljsKHJWzdCI3jcrJBDi8Cgkb4r6HN8M3HkW
         qtuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758552163; x=1759156963;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fSdpk6/rCEmFmOFR6iR3IWh5rll/qCku+r80HG/TWtM=;
        b=MSl4pwkoOdwBHYbFDZUsrg+GIfNDE3vKiiOyxQErtBUVO/8/DEN+W7yHUVQgJIY6nD
         gWc84ZwXctBNceM06ukSo1NMlWM51r+gSG2RHeQY8Soq84MkVAdM/to47BX9x4x7UOAN
         mYD0yQKbkMmz5Jq6zXANfw0wWnR5DUpGjEQctf7h8NjirgZvi9HqP/yYOZ+bgGxchoyB
         m9Dqlk+IMx3c6jTYsRBOXzQoJHvjTT0GLD4x2/sbhXhKTHroM5eqIkCuZIDCVw4UI5zJ
         OvxqLunMESycM07eRqIkymiEEG5LoJ8Ie7+RZsFQxPWzBXq4iC9oHAellD6F9RKa7TGX
         /Iqw==
X-Forwarded-Encrypted: i=1; AJvYcCVFModlN2f4fTf25ihSiwXvOSZWOcwMqferhGsngV5LztdVY4xv+1Heqr+elHBuD46E6y2rjpDdidosdg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwilMTs5gPqBto7WMbuq1Eh3o5IP4JjzTQ0w9d7ZbmZbyEfcf+R
	utc7JSeYZZNlSvnyrfdUKciNKIN7BtwALbbiO3W5QBeUY+O+uqbqGp0OK6YlKg/0
X-Gm-Gg: ASbGncv2pHN8lv6ij3fwR4NCy7BmH1hZ2vUy90oKQYtJBuQmaN89KUPcE/kFOj2V41+
	LaYs9PGwJMcoLQEMQSg7USuqz55ndyzq9PJXcB2L3LWUa7es5nDivzkiDSCzgIO9nbo7zexyyEb
	37uZu53UTgmUSMs7hSSQwV5r0VLMU/uyQOsi7vtyEixGBncIzB4BcmXp1dZATKiJjCiBqfXkcQq
	1a3KOMS4oErlKHdoKSYaWFUFfqGPLkrL6dfyev2Y+xXcelR5BMNaHiePWFlX9PfCjJfpzOVZ3+/
	GlL8u/1EtLEMxykBmikJDi79ccdxbndpMLPmA8UC0Hw4k92RPaseAH22b0G1rxmB0hHKBA/g2DL
	ytFsi0+2EApzXyBksOIiQUf6EopCpxCtBmHPD7Nsz7g8JDRrB6RX0qw0WaeJZqHO1BHuP65zpLx
	oZ7o5M0uy3gm/joDZB
X-Google-Smtp-Source: AGHT+IEaXJNVnmOempIC4sdHG1xqvMW++QRt/th9kx+Xh1olAhqCDJAWeG7b0NIR1dEzieOMIXNmBA==
X-Received: by 2002:a05:6512:6306:b0:57e:ef77:698e with SMTP id 2adb3069b0e04-57eef777f01mr949325e87.11.1758552162891;
        Mon, 22 Sep 2025 07:42:42 -0700 (PDT)
Received: from localhost.localdomain (broadband-109-173-93-221.ip.moscow.rt.ru. [109.173.93.221])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-578a5f44735sm3381450e87.26.2025.09.22.07.42.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 07:42:42 -0700 (PDT)
From: Alexandr Sapozhnkiov <alsp705@gmail.com>
To: Alasdair Kergon <agk@redhat.com>,
	Mike Snitzer <snitzer@redhat.com>,
	dm-devel@redhat.com,
	linux-kernel@vger.kernel.org
Cc: Alexandr Sapozhnikov <alsp705@gmail.com>,
	linux-media@vger.kernel.org,
	lvc-project@linuxtesting.org
Subject: [PATCH 5.10] md: fix NULL pointer dereference at reregister_snapshot()
Date: Mon, 22 Sep 2025 17:42:37 +0300
Message-ID: <20250922144239.11-1-alsp705@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alexandr Sapozhnikov <alsp705@gmail.com>

Return value of a function '__lookup_origin' is dereferenced 
at dm-snap.c:596 without checking for NULL, but it is usually 
checked for this function

Found by Linux Verification Center (linuxtesting.org) with Syzkaller.
Signed-off-by: Alexandr Sapozhnikov <alsp705@gmail.com>

---
 drivers/md/dm-snap.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/md/dm-snap.c b/drivers/md/dm-snap.c
index 4668b2cd98f4..105f6e768ad1 100644
--- a/drivers/md/dm-snap.c
+++ b/drivers/md/dm-snap.c
@@ -590,12 +590,15 @@ static int register_snapshot(struct dm_snapshot *snap)
  */
 static void reregister_snapshot(struct dm_snapshot *s)
 {
+	struct origin *o;
 	struct block_device *bdev = s->origin->bdev;
 
 	down_write(&_origins_lock);
+	o = __lookup_origin(s->origin->bdev);
 
 	list_del(&s->list);
-	__insert_snapshot(__lookup_origin(bdev), s);
+	if (o)
+		__insert_snapshot(o, s);
 
 	up_write(&_origins_lock);
 }
-- 
2.43.0


