Return-Path: <linux-media+bounces-21160-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 973DA9C1F1B
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2024 15:23:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 176E0B2214E
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2024 14:23:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D93AB1EF93A;
	Fri,  8 Nov 2024 14:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="tsEa6l6c"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7B9D1401C
	for <linux-media@vger.kernel.org>; Fri,  8 Nov 2024 14:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731075830; cv=none; b=rXSZ7FcFZRX1v/fU7sH+W3JZpHa4DR/wcm2rwGphsCsr2a1J+CHFwdR9/lHXKIOU1ipmU/Zk6jvJVUbbeAHHvHgO4FkE+WiLjXaJmgnq94bjrEW7HAhajWlladsDoZ0QPkz6M5Lfo3Pv8poOg4+Vo7UgiQLY/mCRiftL/2XkkH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731075830; c=relaxed/simple;
	bh=yWiQoSK5zsa2uZwcfILjk4WjNfH4PF9ibYho0RzmEhE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=juzhTmqAz8fSUEDES4XnDDYcNqgzNmNdpWnt2/OJDL+tQi4jO+yp3UGj4n3tphWPXoz7U6IkFEh0B7Ctol4aLbj+lx9CqEbNz/7KNkkw7JBZzLcDvqXxQ2Lux/XI1bGQbbklqg9228JP5BEYGbCHkoeW9s/3v+k6P0noZszNX+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=tsEa6l6c; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from isaac-ThinkPad-T16-Gen-2.local (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 09BFA2C5;
	Fri,  8 Nov 2024 15:23:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1731075817;
	bh=yWiQoSK5zsa2uZwcfILjk4WjNfH4PF9ibYho0RzmEhE=;
	h=From:To:Cc:Subject:Date:From;
	b=tsEa6l6c+nE/B0JOO0Eymeya/l0hgU6ufTD3rhcVqMhqgUNql+jhAGXcwie9vR8SG
	 KCZvQSbE3KPG0zkHEt4Teizwau2KniuO6k6ZomSnKaKv5chdhiZnr7ZXecBrvZ8fTN
	 byysF7uoKz2gmLRIR9Ba17ZQaftcf5MacFniGpco=
From: Isaac Scott <isaac.scott@ideasonboard.com>
To: laurent.pinchart@ideasonboard.com
Cc: mchehab@kernel.org,
	linux-media@vger.kernel.org,
	Isaac Scott <isaac.scott@ideasonboard.com>
Subject: [PATCH 0/3] Fix Sonix Technology MJPEG streams 
Date: Fri,  8 Nov 2024 14:23:07 +0000
Message-ID: <20241108142310.19794-1-isaac.scott@ideasonboard.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some cameras, such as the Sonix Technology Co. 292A, allow multiple
streams to be sent over the same USB device. It was found during testing
that occasionally, when one H.264 stream sends a new keyframe during an
MJPEG stream, a URB buffer would be lost, and a frame lost in the
resulting capture.

This was because some EOF markers in URB buffers are lost. This particular
use case is not covered by the uvc_video driver, which causes two
consecutive buffers to be erroneously considered to be as part of
the same buffer, and lead to the whole erroneous buffer to be dropped.
This can be seen when using the current driver, as frames occasionally
are double the expected size, containing two images. Furthermore, the
interval between the frames was double that of what it should be (~66ms
as opposed to the usual ~33ms). Upon further investigation, it was found
that the packets within the erroneous buffer were being dropped.

The changes in this series supply a new quirk for the UVC Driver, which
cause the buffers of MJPEG streams to be closed when a new JPEG SOI
marker is discovered, and be treated as a new buffer. This works around
the missing EOF marker and separates the buffers.

Tested on v6.12-rc3

Isaac Scott (3):
  media: uvcvideo: Introduce header length
  media: uvcvideo: Add new quirk definition for the Sonix Technology Co.
    292a camera
  media: uvcvideo: Implement dual stream quirk to fix loss of usb
    packets

 drivers/media/usb/uvc/uvc_driver.c |  9 +++++++++
 drivers/media/usb/uvc/uvc_video.c  | 27 ++++++++++++++++++++++++++-
 drivers/media/usb/uvc/uvcvideo.h   |  1 +
 3 files changed, 36 insertions(+), 1 deletion(-)

-- 
2.43.0


