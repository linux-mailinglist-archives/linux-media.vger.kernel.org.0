Return-Path: <linux-media+bounces-21484-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FE079D0657
	for <lists+linux-media@lfdr.de>; Sun, 17 Nov 2024 22:38:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 059E3281F82
	for <lists+linux-media@lfdr.de>; Sun, 17 Nov 2024 21:38:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 154B11DDC01;
	Sun, 17 Nov 2024 21:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ZYKyEkgK"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83AF51DA60D;
	Sun, 17 Nov 2024 21:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731879525; cv=none; b=p8/5liVHuLXT7gDQT1cnHZZq12YDBXX87DsOVj88eys+Hv52kRWg8Tg9UNr7gaCk0mjnsGsdceH5RqSPseO29Y3CHkz/x5o1i4KbPniKcPRDPeh5r1RRCtH3oGBvV4Ed3bbbrGBRMM9HdWY9CzkLYmYUXb83zR3Y7gsQGSMxpu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731879525; c=relaxed/simple;
	bh=93ujwKPl41nzk1IIH0YnGiFlMT/exMkWz7KSgibseWE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RLFopiI9jKXh5l2+Ywq4YlC0fK2WuNjv2YAl0wWsLypmv4LClx9sie7qFEVYkXsmbvIgCPaLgeKBFeFRUCAeowzKpu0WsmZ9kZg4CYGgebQymSk9ATYM9bStCCUeylWYt5IJ6zv8AZbBSkhPI57ivfIHjoCSYvAZOMAX0WW8tfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ZYKyEkgK; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D645C7CA;
	Sun, 17 Nov 2024 22:38:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1731879506;
	bh=93ujwKPl41nzk1IIH0YnGiFlMT/exMkWz7KSgibseWE=;
	h=From:To:Cc:Subject:Date:From;
	b=ZYKyEkgKJvQMTm6sV4IfIMhw66FYGdgec3Iwlj7Bu+A5CvKQgX8DnuqCpYtaeM1ns
	 hIYUGto7MbMxxJ6g5v7fZOtiFqkKCwfr+zQY5j1OF8iNB/jU9KgrFl0zebhQi7qjQF
	 5psGAuvuSZTvM2w0U3y7j2M47LW4kU1rUbpyxdhA=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH] MAINTAINERS: Add missing file entries for the USB video class driver
Date: Sun, 17 Nov 2024 23:38:33 +0200
Message-ID: <20241117213833.22952-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The USB video class driver is missing a few F: entries for files related
to the driver that have been added to the kernel over the years. Add
them.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 MAINTAINERS | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index f65f00392789..af018330f6fd 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -24076,7 +24076,11 @@ L:	linux-media@vger.kernel.org
 S:	Maintained
 W:	http://www.ideasonboard.org/uvc/
 T:	git git://linuxtv.org/media_tree.git
+F:	Documentation/userspace-api/media/drivers/uvcvideo.rst
+F:	Documentation/userspace-api/media/v4l/metafmt-uvc.rst
+F:	drivers/media/common/uvc.c
 F:	drivers/media/usb/uvc/
+F:	include/linux/usb/uvc.h
 F:	include/uapi/linux/uvcvideo.h
 
 USB WEBCAM GADGET

base-commit: 5516200c466f92954551406ea641376963c43a92
-- 
Regards,

Laurent Pinchart


