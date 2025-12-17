Return-Path: <linux-media+bounces-48976-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 72902CC7329
	for <lists+linux-media@lfdr.de>; Wed, 17 Dec 2025 11:59:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EF2D231EC277
	for <lists+linux-media@lfdr.de>; Wed, 17 Dec 2025 10:49:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34BAE35E556;
	Wed, 17 Dec 2025 10:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Kw3lSd43";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="TE/EbRSB"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD52635E538
	for <linux-media@vger.kernel.org>; Wed, 17 Dec 2025 10:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765967136; cv=none; b=Ydz5LgdBSMXBqPFh0EtqQed8J20S4k+9VBfMqfiJaH3S1We7/QXIEjpTiS5kKKGOKMsTXzeFenE43zWb9pTBbXgiBzlqZPIpqAkjrWDRUC0aT8dqcHw2nGEXIdKFbXbYw7y4/3W4Ijmq5tc/FAHy/krrO0JXIrlT7Z5nOKDLI5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765967136; c=relaxed/simple;
	bh=BYbKHX4dTFPN99WnexO1X4sRqPo8Rn23NQoY+DLrVr4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=f2uHg0VjbM+4k9H3da7KUdI//iK+1JcwOmjnza9Fma5hekcfogjYqVk1Y7fftw80ALTByVU+KUurt0eKH8/PxiJHfR73x7xsib0kgWRaqC4iOluHtZ2NuYcMsiyKbmHv2lrK69JJFTYiY9DcQNZrMZIf17ZYFrNJpoDSpEBH3/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Kw3lSd43; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=TE/EbRSB; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1765967128;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=smHdiTegAULuGhXNBZg/bX/26IPaO/x2LiGtrg1VjdM=;
	b=Kw3lSd43NiqNqTebsm8RRHl+73UMpp5eROaUePU0jG6La7vBzXH4Xm/tMj6m8LYOtG1kB1
	3ly0qa5v59r1+P4UMk4qQBjfL35GBKjQWCYJMhvR0MK5rEO4DDyGIhLhi5qPK0Bq4vCBUm
	0XEl3aqOsysZtQHYBP7y5IJu+UMmeGk=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-417-WWH0cR8oOvSIIFYG7RgMvQ-1; Wed, 17 Dec 2025 05:25:27 -0500
X-MC-Unique: WWH0cR8oOvSIIFYG7RgMvQ-1
X-Mimecast-MFC-AGG-ID: WWH0cR8oOvSIIFYG7RgMvQ_1765967126
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4775f51ce36so44603275e9.1
        for <linux-media@vger.kernel.org>; Wed, 17 Dec 2025 02:25:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1765967126; x=1766571926; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=smHdiTegAULuGhXNBZg/bX/26IPaO/x2LiGtrg1VjdM=;
        b=TE/EbRSBcs7qFiTjVsy8yOBeGKOcEACMkZJOEBuVrO62AjCA3UH/ldTuCNKnSFUIUS
         dgBiuQrsizuOi7ZfvxaPZ7Pb3C+MPKXWbN2hLYexxOy/WmchRbiQVTKglv0KIJw6O+0m
         dEARVxiFfYEBIMwnoPok58OwDU9laxmuNUdAaZsSus2ASio4cdQbkV6HPMxPTVznoUTS
         LfRPvJPL3NpFhbf6Aaqob2lgfzqDO2hDnXleVEzAmYzDhRvtG+xPZvWRuD++42NqfhJd
         i3KmR7mI+K04uBvwLX1rzqAkwIo3g5JT4Woehw+u9DublNS1r8cxt2gXWlFl1kecn7I2
         2L3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765967126; x=1766571926;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=smHdiTegAULuGhXNBZg/bX/26IPaO/x2LiGtrg1VjdM=;
        b=SkDUOFGxyKIBP+9QA9ZU2lQo4xcYVYNPvfkevg3722jIBEngf5/6dXlsEOwzTDxQXZ
         QJ97XEm0uVpBw1eLW5TJ2fvyuldAF4RqNQhGaa/eQ5957nKg3ntJeZmLjr9ryS9Bqou0
         +vNbZDaozYh8xfhp+Ta/9DhcfU6mjg9f0OqpKUOx98j+0stCNMM7CDMmUBgv2YjEPTyN
         NcaqbksmwzvEEoz+tWliBLHv0ICVK4G3xYUy9qN8uTVRqxHal5glENnp5p271lTTRYuY
         84jB4kyApx2Ik5kkRKrlgoVY0li7RjuqjZO+GrqTyOtaDUogbTovXVFtyDu1wCWnHg60
         1XUA==
