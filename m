Return-Path: <linux-media+bounces-22101-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 060079D9B47
	for <lists+linux-media@lfdr.de>; Tue, 26 Nov 2024 17:22:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C0F642824B2
	for <lists+linux-media@lfdr.de>; Tue, 26 Nov 2024 16:22:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8227C1DDA36;
	Tue, 26 Nov 2024 16:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="HIvJtrmV"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DF051DACBF
	for <linux-media@vger.kernel.org>; Tue, 26 Nov 2024 16:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732638033; cv=none; b=g3Sqq0GpOlLO4ExKrQ5f6uqqj4NsxOfdJeX2YGKywa+sNd8J5lhj5WBlGHZYCz5B+O4SGrA34X4Cavn+WXgSUVhQQAverhjkg1OJJVkWxGx3tIy+ZupIUc/EInojcDPF5YFiQCM/T4knawbRd8VdSwU4igBnS929YuYNJpEh7I0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732638033; c=relaxed/simple;
	bh=HyqCzaymRik4He7GN3tEcdLeiRbjJnfCdIYBk4WebLk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FGADII4TbrGruShDBfTB6zcHpC4IMrweRqrnKGUaifHu9D1/m30VITF5u7zsLViBZwSsE69t0wkhvsNb8vomKLGC6encZPB9Kd/0156rrO9fLd1YvihUQvVDhJMsmWw/IIsjiRY5PkZ+r4VSv6aWw4FQDQGZMrIQK4ywDYscLAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=HIvJtrmV; arc=none smtp.client-ip=209.85.161.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-5f1cec20a77so1142991eaf.1
        for <linux-media@vger.kernel.org>; Tue, 26 Nov 2024 08:20:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1732638029; x=1733242829; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oqSWPss0imTjEBvgoF+O3/N5JaCFfxEYIjh5jyzakaE=;
        b=HIvJtrmVAwGkxd67/HmMmk6/2TZfIMvu60ERUNIt/x1wZ7BQT1jFskbWfHuvlfgq/I
         TZP28N353+K2rKyksjfJw8qiCQAMYF7ONIpTTVJQx5eMe17xUb5iD9TIqaWdMd8ytU41
         HkN+7IisnUfqA1uz4qlewA2na3kGXoIRonSZ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732638029; x=1733242829;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oqSWPss0imTjEBvgoF+O3/N5JaCFfxEYIjh5jyzakaE=;
        b=d+5kC4B15cbuLYf+dx6YoPqaAVKWPDpQgStSlEdRBWCjT+eoICajALKEL/UAkwUTvh
         FNlgXwkm4LPr/Af95EiTBnVPEzFloM5c8p/ZegTlWHOM24GIR/ns+GP+mW0n4gslqwSD
         /DKKHL8Vz8+u8Zb24Auj61NbTSTdF4eiYpUv0h47wihQz5nlyPg+dMahIKYN+hW883BK
         FceXFYdcOrzWBmK2ZjMXwJ8wuIxayTCFcI9jkvsGZjQ6NY9E4KOLZ+RYWZEj/i662xoE
         5XTZKSQj4QVjyn8ttfnEIisBY1PyH6CtWpeKLPAkCC5zVTM8oinou3cRVQ6GgIcbjRNc
         vWbg==
X-Gm-Message-State: AOJu0YwT5TFfOR39oWTIpYjPIGJl/vFJvdqgMHjvw2fDpA9WJTQNKY2m
	bhjDu9SqhHNIu7I4BxbB4+60J1XH/9cOi1kGtfmikX6H3WDNiki8pdgzqwIK9g==
X-Gm-Gg: ASbGnctn5yS9y/wqrZJsjZ3ovKpg3jRfg3XwFg2/Ut3xn1B9Ne3eX9T7Ejvdm/ddFXl
	miZxD7MpNYcswidKbIq8xZIzTC+dLCFu5ebxmWVKVHp435jjD7GZ5uLbvcFiM0l2HLoMGzM0VTW
	xJr/o2JT6rRJOYTHobLhhnU7UpPV+T1WbwJElEgE0CxnkacCAaVhPO1sXDUBpFJwHZMpEvSZNbt
	ts/YkOipG+X6Nm7OOI/6At/jRI2a2YsDyOyXpM3OEyRev2yfpQptPPuWydknPUHZ9StQG4VFVfL
	CNnomaeFtLmkwJRDv+85vQjt
X-Google-Smtp-Source: AGHT+IFSeCLAxLBaIb6/TUqzxFH7lB3SI+CE6KSiFU+YQRWCA4HwT+r88u630f7asyH+jTHjbUh/lA==
X-Received: by 2002:a05:6358:9209:b0:1b8:f18:3e6e with SMTP id e5c5f4694b2df-1ca79724369mr996360055d.12.1732638029389;
        Tue, 26 Nov 2024 08:20:29 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-85b4e8205fdsm346532241.1.2024.11.26.08.20.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Nov 2024 08:20:29 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 26 Nov 2024 16:18:55 +0000
Subject: [PATCH 5/9] media: uvcvideo: Add a uvc_status guard
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241126-uvc-granpower-ng-v1-5-6312bf26549c@chromium.org>
References: <20241126-uvc-granpower-ng-v1-0-6312bf26549c@chromium.org>
In-Reply-To: <20241126-uvc-granpower-ng-v1-0-6312bf26549c@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.13.0

It helps will help will the error handling of PM functions.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvcvideo.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index b63194a9c64e..c38ddd10307c 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -759,6 +759,8 @@ void uvc_status_suspend(struct uvc_device *dev);
 int uvc_status_get(struct uvc_device *dev);
 void uvc_status_put(struct uvc_device *dev);
 
+DEFINE_GUARD(uvc_status, struct uvc_device *, uvc_status_get(_T), uvc_status_put(_T))
+
 /* Controls */
 extern const struct v4l2_subscribed_event_ops uvc_ctrl_sub_ev_ops;
 

-- 
2.47.0.338.g60cca15819-goog


