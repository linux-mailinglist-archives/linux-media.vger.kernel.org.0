Return-Path: <linux-media+bounces-9682-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 244218A8A7D
	for <lists+linux-media@lfdr.de>; Wed, 17 Apr 2024 19:52:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B73101F22A8F
	for <lists+linux-media@lfdr.de>; Wed, 17 Apr 2024 17:52:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 927AA174EFE;
	Wed, 17 Apr 2024 17:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ue7Q9sj8"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54B19174EFA
	for <linux-media@vger.kernel.org>; Wed, 17 Apr 2024 17:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713376288; cv=none; b=syIVT350dTlNVqEP3WIIT3+BzlcLkP39reIIPc5sssATUkYvULFz8A0bWn2kziy+5mUOwSkxH/o/ffiBuKYkvO6VSkTjg2LbgQEn71qJDwYlD/WJU5GvQGfsLP0v2aztzMR9xlKudZ06mbtHPhYJZgBw9/IvZ6zwmIjWfkGlCv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713376288; c=relaxed/simple;
	bh=kxKejiY5Vxw1asyQacjiWDKZDv4Plb+WMxRCwVm8W60=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tWOC2RKsOWMFdhhWSvzkyqaHu51iJg8vg/R0NbH1dQNUtOk3MgOMXme0ktNVa5/eM7WKjXuq1X3xX0wcq+8gKfvh3e9Vt4eaO37XD7zFDssOLdnOhfJBUSb28BQnvvkmDhkgc+odD0HOy85bc8KyX7Lq7oDb7xAirjPo+FXjO00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ue7Q9sj8; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-57013379e17so4433144a12.0
        for <linux-media@vger.kernel.org>; Wed, 17 Apr 2024 10:51:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713376284; x=1713981084; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MgZqCyNCGaQC8H0yKbmw1VwHJNsqgr3VIM8LYOEI/BM=;
        b=Ue7Q9sj8L8v7tW4/K/zuZ++CQCEUyD+fOD4Er5s3eSnsnpO0ar/9GjTINzB8PUGxSH
         5fMB6FsbYdSoEZZhyGAgdavmQljlyqO4HGoMc21oiDyPMEZKdOc7TwooZD4PQW7JyrO5
         iXj8ir8fMobYHTYshA1BJaXfHMN/zwuCJPsfsolvBzCSuOLNVzohsScMcZgr3+2RaCVm
         392Ar7LCxE51xjxsqal+7dS2TbwmFt5gmawihPMiuqOOozdxmz42Z20o/SxbAt+mOv8H
         EihtB6/PlZsR5ohOZoAODyTEV18fxok0Hm+DghXhslGKCJRdXNeoqOUHsT2Q6qQsz5Qu
         Yo0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713376284; x=1713981084;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MgZqCyNCGaQC8H0yKbmw1VwHJNsqgr3VIM8LYOEI/BM=;
        b=L6/GYu7WkD0wxoYPK7HpLiXDkxTYB5BIADSKAFi9Z4GjAH4j9Bssqbxm6fSNd12zuu
         eJae3pmoe27r/rxctbB4Prx5vRIHp/0pk0apAz5USZF3+YF8gJv0+j82TOREuTMNPfuC
         siIdUo9XOVyix6OszZIzVIDZ0LAd6shDlcH88+nXD2mjABeJxunFZpl3Q7CqfIvnoRQv
         R0/G2ombhmAkajwdr3uKbheE2NbUyOrfGhY/FyDLMHDCqVfXKoi8HsSCClAhlw/RlPo/
         9YZYV63L1u/cQCTn7ITwy82O1UeC2LbRjetplQ0Xkzf5QbcwbDc7m1a/hNr4UU7Yw/7s
         iRqw==
X-Forwarded-Encrypted: i=1; AJvYcCUMYqCmFrnjPiKooowXYY5aK8rlExPgeJ+0HWiaqG17E35/tShT1QkIAtFN6h+qeo2vSewHGDwQD6a1+sbFL4vMlKC1lRWVYc+3vo8=
X-Gm-Message-State: AOJu0Yy6FhGO0/usPY7XBZCmX+z7tzpL+rRJKyVxVa1bieKa7mB4jlHc
	OnJiJLWoO79iNrE9sIwiS9tRA2K0CIGiYkF4sTQ+H1hLJtPwWZQJS1gOwagBO/fn+uLn2jVMGUW
	+
X-Google-Smtp-Source: AGHT+IG3g99Fh5NG2CN+WRwot7slvkEmK0aM122+VwEWPwWqCg9dIm7MTVR0ieqeFKldtS06ro8LDw==
X-Received: by 2002:a50:d75b:0:b0:56d:c937:7558 with SMTP id i27-20020a50d75b000000b0056dc9377558mr241527edj.9.1713376284274;
        Wed, 17 Apr 2024 10:51:24 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id 12-20020a0564021f4c00b005701eb9441fsm4734271edz.75.2024.04.17.10.51.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Apr 2024 10:51:24 -0700 (PDT)
Date: Wed, 17 Apr 2024 20:51:19 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ezequiel =?iso-8859-1?Q?Garc=EDa?= <elezegarcia@gmail.com>
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH] media: stk1160: fix some bounds checking in
 stk1160_copy_video()
Message-ID: <ab56c444-418a-423d-8528-cf04d5d458ef@moroto.mountain>
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

Fixes: 9cb2173e6ea8 ("[media] media: Add stk1160 new driver (easycap replacement)")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
This patch is untested, I just spotted it in review.

When this bug is fixed, the two checks for negative values of "lencopy"
could be removed.  I wrote a version of this patch which removed the
checks, but in the end I decided to leave the checks.  They're harmless.

 drivers/media/usb/stk1160/stk1160-video.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/usb/stk1160/stk1160-video.c b/drivers/media/usb/stk1160/stk1160-video.c
index 366f0e4a5dc0..bfb97ea352e7 100644
--- a/drivers/media/usb/stk1160/stk1160-video.c
+++ b/drivers/media/usb/stk1160/stk1160-video.c
@@ -139,8 +139,8 @@ void stk1160_copy_video(struct stk1160 *dev, u8 *src, int len)
 	 * Check if we have enough space left in the buffer.
 	 * In that case, we force loop exit after copy.
 	 */
-	if (lencopy > buf->bytesused - buf->length) {
-		lencopy = buf->bytesused - buf->length;
+	if (lencopy > buf->length - buf->bytesused) {
+		lencopy = buf->length - buf->bytesused;
 		remain = lencopy;
 	}
 
@@ -182,8 +182,8 @@ void stk1160_copy_video(struct stk1160 *dev, u8 *src, int len)
 		 * Check if we have enough space left in the buffer.
 		 * In that case, we force loop exit after copy.
 		 */
-		if (lencopy > buf->bytesused - buf->length) {
-			lencopy = buf->bytesused - buf->length;
+		if (lencopy > buf->length - buf->bytesused) {
+			lencopy = buf->length - buf->bytesused;
 			remain = lencopy;
 		}
 
-- 
2.43.0


