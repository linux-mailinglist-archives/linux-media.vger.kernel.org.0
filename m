Return-Path: <linux-media+bounces-28141-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C4963A5F3CC
	for <lists+linux-media@lfdr.de>; Thu, 13 Mar 2025 13:07:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BD34E3B603E
	for <lists+linux-media@lfdr.de>; Thu, 13 Mar 2025 12:06:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FAE3266F14;
	Thu, 13 Mar 2025 12:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="lfxjgeLv"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4212C266B67
	for <linux-media@vger.kernel.org>; Thu, 13 Mar 2025 12:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741867590; cv=none; b=ULYGH1O0ZSGl40pxThQ2fiqLF+lN6TzhSpQV+eeijX5J4WPbxLhHs881Kk2QKsM5cPZWb6y6KjI/6a0rSMvYH1DPclS7VdLZD3fTpCGK7rmrwvs0MPjnjAJYDcWEgs3X5I5us6/Ac6zWW9GMgVEFmpiCEUjaCE5fcVAE+fznGss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741867590; c=relaxed/simple;
	bh=TdeKYj+nKDmLMq5rDHi0EKfmM8Q9c+Fp2RgC37HVEwQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BZKbVgxMhkywS2yJp1eINMWHsJRhPEypFtn0xffbh2nZHNyM9rwCy2QmQkuorEd4G2SJmmEEq0oU6XIoguppB6pappo641v9shUxfHua4YPCjXNeCMb0D2FTvWOfPvv806QBoCFOY2Yhyvd3VVrv/ceOXTPbsSf48TDpVNvQWG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=lfxjgeLv; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-7be6fdeee35so144483485a.1
        for <linux-media@vger.kernel.org>; Thu, 13 Mar 2025 05:06:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1741867588; x=1742472388; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E3p062ai1AaXGIlqJv8w3IqJw84i5gPWV6oy5k5lnYA=;
        b=lfxjgeLvKObeZgFihWb0q52OYllBAKTdF/4lQ7HCrmU5Ign3Qf85EdNwKEnH5McfiQ
         RlOGZj7dQ1ZuTdkFMephTsFrTUBDna2WLKl6IDTAmvfn/RK9JbprpFJa+rWoeLFANhEz
         Tb1MnLvdy/4Ecf9myTEc4r7kOJLzSIkUWPGGY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741867588; x=1742472388;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E3p062ai1AaXGIlqJv8w3IqJw84i5gPWV6oy5k5lnYA=;
        b=eoHZ2N4xAJU8oTj7wOIB5MFNt2lWVo3R48peCdcR/1XIeK26B1yO2mimuhFYB1N80z
         3XVAc3V0r9t3Qa4Ru8aUK4APLvvbUSFQQBKIZ/RiAuwAAcaUO88WS4Kxf+pdLsNSIZU6
         jPm2WjNhtzkmsG+xKcbwa2gdVEpqFq6QmeEls/RD0KXU6KUU/bcvEZ6rD2nZ4o28Vi9x
         cIUDP4dnI26fe5TslOY8CU9cPEeSyvYfs918lPnKjYlO2rj2kK4ewQeVF4ZTEomgw4GO
         qk/Cf5ulC0D6j3H4fY6onwk+eZ5qJn9ckuoD3bH9JhS7iVx+Roi5D7dmWsGfZGGSRCco
         xt9w==
X-Gm-Message-State: AOJu0YwzJrYxrsJqNJoVcXiZi9b56QnDJK2i23QYTTPmv8c7C5m9SaIF
	8pkYU0boIWDKdkrbrSzFyUGnKUUvy57jTz1li43byUQ4xpEdO6gaN6oEQj15x7fzO5aHpTZPxDc
	=
X-Gm-Gg: ASbGncvwW9qPuztJOJ2SKO5K1otRRZwC+EnRfumnyp97szXLRSKFAmzDyfWBWb8VNkt
	GR/al3/3IHrZmZnIYjW72t57lF3toFn6ymzUhnJJ4dlThotGBBPh9XyYEcvbjXPviwNs6JcwM5I
	N2uGe/MFmpo5/N9tC+RQFhUbY+/eRVxfMhbg6Sz5XzVTzn+tpeLphRbU36zuc4ot21rfKyWMLza
	V5E5koao2HPLV/hU1R+bxxXsdB7V70beyFSLmVFrvfEYSXcEgOaSoN/55czXwcNgAMOM3Um7Na6
	32rLgiSeEU4IJibud0N7VVHnIqIEFIKX91pOJqBdJoFDSQwR8JvHrvULITBNAwFAkQIRSCn+rEq
	A1T3i1pQQ4u7JfSoqNeY5dA==
X-Google-Smtp-Source: AGHT+IEs1dnda/05lwv48p1kChP8H4iqWWWnIRWvPPrcVe+HE60b6DEE4FUAP4bsiwKGbIpAGianVA==
X-Received: by 2002:a05:620a:8803:b0:7c5:5a97:f784 with SMTP id af79cd13be357-7c55a97f9fbmr1863851085a.33.1741867588213;
        Thu, 13 Mar 2025 05:06:28 -0700 (PDT)
Received: from denia.c.googlers.com (15.237.245.35.bc.googleusercontent.com. [35.245.237.15])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c573c4db57sm92117685a.8.2025.03.13.05.06.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 05:06:27 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 13 Mar 2025 12:06:25 +0000
Subject: [PATCH v3 1/3] media: uvcvideo: Do not mark valid metadata as
 invalid
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250313-uvc-metadata-v3-1-c467af869c60@chromium.org>
References: <20250313-uvc-metadata-v3-0-c467af869c60@chromium.org>
In-Reply-To: <20250313-uvc-metadata-v3-0-c467af869c60@chromium.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>, stable@vger.kernel.org
X-Mailer: b4 0.14.2

Currently, the driver performs a length check of the metadata buffer
before the actual metadata size is known and before the metadata is
decided to be copied. This results in valid metadata buffers being
incorrectly marked as invalid.

Move the length check to occur after the metadata size is determined and
is decided to be copied.

Cc: stable@vger.kernel.org
Fixes: 088ead255245 ("media: uvcvideo: Add a metadata device node")
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_video.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
index e3567aeb0007c1f0a766f331e4e744359e95a863..b113297dac61f1b2eecd72c36ea61ef2c1e7d28a 100644
--- a/drivers/media/usb/uvc/uvc_video.c
+++ b/drivers/media/usb/uvc/uvc_video.c
@@ -1433,12 +1433,6 @@ static void uvc_video_decode_meta(struct uvc_streaming *stream,
 	if (!meta_buf || length == 2)
 		return;
 
-	if (meta_buf->length - meta_buf->bytesused <
-	    length + sizeof(meta->ns) + sizeof(meta->sof)) {
-		meta_buf->error = 1;
-		return;
-	}
-
 	has_pts = mem[1] & UVC_STREAM_PTS;
 	has_scr = mem[1] & UVC_STREAM_SCR;
 
@@ -1459,6 +1453,12 @@ static void uvc_video_decode_meta(struct uvc_streaming *stream,
 				  !memcmp(scr, stream->clock.last_scr, 6)))
 		return;
 
+	if (meta_buf->length - meta_buf->bytesused <
+	    length + sizeof(meta->ns) + sizeof(meta->sof)) {
+		meta_buf->error = 1;
+		return;
+	}
+
 	meta = (struct uvc_meta_buf *)((u8 *)meta_buf->mem + meta_buf->bytesused);
 	local_irq_save(flags);
 	time = uvc_video_get_time();

-- 
2.49.0.rc0.332.g42c0ae87b1-goog


