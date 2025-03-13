Return-Path: <linux-media+bounces-28140-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CA1BA5F3C5
	for <lists+linux-media@lfdr.de>; Thu, 13 Mar 2025 13:06:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D79BB7AA677
	for <lists+linux-media@lfdr.de>; Thu, 13 Mar 2025 12:05:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CACE2266F00;
	Thu, 13 Mar 2025 12:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="D0mSEVa2"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4E15262D38
	for <linux-media@vger.kernel.org>; Thu, 13 Mar 2025 12:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741867590; cv=none; b=EepS6nd+sHl1fmgbOozsxLF3Mrb6UGpkKkn94qhTwemypyFPmfmCv31BhwI10fjg46YPjsHLdkFDvfAP5eGxJakPYoI0KkVwIC6JvwJcgLgoT6Bns+3EsYWZNHzXDJIg43rFlsWxfRLCVi1H8ptY1PBe4NS7KswSUmsxRNXGGeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741867590; c=relaxed/simple;
	bh=YgUq00/8AbhG4t9L/nSWQetaZNYQQMmFFe2guzrS0oQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Jn5OTZ0WsmV4dnZiZhFbT4ZvuA83BC/SYH8ZlTyL4Oz5n+bId/nmKRHbAehAXb+Tuy0aedW937DCsoviHkJv7QbTI6il8KqAn3pBEp1k8AugJkLq5BDs+nklub62epeCqtKcG5LlDVEYyJcZDozCLXDcgkEVq+rZY2OS2N5biww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=D0mSEVa2; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-7be49f6b331so79370585a.1
        for <linux-media@vger.kernel.org>; Thu, 13 Mar 2025 05:06:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1741867587; x=1742472387; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9HHfyOLpdx1aPPgPI4Rp9Zj3D1LYRLFjWWXAeeSzzaQ=;
        b=D0mSEVa2Ni2Y5XtUTXWkGBJ8YuVZHcfBIgmzF0tGh8UyDZVqIc9cu5Zi9HSyN2d7LX
         Ah+dZtjCQXN1IjE39meiablIUScuOPzXwC4GL5lEMn+RlcksAawkZLJx5jAwRmPmweif
         1Jnq9rX2lwwQbHu0Q692XBf0XEzhI62+4wQDs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741867587; x=1742472387;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9HHfyOLpdx1aPPgPI4Rp9Zj3D1LYRLFjWWXAeeSzzaQ=;
        b=hVONGibs94DPompMCIaeCVC4p/k0Iv3SdKQ6d+wPN09vgUQKWYT3yDxCvHDY2TjVRY
         Ct1Y53VlPxmM/MvvKX+RWRiPvNmzeR1UIG6hgyZ6VfEDzkcACyLTBlip2/L4Gw8se9po
         BQmDDshiohp+Ux8DguIXBlKVqnI+ecwgACi9snzNokRUxzBoTUphxJJCC3SoywFyG49h
         UpxNSXxVxI4tsGlujFAR9z/bVyFDgt4HvqzY3ZPM4BOSxotwocBaGb+mlzaLePyYEt/O
         Z1dNvz9Pcfsz/zR4L7sZucZdna2fCQOUU1Dn4StBFCNr5gCiPcUc8+k4MBD2SJi908Ad
         aR+A==
X-Gm-Message-State: AOJu0YwoIjY7OUElELa5jBxm5D10+yBO+azUsBevWzur3L0n5+8PobJT
	6t2NYR+filbp6ptxuqaXoZVt4BKfMMp8ow/MEmnmDesEHsjNQ4P6dYYqoTEALA==
