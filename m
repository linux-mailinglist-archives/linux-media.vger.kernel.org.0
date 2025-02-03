Return-Path: <linux-media+bounces-25580-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 537DFA25966
	for <lists+linux-media@lfdr.de>; Mon,  3 Feb 2025 13:27:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D8494162711
	for <lists+linux-media@lfdr.de>; Mon,  3 Feb 2025 12:27:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 886632045BF;
	Mon,  3 Feb 2025 12:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="e+p069yt"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 645CD20408E
	for <linux-media@vger.kernel.org>; Mon,  3 Feb 2025 12:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738585650; cv=none; b=WtKjZPEBX+B5ooQ2tpC1G7bD4m0YZQV2LMde7xzxw5GsqEVh3QkKiudy0qRg7K2lYAwgs/h0NPuHnELnlp2QxdkjL81ev8eFQ5aSDJfZmhP2wASVeERT4opkoBV/1Jxa7hD8bC308sdI/6kKh17fIwhSGCeJZ4bQZ7KMSCFybP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738585650; c=relaxed/simple;
	bh=nYPlbjG7L0aNiv+8EnU1RmzRlpaVyv+jcDtLaPfyTSw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ZH2kH7Pf7r0LF79CS/mLSwILQOfQe3a1RtKcbXUZxrQHr3zgDIU9EzY6n/4GMNor95ld2PIFT6QzfPqCCnPXdF1fu/DD8f/ng6pBLCi0NUmlAQAXOc9qnisC3h15NLYi4yrwkZ7AbQWakP+4pzMztffnFoGD2L5WxpCGvFge728=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=e+p069yt; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-46c7855df10so76559001cf.3
        for <linux-media@vger.kernel.org>; Mon, 03 Feb 2025 04:27:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1738585647; x=1739190447; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YwkI6GW2UxTs2aslAYBxTHXmRJrLYPCzR0fgg6McKTI=;
        b=e+p069ytFWfQ1JCyDDbQk2S3t54viYJiD2YQklH00yDJPkQ05lxPIopKqpWnvkh8Mz
         sg61BHPhl3GzpnirEUXuEoV/UtnYSpyY+eddiSvDxPHOSGwyF+7GxRWyJ7GNiHwvKsei
         RD0nebylISlRQOXaoS4of9wpa1XNI996PQ+so=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738585647; x=1739190447;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YwkI6GW2UxTs2aslAYBxTHXmRJrLYPCzR0fgg6McKTI=;
        b=cawcJwu3VZ47TCEfB8Y8xNwPXgMsay5o+O683yAqF9plzvaAJmcmtbmw5dzSXwsfn+
         JG4KBDenOQTGtDZ2mWliZkRTqCdU3lWL3WZfgnY56/nXNCztvoxzr8MIBwz12jNlTAdd
         RmQeZB8gFpMrf95/Xd65pvSm1jOesaj9p2l89VjfvSBNf/zac5pS+o+nLdsrjdQmUeqt
         ZWp5OfsQ16D1qKBCoZJebI6+E3fxERfcLVZxCemq4ZEb32kHArynealWEeo7j4lPMKES
         dGcWcpVNlB0jyvXUpzgVSOczpiK4GN2kzU/rebpzxE0AOEgOOntBKU1LxJ368Oxk12/J
         ciHA==
X-Gm-Message-State: AOJu0YzpkE1BOz1haQLFAMq7ugiwv7IIU7uVTWV/h1KT0jjzr3k2Bkli
	RI4ldBP0zg7yRI+mLp3nAkAZFv5pzOo26gXp4GnIsSFfw9YQVvsbYCRpd5wZWQ==
X-Gm-Gg: ASbGnct1kp+3KI7R0a9X9Wz7h1GxLxmDlsC565/BlFpqvW1g9pCQ0GQisq5ofqxa3NQ
	nZ299D8+fE+iMXZYHeA+67QF3cid6m6Q2+Vocg4U6Qyk6UlvRsriVzVVKoKxye42EXs6lTcWorT
	RWiiScHbKN6zr7aMkPDx+2KZDiVnaZMdY0EPMa4TE5ujfuSBpcfSY5KspFx/ar8yXxEYDFyle7p
	YqJR3Od1a7779AVZPMo8wfuKMNwwg6hLPT8cVTQhL6HGuGNxX+7ivKF+ZDXKpi+iRq5HwzMwCMv
	6yKG9DbbTckWxEKI+w/rfajSQtPwoeqZuiDyRUzqrA8oXUGMnkIlFPD8dabIZ2jY/A==
X-Google-Smtp-Source: AGHT+IE58iHFnV7ApUIvQmJIJTd1uz5+4McRl8q5rVT9hvFp4daQjMPaP/n2MXUt0czDcuSoUmxe8Q==
X-Received: by 2002:ac8:7f50:0:b0:467:8765:51bb with SMTP id d75a77b69052e-46fd0b6da91mr319785941cf.37.1738585647239;
        Mon, 03 Feb 2025 04:27:27 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46fdf0e0c12sm48240941cf.37.2025.02.03.04.27.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 04:27:26 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v2 0/6] media: uvcvideo: Implement Granular Power Saving
Date: Mon, 03 Feb 2025 12:26:19 +0000
Message-Id: <20250203-uvc-granpower-ng-v2-0-bef4b55e7b67@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOu1oGcC/32NQQ6CMBBFr0Jm7RhaSxVX3sOwwFLKLGjJVKqG9
 O5WDuDyveS/v0G0TDbCtdqAbaJIwReQhwrM1HtnkYbCIGuphJAa12TQce+X8LKM3mGtW3Fpej2
 os4IyW9iO9N6T967wRPEZ+LM/JPGzf2JJYI36JORjlLpRrbmZicNM63wM7KDLOX8BE0DBgbMAA
 AA=
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
base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
change-id: 20241126-uvc-granpower-ng-069185a6d474

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>


