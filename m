Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D364A34542
	for <lists+linux-media@lfdr.de>; Tue,  4 Jun 2019 13:20:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727380AbfFDLUF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Jun 2019 07:20:05 -0400
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:40579 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727328AbfFDLUF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 4 Jun 2019 07:20:05 -0400
Received: from tschai.fritz.box ([46.9.252.75])
        by smtp-cloud9.xs4all.net with ESMTPA
        id Y7TyhSHLnsDWyY7U3hwRoB; Tue, 04 Jun 2019 13:20:03 +0200
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Boris Brezillon <boris.brezillon@collabora.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 3/7] rtl2832_sdr: set device_caps in struct video_device
Date:   Tue,  4 Jun 2019 13:19:54 +0200
Message-Id: <20190604111958.22331-4-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190604111958.22331-1-hverkuil-cisco@xs4all.nl>
References: <20190604111958.22331-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfNXflZfKsX1jYcVAlD942UrGn+kiyHuHj6hWxbkWPPybWSHphyf5W7P1zXK9b5vnrEPGBjHqbkGry2GxS2JB/eZKLw/+sHTR4G/nCzJHYWCjTPVbIAzZ
 Ejkdb7ir/i6R/PFyIETQsJngpJ+b91T4gjwnjP6MAu8CYQZ2iLazjdXJ91TLyv5BvFZmS69U5AOsvO3mJuxu9HE9sRc8ZETh0LHNx9UDiPC40XgTUaH8P9b/
 Pfhw+dZ1CdRgsODGx0gXdTvQr5p/P8+UGVR4PvaUQU0=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Instead of filling in the struct v4l2_capability device_caps
field, fill in the struct video_device device_caps field.

That way the V4L2 core knows what the capabilities of the
video device are.

But this only really works if all drivers use this, so convert
this SDR driver in this patch.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/dvb-frontends/rtl2832_sdr.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/media/dvb-frontends/rtl2832_sdr.c b/drivers/media/dvb-frontends/rtl2832_sdr.c
index cf1a8f77ee02..e05c21d35dc8 100644
--- a/drivers/media/dvb-frontends/rtl2832_sdr.c
+++ b/drivers/media/dvb-frontends/rtl2832_sdr.c
@@ -428,9 +428,6 @@ static int rtl2832_sdr_querycap(struct file *file, void *fh,
 	strscpy(cap->driver, KBUILD_MODNAME, sizeof(cap->driver));
 	strscpy(cap->card, dev->vdev.name, sizeof(cap->card));
 	usb_make_path(dev->udev, cap->bus_info, sizeof(cap->bus_info));
-	cap->device_caps = V4L2_CAP_SDR_CAPTURE | V4L2_CAP_STREAMING |
-			V4L2_CAP_READWRITE | V4L2_CAP_TUNER;
-	cap->capabilities = cap->device_caps | V4L2_CAP_DEVICE_CAPS;
 	return 0;
 }
 
@@ -1242,6 +1239,8 @@ static struct video_device rtl2832_sdr_template = {
 	.release                  = video_device_release_empty,
 	.fops                     = &rtl2832_sdr_fops,
 	.ioctl_ops                = &rtl2832_sdr_ioctl_ops,
+	.device_caps		  = V4L2_CAP_SDR_CAPTURE | V4L2_CAP_STREAMING |
+				    V4L2_CAP_READWRITE | V4L2_CAP_TUNER,
 };
 
 static int rtl2832_sdr_s_ctrl(struct v4l2_ctrl *ctrl)
-- 
2.20.1

