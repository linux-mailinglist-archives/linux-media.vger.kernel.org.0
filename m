Return-Path: <linux-media+bounces-12897-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 50AA2902C3F
	for <lists+linux-media@lfdr.de>; Tue, 11 Jun 2024 01:10:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C549BB2166B
	for <lists+linux-media@lfdr.de>; Mon, 10 Jun 2024 23:10:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A34E15251B;
	Mon, 10 Jun 2024 23:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Q7HpKo41"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FC0247A40
	for <linux-media@vger.kernel.org>; Mon, 10 Jun 2024 23:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718060997; cv=none; b=EeVU4vERGYRjgNNTDv1C5qXkov6NwWwkJVMuKIgqK/+bSRaJ/dEbPnYsfioBvTdr2inFAOB51aVdyUd0kva/TL4+lIET+aX9AgHkYXtzuUO3AV9t4Mo5ltNETqM68ed33oF1qYPwrLfeTYXK+IfA3vgXJsQaBXUCri6gElQQpMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718060997; c=relaxed/simple;
	bh=7yOCw5ehRCh9Die2Lwd6uWTzJjn9VrsOF6i3rUuNHEk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=p153JXERcYW9MN8XNFLO6pigC3lTFC+lba/ZOdUun0wJSEA2uZn2bxjxcxqrE8AqIrTbcwp0MJC733CzuEeCmNWBDyCj0kI1NuJzNHnKod5c5x9Y6j4KUUevOVRk/wjO3B+IDXpOEujUYQRO2ucWvzeswzIA3ZRT1DArIpetqow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Q7HpKo41; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-440609dd118so10168291cf.1
        for <linux-media@vger.kernel.org>; Mon, 10 Jun 2024 16:09:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1718060994; x=1718665794; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/ICdOWrg5mG8fO0nrrLGSS0O+w4350VdKAB7pBCMUhM=;
        b=Q7HpKo41CimlwXiAJNtk4EQfQjotltLWx+K06ziTSxgvQb8ZBUT9PEjjjqKADfTttj
         DzCoX2tJ0hTdMDEXUUCqLyhWhBSBgNVt1tQSvUgz4s9p5VpKFVao4LIdBXf7N7tyq5t4
         b6CuIToR7QgvLg1HRKoO8TKfQwrFgwtfM+JM8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718060994; x=1718665794;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/ICdOWrg5mG8fO0nrrLGSS0O+w4350VdKAB7pBCMUhM=;
        b=VeRsAE1sCndXyp+HoNi1iE2VNjsEF+2ZzoI1mKytr4QeCMV/wYFTCKAcl/MbyDmFS1
         woXcLx5fP3JEJRuQEqdSnoOsCe39kW5BPIU9+VFQIv8O+X2fHaGRbzz2AEzsdA9t0qMq
         aMD5pPwlrbNpk+2FEv/AlF7iLfkZ47Ap+QEtEXC5QzxGz5DfLhpgkqN3O6Q9PoPuC22n
         uwMa5BOIN7EsF8E4OXua+2lWpOV1jMbgD788WEZuDaEf0nvJ9rOhQAe4HCKmMGxHa+6C
         /Q0VSoqB3XIgtBFPVZzmj0cNxQWQnbzVXEvMr1owiImm/HzrZYt6r0XTsJNGfEx9G5Z/
         p5Ww==
X-Forwarded-Encrypted: i=1; AJvYcCUpHGVkWu7rRu30bTELkIWJdwoHoyQvFnBAe+tJ7E08y3ciKQARefwuHujUBL/QAR5BMiHwWwKdOC1ifKRNZWPPbNZWGmhWP4CDPXs=
X-Gm-Message-State: AOJu0YwZJ/8ICL93PYoM9Cclutw0XXxKtKfWf2p5gj7U/Z3LeRv7EZFC
	HcF2z9AGxzZMobuOUkEU8u1KewoUCNkdC4CG33UPMS2SdEHpFdPIe2QxLUhjmg==
X-Google-Smtp-Source: AGHT+IGxw6UDURFkAaIXBhSE8QYt8olnJgp1gO8TAyo+egZMro2afsnjv/Q591w5ZZsDakY7NP6JVg==
X-Received: by 2002:a05:6214:3992:b0:6b0:649a:7a25 with SMTP id 6a1803df08f44-6b0649a7c7bmr103223616d6.22.1718060993914;
        Mon, 10 Jun 2024 16:09:53 -0700 (PDT)
Received: from denia.c.googlers.com (123.178.145.34.bc.googleusercontent.com. [34.145.178.123])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6b06519d521sm35256946d6.65.2024.06.10.16.09.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jun 2024 16:09:53 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v2 0/7] media: uvc: Probe PLF limits at start-up
Date: Mon, 10 Jun 2024 23:09:51 +0000
Message-Id: <20240610-billion-v2-0-38e861475f85@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMCHZ2YC/z3MQQ7CIBCF4as0sxZDgWrjynuYLgCHMklbGlCia
 bi72ESX/8vLt0HCSJjg0mwQMVOisNQQhwas18uIjO61QXChuGwlMzRN9cM6I7TqnO5PTkF9rxE
 dvXbpNtT2lB4hvnc4t9/1Z/R/I7eMM+HOxnJEwSW/Wh/DTM/5GOIIQynlA/FUqp+hAAAA
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.12.4

The UVC standard descries the values for the PLF control for its
versions 1.1 and and 1.5, but it does not describe which values MUST be
implemented.

So far, we have been adding "device quirks" to provide proper limits for
the control, but this is failing to scale.

Add a function that during probe-time checks the capability of the
control.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
Changes in v2: Thanks Laurent
- Cleanup mapings from uvc_device_info
- Use __free()
- Implement filter_mapping
- Link to v1: https://lore.kernel.org/r/20240318-billion-v1-0-2f7bc0ee2030@chromium.org

---
Ricardo Ribalda (7):
      media: uvcvideo: Allow custom control mapping
      media: uvcvideo: Refactor Power Line Frequency limit selection
      media: uvcvideo: Probe the PLF characteristics
      media: uvcvideo: Cleanup version-specific mapping
      media: uvcvideo: Remove PLF device quirking
      media: uvcvideo: Remove mappings form uvc_device_info
      media: uvcvideo: Replace get_mapping with filter_mapping

 drivers/media/usb/uvc/uvc_ctrl.c   | 191 ++++++++++++++++++++-----------------
 drivers/media/usb/uvc/uvc_driver.c | 122 -----------------------
 drivers/media/usb/uvc/uvcvideo.h   |   8 +-
 3 files changed, 109 insertions(+), 212 deletions(-)
---
base-commit: b14257abe7057def6127f6fb2f14f9adc8acabdb
change-id: 20240313-billion-5b2a45fa86f4

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>


