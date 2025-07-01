Return-Path: <linux-media+bounces-36384-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA085AEEF26
	for <lists+linux-media@lfdr.de>; Tue,  1 Jul 2025 08:46:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D1D017AA287
	for <lists+linux-media@lfdr.de>; Tue,  1 Jul 2025 06:44:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C89342609D0;
	Tue,  1 Jul 2025 06:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="cVFyVHz5"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0763F25A62E
	for <linux-media@vger.kernel.org>; Tue,  1 Jul 2025 06:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751352331; cv=none; b=Z0M6tFRYOPyY/CywRWdr8F/7xza++GDThqXU8ZJ8B2dzP7T1vHJbPUlCYkjd4czMqubhiYxH6lWKwieDjed4S8uWBv33DSQzFZFS87kONx35VOUEC40e8j0EJWO9Dc0JJRxtajjzMX67fsyMJCIqLVbyNVpANbiymLVX2HjbDyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751352331; c=relaxed/simple;
	bh=T/ENgDFNkXtO15nvmRhR15iE4Gpc/i5d+Eopejkp9ok=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kyXGl9S5+1Cn6ZIKuD7Ol9MESQU8rSZM/QoSAytAdDsrlrpEfHSiQXdMOYVwhxE469tk6yosJCCQeAicnpILt8vG7XbicYU/TV8Cf++qBSVNFi5aeL0buLqkKYgJs7GehXCZ+1igiZRp+q+NobZ5TEj44487rCwwlH73kZdsVvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=cVFyVHz5; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5551a770828so2096701e87.1
        for <linux-media@vger.kernel.org>; Mon, 30 Jun 2025 23:45:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1751352327; x=1751957127; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kZdlFdfPdmkQXJkoN8XjUo5zo6CJqcXC2iQo+5kU+Hg=;
        b=cVFyVHz54lWvTGZpZjp90kB7Ja1MJ8KStzTO1ykvoFJtoYyrxWNBRpnN5RA00LVU00
         tGzhVBzV6llqUUsVdMJqWiOpFwzz1/wDKK7x0HDj9JLRMvl0/jLxvUF7GhRaTQUGJh3d
         4O6D4/5KH9WB5amOXTaYW+RGIDGMwOq2F8ir4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751352327; x=1751957127;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kZdlFdfPdmkQXJkoN8XjUo5zo6CJqcXC2iQo+5kU+Hg=;
        b=CXhAmnsRw8FY/HIiRSZbtHV+dnqlXNEl6Lr4jZlzd+YbCOMyYusRDLw6CXDnR752y6
         2P/RO8PgA2dTwD6nmUhCe/NndQBe0zUCAd/Xx86vyV6dznziVRI0P8bGTHKRXriQZL07
         zJmZorCc4WFHoZg2JDTxv/7tCaE7IMl3OjiN0ihDMPjYG78vjz9zyyPza0aXt7O8vbOS
         i1gNxu31Sko89G5Vm5UdawT+dy+qiyB15D87eRkITHAqSHNrq82jw48xWBFq1BQvl/Gl
         Z/TkZfXP3RqTdASurwuExmH/BlQSwOUc3xim/wywfZQptdhVqfL9YfCNtgxnqvmZRw3x
         D7cA==
X-Gm-Message-State: AOJu0Yw9Hh5fNnlcC+JncGkNcCkxw37/LYYUSZjhG6mTcMMLZML1U3sq
	1tNijwNj+byvUnlhWd/8ypeNAnH/RInKfvAvzAA877rIW/+pDsIYZPRJsiIMQzvgyrpZo2ZgwKr
	q+a9pSA==
X-Gm-Gg: ASbGncvlr20+sEyKTiyEk05NnU6lTZRQJqkgGGo7DeCxnHli9N69AnHq8YZy77nVCRZ
	wnEgnA/SVda9f4uDTGBY5Ct7Z4+sMfKn1raX7pRvugHsAvcaU7LFiWAAI+BfGicOnK4FZBX1Eme
	9U5qUw9h1FiX8d6TEqNR1/F4vGsRCcyAH0/h6wNzX2WkQ/r6nK8CX55Cw9JE27Z7euF0nCGjRw7
	Jdh6SB8jWtDB9IND1xwgGf9N0yWWl4No4eNFggQS1zhXOEL5J8cQhbcgQJJO/WInHVfjEGU9Etg
	oPiHvEXdUcRx8zu2Ofv7FGThlrmJ+fTWHoJYsl4WDm3yLN1QDdSLh6GC4N2YyH2oA7hCUM9BKF4
	8pKy69MDeajB4szRzRq9L1CN9xrNORnrn+sHp+A9NUA==
X-Google-Smtp-Source: AGHT+IFUk5DwN4L6iLti9NTtyA0INwfyi72kxI97Q28rnDFt6sVumziGfDhe56SIw4UeX08NLnkvdQ==
X-Received: by 2002:ac2:4e05:0:b0:553:33b3:b944 with SMTP id 2adb3069b0e04-5550ba44a0dmr4812865e87.54.1751352326511;
        Mon, 30 Jun 2025 23:45:26 -0700 (PDT)
Received: from ribalda.c.googlers.com (166.141.88.34.bc.googleusercontent.com. [34.88.141.166])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2f162dsm1704836e87.248.2025.06.30.23.45.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 23:45:26 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 01 Jul 2025 06:45:17 +0000
Subject: [PATCH v4 5/7] media: uvcvideo: Turn on the camera if
 V4L2_EVENT_SUB_FL_SEND_INITIAL
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250701-uvc-grannular-invert-v4-5-8003b9b89f68@chromium.org>
References: <20250701-uvc-grannular-invert-v4-0-8003b9b89f68@chromium.org>
In-Reply-To: <20250701-uvc-grannular-invert-v4-0-8003b9b89f68@chromium.org>
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
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_ctrl.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index 303b7509ec47964dc1bf0e28127075b4a3867511..efe609d7087752cb2ef516eef0fce12acd13e747 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -2072,18 +2072,24 @@ static int uvc_ctrl_add_event(struct v4l2_subscribed_event *sev, unsigned elems)
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
+
 		/*
 		 * Mark the queue as active, allowing this initial event to be
 		 * accepted.
@@ -2092,6 +2098,8 @@ static int uvc_ctrl_add_event(struct v4l2_subscribed_event *sev, unsigned elems)
 		v4l2_event_queue_fh(sev->fh, &ev);
 	}
 
+	list_add_tail(&sev->node, &mapping->ev_subs);
+
 done:
 	mutex_unlock(&handle->chain->ctrl_mutex);
 	return ret;

-- 
2.50.0.727.gbf7dc18ff4-goog