X-Gm-Gg: ASbGncsg613SGvX37bUt9cHCkbHXwWg9n1hduFvuCnW7KYCdT1MEJi/D9QSIbBXK5WI
	fQTnhTaJWMYkhWUU4v0Jdt/4C+BrbP8oHmgTTtniLhJN0Hj/9MbGhG+Rxg7ba4fcKRQ9PH7vZCB
	LGKdCBDeNDhRZLZPqTZS4+f4f8DHGcWF0M0UsQKl5jsC6DErwwFFjjtjEjS0lhOZ/1rWvvQEbrZ
	4OGuFC3dVD3gmVenEzkO0Om4vQDzK8HdjTx+wHG2I+IIU6/riS/lT4Zxg8HnIycRBYqwOjeaCEa
	d0DbLlFBOjuyhj4dwLNMEt4qqDe29ojQRYLxvnCB2Ennns3ThQEyBxId8sFhAnn/NmzsloADhgW
	dYkzOncktP5fFweC74+RB5w==
X-Google-Smtp-Source: AGHT+IGLSM49dNKretr2HZ5V+KCsqhUkgKSImjMwSG2jKqCqMqncxxsSoTFy9uuqSCOzVvGsMJ0i0Q==
X-Received: by 2002:a05:620a:86cc:b0:7c5:5883:8fbf with SMTP id af79cd13be357-7c558839293mr2121678685a.21.1741867587461;
        Thu, 13 Mar 2025 05:06:27 -0700 (PDT)
Received: from denia.c.googlers.com (15.237.245.35.bc.googleusercontent.com. [35.245.237.15])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c573c4db57sm92117685a.8.2025.03.13.05.06.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 05:06:27 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v3 0/3] media: uvcvideo: Introduce V4L2_META_FMT_UVC_CUSTOM
 + other meta fixes
Date: Thu, 13 Mar 2025 12:06:24 +0000
Message-Id: <20250313-uvc-metadata-v3-0-c467af869c60@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEDK0mcC/3WMQQ6DIBAAv2I4dxtcBWtP/UfTA4VVOSgNIGlj/
 HvRSxOTHmeSmYUF8pYCuxYL85RssG7KUJ0Kpgc19QTWZGbIUXBECXPSMFJURkUFSA3VtWilNMR
 y8vLU2fe+uz8yDzZE5z/7PZWb/TNKJZQgtZEdCdKonzc9eDfaeTw737PtlfDXV/zYI3BoqK3ai
 2i0MuLQr+v6BUORt83rAAAA
X-Change-ID: 20250226-uvc-metadata-2e7e445966de
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>, stable@vger.kernel.org
X-Mailer: b4 0.14.2

This series introduces a new metadata format for UVC cameras and adds a
couple of improvements to the UVC metadata handling.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
Changes in v3:
- Fix doc syntax errors.
- Link to v2: https://lore.kernel.org/r/20250306-uvc-metadata-v2-0-7e939857cad5@chromium.org

Changes in v2:
- Add metadata invalid fix
- Move doc note to a separate patch
- Introuce V4L2_META_FMT_UVC_CUSTOM (thanks HdG!).
- Link to v1: https://lore.kernel.org/r/20250226-uvc-metadata-v1-1-6cd6fe5ec2cb@chromium.org

---
Ricardo Ribalda (3):
      media: uvcvideo: Do not mark valid metadata as invalid
      media: Documentation: Add note about UVCH length field
      media: uvcvideo: Introduce V4L2_META_FMT_UVC_CUSTOM

 .../userspace-api/media/v4l/meta-formats.rst       |  1 +
 .../userspace-api/media/v4l/metafmt-uvc-custom.rst | 31 +++++++++++++++++
 .../userspace-api/media/v4l/metafmt-uvc.rst        |  4 ++-
 MAINTAINERS                                        |  1 +
 drivers/media/usb/uvc/uvc_metadata.c               | 40 ++++++++++++++++++----
 drivers/media/usb/uvc/uvc_video.c                  | 12 +++----
 drivers/media/v4l2-core/v4l2-ioctl.c               |  1 +
 include/uapi/linux/videodev2.h                     |  1 +
 8 files changed, 78 insertions(+), 13 deletions(-)
---
base-commit: 36cef585e2a31e4ddf33a004b0584a7a572246de
change-id: 20250226-uvc-metadata-2e7e445966de

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>


