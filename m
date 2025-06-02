Return-Path: <linux-media+bounces-33901-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B677ACAE62
	for <lists+linux-media@lfdr.de>; Mon,  2 Jun 2025 14:59:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 24C323AEBD7
	for <lists+linux-media@lfdr.de>; Mon,  2 Jun 2025 12:58:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF25521B9F8;
	Mon,  2 Jun 2025 12:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="F5q0+rjo"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D81A1DE4FF
	for <linux-media@vger.kernel.org>; Mon,  2 Jun 2025 12:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748869151; cv=none; b=Elu7yFUOj20APZgshiFObThMcaheSPTbOGMsO3hQ74+DfV1ZnZjUq+cnKpfCPHoSOX6YIdQnjopBY1uO2XM6IDgYxSrzii4HmXkI7GWqAB9f8y/sV+bTRt9/oJAg+EfpP44z2ZCpszcu721NEVW5Ylqq8qh0hSfm4pJYcjGi8ng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748869151; c=relaxed/simple;
	bh=mRhBv8B06p8BiSk4yqWejxdlUqXVc0lpn9uh+Wn9FaM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=oiwI2sinp2B7aRR3IwftgAFkNBmiAZiZKhQeXfgRCM5fE1BTX5bHH62Dja8FkFpDihP8Fw9ftX/BJ947ItOJ78UEjABX9EQknPM++4MGiBdfcisI023vdh5DgnRW7gvxzLRMkj5eWg+K2j9rge+DDrUGgnUda+4pqkTI0P0I9sc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=F5q0+rjo; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-55220699ba8so5413081e87.2
        for <linux-media@vger.kernel.org>; Mon, 02 Jun 2025 05:59:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1748869148; x=1749473948; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SIMCF1EE0zFkVd3PWGlSb7GN6NEbioZWJr0XthYNjNs=;
        b=F5q0+rjo5wuMQC/G5ke7Gh9ukBk/hvsNi2v1KW4bTScubMeqT+H+5og0gRzd/8RI79
         BKT9StfKn2zmf1CkvVids7B792TzrFwuBcoDbc11O/+6TiJNv9a4yaw2OcBxjDFno5xr
         H2c/0jq7rlWl07iqic7CFT771Ic6BAQWWNDkw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748869148; x=1749473948;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SIMCF1EE0zFkVd3PWGlSb7GN6NEbioZWJr0XthYNjNs=;
        b=j48ijrnBjsNR8w8akgBjyKuy3Tef+5/aPVSNfT85ugy9V3mCHGTPqep7iQxcBd66ts
         GJZsnNYdP1GqFxiz+1NzHvA+kZOIqY7Oo6DIfPswsOJkSs5nmzR+t/qJ6roqgZIASE9Z
         unclJwXLoDLpGhILB3XzwecoRs/1vvOnJGjp7NqHIioxysCYBQ5NsyloDDLiE44l6pmy
         n230tZuJtc7Xgzor3EXoMx/OGJkB3LPqo74CKsl5wTd8cQpzISR4lR+7/EgQGHEvuT4y
         tKt0OTQhcHl5740QaQSrAlRoRJSRy7GcJLvcK7va8A6DTTh2Ns+S5y/eTXq9F9vb0rXl
         muTQ==
X-Gm-Message-State: AOJu0YyTVCpgnOhqhlfrI1fR7Qp2oJoqqLkqFOP14W7WuhbwRdTehrhT
	/zBaXrk39EwOgxgQqw8eQCguuAhgvW4I57yrbpWCSI9GKh9SthcBcfzGca1mV7qSV+EXMUtOyvQ
	fFcQ=
