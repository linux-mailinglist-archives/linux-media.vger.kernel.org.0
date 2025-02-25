Return-Path: <linux-media+bounces-26956-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3912EA440F5
	for <lists+linux-media@lfdr.de>; Tue, 25 Feb 2025 14:37:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9E6DB7ACB4F
	for <lists+linux-media@lfdr.de>; Tue, 25 Feb 2025 13:34:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CE2B26982C;
	Tue, 25 Feb 2025 13:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZVGsj+OK"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC8EC268FF8;
	Tue, 25 Feb 2025 13:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740490510; cv=none; b=YVw3xvIHFsr2GsE3B7PavYo3qQ0t/QsrhO22h+6od4VXVdTjwdRtdWhNLyipN+L/HyFloqXO2hmV5E1eO2eOcivJyfwc1Qp6yzYXPoKewJ4BSm9cH44VJHux14lvdX8fDig5YZuoH6xvR/HKhnLOzA78MLx2jjHJs7GQiR/J594=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740490510; c=relaxed/simple;
	bh=NuCCD+5ngYYpDJxMD83rbVh1YsowJ6J+qnTPt45lKqg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=AGUy7IJv6aHD3PiEBzGmDP3yp6x6lT8yJMn4LTIbpov9SQXZq/f/h1zOnJ94PXhuI745jW2mY/D3PuSatqgZHienMBC1CRn/6VS7ecbdIUmt4MiOXcqQNPXHahQ0IqZ/v8xjMESGYHSXcopNzQ1s5KEJjzyFKKGVuHMnOlUjcRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZVGsj+OK; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43994ef3872so34328895e9.2;
        Tue, 25 Feb 2025 05:35:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740490505; x=1741095305; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vgOIooV+vPcoX74/jt4WArZdHKkpzYkOZYv/SCbrW0s=;
        b=ZVGsj+OK/4Qmcz1rjhYoCTOMdU8T+dkDszzYVq7AgfGpvyhcTYgEIJsEWaNwhxCZgn
         gmb9C6VKfdhMWa+1DMJEZyhT5TSk/Rsq6nFsHi7YbL6V0S9qHjn5Soxz+YkDb8SqABKo
         UYPpnlG0pfc4h3c6yXYFzPwcTR8BO13Lk4avZtHe/DFfXbZsln+9HyviLjW5ewZjGQPw
         73btpAjExFRGIJ/qRedUsnkSRfl2L1Dp+S57hLm+jHURVL8icSo3v5FEH6MAcQb6ThxF
         VzYc/9cuteOHkbYPCduV3NfdLPaJ+VTsTso/63qb7MUii02qA1djv2J1OVJklovfVjCR
         htBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740490505; x=1741095305;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vgOIooV+vPcoX74/jt4WArZdHKkpzYkOZYv/SCbrW0s=;
        b=PIskpif3UhCU6ceVU7ZvA1xEvyaZmpRDRjhASuplunK25bTMJ7zUSsf1yPRFvq6KGe
         e6GObfxFatz1Nq6Ku5XNMfZpRNY8x9HoZVKT3p0LfdPIdg5Zi3uLGM8p+dj+1aQ5tVid
         e0nr5ltLWoAafs7DzOnesXqwLEy8A0IN/kBNO6ePeU2fcv7kzLzALoL+ifsu6lvvvc0U
         DS3k6KtWSPZrjgor4qEv8ow1HdKXbC0zZB0rCxzrUB/pT7V/49Abdcz+w49jWFW8hMFZ
         CMbcYXbVjtNdkqy7XNOswokvkLFNqXQcennq5wQi5i0kiRIUPCcdcB+5XtOud4ChQ2If
         95DA==
X-Forwarded-Encrypted: i=1; AJvYcCVnHvhja22XEp/wytmigGX4la2WBbS0y2qnSBJG4ODx1FdvplisqxPwUPuS58zWYxjDaXUpWez2Mg5sWdM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6NWpJIHqF0vDV2L1pASla1F5FoDWoV0f7ZwPuOfqAIi9K38u4
	cSVA9oh7dZ8voq9VuH5QSof+mVUZlzAqX+8aMsdbpLNowiQ+4lNl
X-Gm-Gg: ASbGncuTHurKnTPQPKmnvxlCW/f1EgUmNaDnx+3CI/5ryOsKxXD9Y5MgdjKC5tgFbYq
	EqAxpbYbjNxOWauwp5+RJfIU00P3xITpWqMpuxZaNOWTfHzn4RSaxddkAVMKhEpCCIhpOFaez1P
	s++Dy5+cweKqx0lnOy2IVF8h3V4v7TYo+FNryAKxejP2f081hXDMrIvXtiOHjklWW9OmZng2tQy
	AHanNJ6hyjWmkvFKiD8sg6AZ2I1GLW7ItKHWsvnjj2X/rOnDNkj8iTYWa1j2TMEN7WA5QFfTs5B
	prO6uQeHEkJd6yzB8NK7bd43g6uEkobQIP9mSp0=
X-Google-Smtp-Source: AGHT+IFgIttL2OJHMfhu55YCgKpGUWOUuIqNz+zWdPlkkQCExtB2rK2ob3PSZBKrarWdAmTUjdMOHg==
X-Received: by 2002:a05:600c:1d94:b0:439:9a40:aa09 with SMTP id 5b1f17b1804b1-43ab3be40d7mr18392495e9.25.1740490505165;
        Tue, 25 Feb 2025 05:35:05 -0800 (PST)
Received: from localhost.localdomain ([2a02:c7c:6696:8300:7c3b:8f00:8531:eaa])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ab153a803sm25743175e9.12.2025.02.25.05.35.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 05:35:04 -0800 (PST)
From: Qasim Ijaz <qasdev00@gmail.com>
To: sumit.semwal@linaro.org,
	benjamin.gaignard@collabora.com,
	Brian.Starkey@arm.com,
	jstultz@google.com,
	tjmercier@google.com,
	christian.koenig@amd.com
Cc: linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dma-buf: Use max3() instead of nested max()
Date: Tue, 25 Feb 2025 13:35:02 +0000
Message-Id: <20250225133502.28084-1-qasdev00@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use the well-known max3() macro instead of nesting max()
to find the maximum between in_size, out_size and drv_size.

Signed-off-by: Qasim Ijaz <qasdev00@gmail.com>
---
 drivers/dma-buf/dma-heap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma-buf/dma-heap.c b/drivers/dma-buf/dma-heap.c
index 3cbe87d4a464..96cb9ab5731a 100644
--- a/drivers/dma-buf/dma-heap.c
+++ b/drivers/dma-buf/dma-heap.c
@@ -147,7 +147,7 @@ static long dma_heap_ioctl(struct file *file, unsigned int ucmd,
 		in_size = 0;
 	if ((ucmd & kcmd & IOC_OUT) == 0)
 		out_size = 0;
-	ksize = max(max(in_size, out_size), drv_size);
+	ksize = max3(in_size, out_size, drv_size);
 
 	/* If necessary, allocate buffer for ioctl argument */
 	if (ksize > sizeof(stack_kdata)) {
-- 
2.39.5


