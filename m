Return-Path: <linux-media+bounces-35853-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 66542AE7CD1
	for <lists+linux-media@lfdr.de>; Wed, 25 Jun 2025 11:29:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0867F3A3B06
	for <lists+linux-media@lfdr.de>; Wed, 25 Jun 2025 09:29:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66C3729DB6C;
	Wed, 25 Jun 2025 09:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Qn4AoLQo"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 199AA29AAEC
	for <linux-media@vger.kernel.org>; Wed, 25 Jun 2025 09:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750843248; cv=none; b=c+O5sHRcCSTXkpZQ2kwcMSSwkCEZsVmaWyLdlrwppfOSMIaafe5Y7sGi3e+CYvWiLpza0/GDCUSL7u1/S0vXjk/tEhsttp7jhTiC33DniE6+WzHEAqyD1VcT6Kva+p9F5v5MLWVR0+kBmLWzU6SYKluJZDFYcP3B4Iw9MHgoVV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750843248; c=relaxed/simple;
	bh=DfwfmlgZc206WBk/3jV4qdEoEu7BcX8QtscGVN6Ch4c=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=mp8dU1ITPsQoQ/qYAb8QwCSwvZm7JNluu22dLvEa8cwp96345zSSODbAfCqhi/3hTFMf0OjZlUSaVq7kP5aFkuKuuodl/0LHvqTDsmd2sbPpzpgJn/B44mEKLOHmmxHVw2qzh8At25SlPpefuFgHUiQaLhRcXVg5yGfGWSYmqQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Qn4AoLQo; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7F9F56F3;
	Wed, 25 Jun 2025 11:20:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750843220;
	bh=DfwfmlgZc206WBk/3jV4qdEoEu7BcX8QtscGVN6Ch4c=;
	h=From:Subject:Date:To:Cc:From;
	b=Qn4AoLQoJsRHKljd6k6eSH3IYR9HRui+pbEz/AbwEm7z9oupBkQGMEXXF7e4zpSm8
	 /0UfvvK1Xz60b2gxDIqLIRHeaF/5Tk0Vz7S539GMG9h9XX2HQY8LepOLaOMB/5d8ke
	 Hvy0i65L0qkg5VfQqrHHw+982xilNBT7VR2j1KYA=
From: Daniel Scally <dan.scally@ideasonboard.com>
Subject: [PATCH v6 0/6] Extend RAW format support for rzg2l-cru driver
Date: Wed, 25 Jun 2025 10:20:26 +0100
Message-Id: <20250625-rzg2l-cru-v6-0-a9099ed26c14@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFq/W2gC/22NQQ7CIBBFr9KwdhqgBdSV9zBdTAFbkgoNaGNte
 ndpXepq8n7+f7OQZKOziZyLhUQ7ueSCzyAPBdE9+s6CM5kJp1xQySuI744PoOMTlK4rpRi2VHO
 S+2O0N/faXdcmc+/SI8R5V09iS7+W7GH5MFEKqVQtgYFBXyaNwzBfnLGYgm8DRlPqcN/Mf55PA
 igwKSs8aqnYCX+HzbquH8Kr8gzgAAAA