X-Gm-Gg: ASbGncuxjOqHFOf0BzMFiTGOoMkAltU70gqNdlgOJFIuAY7VmabE9P3wAJUwkCNnlkK
	BGzrLe7ZHyBnWTGqK34I08wb+J9gzyutfMvnnuZPzGozxRH0AhmbHmN60ZUD916OU8YzslORF/t
	urr5Affv63cvD3Qzu8kUHB8ftQXYKSU3IEkrMtp3K2byUYiljIKC0oeKC6jnlkXrZ3xxPpom812
	CGbt4s9tK8pxKIC6eVflrE0B4wnZszeU+l1igi+xkPZdL9vv772rOEzD/fPpUMlUk3jqxp3mT/o
	zkP4l9Fy89JJ7Qen6OKGh8DtODmSlsbPfLPrvyek9h3BY/UNNCjNHkuoHV9SJzyYSzazQyCbTIx
	zJj6g5rnf4I4l+/a5fCYRi9dwMA==
X-Google-Smtp-Source: AGHT+IEwXPHNOvx4+JMY+XWQ7Qwxx7hauNzfzxTlYCANRbkQVufuyZLQULYAVyKRPr389t+uouJQfg==
X-Received: by 2002:a05:6512:3da6:b0:553:23c5:43b8 with SMTP id 2adb3069b0e04-5533d19dd22mr3855572e87.32.1748869147598;
        Mon, 02 Jun 2025 05:59:07 -0700 (PDT)
Received: from ribalda.c.googlers.com (90.52.88.34.bc.googleusercontent.com. [34.88.52.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553379377a8sm1601140e87.239.2025.06.02.05.59.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jun 2025 05:59:06 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v2 0/3] media: uvcvideo: use vb2 ioctl and fop helpers
Date: Mon, 02 Jun 2025 12:59:01 +0000
Message-Id: <20250602-uvc-fop-v2-0-508a293eae81@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABWgPWgC/z3MQQ7CIBCF4as0sxYzUAnRlfcwXbQwtLNoacAST
 cPdxSa6/F9evh0SRaYEt2aHSJkTh6WGOjVgp34ZSbCrDQqVRq2k2LIVPqxiMBe6IhrntIT6XiN
 5fh3So6s9cXqG+D7gLL/rz1B/I0uBoh08mR7Rt9Ld7RTDzNt8DnGErpTyAf68yBKhAAAA
X-Change-ID: 20250521-uvc-fop-b74e9007dd51
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, Hans Verkuil <hans@jjverkuil.nl>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>, Hans Verkuil <hverkuil@xs4all.nl>, 
 Hans de Goede <hansg@kernel.org>
X-Mailer: b4 0.14.2

This is a rebump of a 4 years old patch from Hans.
https://lore.kernel.org/linux-media/20210618122923.385938-21-ribalda@chromium.org/

It brings "new" helpers to the uvcdriver and removes tons of code.

The patch:
media: uvcvideo: Refactor uvc_queue_streamon
Is already in the uvc tree. It is here just for CI purposes, do not
review.

I have uploaded my working tree at:
https://gitlab.freedesktop.org/linux-media/users/ribalda/-/commits/b4/uvc-fop
which shows the differences from the original patch, this is mainly for
helping the review to people familiar with the previous patch.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
Changes in v2, Thanks HansV:
- Fix typos
- Use start_streaming and stop_streaming for managing pm
- Link to v1: https://lore.kernel.org/r/20250522-uvc-fop-v1-0-3bfe7a00f31d@chromium.org

---
Hans Verkuil (1):
      media: uvcvideo: Use vb2 ioctl and fop helpers

Ricardo Ribalda (2):
      media: uvcvideo: Refactor uvc_queue_streamon
      media: uvcvideo: Remove stream->is_streaming field

 drivers/media/usb/uvc/uvc_driver.c   |  34 +---
 drivers/media/usb/uvc/uvc_metadata.c |   8 +-
 drivers/media/usb/uvc/uvc_queue.c    | 154 ++----------------
 drivers/media/usb/uvc/uvc_v4l2.c     | 291 ++---------------------------------
 drivers/media/usb/uvc/uvcvideo.h     |  38 +----
 5 files changed, 37 insertions(+), 488 deletions(-)
---
base-commit: 5e1ff2314797bf53636468a97719a8222deca9ae
change-id: 20250521-uvc-fop-b74e9007dd51

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>