X-Forwarded-Encrypted: i=1; AJvYcCW2dCdZjcuRL+N3T6ZxuFYDHYo2K8HoMC5XV/9+HqQxRRZLSP6UrffDHgp7SX9GAOROal+/II2GOyZobw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyf7Nw7cR6tGf7U3D5I32IBffDQZM2fmdrPQbmO6B8N8pUZ6SwP
	wPyhaoVmb+K6lpJKJqa98QPc7IL05boeKXGduUveJ9sul3zq/XWKnUTu5qQg2zTaJhIdnWuYiQT
	ys6Vzd3+xEwm1SnoFG8ApM8amykar/N7UJypagT3rXhenrzbhbV1lwvrLeFz83sWE
X-Gm-Gg: AY/fxX5qw6vQ/1a7yfCnhui/LtfuzwENwDhDuBeoJ3KD5HDih3iq/7EF96re4o8q6Kc
	4ixqyZ/VYi+jzhXV+EtffvwMl5pz3ZmOKmBDHnKTz9dPIg5REDRTjTsrY7XHTL+7f+DBqxXgNQe
	3WCtewk0XoAuKTQa3dmQOWO9j6Bhpm04JKPh1qRi9evlED/3J9eljHiuJ7puPbVKDhFwOYIIdmW
	4XthCmX0Msq5FCSWcxURqBe/8YZh8RMOsaIp9MrDCaFpginO5buUKxEgXBSWNnAM3DzqIuufYm3
	4I49YbB9bBjVRG4u58j4bzM5CZ2Trd9DtwPcDY3Sx/OTiJJxHDugAhUFjsD4b8ySsMEQ9Pyc+hu
	eEpsRxzVXNUiUSGZMPUS/9KvAcT7vNFNMeimdD6lfzj47aDv2BqwFObxdHMM=
X-Received: by 2002:a05:600c:5254:b0:46e:37fe:f0e6 with SMTP id 5b1f17b1804b1-47a8f90d28bmr183475005e9.30.1765967125956;
        Wed, 17 Dec 2025 02:25:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHv94oYFukoKO/fNpwSZWIAqty2A+HqHfndysVYm5pmz3lseu6l1OSQncA0MKLpd0JpALSjTg==
X-Received: by 2002:a05:600c:5254:b0:46e:37fe:f0e6 with SMTP id 5b1f17b1804b1-47a8f90d28bmr183474695e9.30.1765967125517;
        Wed, 17 Dec 2025 02:25:25 -0800 (PST)
Received: from lbulwahn-thinkpadx1carbongen12.rmtde.csb ([2a02:810d:7e01:ef00:1622:5a48:afdc:799f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47bdc1e6ca3sm30491045e9.12.2025.12.17.02.25.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 02:25:24 -0800 (PST)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	"Michael J . Ruhl" <michael.j.ruhl@intel.com>,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] dma-buf: really enable DMABUF_DEBUG by default on DEBUG kernels
Date: Wed, 17 Dec 2025 11:25:22 +0100
Message-ID: <20251217102522.2790298-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.51.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

The intent of commit 646013f513f3 ("dma-buf: enable DMABUF_DEBUG by default
on DEBUG kernels") is clear, but it mixes up the config option name. The
config option for kernel debugging is named DEBUG_KERNEL, not DEBUG.

Fix up the DMABUF_DEBUG definition to use the intended name.

Fixes: 646013f513f3 ("dma-buf: enable DMABUF_DEBUG by default on DEBUG kernels")
Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 drivers/dma-buf/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma-buf/Kconfig b/drivers/dma-buf/Kconfig
index fdd823e446cc..426c9ad3364f 100644
--- a/drivers/dma-buf/Kconfig
+++ b/drivers/dma-buf/Kconfig
@@ -55,7 +55,7 @@ config DMABUF_MOVE_NOTIFY
 config DMABUF_DEBUG
 	bool "DMA-BUF debug checks"
 	depends on DMA_SHARED_BUFFER
-	default y if DEBUG
+	default y if DEBUG_KERNEL
 	help
 	  This option enables additional checks for DMA-BUF importers and
 	  exporters. Specifically it validates that importers do not peek at the
-- 
2.51.1


