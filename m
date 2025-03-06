Return-Path: <linux-media+bounces-27729-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AF691A54F94
	for <lists+linux-media@lfdr.de>; Thu,  6 Mar 2025 16:51:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 05DA2188D599
	for <lists+linux-media@lfdr.de>; Thu,  6 Mar 2025 15:51:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CA57210F6D;
	Thu,  6 Mar 2025 15:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Xu7wHIDE"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A98E17995E
	for <linux-media@vger.kernel.org>; Thu,  6 Mar 2025 15:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741276267; cv=none; b=dimxFWM8/MHUUehPf94XzWxjpYPH/2TE7e6LoR8wy+o/dky7f2nUxj1W77OWUdxsonE2y5jbveQIsCk6myALYFbTdERqhX2paFLvmpfyOZAj2lQY6jF/adBCji+5PBN5GLg2QfyImVFAjWwSsLXJSRvxFeVNqvI0l4YL7SJke38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741276267; c=relaxed/simple;
	bh=6/eshPQTJ88U2E8tAaABEc0mBxrlK9eSvRujOfacHCU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=o4PsZMBW0Ypqobq8wTtJ8amgubg0SzU0VnDephm++FviZiVYlLOj7iAMjlRrnJajdSbsy+j/5dJeCC1pPVwRy/2288xMe+CCHElsDjAHPY861CTft5N74Rdn5FMLngqNpU6q71hfFmPwGqxn+LesmUeVPj9fVXk8LTWHv/lJFQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Xu7wHIDE; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-7c3b63dfee1so89655585a.0
        for <linux-media@vger.kernel.org>; Thu, 06 Mar 2025 07:51:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1741276264; x=1741881064; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RMbnC32xMkkNtpNE5OTsWUJHP+Zfh4wWIQQTgHHZzVc=;
        b=Xu7wHIDENqS09TMlJ8kpd7PYRqY5kXbNVLeAHyjW9VFS/MtDqwAEoqAYI9EqLswSw5
         lcc2fmnhSGXscSlFFJerbgn/51ajt+dpi21jTFfFxksQUNT05DtairqWkYOSaSF6QyTN
         HHk597kq26E1w52L7HyBK1mCAHwnYp/DJLtDg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741276264; x=1741881064;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RMbnC32xMkkNtpNE5OTsWUJHP+Zfh4wWIQQTgHHZzVc=;
        b=uLIkBlQ8bVV31WxNhM5qOZatSigBbof+mGiEIZZkcbglfHfyIlYjAtSKKOdP5olrja
         Z9JWby3ih6+aeSyh1WuwlxnoF0g/ZHhAFf0pEkQTnnmKahGx+8BXh02/bZYk2AJl0ENJ
         m/vOHX73WTlTyAHWvzLdWNs4Objw93wOBlDW2idFY9K1CeHd8kaHTXYS89yE1hzae92N
         xYPfZuBm+VS5nskf6oB0xdtmXVkWUSJ9qVpwMeVc0Eeoj78Dr0WIWRTK84pCawNyITqm
         vdIyFniPZvyGCvym/zUiQpNFdi9OB6/YsVunAAvKekPas570TXgnjRooXYE7PIXl6mOy
         L9Yw==
X-Gm-Message-State: AOJu0YxybFKJfAMy4OEel9a+iRVbdueOHYdCvHSw0n9ggMgEPlzD6XZK
	vPE6UDHqc2L3TxwnXbY9Y/1tnC4EJqiEoISnQW59jRm2tGDG5gAjLzAFfvIcHk+9wrOWHXVwFrY
	=
X-Gm-Gg: ASbGnctrIHvr9NQyfDOX0bPVeYYewFKuXKuCHZdkSnLd58Nv1t2v7oRpVVMU6mueE4g
	4JNz4Eexaa7Crj+h9tnXjG59rRamU7FG7zjoMRhmWm1lG1RPmUZ7cZbVPBlHY2QBbEI3sAwkZxS
	qvk/VuLmbOA0DnwHbYDVRlvEg4YpYXVWpxfEJn64vCtT0hj+vuYJCq6b8btmK6zOPzK+yqUsIJq
	O8gM+8Gnt4EoBW2Ozdp9OX44nd5ZHGVg4A12gNLhSYDpQyhX2FlNmEXi94h+y1kcCPOfCLuKT9E
	cfe4T/96PMhV3FLO3Q2I1N+KYLWGzixUBmUGhrPnV5RbOeHW3gs72d9V/IYict3KvUW1/Mgjndm
	vQ5qBg5F5oyv4s17jsMtuqA==
X-Google-Smtp-Source: AGHT+IH24KmuxGN+n2gl5zVRmv9+jF9yqy4bvzwQUqbaRmvUqLbrFB/O+ZtC7Gu9XeQA0kdFZZGpLg==
X-Received: by 2002:a05:620a:6190:b0:7c3:d2f7:ca5e with SMTP id af79cd13be357-7c3d8bd27e5mr1112875785a.12.1741276264174;
        Thu, 06 Mar 2025 07:51:04 -0800 (PST)
Received: from denia.c.googlers.com (15.237.245.35.bc.googleusercontent.com. [35.245.237.15])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c3e533a1a1sm106257585a.6.2025.03.06.07.51.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 07:51:03 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v2 0/3] media: uvcvideo: Introduce V4L2_META_FMT_UVC_CUSTOM
 + other meta fixes
Date: Thu, 06 Mar 2025 15:51:00 +0000
Message-Id: <20250306-uvc-metadata-v2-0-7e939857cad5@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGTEyWcC/3XMQQ7CIBCF4as0sxbTTgpGV97DdIEwLbOgGKBE0
 3B3sXuX/0vet0OiyJTg1u0QqXDisLbAUwfG6XUhwbY1YI+yR1RiK0Z4ytrqrAXShcZRXpWyBO3
 yijTz++AeU2vHKYf4OfQy/NY/UBnEIJSxaiZJBs3zblwMnjd/DnGBqdb6BaBrwdKrAAAA
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
 .../userspace-api/media/v4l/metafmt-uvc-custom.rst | 30 ++++++++++++++++
 .../userspace-api/media/v4l/metafmt-uvc.rst        |  4 ++-
 MAINTAINERS                                        |  1 +
 drivers/media/usb/uvc/uvc_metadata.c               | 40 ++++++++++++++++++----
 drivers/media/usb/uvc/uvc_video.c                  | 12 +++----
 drivers/media/v4l2-core/v4l2-ioctl.c               |  1 +
 include/uapi/linux/videodev2.h                     |  1 +
 8 files changed, 77 insertions(+), 13 deletions(-)
---
base-commit: 36cef585e2a31e4ddf33a004b0584a7a572246de
change-id: 20250226-uvc-metadata-2e7e445966de

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>