X-Change-ID: 20250623-rzg2l-cru-7c43771ab0c2
To: linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com, 
 prabhakar.mahadev-lad.rj@bp.renesas.com, jacopo.mondi@ideasonboard.com, 
 dan.scally@ideasonboard.com, Hans Verkuil <hverkuil@xs4all.nl>, 
 Daniel Scally <dan.scally+renesas@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1923;
 i=dan.scally@ideasonboard.com; h=from:subject:message-id;
 bh=DfwfmlgZc206WBk/3jV4qdEoEu7BcX8QtscGVN6Ch4c=;
 b=owEBbQKS/ZANAwAKAchJV3psRXUyAcsmYgBoW79kKxUT5gcymp1R5+vQc+YbaTzQCwW+sUvx2
 Y55lrq+pXmJAjMEAAEKAB0WIQQqyuwyDnZdb+mxmm/ISVd6bEV1MgUCaFu/ZAAKCRDISVd6bEV1
 MpbeEAChiQvmemGWMky3itwKyREd2g4L/+5AV4KO7foM1hiXdQMFbXLYe9hpLJJOV7QN5c4uX/Z
 h5gzZJdL6vxO2WduN76bAion72iYrU7gGylFnz2WQHnRTi8RyjsP9Sa+S45c/RB86OmW3F/Qv53
 QlCVGV+saaepeOi5Ih0F4doCquXxZfyyOc/W10THidt8qtiWrJ/GcD3d9pequMz0ZVHtfRSw5Ia
 foLyOLOcnOuY3zgWFauDafRInFt015VhDk4sX1mvNjrklhIh7d4seH/VJ45qCFqo3vSzq1x90qo
 FgKDldbAVJINnu13DrrotaJD3tgtIwmb43jOnTZfqCxm7SaYbpjyLh6r/Fuq6W4VaFTZNH+4L+U
 GhKr1S3j3i9DwkRxV4JJcqogFewAvlecRtA/Jtu1exnrZ/E5QN9XkxVYafwD1X0vCcIKyvl8yZd
 zwE4zG/DCkfzkAqCFccKSJ2awpzLr/tBYOh1WxSWjGgxjkL8vfqvUpxNdlUUiFI4wl6Y6Wkg1nU
 rNbqLpgcOGQPrtkkEi7zqOtzr640sZfbJ0EFy71XHwudDky07hWKKi93rQfjmuaMwHEDLrqj04y
 pA7d5VS9+TNDP3JoH7WMxfxAAo5BgK/oOlnbb9o93tQnLxm799ceEsry9/jlkB3dwZN7Jgng54w
 YQFUjCkF4pER4Ow==
X-Developer-Key: i=dan.scally@ideasonboard.com; a=openpgp;
 fpr=EEC699ACA1B7CB5D31330C0BBD501C2A3546CCF6

Hi All

This series adds new pixel formats representing the 64-bit packed format that's
used by the Camera Receiver Unit in RZ/G2L and V2H SoCs. Support for capturing
those formats is then added to the rzg2l-cru driver itself.

Thanks
Dan

v5: https://lore.kernel.org/r/20250623-rzg2l-cru-v5-0-1663a8c6719a@ideasonboard.com
v4: https://lore.kernel.org/linux-media/20250506125015.567746-1-dan.scally@ideasonboard.com/
v3: https://lore.kernel.org/linux-media/20241202145831.127297-1-dan.scally@ideasonboard.com/
v2: https://lore.kernel.org/all/20241112124614.646281-1-dan.scally@ideasonboard.com/T/
v1: https://lore.kernel.org/all/20240927232729.GR12322@pendragon.ideasonboard.com/T/

---
Daniel Scally (6):
      media: v4l2: Add Renesas Camera Receiver Unit pixel formats
      media: rzg2l-cru: Add vidioc_enum_framesizes()
      media: platform: rzg2l-cru: Use v4l2_get_link_freq()
      media: platform: rzg2l-cru: Use v4l2_fill_pixfmt()
      media: rzg2l-cru: Support multiple mbus codes per pixel format
      media: platform: rzg2l-cru: Add support for RAW10/12/14 data

 .../userspace-api/media/v4l/pixfmt-bayer.rst       |   1 +
 .../userspace-api/media/v4l/pixfmt-rawnn-cru.rst   | 143 +++++++++++++++++++++
 .../media/platform/renesas/rzg2l-cru/rzg2l-cru.h   |  10 +-
 .../media/platform/renesas/rzg2l-cru/rzg2l-csi2.c  |  45 +++++--
 .../media/platform/renesas/rzg2l-cru/rzg2l-ip.c    | 108 +++++++++++++---
 .../media/platform/renesas/rzg2l-cru/rzg2l-video.c |  38 ++++--
 drivers/media/v4l2-core/v4l2-common.c              |   6 +
 drivers/media/v4l2-core/v4l2-ioctl.c               |   4 +
 include/uapi/linux/videodev2.h                     |   6 +
 9 files changed, 316 insertions(+), 45 deletions(-)
---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250623-rzg2l-cru-7c43771ab0c2

Best regards,
-- 
Daniel Scally <dan.scally@ideasonboard.com>


