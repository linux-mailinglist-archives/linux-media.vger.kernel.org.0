Return-Path: <linux-media+bounces-21201-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BBAE9C2689
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2024 21:27:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BD4941C21BE0
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2024 20:27:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51CF72123D0;
	Fri,  8 Nov 2024 20:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="TNun1c5f"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84EA81F4719
	for <linux-media@vger.kernel.org>; Fri,  8 Nov 2024 20:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731097559; cv=none; b=OsoVBEPsWOyRLD4CDH0a8Tp0wZ6DKqpKxf6IUbKUM9PDz7S9wwFJ05bJ409vjz8ZJDIbMT7+xZmpowS0WchNGgWrCdpVYOM/A1SNOIHmBcvXyNNdsCVGhqrQj0zUE4wU/2mH2NW5Tq/kCPGww0l6moqU2/GAHAAupdFWLLyrMIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731097559; c=relaxed/simple;
	bh=CEQbOGQ7MRdKXGHNLVjrKRQ53Dwr649n7vnBnnj8ctA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oNKn4ima/xjzJlugdMLoDFBQkewENuzhCBGyHWF9DurszNjP4vgGyv7X/HynkvWb9x+Zwi4i3Tt74LuQJeE1traOCBQL5EhQhiK750jcx9fpBq93D45oozcEjtrAwpcofayuzj+AjRZRsbbSxkJ2R9P1u2fjhqNbtlIVrtNnfZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=TNun1c5f; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-4609967ab7eso16619121cf.3
        for <linux-media@vger.kernel.org>; Fri, 08 Nov 2024 12:25:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1731097555; x=1731702355; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tkMMFzioKVFAa0nRKkB9RNN+8H7kOdLFjqp29pnighM=;
        b=TNun1c5fO/PpGMveSRkPiD1OPH0tF7NWeSRseoxVvPj5tIP++05Jq0DRTz2kklodwB
         idodLlAuT+2TCNRZy4niV7okbpJAR5C1lGaox5wPpBgHPb+YS0n1zhhdpEmP2Y1bw3jP
         vEA840b191t1MzsXs00r7aKE+FFzKrxMkXZC0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731097555; x=1731702355;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tkMMFzioKVFAa0nRKkB9RNN+8H7kOdLFjqp29pnighM=;
        b=O2H8YdX8z+w34lRYYWtJrSBT7DI4jmn5BZApPkIQ/m/kFRknsqqj+geCiX0HObyqxG
         kdMTvBbPZbnY0CvUyvdOBTymJYAdyyGCM+3u5KGQbvtrpK8MfhCDJQRIu+c3eaPfXY7M
         QV9bYI/RAvnJCewT/TxYdP9rrLgUhY+MtQpAfh6p3RJJnX0p8mgQNazpVmW++TUS2qR1
         bdZ4gXvUtktuUTQqBjhu2A0gB9HYodm7EmzQz/4wmE8sMiF9ftd2m54JQRqQqOxww+qs
         8iyK6dTffDH34ZLZMIr/8ul6WCpTH9b7zrPO+BSsWcUtGiUC7oG7l4RNYr4AjyNITR7u
         EJ4A==
X-Forwarded-Encrypted: i=1; AJvYcCUHzis1juCTUhTCVEoqGLG5BQThGm2P1KgXhUfLLrO3/SIPurjccWfNjX8m7qI/rxLwrzwKdUP++L9eHA==@vger.kernel.org
X-Gm-Message-State: AOJu0YytgTNebZhNgbSai2bcwR5Ytuz6jFa9YwBjvpMSEF3FWuS8LH1c
	dtsu84Tciais02egRIeTRzXmZ5hqn7stn0qtyJ4kAA76JELfflnMJdTvXCIbGg==
X-Google-Smtp-Source: AGHT+IHWOvV1IPVUo7h7yQ/dscufz+urxttXJhEzrF799ygWuSvfQI1Q+sg+Un/wfzS9P6xNNA9BQw==
X-Received: by 2002:a05:622a:18a8:b0:461:48f9:44e2 with SMTP id d75a77b69052e-4630921aeddmr58442371cf.0.1731097555504;
        Fri, 08 Nov 2024 12:25:55 -0800 (PST)
Received: from denia.c.googlers.com (189.216.85.34.bc.googleusercontent.com. [34.85.216.189])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-462ff46d440sm24207341cf.52.2024.11.08.12.25.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2024 12:25:54 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 08 Nov 2024 20:25:48 +0000
Subject: [PATCH v2 4/6] media: uvcvideo: Create ancillary link for GPIO
 subdevice
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241108-uvc-subdev-v2-4-85d8a051a3d3@chromium.org>
References: <20241108-uvc-subdev-v2-0-85d8a051a3d3@chromium.org>
In-Reply-To: <20241108-uvc-subdev-v2-0-85d8a051a3d3@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 Yunke Cao <yunkec@chromium.org>, Hans Verkuil <hverkuil@xs4all.nl>, 
 Hans de Goede <hdegoede@redhat.com>, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.13.0

Make an ancillary device between the streaming subdevice and the GPIO
subdevice.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_entity.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/media/usb/uvc/uvc_entity.c b/drivers/media/usb/uvc/uvc_entity.c
index c1b69f9eaa56..dad77b96fe16 100644
--- a/drivers/media/usb/uvc/uvc_entity.c
+++ b/drivers/media/usb/uvc/uvc_entity.c
@@ -53,6 +53,16 @@ static int uvc_mc_create_links(struct uvc_video_chain *chain,
 			return ret;
 	}
 
+	/* Create ancillary link for the GPIO. */
+	if (chain->dev->gpio_unit && UVC_ENTITY_TYPE(entity) == UVC_ITT_CAMERA) {
+		struct media_link *link;
+
+		link = media_create_ancillary_link(sink,
+					&chain->dev->gpio_unit->subdev.entity);
+		if (IS_ERR(link))
+			return PTR_ERR(link);
+	}
+
 	return 0;
 }
 

-- 
2.47.0.277.g8800431eea-goog


