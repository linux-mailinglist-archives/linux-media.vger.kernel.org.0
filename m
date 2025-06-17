Return-Path: <linux-media+bounces-35101-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C1B99ADD05D
	for <lists+linux-media@lfdr.de>; Tue, 17 Jun 2025 16:48:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 016503B973B
	for <lists+linux-media@lfdr.de>; Tue, 17 Jun 2025 14:43:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAED92E54A6;
	Tue, 17 Jun 2025 14:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Qiveonxq"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9410B20AF9A
	for <linux-media@vger.kernel.org>; Tue, 17 Jun 2025 14:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750171358; cv=none; b=H6904BZcsu9zQ8aOuRUbJl+RHxTnfF49V8Clrbc+i5GZKUfT+SrB7RzA6mlBwGbmRlT9zSHDngKIC9vWIh7JGQ+4QlvkcmcUDmlSmED1/TqkSdpbusPaR5RX10mEptLfVAP6DWrqZaO7g62ffyT0uFTZQFRREIYj1J+UBRermIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750171358; c=relaxed/simple;
	bh=bYdXHZgcVr0efBjTgUPsB8+QuqvjW8HoLU5Tp9AdihQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Is5kzsPu48uJuftoHtmcW+Gi3Y3A0mYq+aslx0Ttde8aFslO8g9RT/H0keueiPJFZhUsy5OgEnuP5D39KAZ0JVQSGVLpqvuKLH7FzBRddeugR0KUn300Cxw9PwanqG5CgaYjvvioHKsh63sbvNXXDO6ZxtycUo5yDBfSrJDUouQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Qiveonxq; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-553ba7f11cbso3322249e87.1
        for <linux-media@vger.kernel.org>; Tue, 17 Jun 2025 07:42:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1750171354; x=1750776154; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0xlu3CSgyiphpvjrJ4zGRNfneVAXEwqkV8GfJcaFYtI=;
        b=QiveonxqdrRLMX9k4hobfSqIumO2vT6j/GmEvWxTx9mJCiZGY4CDiZlDhv6YMnEouM
         VJiT87HOS9rKUxmS/K3jVARBolteplWl6TwKAD8ODbeonvL1qQ9SSLgLbXBphTFS8Cs4
         hDCeus9kg9AFCpJXqkvrOcmdNIU1yRSmW4RNs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750171354; x=1750776154;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0xlu3CSgyiphpvjrJ4zGRNfneVAXEwqkV8GfJcaFYtI=;
        b=b04V0m7G3koYx8GczHc0fYvEbR0uyVhNE5gFkukCUeKx6G9jCoYeoLGTIprS+uyLcU
         GOt6JaF9ZkIX2omr0wNMRKac6Osf990FcVmfJ2KMBNPXbNgeZZaE6PjAmIRkhzT1Mtty
         rIuKG9A3uEO/owEJoe6PYBXIIlsoKpLy75P1nZkLmPhlfLnwN3rbW03tZR6gZbt54FUN
         Tqoj6LDvsMYy3x6bXqbnxOHrJHfCBztNKciLbr98nvDd3C4JiRDkwNgJKT0d6Tzu8U2Y
         CYolRYSFNEN5x58u9wZDAyTnHUro/zIn4/gu9Lo9edmjJmTooVGu8lYAf6rOwg7um8Ye
         Bfwg==
X-Gm-Message-State: AOJu0YzM5wOx5HLNRd+bo4qGL0eqWUguoMY3tGzZPQJ/Sm9ugHm+pFXv
	nd7p5APdrlpeX4xZkSgArbILaB7Y629FC5lV54QFw03uvZ82LcH8s0yFmfpNJHkKRg==
X-Gm-Gg: ASbGncsbvAGe62PF9LawK20vejpq/5X+AkH8AXgn5JsBS/c+nRDlztXq5GTTmG/N0Yo
	jJHF5V2SlWFRDULuHEeTtexaxcRQNKkxu58D0EEeUEYqAt4S35ajuhZCqB/9/q0y5aAA3UuoPb+
	GK7XrNzID9nJ9iogllS1JkWT0zH15Ee3kwbUEYzBSfa8aX+HMKKeNV3tj0jWain4YCpAUeMnsuL
	TP0eC7xh5CDA3+Lu2yU/yML095X+V6DI5aoXZqYQWR27CZMsiz+Kv9/fbXjn3B2+MFz2RSpwwcs
	Oj/UcLck5FYpBSfHduPvpq3/Y5n6F/9KEv9bfT7qvt5khctYPAH7nSdhoeTWeR+483YNkE63HYG
	xGPrvDHmwTiTf7LlE4BhXQEEDg8hol6qlJDBhnrdX5Q==
X-Google-Smtp-Source: AGHT+IHSNhO5TwkGdfM9rWVrhKnKMpikCyF46rs9ZtD7y07NlXl7lvAuPvpPwbsqhlOXn7g3p/KjdQ==
X-Received: by 2002:a05:6512:3e0d:b0:553:a8bb:7472 with SMTP id 2adb3069b0e04-553b6e8c40amr3461768e87.15.1750171353679;
        Tue, 17 Jun 2025 07:42:33 -0700 (PDT)
Received: from ribalda.c.googlers.com (166.141.88.34.bc.googleusercontent.com. [34.88.141.166])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553ae234437sm1814992e87.53.2025.06.17.07.42.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 07:42:33 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 17 Jun 2025 14:42:23 +0000
Subject: [PATCH v7 2/5] media: Documentation: Add note about UVCH length
 field
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250617-uvc-meta-v7-2-9c50623e2286@chromium.org>
References: <20250617-uvc-meta-v7-0-9c50623e2286@chromium.org>
In-Reply-To: <20250617-uvc-meta-v7-0-9c50623e2286@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Hans de Goede <hansg@kernel.org>, Hans de Goede <hansg@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2

The documentation currently describes the UVC length field as the "length
of the rest of the block", which can be misleading. The driver limits the
data copied to a maximum of 12 bytes.

This change adds a clarifying sentence to the documentation to make this
restriction explicit.

Reviewed-by: Hans de Goede <hansg@kernel.org>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 Documentation/userspace-api/media/v4l/metafmt-uvc.rst | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/userspace-api/media/v4l/metafmt-uvc.rst b/Documentation/userspace-api/media/v4l/metafmt-uvc.rst
index 784346d14bbdbf28348262084d5b0646d30bd1da..4c05e9e54683a2bf844ddf26f99d0d9713ef05de 100644
--- a/Documentation/userspace-api/media/v4l/metafmt-uvc.rst
+++ b/Documentation/userspace-api/media/v4l/metafmt-uvc.rst
@@ -44,7 +44,9 @@ Each individual block contains the following fields:
         them
     * - :cspan:`1` *The rest is an exact copy of the UVC payload header:*
     * - __u8 length;
-      - length of the rest of the block, including this field
+      - length of the rest of the block, including this field. Please note that
+        regardless of this value, for V4L2_META_FMT_UVC the kernel will never
+        copy more than 2-12 bytes.
     * - __u8 flags;
       - Flags, indicating presence of other standard UVC fields
     * - __u8 buf[];

-- 
2.50.0.rc2.692.g299adb8693-goog


