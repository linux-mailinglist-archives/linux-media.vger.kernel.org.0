Return-Path: <linux-media+bounces-10928-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BE158BD6A4
	for <lists+linux-media@lfdr.de>; Mon,  6 May 2024 23:10:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 183A8284118
	for <lists+linux-media@lfdr.de>; Mon,  6 May 2024 21:10:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4044815CD65;
	Mon,  6 May 2024 21:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="AD8v238k"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 358CD15B57B
	for <linux-media@vger.kernel.org>; Mon,  6 May 2024 21:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715029832; cv=none; b=iszVA7zZ6TDT9bpYsnTtgS+J0V2rjXZGbAqGASGTIHcf1RtceABwGQ7QCgz4UZfkfn6RwR+A/Dl7c6x+TWCEsvyQfqNbgLp3Sv1YjHlM/N8Nc++xGn+fkhzOdGESJ3V4rNcAbet0+6ShjsY30tASxYBmdOAC8D5SgYFGpGpW+NM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715029832; c=relaxed/simple;
	bh=rmMHfZ07Kd9lTZW6PwC3rqA96g9FbrjW5lK3extywms=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YMpFMKD8vOQTMskrJHrzH0iGBU29gnB/2YCl+t4grMgh6+D8y0AbVN7sb+pYKT5j7wp1yaRKWBVza4JVy0xwKZduKGmmJJ+oowS6y8Fb+IGpISqTcHyJUmEmgY3cCFijSFCT2ay2qdL9slxQk+YpZYd6TDC1f8ZlDiE321LlmMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=AD8v238k; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-7928c54e945so208431585a.2
        for <linux-media@vger.kernel.org>; Mon, 06 May 2024 14:10:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1715029830; x=1715634630; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GChtxSEHiZ0rsnEnXBszudDorgEfMXDvam+C+CQ8ysU=;
        b=AD8v238kG/nRmGskPklFvxXewBA+3TI+A2uSOWBNUYHNym1YT14DlD/dUc0YpjsH+d
         ZiyY+x2FX2Zx6tatsr7ebbwclChoXX6QC6WQb0fUSQQzuT9aToTXu4jrT1bPQ2qUnN2n
         Y6vGYnqE+O706qslQb5NRtbF4W3TtkKtiTsls=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715029830; x=1715634630;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GChtxSEHiZ0rsnEnXBszudDorgEfMXDvam+C+CQ8ysU=;
        b=te1xbt4E3udy+Mwwf8/ojv8t6se3jqD5NavuNcsHHJg9WKn4MM1i3JPPi/VDKF0HKq
         MdSJ9y7coMQOgq6/O22HruKUyYBTTwu6awb6LYJuVUjPhMlSALTovPDxTySjL9dV9BRt
         5DIkElvXFSznvOS6m+fXjyU6XvzMxYyxS39kMBynt8e44rH5b0Ig21rn7rXUsC7ah98A
         ECDx0jbRP/ZMVmjZppAP3m5klNmw1cExzOxBYugFisIdMP/7OQNgZBSPFVLOhb9mp/A/
         6VWLzLXR5SMhMYeZRxhq9sKg6TrycoFBWAS7mS054cviGEWtFCg6EEAKUsMlIL1izVUV
         ORMg==
X-Forwarded-Encrypted: i=1; AJvYcCVvKEhN/4nvptQZpcc6gdbULBlRvXhPqwcsnXHkPRN+jvqXy6kWPdzrpH8l8gMCyvc25Cll7QTsdKGRyJRd5oW7v2vPDhHp1lJRCug=
X-Gm-Message-State: AOJu0Yz+iZA9AZyNU9hIueItvLTXnLqU0wh8LLfI+1F1bK7gAd5YGeMN
	A1VrgbK08DpFbshx2vxRlNy9SJpjWdwf0Y9ZE5Nd0GUakKD1VQgN+j1VD3KVeA==
X-Google-Smtp-Source: AGHT+IHCIfstPtI+qCxYBl/8IeI1JeUuGRWhMdpvvDoh1G+j87TAujBrzH7bpSdDG6tDvHp9Uo2iFg==
X-Received: by 2002:a05:620a:89e:b0:792:93ed:2e7c with SMTP id b30-20020a05620a089e00b0079293ed2e7cmr4684450qka.76.1715029830157;
        Mon, 06 May 2024 14:10:30 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id pa20-20020a05620a831400b0078f13e59dc9sm4224921qkn.102.2024.05.06.14.10.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 May 2024 14:10:29 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 06 May 2024 21:10:27 +0000
Subject: [PATCH 2/5] media: imon: Fix race getting ictx->lock
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240506-cocci-locks-v1-2-a67952fe5d19@chromium.org>
References: <20240506-cocci-locks-v1-0-a67952fe5d19@chromium.org>
In-Reply-To: <20240506-cocci-locks-v1-0-a67952fe5d19@chromium.org>
To: Andy Walls <awalls@md.metrocast.net>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Sean Young <sean@mess.org>, 
 Jarod Wilson <jarod@redhat.com>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.12.4

Lets fix a race between mutex_is_lock() and mutex_lock().

<-mutex is not locked
if (!mutex_is_locked(&ictx->lock)) {
	unlock = true; <- mutex is locked externaly
	mutex_lock(&ictx->lock);
}

Let's use mutex_trylock() that does mutex_is_lock() and mutex_lock()
atomically.

Fix the following cocci warning:
drivers/media/rc/imon.c:1167:1-7: preceding lock on line 1153

Fixes: 23ef710e1a6c ("[media] imon: add conditional locking in change_protocol")
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/rc/imon.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/media/rc/imon.c b/drivers/media/rc/imon.c
index 0b55314a8082..8f1361bcce3a 100644
--- a/drivers/media/rc/imon.c
+++ b/drivers/media/rc/imon.c
@@ -1148,10 +1148,7 @@ static int imon_ir_change_protocol(struct rc_dev *rc, u64 *rc_proto)
 
 	memcpy(ictx->usb_tx_buf, &ir_proto_packet, sizeof(ir_proto_packet));
 
-	if (!mutex_is_locked(&ictx->lock)) {
-		unlock = true;
-		mutex_lock(&ictx->lock);
-	}
+	unlock = mutex_trylock(&ictx->lock);
 
 	retval = send_packet(ictx);
 	if (retval)

-- 
2.45.0.rc1.225.g2a3ae87e7f-goog


