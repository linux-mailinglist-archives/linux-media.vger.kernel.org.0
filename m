Return-Path: <linux-media+bounces-23018-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B805B9EACE4
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2024 10:50:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C869E188AD73
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2024 09:49:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B61D23A56E;
	Tue, 10 Dec 2024 09:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="X7SF+lDz"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 299C1237A4D
	for <linux-media@vger.kernel.org>; Tue, 10 Dec 2024 09:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733823795; cv=none; b=IROEStX/6LV2WxHi/aQj8ZkGj6BHx+qCUTWAkqD6XKRI+pDnQTjGbYAUC/oA+lWiFRe971yuaBGIjfvksQhObwH9bNslSRBp9Ykz7pm355eFpRGTYbuHw4xSRFinFyNOtuXo9MtmsWQ+Jtjfd76ku1O4lINY2LuuvTFR5rM0ADg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733823795; c=relaxed/simple;
	bh=HCkd9QY2OfGozb/+L9hVVayAr5QQOjRc9Dn84hpf1DE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tvr0RUXtB9TrCUnO3co1UAMjl2mz3cml3pWPK/hCj/6IGFF4oeDiS2+t/WxL9iVFs6b3B0quJ5uwuTGvV/TiGOQs2T3k9bnB6hIdTrpfNZ2UhFJO9o35lw7AQhNEH0P9KFUcdSifRIpNPY9L4sbpYR4la2sl+e/edSOHJocAMJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=X7SF+lDz; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-6d87fffeb13so44134916d6.1
        for <linux-media@vger.kernel.org>; Tue, 10 Dec 2024 01:43:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733823793; x=1734428593; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OHxayE4k42tgzCvBKbSWRnUHa8HIxT/un4VmPqqRwYk=;
        b=X7SF+lDz6MlNUHuAcXYN3JW/5Sv0DP77lsEtWLll/i75RbsNmLGGxt7OzyZl6BO7Np
         sfT654aLtUBMjISTP9sq5TVvqUAjgP6lVwVzGbQCfA/sbnbF/Q0uv56iQEM5nZbyX6v1
         07tqyifhnyzEiL1hrDpP/zv8IISPW98lt+RPc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733823793; x=1734428593;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OHxayE4k42tgzCvBKbSWRnUHa8HIxT/un4VmPqqRwYk=;
        b=gc17oTJtI2K3iBoU13EcvMcjIsFgFzHfh1EkbWod/AvSSI0khIjbtgFesw+ubDbo+M
         ubyVBwF1PUre5X9tIE6DgTcWIfQzgxboJ7ip/7wmksMpru8XG/kjitcVXTYmRpMgl6Dx
         6XBETu5qsUfl2CXfeffUMHo8eJObi/dXCwATCge5W0xBw6j5+Lzr8XylW7T+8upMoFsz
         LvIHrECPt06FjfZ9mjprpSg0EMwlnhoppx7yXRP0d2WZXaEA0ENHmJ8PQuTGHtc6ueF6
         R/mF90ElNTbzK3oM3F03aN/yublug4dLVPEimipIiZ76fuQmrwT8iorZXBZKhz4jBkre
         +N+g==
X-Forwarded-Encrypted: i=1; AJvYcCW8DMXa6jH2tRRE0dm2RY93B8AWYy6NevdvOy2lFQcVvnlh6pSVNOYMbQ9Uvjcx2vB8SidaYycWwVRqnA==@vger.kernel.org
X-Gm-Message-State: AOJu0YykYOPhRdRYyvnnL41ifYF0LEiAH6PGkZ0JBmZsDmKVbEYSQyO4
	gc0QNgnE4MXJKc/5y5YUWPD1dYFxfHCgalr1b2lfRj9jV+VZBvjRo2/h6CPgzA==
X-Gm-Gg: ASbGncuqgZ678e6D1eupJrBTkI8F6nujtilnEAVXc7KLf5PsjoIZgfPilDZzAf254Rr
	dAAEJhSJRd8Jt6RIaSc4WxGhL4wQIMrV5dDlMFjc1zLdmsGnQ1Dl89QrtFJ5BBC7A3NrRDk9BWU
	mRbT39HBrEEju6npGGfjdggczSDyxVproWXQD8IJV4lefni4T88UWGUAsYt1fKQiJSdjkcQHyRA
	v0uK1iuAOwH7jpU9o4oOKygCqpfJF8z5K6exFjTFA4hmVkJqlBkZ+CPr8Bh+L68gfQePs8bB195
	8X7QA6I1HoqpXizINWSSI/SnBDPs
X-Google-Smtp-Source: AGHT+IEdReo0MRnNlTyTmOkuTUdcKCx+CoS8N4Bbe9AR14bTkRgBndNrGwfcStRIkm86B2Q5mtIIRQ==
X-Received: by 2002:a05:6214:f62:b0:6d8:a148:9ac9 with SMTP id 6a1803df08f44-6d8e73be7c3mr272587766d6.30.1733823785070;
        Tue, 10 Dec 2024 01:43:05 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d92f7c2bc1sm773326d6.83.2024.12.10.01.43.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 01:43:04 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 10 Dec 2024 09:42:52 +0000
Subject: [PATCH v16 16/18] media: uvcvideo: Add sanity check to
 uvc_ioctl_xu_ctrl_map
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241210-uvc-roi-v16-16-e8201f7e8e57@chromium.org>
References: <20241210-uvc-roi-v16-0-e8201f7e8e57@chromium.org>
In-Reply-To: <20241210-uvc-roi-v16-0-e8201f7e8e57@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Hans Verkuil <hverkuil@xs4all.nl>
Cc: Yunke Cao <yunkec@chromium.org>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>, 
 Yunke Cao <yunkec@google.com>
X-Mailer: b4 0.13.0

Do not process unknown data types.

Tested-by: Yunke Cao <yunkec@google.com>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_v4l2.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
index 5000c74271e0..0d9d056f1bbe 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -106,6 +106,12 @@ static int uvc_ioctl_xu_ctrl_map(struct uvc_video_chain *chain,
 	struct uvc_control_mapping *map;
 	int ret;
 
+	if (xmap->data_type > UVC_CTRL_DATA_TYPE_BITMASK) {
+		uvc_dbg(chain->dev, CONTROL,
+			"Unsupported UVC data type %u\n", xmap->data_type);
+		return -EINVAL;
+	}
+
 	map = kzalloc(sizeof(*map), GFP_KERNEL);
 	if (map == NULL)
 		return -ENOMEM;

-- 
2.47.0.338.g60cca15819-goog


