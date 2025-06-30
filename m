Return-Path: <linux-media+bounces-36309-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1863BAEE07F
	for <lists+linux-media@lfdr.de>; Mon, 30 Jun 2025 16:21:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 49DCE16ED43
	for <lists+linux-media@lfdr.de>; Mon, 30 Jun 2025 14:21:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E92528DB61;
	Mon, 30 Jun 2025 14:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="g83xLC1o"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 884F928CF74
	for <linux-media@vger.kernel.org>; Mon, 30 Jun 2025 14:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751293235; cv=none; b=jOIm8AQR2vDck6mmqfiEC2CIG5eqdsFI9/0lFLKF4wQ+25OQ1Ma2EGb96IeOoEuotsbgWbjgPkLN/UJzMiY0k4kheHUSrE7HFJfnwp5ijA94tZmWwg0ZopCv645bLDTZz5uzlq7ZWn+BE+9iZuviYt3PtdK1mdRN8S9xQNfH6qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751293235; c=relaxed/simple;
	bh=kmRTm9kyR+46n0xfucUpkYJjdAw04RXMg4vx4GWGzVE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J98ZxKd0EOt6pxr42YEYAOvYBSVXjB55itjUix7PWWt+dTBrHdC7PXVOB+5FPnJSaP8VTxsAvgJ09JikinepZKgHS4bt+syAJ4lZnyU52SJUaraVnvmc9Csa0AN8wW2hm/+Eta5H07JyshBdwSMFKMlMZ4mtdkCxZ9Kcwq9sq68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=g83xLC1o; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-553be4d2fbfso2424749e87.0
        for <linux-media@vger.kernel.org>; Mon, 30 Jun 2025 07:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1751293232; x=1751898032; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xvxAKM98pb9QJ/qUv4r/ub1kcRedtcU6A5oFVUSoXHg=;
        b=g83xLC1oO/lcJqpsPeMf9ASMPZp5h/BFYsfhr+WO8SzUKx98gudKRQTa4Ddrnn2oSR
         8IE4m7H6Ism39yg2lbVXnXd+JqW8vVarMc1/yk326ouPPFzFas9nTVrcuJ+DuUzy2MBV
         EAvcmnCypiWicWRrM+Hv2rzTxxR5IrCkvwz64=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751293232; x=1751898032;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xvxAKM98pb9QJ/qUv4r/ub1kcRedtcU6A5oFVUSoXHg=;
        b=IbChJOhVCWZ5BHzoTi3UviR2naov2fm9P6VZAcziH0YaC1z2f2qOUz8sRN5xXfgeOi
         x6Ed8njJXIgohQeVpdwIrRh02IrD6+P2Rqe0gm51/GqA+tVebdo8JQ//o0O3qU7phjzo
         PNK0ZSnbwdTdx6TpfogaBqXJo0rH5wSP+QLgNhseJJwSjoeIX3PYwoh5yPZddvNvCk/m
         eETWp0gdNYcenfhMxIIdJ9eZuCD91DCJeaSnCeeAXNf/H44zsFRf2ronZODvsFPqE6QG
         B033wVkze3Ivgp8GC3Mcn391ocHGuGf8hfKj+vxTnumIjD7BkFOM6jqUPRXZjhWmXavF
         4h6Q==
X-Gm-Message-State: AOJu0YyKtas4XtEKUmRHSiIqIL4+VAbkPO+j9747uiad+UNDAVaog6kl
	hDbITIsoodaIYt5zDbOvQmAXYsMG1xUZcj9g8aZlirKTcVMlWNtil8W/ZH+3b0h7lw==
X-Gm-Gg: ASbGncuDgwau6h18P+GS/tJ+Z8f8Pn38dqyNe8iA1tP3Zj/p9IDoegJSMihO+lrLQ+Q
	XspP4uWHm2yp2SSVBjx6FibHBzqGemQkbRsV403NiMG6TdLVPS9kmFbTUa03mvWYkznaLpk/F67
	PIKb+TAUvGrGUe4TTHqMubk5jTJKn8mIFfJ8kuUxtMxPB8SzOiNSp7YVujVvNbBgTm7xYaB1Ewf
	3aH6Ed1uH2xYwDPiHPlpdcvsq3SJdH5yjS75fzH2CeIMAJBwNIWlHHgl1DMXhtKSqqP2Ndz54Xm
	ERXTo/sHVa4xCPXz4iGOie8sWiyA7qNIe+GCF9QG/eBUT3p2rDr9RZsrb8JZYLp9rjuLUXZSJCH
	0trWa1QOrXuopjCoW7P/QAMnqgaHz7oMxk0LjQILr4Q==
