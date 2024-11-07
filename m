Return-Path: <linux-media+bounces-21068-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FB529C08C7
	for <lists+linux-media@lfdr.de>; Thu,  7 Nov 2024 15:22:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D88A12846A2
	for <lists+linux-media@lfdr.de>; Thu,  7 Nov 2024 14:22:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0E08212D0E;
	Thu,  7 Nov 2024 14:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NoHiJjUS"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0282212164
	for <linux-media@vger.kernel.org>; Thu,  7 Nov 2024 14:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730989338; cv=none; b=FolsX6n4TF3+/VLlksFkZbkDIMtTnTG4C/JU7fgJo9NAPQUlWIOAV2Ubb3gK1EYpe4r4zC/0x6OhA8jlXurBFYvc2yBQi/UwosBeBWUuBwBwyHAxcXhVBRLwqTta+Wb06J4CyPyad+YstEn+ihhJNpu9e6zY2mrgGeghPsRbxww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730989338; c=relaxed/simple;
	bh=+ZlM93Sxvm2YkT6cevxVglWquKgVbpwQmN5TaCYWOLQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=YPDWf4iE5v+asUgE5fq79wQf75SvHMp5aDTCFXQ/wwGU8sBd5FmQwRiRekxWBYqSLUc4iuWr3EHzaDZq7j4NoYxFj4F7mkVg+163W1VFVPnLLJYeLlds59H/j+MISaJr+KcFSLJi69qBBEmV0x3y+r1Ase532wNcHATaYztOWS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--bsevens.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NoHiJjUS; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--bsevens.bounces.google.com
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-37d95264eb4so549696f8f.2
        for <linux-media@vger.kernel.org>; Thu, 07 Nov 2024 06:22:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730989335; x=1731594135; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=lLNHHUDMS13HSatVQBZuAgvLyCkPe7JQ5HpV1uFJ/QA=;
        b=NoHiJjUSCsQBTeVFMSCnOm7wzzgBvZ4MM7At5n/DOfIvl+qFjn66xKqIeRvKeG7eAD
         UNtbvwc8r6IcScqNK9qb2dbW/AZtHlgTaXvR19e9wJPTOl+fSpIUgkOp3m9Ayd+7e726
         eLkVE0UO1icNPDQ1r82sbuu8zgx0YuzNodb3f0HCVN0hDSJjozBrLhHVq0hma7BguGhH
         0xs1aS8NuPWe4grPREEwDeL/FY+foJNvlzd+ZGnmDZ481pk8ZlS7VvasFT8f3XVEevM/
         DOjzmH8DKp9HI8GFW2ajgKNjo6L1fPAd/jECxTZdU5WU0Tp1rqkzN5EoAWxQ6GmVO4v6
         LJeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730989335; x=1731594135;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lLNHHUDMS13HSatVQBZuAgvLyCkPe7JQ5HpV1uFJ/QA=;
        b=KhofuLOv/6t7MrLhqbQLnVjcaFXkYTNgwSa5GyOCYO4HRzWPpYbPysvFj3Ubs4t685
         BkT2RaoUOBzkKgPvq7xgePq+aXlK4sfbKSmu0tmueL0Apv/xDXrtE2hKNa0/osQJdVpq
         LQIp7ANlnQ+1PBgiowqEc3j9MJkuaNVGlh4deKY+nRukioFk167CdEFvylYwRgjhUQpd
         9uUvojdGKAJ2kYRMvcQf65q+ycQY+qTR5Kd2QdqsapAk+G9oaM8XdmpRss5Helkw/mgj
         NtTWitrXR63VBOe2UMnO/dZKzISTKjkYDBFY4TErOBXQwMXHtSfaYM6ZpdNh4cKd5eDy
         2kww==
X-Gm-Message-State: AOJu0YwFNyxqrmlMZC+se/bLveNSqzr5WuaNuJsajVsFIPd+nwDEFlEE
	PcjkhdnBR/MJamKM4SaXaa0tgKjysNe+lQczga4kaZOVxqwO4nBWM/HwLEtpssopP0Fc225M6mn
	IcE+jQg==
X-Google-Smtp-Source: AGHT+IEy0onjmObD7oo+mNfcNZhj5w16DGfMqaSsToad00YD15NoLaki9W45PayM+YWWt+QQZrfsbspTx2pM
X-Received: from bsevens.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:22a4])
 (user=bsevens job=sendgmr) by 2002:a5d:5010:0:b0:37d:476d:5423 with SMTP id
 ffacd0b85a97d-381f0973fe8mr68f8f.9.1730989335207; Thu, 07 Nov 2024 06:22:15
 -0800 (PST)
Date: Thu,  7 Nov 2024 14:22:02 +0000
In-Reply-To: <20241107142204.1182969-1-bsevens@google.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241107142204.1182969-1-bsevens@google.com>
X-Mailer: git-send-email 2.47.0.277.g8800431eea-goog
Message-ID: <20241107142204.1182969-2-bsevens@google.com>
Subject: [PATCH v1 1/2] media: uvcvideo: Skip parsing frames of type
 UVC_VS_UNDEFINED in uvc_parse_format
From: Benoit Sevens <bsevens@google.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, gregkh@linuxfoundation.org, 
	Benoit Sevens <bsevens@google.com>, stable@kernel.org
Content-Type: text/plain; charset="UTF-8"

This can lead to out of bounds writes since frames of this type were not
taken into account when calculating the size of the frames buffer in
uvc_parse_streaming.

Fixes: c0efd232929c ("V4L/DVB (8145a): USB Video Class driver")
Signed-off-by: Benoit Sevens <bsevens@google.com>
---
 drivers/media/usb/uvc/uvc_driver.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index 0fac689c6350..13db0026dc1a 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -371,7 +371,7 @@ static int uvc_parse_format(struct uvc_device *dev,
 	 * Parse the frame descriptors. Only uncompressed, MJPEG and frame
 	 * based formats have frame descriptors.
 	 */
-	while (buflen > 2 && buffer[1] == USB_DT_CS_INTERFACE &&
+	while (ftype && buflen > 2 && buffer[1] == USB_DT_CS_INTERFACE &&
 	       buffer[2] == ftype) {
 		unsigned int maxIntervalIndex;
 
-- 
2.47.0.277.g8800431eea-goog


