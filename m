Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9EB191ABB44
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2020 10:32:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2502230AbgDPIba (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Apr 2020 04:31:30 -0400
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:50567 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2502203AbgDPIbM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Apr 2020 04:31:12 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id OzqrjxiLilKa1OzqujQwe7; Thu, 16 Apr 2020 10:26:28 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1587025588; bh=vOrP83TK2KSk4bHbD4HwDZGwLWeosFdwUHuxV4437rE=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=cd1yY1B1kJ4LY+s3jvaLBBlcLZ+rXaGNnYsDpd16L6ZkNuwwudJWf67bz7ALkej3o
         tJlM5hK12tUdJMyWlPSMmRixlGkFzQOkw8h9S+6Cq32YOeBEb3dmWvnMm7/xNPEL9x
         9xn3mOavXjJpOMj0IpJVsRyqkarbKlOKf6o6tHgEpohv2GtHX4Xr9WX+pZ25WukRLi
         C3UgotxI57uAStvDIzJlH1OLhE03FnYXs/aykHu4qBRNcQskN+gmi2MY8h1dRY+yO5
         EjCqyNEIODitgYr/8qzwkiaTaDZTth5az0Aox2A7DnHVWpcCh8KcLiGdxhDK1vGoZX
         ggr7gA+1BhyiQ==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH] Documentation/media: drop/fix vivi references
Message-ID: <2f4218ef-b959-9ee5-5e81-ed1c05e0d9b0@xs4all.nl>
Date:   Thu, 16 Apr 2020 10:26:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfFzzpD4pito8xOVJabsfAQvJ0wmNPu/F2dolOwPcnvL6S5qs5n9n+hTFcmy3NEsne5P31V0ntcEArlGDRh1Mi8QQNqWJyufvk0U8yHXX30ZyMlSprAvh
 djjhWoxDwtLlSrL8kqGLPuTStv8CSoumSmtIZvgI+jzfDc2pSndrtyzu7OXx6fewI1SPKyK0pKba4w==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The vivi.c driver has long gone, but v4l2-videobuf.rst still
refers to it. Just drop that reference since it is no longer valid
or relevant (videobuf is deprecated).

The QUERYCAP documentation also made a reference to is, but there
vivi could just be replaced by vivid, the vivi successor.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 Documentation/driver-api/media/v4l2-videobuf.rst          | 5 +----
 Documentation/userspace-api/media/v4l/vidioc-querycap.rst | 2 +-
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/Documentation/driver-api/media/v4l2-videobuf.rst b/Documentation/driver-api/media/v4l2-videobuf.rst
index 1a7756397b1a..4b1d84eefeb8 100644
--- a/Documentation/driver-api/media/v4l2-videobuf.rst
+++ b/Documentation/driver-api/media/v4l2-videobuf.rst
@@ -399,8 +399,5 @@ again.

 Developers who are interested in more information can go into the relevant
 header files; there are a few low-level functions declared there which have
-not been talked about here.  Also worthwhile is the vivi driver
-(drivers/media/platform/vivi.c), which is maintained as an example of how V4L2
-drivers should be written.  Vivi only uses the vmalloc() API, but it's good
-enough to get started with.  Note also that all of these calls are exported
+not been talked about here.  Note also that all of these calls are exported
 GPL-only, so they will not be available to non-GPL kernel modules.
diff --git a/Documentation/userspace-api/media/v4l/vidioc-querycap.rst b/Documentation/userspace-api/media/v4l/vidioc-querycap.rst
index 4ce8f87bd54a..28e1f766128c 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-querycap.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-querycap.rst
@@ -83,7 +83,7 @@ specification the ioctl returns an ``EINVAL`` error code.
 	string. For example: "PCI:0000:05:06.0". This information is
 	intended for users, to distinguish multiple identical devices. If
 	no such information is available the field must simply count the
-	devices controlled by the driver ("platform:vivi-000"). The
+	devices controlled by the driver ("platform:vivid-000"). The
 	bus_info must start with "PCI:" for PCI boards, "PCIe:" for PCI
 	Express boards, "usb-" for USB devices, "I2C:" for i2c devices,
 	"ISA:" for ISA devices, "parport" for parallel port devices and
-- 
2.25.1

