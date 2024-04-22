Return-Path: <linux-media+bounces-9849-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 069EA8AC8EC
	for <lists+linux-media@lfdr.de>; Mon, 22 Apr 2024 11:32:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 20C331C20F49
	for <lists+linux-media@lfdr.de>; Mon, 22 Apr 2024 09:32:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95D8054670;
	Mon, 22 Apr 2024 09:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jOp3yYHE"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5748F5029A
	for <linux-media@vger.kernel.org>; Mon, 22 Apr 2024 09:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713778372; cv=none; b=Mj1W6kFLUrHMq3YoDJJ2TLCMg51ghNfV4qYmNWenzGZXnWpgTSXH/hacZsvAFKZzv9Ouo5YwxvtP+ssseL1zCfOEZIsnCeOEcHNSyyZls7v3EHncaH+lY9cVfgWuHi9RMf6NcF2CFpdMRHKVUNol0ZR5aXMh8eKzDNs9Z72lc04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713778372; c=relaxed/simple;
	bh=ORQ71f0AaQQ5akKJiukuBgi17kny7qie7GaIGLxzN/I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SEwiWHJTC/1waMdGskfMqKIxYyp89RzCGX0xKGUnyF9YPh3kW0NW6bMVJWOquEeHI5zn64S0J2W86FtnyHJqDNYl6ddmb5SUOveowdZ74TjwzBPCZ5/mhfzveAX0MU3xkRbqkEcbWMk678wPx0U6HPXq1+Cmwfkh9qc8H6phBMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jOp3yYHE; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-572040691c9so1553297a12.1
        for <linux-media@vger.kernel.org>; Mon, 22 Apr 2024 02:32:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713778368; x=1714383168; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=S1CqQcJrzdvW3IqhkKP04Hdt5bWJd9zRL4G/OeUl8Pw=;
        b=jOp3yYHEkvhzxwN8/UjDO1vdZ5aXhFMHbjacqI+X033n5DCn6+XuLkC1J2TLci2ZON
         ghDYUv5T6mDEJteFGq5l2FGdKSqMzJHrA1o2bqAApx8CPyvayW6LE405FHnQD0rXc6MX
         87wynayoeQAww1bBJ4bF1eDOHoZtHVzCOPQ+ZRBM2EeaOCI22Ej+JCf5Sw//pbExNV39
         lCIqoiJgDpkC30LrRVTI/h9VJOW/HLaovzhfD28wqSvXdrmDBLc1g3kdVQceBkDvAMfx
         zlNi5u3uoieOM9/jUxXPu8rx+4KYSeE+aWAHQJD7RX7+3Dst/Wdwoceddbt4/sttfynB
         Em4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713778368; x=1714383168;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S1CqQcJrzdvW3IqhkKP04Hdt5bWJd9zRL4G/OeUl8Pw=;
        b=UwUzS7F3R9nxiHNk9dg84rN8MfFhwYWH1ddLOm2OMr+2LaTqYdrxP+vAZTODT2DOfz
         GfcpgPkMTMtcUp36UkKfKl/MXLVHcAquPx1z1hK+rmCmvpT+LUDj8uAPFci1tJ2Sx0WK
         6McJyTgJQBngGcscoFAsYfw7Dj4l/1OSinz7LNIMNi5atUe7VjL+Y8il0Nt9uyLWga4B
         WCRAB0h+uPf3/bEBqw2/uRnHZymvyvQaRaBHQfVt1eJhgedaaUCrvS+NULVP56VFFdcz
         FTTpdZYWoSzC4u8ou6imsrc++O54s8k74hYPVkEG/CQy+vGiBV4eSqFvNgBqCzk5QDpv
         10Jw==
X-Forwarded-Encrypted: i=1; AJvYcCWMMqi68ZDtj29ZDt6Ny5CsxtYbMEnXbMjYYyKjpod07cwSeZHRjxfyswK4fe5pWUBENSZuYIM1GGta8zOgBVO5rET8LXtMwO9Tdpo=
X-Gm-Message-State: AOJu0YzwDSJKBLXCrOIzdOcPqUWWm/i+v16Cp3qpL9MxHELnt+xIyxIw
	Mk3HovKzBiOazRwyWXyxbJoRYMuDwFId1BfpLiicrdBmWaeg5ybPM750VY/VzdA=
