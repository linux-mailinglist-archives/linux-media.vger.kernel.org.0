Return-Path: <linux-media+bounces-36754-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F0CFAF850E
	for <lists+linux-media@lfdr.de>; Fri,  4 Jul 2025 03:02:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CC16E7B6877
	for <lists+linux-media@lfdr.de>; Fri,  4 Jul 2025 01:01:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C87217BA6;
	Fri,  4 Jul 2025 01:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="MZnr/Ii5"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 622D56BB5B
	for <linux-media@vger.kernel.org>; Fri,  4 Jul 2025 01:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751590970; cv=none; b=bZAsC20xJk+wZYNokODuK0qT1fGLQvLwX1yQv1OQHvvhvPW5Q9YeUIEKd+ePnJca5nzS/LlwnNpmbA8/FtcULamtJmmRoqLpl14oShJsIcLBCSL9fY4KgI2BwpEet9dDjufyWajvAz2hauR9QeQExk/LidLu7ULMJ3H0/Mwgbu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751590970; c=relaxed/simple;
	bh=Zc+omdlPadLqz6k3+FmDYBUfhbQz2+Z/CE33JhORu9Y=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=dglOP4HzyGeOw5O01WUDUMlH5wt0xCebvLRT9a92q2oFji5wm6LobQ5ZY4WULA7hnxr69E0+vGm4ef/YIezwjckKIBi8tp6haTyE3esum357boDTRBbkRLUs4nE7RcU6xMVNUbNf41m2ys6hGxjR16WvtR9bjIL72J/S0w1qyVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=MZnr/Ii5; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2601:602:8100:c320::3926])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 75753524;
	Fri,  4 Jul 2025 03:02:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1751590941;
	bh=Zc+omdlPadLqz6k3+FmDYBUfhbQz2+Z/CE33JhORu9Y=;
	h=From:Subject:Date:To:Cc:From;
	b=MZnr/Ii5g2tRpJ6vJHFB+Sx5txq3IwPt+5sOQMzUVWWtliwLb5VjGDA0svk8qKS3q
	 9u2qog4idos0tRv+HMAdeslA4cONQAq17TYdyfzghKZnNSoPulxtgT2nkSePtiTh97
	 jv5yNVyMLv62ZKsShOrp+IfaWP5HMm91bfvC9q9Y=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Subject: [PATCH RFC 0/3] Add support for video device state for capture
 devices
Date: Thu, 03 Jul 2025 18:02:07 -0700
Message-Id: <20250703-vdev-state-v1-0-d647a5e4986d@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAA8oZ2gC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDcwNj3bKU1DLd4pLEklRdA3MT46TERIPEFJMkJaCGgqLUtMwKsGHRSkF
 uzkqxtbUATG8cZmEAAAA=
X-Change-ID: 20250703-vdev-state-0743baa0ad4b
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Heiko Stuebner <heiko@sntech.de>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Dafna Hirschfeld <dafna@fastmail.com>, linux-media@vger.kernel.org, 
 Jai Luthra <jai.luthra@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2029;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=Zc+omdlPadLqz6k3+FmDYBUfhbQz2+Z/CE33JhORu9Y=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBoZygtFntDm32FZ8uO/DRgHOnFshUIfXqEG4P+U
 RLQuGLDZFeJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaGcoLQAKCRBD3pH5JJpx
 RQ5DD/9uPB2z12XHP6gIxl0vBb1NhFl2U6F671pKI2XMICCAatVIFhePxkgLzq7Mzi8Zftwoydb
 qZlhdiBY5SxqMkiNq20MG1cQeUUpexwJQxMLlg18CNwEbJjCC8uCVZk0ZyDMakTENa0oG64OkH3
 dSq8hZkauYwH0Vg4lwMnyKi/qO/6IeXEG/UarIeOMmKszhOO3o7luEToS/937C/3KZUvZNBaDVe
 UQEJQf9HxkUOVFR/zY7dskmr+xAq2Q5PfUlnQ2viOkDp8tGxZy+oqS3K3BUG4+8lCYnOuGwz2QL
 ngxt7DxY34daqMqB3PKyYTE5sX4bXBP0bXhls0/SzcCQ7OqXsmQSioVNEui4NDX4Hng9tL0XqqG
 8w8IkwBOX4D3bgKx2uwTk9Hb/C9wJB1cnwlCYUwt4vpIhN+LwgwkAjOEtblLSUP9hlwwmP7zgZe
 b+pUYhL6H0eJqZ0T9H3rTFLuCD7wpu9Ca+9Y28+F1W2D9ZXJ21IFRi5ozO/aL0j5xNpGNjIEoVm
 xW8FFU9bQs7p3uMnYbh7ATWvTNVBLEhfdZYvvfPDf2u/6PenF7iGeNXej9FTTWh122VCso/MmFx
 SeO1wwPqHZULHe4D5e2ZmLK+B/4l/ejZJBQ6WjL2azZtO6pwuJc2xprLj9MiVVW3m2ikBHIQAbh
 L8Qcv5PQgl2YFRQ==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

Hi,

This RFC series adds "state" support for video devices, along similar
lines to the existing support for try and active states for subdevs [1].
The main motivation for this change is to achieve the long-term goal of
"atomic" state changes across the media graph (all subdevices and video
devices), which ties together with Jacopo's in-progress work for
multi-context support [2].

Along with PATCH 1/3, which adds video_device_state to the framework,
PATCH 2-3/3 converts two capture drivers (J721E and RKISP) as examples
of using this newly introduced state mechanism to simplify their format
handling.

In future, this may be extended to other video device types, such as
metadata or video output devices, or M2M devices, but it is omitted from
this iteration to ease review and get early feedback.

[1]: https://lore.kernel.org/linux-media/20210610145606.3468235-1-tomi.valkeinen@ideasonboard.com/
[2]: https://lore.kernel.org/linux-media/20240913214657.1502838-1-jacopo.mondi@ideasonboard.com/

Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
Jai Luthra (3):
      media: v4l2-core: Add support for video device state
      media: ti: j721e-csi2rx: Use video_device_state
      media: rkisp1: Use video_device_state

 .../platform/rockchip/rkisp1/rkisp1-capture.c      | 113 +++++++++------------
 .../media/platform/rockchip/rkisp1/rkisp1-common.h |   4 -
 .../media/platform/ti/j721e-csi2rx/j721e-csi2rx.c  |  57 ++++-------
 drivers/media/v4l2-core/v4l2-dev.c                 |  32 ++++++
 drivers/media/v4l2-core/v4l2-fh.c                  |   1 +
 drivers/media/v4l2-core/v4l2-ioctl.c               |  44 ++++++--
 include/media/v4l2-dev.h                           |  52 ++++++++++
 include/media/v4l2-fh.h                            |   5 +-
 8 files changed, 192 insertions(+), 116 deletions(-)
---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250703-vdev-state-0743baa0ad4b

Best regards,
-- 
Jai Luthra <jai.luthra@ideasonboard.com>


