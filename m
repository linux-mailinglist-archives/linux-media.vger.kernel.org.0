Return-Path: <linux-media+bounces-28142-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DCAB9A5F3CD
	for <lists+linux-media@lfdr.de>; Thu, 13 Mar 2025 13:07:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0507C170F00
	for <lists+linux-media@lfdr.de>; Thu, 13 Mar 2025 12:06:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE7AF2676C1;
	Thu, 13 Mar 2025 12:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="TtUwTCOb"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB574266EFE
	for <linux-media@vger.kernel.org>; Thu, 13 Mar 2025 12:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741867592; cv=none; b=gNGRkfttxE4nMQf2/okIgST5EJyVC6nY6Gggqfj3qZzLDDD6Cxs9y6hCSWOo2eeuvPsdl7H9kKy1preP9mHW1zvSBiEkyiMsK4b+VI5tr4jcloiiItMxKMXU95ltHvl2IjWpQUU5j2T4yHVTePonHsWFKLumcY+yGYnrU2CmNdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741867592; c=relaxed/simple;
	bh=TGrzXI9YKQDJkjN7BUp5Wnd1Z6+rVPCgyfw/0NpdSaA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=V7dlY44kSdiOaxvhpMYBl+Q1JXvoWn7m7YwSqzisWTlXxQJDWiu8TfCuLtCDqehgw5zyRXIejpmPoz4wLY0wFB4fXByUkrX8NIvo7CBRCYWIdXsJAG59VoCCrCq13exLtOp9IxRAPi/QmoLlkRxwUfSL5AmFedrA4y+V8SgCcR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=TtUwTCOb; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-7c55500d08cso77205085a.0
        for <linux-media@vger.kernel.org>; Thu, 13 Mar 2025 05:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1741867589; x=1742472389; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QVRqh3UaN3gOziVXPfdmS+tvyHN3C6l0olhTDl0Ea0I=;
        b=TtUwTCObajPMc534x698CzZdI9MrxAH2nDJaLQGQNgnialL+2hlCu/MtGzpaWCeyDk
         rys/6twkY52MAfOs1kqdD7Q0aOlbzycVPKYnNoepLx5ZgnxNl4Y5gveyYreoVACq3+a4
         MKhvkvUaFbluXraugO3YQFUuGC/u5I5iq0gGU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741867589; x=1742472389;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QVRqh3UaN3gOziVXPfdmS+tvyHN3C6l0olhTDl0Ea0I=;
        b=P2GgyG/vzkjpXfQPVol0LoHLCZ2RtXTTswYGiHg4cW1nLCqw3zaO8lJMflqkHTVWom
         U7OUoQTqwow/m+lWMWJUyv7qWl+XmlrDvgSGqJ6NjQpA1Sx1DNmkXEDebfWXwxOviLK7
         pV3QVbsTF/KAfElS4q+BqJygFwzTqhbSBYV0WSmlQqsZchDzW+aNgvpgHIoWiAv0nvFL
         23SdXadann1bCHKVt3sKuweJNnetZXdX3UZcXNUB0K732NfkJwitEWDm+lnUuF3GSPEw
         Yy3Y3g/pXOwnA7isKjPKeEKcvYoE10dgslkVY5IUkbQkE59eK1ZzDFo+SXcVGTjptVqX
         /6pQ==
X-Gm-Message-State: AOJu0YybVMdKkPA1pvWPDpT6vbPe4ojgQJZAaYtQ0pt3n+oKLasapx8s
	3t6iIR/i1SO3hYYdU/va5nBGXf4ONPANWLWDgSV4MbR42MfMxD8m3a8c20du2m3MicF7EvOKTSc
	=
X-Gm-Gg: ASbGncsafltccqOhfdp8lusiHcE6FaXWgzwSlz5ZMpVthlDn1GMKzUgcVGLacWvv2nl
	gBTYJPpQNLAqyt5lk4FJERbae6U6XFyHIfq+sXElDnycYUWGNadAguNxut0u0DQDWV1Hz/6oUhP
	i7z+p1fzpQvN2va3WW4ZMmYd5q4Ycs0HLFAYWX7/25W/p6D+lN3uMaxo9OPN43In9AsvTad9K9E
	hh2q2kvaLyq7EQqwQQao8Fe7y9gGptj7jTW5gQBYde7/zyviTyFT6xnlFQ7UrX3cg5HQcPwBs07
	ZhOIp6Pp8g1V3u+uqKSYhJQZcbJuelil8HfW5zt1q+87z4rgl5yQzTM1h8+JtQv33T+TqcRQxOL
	H/+ep71WN49rB+rFSrdt6jA==
X-Google-Smtp-Source: AGHT+IEImbQ+B32WsIFxGlRX2mY8st8KTjcmYXJFgpAh8j9I46osYfnpEiMBC+CME+WXzL8jHZgt5Q==
X-Received: by 2002:a05:620a:2b47:b0:7c5:4949:23ea with SMTP id af79cd13be357-7c55e968257mr2170930185a.47.1741867589598;
        Thu, 13 Mar 2025 05:06:29 -0700 (PDT)
Received: from denia.c.googlers.com (15.237.245.35.bc.googleusercontent.com. [35.245.237.15])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c573c4db57sm92117685a.8.2025.03.13.05.06.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 05:06:29 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 13 Mar 2025 12:06:26 +0000
Subject: [PATCH v3 2/3] media: Documentation: Add note about UVCH length
 field
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250313-uvc-metadata-v3-2-c467af869c60@chromium.org>
References: <20250313-uvc-metadata-v3-0-c467af869c60@chromium.org>
In-Reply-To: <20250313-uvc-metadata-v3-0-c467af869c60@chromium.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2

The documentation currently describes the UVC length field as the "length
of the rest of the block", which can be misleading. The driver limits the
data copied to a maximum of 12 bytes.

This change adds a clarifying sentence to the documentation to make this
restriction explicit.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 Documentation/userspace-api/media/v4l/metafmt-uvc.rst | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/userspace-api/media/v4l/metafmt-uvc.rst b/Documentation/userspace-api/media/v4l/metafmt-uvc.rst
index 784346d14bbdbf28348262084d5b0646d30bd1da..42599875331c0066cf529153caccb731148023b9 100644
--- a/Documentation/userspace-api/media/v4l/metafmt-uvc.rst
+++ b/Documentation/userspace-api/media/v4l/metafmt-uvc.rst
@@ -44,7 +44,9 @@ Each individual block contains the following fields:
         them
     * - :cspan:`1` *The rest is an exact copy of the UVC payload header:*
     * - __u8 length;
-      - length of the rest of the block, including this field
+      - length of the rest of the block, including this field. Please note that
+        regardless of the this value, for V4L2_META_FMT_UVC the kernel will
+        never copy more than 2-12 bytes.
     * - __u8 flags;
       - Flags, indicating presence of other standard UVC fields
     * - __u8 buf[];

-- 
2.49.0.rc0.332.g42c0ae87b1-goog