X-Google-Smtp-Source: AGHT+IFKrR5YCaYnhS5iD0uImmyjOzhm8bzbacAYk7AWZ1KupjzDmN0IxVjJ2iXbSGGDEwb9B5VosQ==
X-Received: by 2002:a05:6512:3d1e:b0:553:3892:5ecc with SMTP id 2adb3069b0e04-5550b8ce576mr3858682e87.36.1751293231523;
        Mon, 30 Jun 2025 07:20:31 -0700 (PDT)
Received: from ribalda.c.googlers.com (166.141.88.34.bc.googleusercontent.com. [34.88.141.166])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2d8ea8sm1432363e87.210.2025.06.30.07.20.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 07:20:31 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 30 Jun 2025 14:20:30 +0000
Subject: [PATCH v3 5/8] media: uvcvideo: Turn on the camera if
 V4L2_EVENT_SUB_FL_SEND_INITIAL
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250630-uvc-grannular-invert-v3-5-abd5cb5c45b7@chromium.org>
References: <20250630-uvc-grannular-invert-v3-0-abd5cb5c45b7@chromium.org>
In-Reply-To: <20250630-uvc-grannular-invert-v3-0-abd5cb5c45b7@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>, Hans de Goede <hansg@kernel.org>, 
 Hans de Goede <hansg@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2

If we subscribe to an event with V4L2_EVENT_SUB_FL_SEND_INITIAL, the
driver needs to report back some values that require the camera to be
powered on. But VIDIOC_SUBSCRIBE_EVENT is not part of the ioctls that
turn on the camera.

We could unconditionally turn on the camera during
VIDIOC_SUBSCRIBE_EVENT, but it is more efficient to turn it on only
during V4L2_EVENT_SUB_FL_SEND_INITIAL, which we believe is not a common
usecase.

To avoid a list_del if uvc_pm_get() fails, we move list_add_tail to the
end of the function.

Reviewed-by: Hans de Goede <hansg@kernel.org>
Fixes: d1b618e79548 ("media: uvcvideo: Do not turn on the camera for some ioctls")
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_ctrl.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index 303b7509ec47964dc1bf0e28127075b4a3867511..e84aaf130c73403a6c818deceadf404a2975c816 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -2072,18 +2072,23 @@ static int uvc_ctrl_add_event(struct v4l2_subscribed_event *sev, unsigned elems)
 		goto done;
 	}
 
-	list_add_tail(&sev->node, &mapping->ev_subs);
 	if (sev->flags & V4L2_EVENT_SUB_FL_SEND_INITIAL) {
 		struct v4l2_event ev;
 		u32 changes = V4L2_EVENT_CTRL_CH_FLAGS;
 		s32 val = 0;
 
+		ret = uvc_pm_get(handle->chain->dev);
+		if (ret)
+			goto done;
+
 		if (uvc_ctrl_mapping_is_compound(mapping) ||
 		    __uvc_ctrl_get(handle->chain, ctrl, mapping, &val) == 0)
 			changes |= V4L2_EVENT_CTRL_CH_VALUE;
 
 		uvc_ctrl_fill_event(handle->chain, &ev, ctrl, mapping, val,
 				    changes);
+
+		uvc_pm_put(handle->chain->dev);
 		/*
 		 * Mark the queue as active, allowing this initial event to be
 		 * accepted.
@@ -2092,6 +2097,7 @@ static int uvc_ctrl_add_event(struct v4l2_subscribed_event *sev, unsigned elems)
 		v4l2_event_queue_fh(sev->fh, &ev);
 	}
 
+	list_add_tail(&sev->node, &mapping->ev_subs);
 done:
 	mutex_unlock(&handle->chain->ctrl_mutex);
 	return ret;

-- 
2.50.0.727.gbf7dc18ff4-goog