X-Google-Smtp-Source: AGHT+IEq+Z88wgbIStN5EzvwdJOfTAX0fiWXJvBkGdYYTwJtQFUMA77dFbyTJtExISCiw851Jp7Kmg==
X-Received: by 2002:a50:99d3:0:b0:56b:dd7c:ac3d with SMTP id n19-20020a5099d3000000b0056bdd7cac3dmr8686797edb.10.1713778368390;
        Mon, 22 Apr 2024 02:32:48 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id g1-20020aa7c841000000b0056e718795f8sm5340030edt.36.2024.04.22.02.32.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Apr 2024 02:32:48 -0700 (PDT)
Date: Mon, 22 Apr 2024 12:32:44 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ezequiel =?iso-8859-1?Q?Garc=EDa?= <elezegarcia@gmail.com>,
	Ghanshyam Agrawal <ghanshyam1898@gmail.com>
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v2] media: stk1160: fix bounds checking in
 stk1160_copy_video()
Message-ID: <e43980df-1ca5-459d-b037-788dd7d9085d@moroto.mountain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The subtract in this condition is reversed.  The ->length is the length
of the buffer.  The ->bytesused is how many bytes we have copied thus
far.  When the condition is reversed that means the result of the
subtraction is always negative but since it's unsigned then the result
is a very high positive value.  That means the overflow check is never
true.

Additionally, the ->bytesused doesn't actually work for this purpose
because we're not writing to "buf->mem + buf->bytesused".  Instead, the
math to calculate the destination where we are writing is a bit
involved.  You calculate the number of full lines already written,
multiply by two, skip a line if necessary so that we start on an odd
numbered line, and add the offset into the line.

To fix this buffer overflow, just take the actual destination where we
are writing, if the offset is already out of bounds print an error and
return.  Otherwise, write up to buf->length bytes.

Fixes: 9cb2173e6ea8 ("[media] media: Add stk1160 new driver (easycap replacement)")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
v2: My first patch just reversed the if statement but that wasn't the
correct fix.

Ghanshyam Agrawal sent a patch last year to ratelimit the output from
this function because it was spamming dmesg.  This patch should
hopefully fix the issue.  Let me know if there are still problems.

 drivers/media/usb/stk1160/stk1160-video.c | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/drivers/media/usb/stk1160/stk1160-video.c b/drivers/media/usb/stk1160/stk1160-video.c
index 366f0e4a5dc0..e79c45db60ab 100644
--- a/drivers/media/usb/stk1160/stk1160-video.c
+++ b/drivers/media/usb/stk1160/stk1160-video.c
@@ -99,7 +99,7 @@ void stk1160_buffer_done(struct stk1160 *dev)
 static inline
 void stk1160_copy_video(struct stk1160 *dev, u8 *src, int len)
 {
-	int linesdone, lineoff, lencopy;
+	int linesdone, lineoff, lencopy, offset;
 	int bytesperline = dev->width * 2;
 	struct stk1160_buffer *buf = dev->isoc_ctl.buf;
 	u8 *dst = buf->mem;
@@ -139,8 +139,13 @@ void stk1160_copy_video(struct stk1160 *dev, u8 *src, int len)
 	 * Check if we have enough space left in the buffer.
 	 * In that case, we force loop exit after copy.
 	 */
-	if (lencopy > buf->bytesused - buf->length) {
-		lencopy = buf->bytesused - buf->length;
+	offset = dst - (u8 *)buf->mem;
+	if (offset > buf->length) {
+		dev_warn_ratelimited(dev->dev, "out of bounds offset\n");
+		return;
+	}
+	if (lencopy > buf->length - offset) {
+		lencopy = buf->length - offset;
 		remain = lencopy;
 	}
 
@@ -182,8 +187,13 @@ void stk1160_copy_video(struct stk1160 *dev, u8 *src, int len)
 		 * Check if we have enough space left in the buffer.
 		 * In that case, we force loop exit after copy.
 		 */
-		if (lencopy > buf->bytesused - buf->length) {
-			lencopy = buf->bytesused - buf->length;
+		offset = dst - (u8 *)buf->mem;
+		if (offset > buf->length) {
+			dev_warn_ratelimited(dev->dev, "offset out of bounds\n");
+			return;
+		}
+		if (lencopy > buf->length - offset) {
+			lencopy = buf->length - offset;
 			remain = lencopy;
 		}
 
-- 
2.43.0

