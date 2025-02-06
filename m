Return-Path: <linux-media+bounces-25728-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 31407A2B297
	for <lists+linux-media@lfdr.de>; Thu,  6 Feb 2025 20:47:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3B415188BBA9
	for <lists+linux-media@lfdr.de>; Thu,  6 Feb 2025 19:47:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C8C41CBA02;
	Thu,  6 Feb 2025 19:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="JIuewdwJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 804841ADC81
	for <linux-media@vger.kernel.org>; Thu,  6 Feb 2025 19:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738871227; cv=none; b=qz6bYp6aJfVB1P4XPUrvx/PewEckdUCIUzNKbMp+CoA/+qGF0pB8XKxtZtBuA52DaLwy6NwGM+nRGF3hal5h9L/gWJA3DMU+Nqpnu2mSotODEYLE7qOMbJxbxpquxo/e9ATzw3yWwaLmUSDHjWzGNzUkKc+uoaqloXvEkWl1qhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738871227; c=relaxed/simple;
	bh=mSYqliF1vjjOjuczmAgr2IAOGjo6nGOqDBo3KZjJ0GY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=eWh+jEoxkPRGWZz7cnW9z1pLC5SPiG9r/+gC/YRkBT9qT4W4xLa8MS85SdEbcF7NDhR0yHUeVRS6XfgY7O5Y7EZtr0YIJK5eSHJXhhl9JV3mztrGaEP5yWd2B5xFrXIEAeRRyuK0YhckEZ8BIJCCb9cgZXAbEcINGXovKprf35g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=JIuewdwJ; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-7b6c3629816so67053185a.1
        for <linux-media@vger.kernel.org>; Thu, 06 Feb 2025 11:47:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1738871223; x=1739476023; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Snn0OCP59RzzUH7AjbRTRIE3uWooKPx3a9hzf99beTQ=;
        b=JIuewdwJXbbspuTtrdzg2tPGaTVinGXdmydChgqjcvrtQFpde2RrAZ8GnCeumWLP1D
         FqDwpwekHWH1ATZ24BSNk5+H5lX0fBoc2DmP7JLab/r92f78U1byEAQJz2V7OWTAJYFf
         IJD1xqOkyBGrGdDHCAXlCoSZSWp9JGWvJxn4U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738871223; x=1739476023;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Snn0OCP59RzzUH7AjbRTRIE3uWooKPx3a9hzf99beTQ=;
        b=jjOi6uI6jkreKzRnLP85wjjlgcjpBCwOi3si/s0R/BoW08KZAX5b2Tnw4NMbMZv+fj
         E0j7AqmnpPS0VpLkp/m28adyG++1wHu7nzauPxnPpmS9gzhlRrzLO72fk0VtLU4SYBdn
         Ahad5BSbz3kND0OoYo6vUy+NMMhdDXR3UDQMvUGEzXzlxrMabIItEXWrd+6l6efXfhM6
         hSMeGZ2QJH/5L2H7iN5M8TNikLaVuzbUungfbwuRo/6Wmng6lXpcov2O99OrsvmaUOOa
         U/YU+9Ue60yAkEGdeyYaMzXL0GUFPrc5Zi4H0P8ZivT4Hc5pJbQnL3VcJr9az7dT2icn
         AgfQ==
X-Gm-Message-State: AOJu0Yw2MVMnexFLW1r8njNrEvOMet/dXIMViNbSAdG0DQkAyEY5WWk6
	yriZ236r0t9BulCjU/Vc4DMHhiuA2U0q/vI3a5CDHPPbsTZuaYTY/XGvb2WeVQ==
X-Gm-Gg: ASbGncsolNSdgaIkAGQknHGrCc5xUWd34kBXOASGyzLgCoWsFgUR+K4atUE9AQaekXJ
	uy4vdb64Z4fnFUSQ3DlpwdRAPpehou24BiBTrc4czdhD6eKnwr8xx9NI34WIR7NZ0JQqsBc4N9c
	usoMQig0SpubsEYZYhuukrlLwU7b8qv1Y53QdLxk1R271rDh4yHFKIb6r2Guqz3D9WD3PwX2ZT/
	jiBvkKxeBnnArflRS26d83xRFVUT82dV9V6CbFo1vYlxP59C95KvSm6Yd2KJ4O3hl1APQIFoOOh
	YD3+CszQh7nsIe275Neol4jlflp4CLmVdMtcbiZWxCJU5SvKeVR8JZbACyhaoHvasg==
X-Google-Smtp-Source: AGHT+IG7710lKPwc4g3R1MXtAKWl7/7MRbJw1ZjgnArPu6tCoZPH7EoBjg4NQgLKJ10ymQuidhIx6A==
X-Received: by 2002:a05:6214:cc9:b0:6e2:43d1:5fd0 with SMTP id 6a1803df08f44-6e4456bd2a6mr4658486d6.31.1738871222005;
        Thu, 06 Feb 2025 11:47:02 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e43bacb6c5sm8756386d6.102.2025.02.06.11.47.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 11:47:01 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v3 0/6] media: uvcvideo: Implement Granular Power Saving
Date: Thu, 06 Feb 2025 19:46:59 +0000
Message-Id: <20250206-uvc-granpower-ng-v3-0-32d0d7b0c5d8@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALMRpWcC/33NQQ7CIBCF4as0rMXAFKh15T2Mi0KnlEVLAxY1T
 e8ubeLGGJf/S+abhUQMDiM5FwsJmFx0fsxRHgpi+ma0SF2bmwADwTkoOidDbWjGyT8w0NFSpmp
 +ko1qRSVIPpsCdu65k9db7t7Fuw+v/UPi2/oHS5wyqkoOugMlRW0upg9+cPNw9MGSzUvwMSQDV
 v4wIBsaO6GlxEqr6stY1/UNJPJrVPcAAAA=
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, 
 Ricardo Ribalda <ribalda@chromium.org>
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
Changes in v3:
- Fix build error on sh4.
- Link to v2: https://lore.kernel.org/r/20250203-uvc-granpower-ng-v2-0-bef4b55e7b67@chromium.org

Changes in v2:
- Add missing semicolon.
- Rebase on top of media-committers/next
- Link to v1: https://lore.kernel.org/r/20241126-uvc-granpower-ng-v1-0-6312bf26549c@chromium.org

---
Ricardo Ribalda (6):
      media: uvcvideo: Keep streaming state in the file handle
      media: uvcvideo: Move usb_autopm_(get|put)_interface to status_get
      media: uvcvideo: Add a uvc_status guard
      media: uvcvideo: Increase/decrease the PM counter per IOCTL
      media: uvcvideo: Make power management granular
      media: uvcvideo: Do not turn on the camera for some ioctls

 drivers/media/usb/uvc/uvc_ctrl.c   | 13 ++++++-
 drivers/media/usb/uvc/uvc_status.c | 38 ++++++++++++++++---
 drivers/media/usb/uvc/uvc_v4l2.c   | 76 ++++++++++++++++++++++++++------------
 drivers/media/usb/uvc/uvcvideo.h   |  3 ++
 4 files changed, 100 insertions(+), 30 deletions(-)
---
base-commit: 39e3f5bc0ab4a86b0c8fcda0688d21651ec17242
change-id: 20241126-uvc-granpower-ng-069185a6d474

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>


