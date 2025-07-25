Return-Path: <linux-media+bounces-38473-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A0175B11F33
	for <lists+linux-media@lfdr.de>; Fri, 25 Jul 2025 15:13:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B9A691C2711D
	for <lists+linux-media@lfdr.de>; Fri, 25 Jul 2025 13:13:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA1EC2ED841;
	Fri, 25 Jul 2025 13:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="QamXTq2R"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A564724677A
	for <linux-media@vger.kernel.org>; Fri, 25 Jul 2025 13:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753449173; cv=none; b=OwXoOKmJL2T/go7fkh8fr3yklgnJZ5LNhTPRBoz8GDe0KaoRirg7MKnJ6Sh7tIMj+yPL8EPqGCOGBNJx+cTBjc7qVES8PmM/QAzox+IYeyABRPRtmRlKJ3+2m9bcgpLjYgflCYbgWb++/EQSvOCrBK+VLAYeIeMgizdamPEBpG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753449173; c=relaxed/simple;
	bh=l5Ux4VHCzcv5mMVjRNR5wqteinXsHV9OnucVkhrZotY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Ib3Vb2/8FvdeEb8WhT7gnJmouYADpc1xVRKN/DIoC674g/5/ZpDueyrJyJdf9qXoO4xfUFN1oo1HJSS6/AC8IzFQQzz13bhLKTV/f76nBTV8QhCQGY5E8SOe0zfrLcrSe4+wzeKbdsvEsMj1ALPrVJ0HWpAyyPRldaMunBb6Ous=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=QamXTq2R; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-32e14ce168eso23859821fa.1
        for <linux-media@vger.kernel.org>; Fri, 25 Jul 2025 06:12:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1753449169; x=1754053969; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=04Dq+ZPnInyqy4JPf902awXBaUBsHRlkPaa3NiI7vlg=;
        b=QamXTq2RghZNshp4HZWVBHgHJlhixYhl8R1C6UMaeCJiVBEaPJy0RGtR0rCg1t2fD6
         SXUCHsMz6R6/o6gg3MbIFZQSdwBZZZt7QKAUkkZbaMgg17+K5E5p+3Q6StQEuG3Nub1Y
         VTQoEHHlIlo+1QhvoCPBpKMpsWHGlDmuKYRGs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753449169; x=1754053969;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=04Dq+ZPnInyqy4JPf902awXBaUBsHRlkPaa3NiI7vlg=;
        b=nRzekrtB/Dk7/0cu6ZlbxQgRqEQds/h+iOOOqjPYAd4mTNIky/V+RwZRyS/gveaD+b
         r2aCoYAYzpbrAQjZ9SDnvHf22e8qxxBDgt1HKRmaUXk73CyWkZYuj825Z12soVe7f9yc
         sDqs1mlOYG/Xy/aLNJbRvh9WeRCB+ZgKMhRd6+YYA4/3cRN0U1NaBMxjgRDFV94oLDcv
         irqhYOPyzB7HiqkV/zugRPRMrOmu2O3F7TdbhWg9K1b8hv/4fj+WSdAF+IV8yQs3qjTf
         kWEbHNohrfNkD6jmwcdzsYC+pNYF8CoZSyYwfy/K+ix/cg6Jh/aGlJeEBIw6mtI+dM6C
         PTEw==
X-Gm-Message-State: AOJu0YwzfpZq44LS9jRl0tXYJORUI781+ec/DiLuHF4TALTLP7TLVhq1
	GW5SEsIq9COU7JPxmWI/PLOla/DlqH68CX3fuhcE1FY1fM5e8LN2lpLq3XlsZnpnKX09/b3p8Rd
	dNy8=
X-Gm-Gg: ASbGncsZGashxAhZvGCXQ2wjrE2eAlaDk7asxdJJvuzPFxtYCesoc+jpSDkIiIbb9wl
	mKEu0GRDMuHkxHFjsZCXjLoNaBTcLo3+bPWsCGir9XNJ5d0yuJCzCSAQvRdip/v46/34XvPtNHd
	8jY1WISkXIB1yRqXd70wnuLiZv7o6AWyWpDN5SfikaPnYb7jbBXfchoBOkTBKZtsQ1KzNmsv4X9
	YxEd5CBvpuYdGFpELv6H8hoTApFNAApF0zummLv+Nh0Tz6JJ1d0oXjcS8dIVwCv2d0zbTD5PtEl
	yhAdGqwD1iUiU5ebiO0BglZ28HxO5sxHCJy/wlUMml1y3fGHs+X1T8rCvqD4G5iOpWKT97qbB6N
	yyHA6CFhshCUd5wwfAYeE0RBBCnNOzWPN8L33CtlMWaDcAHALGM7DDRYRVZZQGplaUeh1x5qIUE
	dKpA==
X-Google-Smtp-Source: AGHT+IHUDGVJ7d6eglLzivNxrjLU4k/zv2yf1PEgQOaTinVWCWm/wrdVTJjkmjh0Y2IHRILAWJcHhw==
X-Received: by 2002:a05:6512:ea4:b0:54a:cc04:ea24 with SMTP id 2adb3069b0e04-55b5f4a8d79mr573231e87.46.1753449169533;
        Fri, 25 Jul 2025 06:12:49 -0700 (PDT)
Received: from ribalda.c.googlers.com (166.141.88.34.bc.googleusercontent.com. [34.88.141.166])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b53c712d3sm934605e87.118.2025.07.25.06.12.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jul 2025 06:12:49 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v2 0/2] media: uvcvideo: Drop one lock
Date: Fri, 25 Jul 2025 13:12:47 +0000
Message-Id: <20250725-uvc-onelocksless-v2-0-953477834929@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAM+Cg2gC/2WNQQ6CMBBFr0JmbQ2DUgor72FYQB1gIlDTkUZDu
 LuVxJXL95L//gpCnkmgSlbwFFjYzRGyQwJ2aOaeFN8iQ5ZmeVqgVkuwys00OnuXkURUq7XODaX
 YmRLi7OGp49eevNaRB5an8+/9IeDX/mLFfyygQlVig605ndHo5mIH7yZepqPzPdTbtn0A4VIPU
 bMAAAA=
X-Change-ID: 20250716-uvc-onelocksless-b66658e01f89
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2

This is a follow-up patch for
https://git.linuxtv.org/media.git/commit/drivers/media/usb/uvc?id=c93d73c9c2cfa7658f7100d201a47c4856746222

media: uvcvideo: Use vb2 ioctl and fop helpers

Use this opportunity to refactor some more code.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
Changes in v2:
- CodeStyle
- Link to v1: https://lore.kernel.org/r/20250717-uvc-onelocksless-v1-1-91a1b834186a@chromium.org

---
Ricardo Ribalda (2):
      media: uvcvideo: Drop stream->mutex
      media: uvcvideo: Move video_device under video_queue

 drivers/media/usb/uvc/uvc_driver.c   | 20 +++++++----------
 drivers/media/usb/uvc/uvc_metadata.c | 13 ++++-------
 drivers/media/usb/uvc/uvc_v4l2.c     | 43 ++++++++----------------------------
 drivers/media/usb/uvc/uvc_video.c    |  2 +-
 drivers/media/usb/uvc/uvcvideo.h     | 10 +--------
 5 files changed, 23 insertions(+), 65 deletions(-)
---
base-commit: d968e50b5c26642754492dea23cbd3592bde62d8
change-id: 20250716-uvc-onelocksless-b66658e01f89

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>


