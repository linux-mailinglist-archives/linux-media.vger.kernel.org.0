Return-Path: <linux-media+bounces-23572-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FCDD9F49BD
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 12:21:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0CFC1188B2E8
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 11:22:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B21B1EBA07;
	Tue, 17 Dec 2024 11:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="R6TO/2WP"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A5DC1D5CCC
	for <linux-media@vger.kernel.org>; Tue, 17 Dec 2024 11:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734434510; cv=none; b=Pluek1Zuw206JDmn3/QuKVIeax3v1dzgzIIfe+yjWBzwv+kLEstNrDShLU7tu7Hc9bX3VIj1Apnh2HemTjDoe9VGj/lEz50QbWGMX1AzARFy3oEhJuRGmqU5rwSryzTC4/3C6zh/8CnmsQcf0oyzJzMbIQ0s7WyAjoOPliXWT1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734434510; c=relaxed/simple;
	bh=eQeJPn/M41+5/g8i9C6cl0cRzOcThwrWfxaj9x5JMnE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=a3sN695loX17hIwf5HAK9BWbPl7XhJgRWzHv6/cYcexOW6WJJ+XpISAZ31m8sXUImBef2nZH3KnIHc216UT34GkUW1mqqGhv9j8gFAHaGP0f9vEuLu9p7iuGcxclwRIpND2UHFTQUHY8z6i46loHroN4xWjY/PgHf0vcNQtu9A8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=R6TO/2WP; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from isaac-ThinkPad-T16-Gen-2.lan (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5D0CF4C7;
	Tue, 17 Dec 2024 12:21:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1734434470;
	bh=eQeJPn/M41+5/g8i9C6cl0cRzOcThwrWfxaj9x5JMnE=;
	h=From:To:Cc:Subject:Date:From;
	b=R6TO/2WP3yRd9K/WTFjoAACihiaNS3ckl2eR/ZvMGzm0QcZOl4j5vMESPBNByMckI
	 ddWZq/aQoVKGgBF4H80HTUDuHIOr8VkJWIR+kZmSveBKvGVVLYOTlHDFm2LLhP2XA1
	 70v72IQlphlhs2/TMMfaOjOqwI9mduYFbFNAkxxk=
From: Isaac Scott <isaac.scott@ideasonboard.com>
To: laurent.pinchart@ideasonboard.com
Cc: mchehab@kernel.org,
	linux-media@vger.kernel.org,
	Isaac Scott <isaac.scott@ideasonboard.com>
Subject: [RFC PATCH 0/1] Set uvc_no_drop parameter for MJPEG_NO_EOF quirk
Date: Tue, 17 Dec 2024 11:21:37 +0000
Message-ID: <20241217112138.1891708-1-isaac.scott@ideasonboard.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch refers to the UVC_QUIRK_MJPEG_NO_EOF quirk. The series can be
viewed at: 

https://lore.kernel.org/all/20241128145144.61475-1-isaac.scott@ideasonboard.com/

In use cases where a camera needs to use the UVC_QUIRK_MJPEG_NO_EOF,
erroneous frames that do not conform to MJPEG standards are correctly
being marked as erroneous. However, if this happens, we should avoid
losing a whole frame of data by enabling the uvc_no_drop parameter. Only
the buffer containing the EOF is lost, so it does not make sense to drop
the entirety of an otherwise correct buffer just because of this issue.
The frame should be marked as erroneous, but the otherwise correct frame
should be passed to user space.

To do this, you would have to enable the uvc_no_drop parameter. To avoid
the extra steps needed to configure the kernel in such a way, enable the
no_drop parameter by default to comply with this use case.


Isaac Scott (1):
  media: uvcvideo: Add no drop parameter by default for MJPEG_NO_EOF
    quirk

 drivers/media/usb/uvc/uvc_driver.c | 7 +++++++
 1 file changed, 7 insertions(+)

-- 
2.43.0


