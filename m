Return-Path: <linux-media+bounces-22094-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 26E1C9D9B3C
	for <lists+linux-media@lfdr.de>; Tue, 26 Nov 2024 17:20:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B18671677C8
	for <lists+linux-media@lfdr.de>; Tue, 26 Nov 2024 16:20:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B4BD1D89E4;
	Tue, 26 Nov 2024 16:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ROAGRC8a"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 693731D63EF
	for <linux-media@vger.kernel.org>; Tue, 26 Nov 2024 16:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732638026; cv=none; b=Jmrvso30wgYszrDELSR67QzUOIG4ngGb0p3FZBLnCjxVMlZTw4xJbIZ57ExeAcgjEUAluMU0aRnHBNQCX4ghZggK5LEzt370gfnCHzp8SG5PHCyAJRE2RBF5I6fzuNpfo02yoUYyhzIoZ3oUW+/oZY3pBoDbSN4CXuk6F+esBoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732638026; c=relaxed/simple;
	bh=dSQ7ETPxUqr7Y8jY5HOOpL2zd0d1eXHqZdnF61NKGPM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=B+2aIOk63GOFFwu2srvR/RsktOI99ckyqAeFApYbtTSXzlkCNtYUrXTSQlnzzvALy6h/6uj/wve0lsx6TB0pWMQPj8AX9n9q69bcysL4ezB22w3DQoRJ2Uqn/b4wIl5Lsh80dJLVeclDNZnnfde5Ny3uGZu6mYbmbH59u6SJmA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ROAGRC8a; arc=none smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-71d4d3738cdso1199627a34.3
        for <linux-media@vger.kernel.org>; Tue, 26 Nov 2024 08:20:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1732638023; x=1733242823; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5h6wJYoG8v14a/k7G0R4omEhI1WXt8Qcm4fv6qiXWkk=;
        b=ROAGRC8anXQPCtnU370jhvfT3931HKw/C2oPcy/HQu5YA5ZhxKv5h13r2Asldx8WFM
         FIa+aPq1osYo9oNHrYAl5+vaqr7FhptZstKRAaGoOis7+N9M/0bILWHn8BwWzgiIllTZ
         8xEdI7hwYkdubCKnjgZBv9shoubMIJDeHZhsk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732638023; x=1733242823;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5h6wJYoG8v14a/k7G0R4omEhI1WXt8Qcm4fv6qiXWkk=;
        b=kKICnYUpelpYmoo5BQyDYtMHmZjHXJrHPJTs36lq6Fo5Dp1vBS3OY+Q65F4JKMkcHq
         nkTI0RU+ORPHfxQxH4bywtcg5LEJXxVLi5P9cO1h3W1t47sW0qix1zImcm276fvqGH2w
         i4sAOUOwYVxIT0qVo7sg2DNr7TIHLdWbhbXyJ7tzPdwTjHksaacq0PsVenuLahwliUC6
         dfLKz0n14AqYHPSf3Ta4RsGYVjML1H88UZE74PNzHtf7ogjoqzf7aWx2Np0ISIQuglh4
         BDRdbQw+pkFZSpkmomUaYayHA2+3MorJdExOLGmTvrcdXKqSuvYDn0wr/8CUciD5ztan
         CHAQ==
X-Gm-Message-State: AOJu0YznBWTGZ3giF3rL68kSYNnpOxdLFUIwmYxYJ/ch0+digxW+9xiX
	8g4H0fvtZ+Klg3+TPn8HuLfUfpY/uQTQ1TvthJz8m5A5QXhfZ61/VVjaqIfcWA==
X-Gm-Gg: ASbGnctzN9P+yC9iWyaonz6QLgw3HIfea2VPca9nS/38H81ITG6lb6Oc7YR4NiQKnzU
	faJ1uqRfBYiThXY60qsbLhTRbdY/wB1nu8+1z53jg1f5HDQ89B5/JW7rc9UuDBAIqqt2u6LWUtB
	eL91i1G7Q/vURWApBqbID7nDSa4Ad6pPVUf2Sk6TVhLPor4mVaORX8zkUxQOZIvfF36SHoGoHs3
	I29INWHK/tGtuuLt52gq6BBQ5l+JosD9V06BjKZXGdDyDyRZX3g8ZmWPfqJ6412b0uMBHB+nU2x
	x7NhcASCLdgCx+nJhHgQbyy5
X-Google-Smtp-Source: AGHT+IFG2bZ2P5Zn41kVEQ+tyZFJfQtiniQ3kN0ylxwnAa8drHufHNkYqM3/xaK/IlGeahhM3vi+qQ==
X-Received: by 2002:a05:6358:1281:b0:1b5:fa8a:791b with SMTP id e5c5f4694b2df-1ca79805541mr991681755d.23.1732638023341;
        Tue, 26 Nov 2024 08:20:23 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-85b4e8205fdsm346532241.1.2024.11.26.08.20.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Nov 2024 08:20:22 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH 0/9] media: uvcvideo: Implement Granular Power Saving
Date: Tue, 26 Nov 2024 16:18:50 +0000
Message-Id: <20241126-uvc-granpower-ng-v1-0-6312bf26549c@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOr0RWcC/x3MywqAIBBA0V+JWTeQYvb4lWghOdlsLEZ6QPjvS
 cuzuPeFRMKUYKxeELo48R4LVF3BsrkYCNkXg260UUpbPK8Fg7h47DcJxoCNHVTfOutNZ6Bkh9D
 Kz7+c5pw/KV0QamIAAAA=
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, 
 Ricardo Ribalda <ribalda@chromium.org>, stable@vger.kernel.org
X-Mailer: b4 0.13.0

Right now we power-up the device when a user open() the device and we
power it off when the last user close() the first video node.

This behaviour affects the power consumption of the device is multiple
use cases, such as:
- Polling the privacy gpio
- udev probing the device

This patchset introduces a more granular power saving behaviour where
the camera is only awaken when needed. It is compatible with
asynchronous controls.

While developing this patchset, two bugs were found. The patchset has
been developed so these fixes can be taken independently.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
Ricardo Ribalda (9):
      media: uvcvideo: Do not set an async control owned by other fh
      media: uvcvideo: Remove dangling pointers
      media: uvcvideo: Keep streaming state in the file handle
      media: uvcvideo: Move usb_autopm_(get|put)_interface to status_get
      media: uvcvideo: Add a uvc_status guard
      media: uvcvideo: Increase/decrease the PM counter per IOCTL
      media: uvcvideo: Make power management granular
      media: uvcvideo: Do not turn on the camera for some ioctls
      media: uvcvideo: Remove duplicated cap/out code

 drivers/media/usb/uvc/uvc_ctrl.c   |  52 +++++++++-
 drivers/media/usb/uvc/uvc_status.c |  38 +++++++-
 drivers/media/usb/uvc/uvc_v4l2.c   | 190 +++++++++++++++----------------------
 drivers/media/usb/uvc/uvcvideo.h   |   6 ++
 4 files changed, 166 insertions(+), 120 deletions(-)
---
base-commit: 72ad4ff638047bbbdf3232178fea4bec1f429319
change-id: 20241126-uvc-granpower-ng-069185a6d474

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>


