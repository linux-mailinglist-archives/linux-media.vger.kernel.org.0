Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ACD9A367C71
	for <lists+linux-media@lfdr.de>; Thu, 22 Apr 2021 10:23:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235326AbhDVIWc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 22 Apr 2021 04:22:32 -0400
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:34879 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230270AbhDVIWb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 22 Apr 2021 04:22:31 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id ZUaulq20GvTEDZUaxlYBbb; Thu, 22 Apr 2021 10:21:55 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1619079715; bh=04/cc0IQjw+TC86aoM8+J8io329tydFMySlCryohbIE=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=bhlB9KFgpYgeWu3SLh5X5oWAO6wGoorFBvTvu+SVvAa//0qkdal3zf5qff6+UVy2U
         OC9F7YCE2LulQcniPRysi3c595Ujza8/0siigDr12FXSYZwY4jMeMw69KXo6l4bzQq
         CSVP6+YvwOxy8cGu3DoZdi2uOXsRF6xUw4B+GDboFQpVOXihcpjaSOr/h/pjpNYNCM
         aD+6xEPYnTjIa+PiM7GwCMwutPJMlXqYDU+SBGDswI5+wJcuBZ1gOZQie1NK4XXAjg
         +x9gSOveBtn86aOKHfB+jQM/Do2650N44Mv/pl2RzCj6xbkWk/YJnYjYawUj4A2Bc0
         VjpO/8Kxd0blg==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH] rtl2832_sdr/vivid/airspy/hackrf/msi2500: drop memset of
 fmt.sdr.reserved
Message-ID: <cf215936-6e19-5793-4ac3-167e70820645@xs4all.nl>
Date:   Thu, 22 Apr 2021 10:21:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfBmxeULl+kPtoCQlrstR2LzwuVIfjYlrZ4Psp6B53oIEqxh1cMAI716Mt75yb78dEc1IN+vqYHt5uBOjCczKHCCqNEovuFozjxtc+qGjGn/JkvG5iwdF
 i/MpTqT8L8lfkq7eXBZ0i0I7LujnuLacYQ7QJpU/pUTkaphjBZjmHec5HGy2gvgZTqH0UszqG6vGY2sBhY3hbb4erQImIU+UpTQ=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The V4L2 core already zeroes fmt.sdr.reserved, so there is no need for
drivers to do the same.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
diff --git a/drivers/media/dvb-frontends/rtl2832_sdr.c b/drivers/media/dvb-frontends/rtl2832_sdr.c
index ef6feb299d46..1a2f0d2adadf 100644
--- a/drivers/media/dvb-frontends/rtl2832_sdr.c
+++ b/drivers/media/dvb-frontends/rtl2832_sdr.c
@@ -1130,8 +1130,6 @@ static int rtl2832_sdr_g_fmt_sdr_cap(struct file *file, void *priv,
 	f->fmt.sdr.pixelformat = dev->pixelformat;
 	f->fmt.sdr.buffersize = dev->buffersize;

-	memset(f->fmt.sdr.reserved, 0, sizeof(f->fmt.sdr.reserved));
-
 	return 0;
 }

@@ -1149,7 +1147,6 @@ static int rtl2832_sdr_s_fmt_sdr_cap(struct file *file, void *priv,
 	if (vb2_is_busy(q))
 		return -EBUSY;

-	memset(f->fmt.sdr.reserved, 0, sizeof(f->fmt.sdr.reserved));
 	for (i = 0; i < dev->num_formats; i++) {
 		if (formats[i].pixelformat == f->fmt.sdr.pixelformat) {
 			dev->pixelformat = formats[i].pixelformat;
@@ -1177,7 +1174,6 @@ static int rtl2832_sdr_try_fmt_sdr_cap(struct file *file, void *priv,
 	dev_dbg(&pdev->dev, "pixelformat fourcc %4.4s\n",
 		(char *)&f->fmt.sdr.pixelformat);

-	memset(f->fmt.sdr.reserved, 0, sizeof(f->fmt.sdr.reserved));
 	for (i = 0; i < dev->num_formats; i++) {
 		if (formats[i].pixelformat == f->fmt.sdr.pixelformat) {
 			f->fmt.sdr.buffersize = formats[i].buffersize;
diff --git a/drivers/media/test-drivers/vivid/vivid-sdr-cap.c b/drivers/media/test-drivers/vivid/vivid-sdr-cap.c
index a1e52708b7ca..265db2114671 100644
--- a/drivers/media/test-drivers/vivid/vivid-sdr-cap.c
+++ b/drivers/media/test-drivers/vivid/vivid-sdr-cap.c
@@ -455,7 +455,6 @@ int vidioc_g_fmt_sdr_cap(struct file *file, void *fh, struct v4l2_format *f)

 	f->fmt.sdr.pixelformat = dev->sdr_pixelformat;
 	f->fmt.sdr.buffersize = dev->sdr_buffersize;
-	memset(f->fmt.sdr.reserved, 0, sizeof(f->fmt.sdr.reserved));
 	return 0;
 }

@@ -468,7 +467,6 @@ int vidioc_s_fmt_sdr_cap(struct file *file, void *fh, struct v4l2_format *f)
 	if (vb2_is_busy(q))
 		return -EBUSY;

-	memset(f->fmt.sdr.reserved, 0, sizeof(f->fmt.sdr.reserved));
 	for (i = 0; i < ARRAY_SIZE(formats); i++) {
 		if (formats[i].pixelformat == f->fmt.sdr.pixelformat) {
 			dev->sdr_pixelformat = formats[i].pixelformat;
@@ -488,7 +486,6 @@ int vidioc_try_fmt_sdr_cap(struct file *file, void *fh, struct v4l2_format *f)
 {
 	int i;

-	memset(f->fmt.sdr.reserved, 0, sizeof(f->fmt.sdr.reserved));
 	for (i = 0; i < ARRAY_SIZE(formats); i++) {
 		if (formats[i].pixelformat == f->fmt.sdr.pixelformat) {
 			f->fmt.sdr.buffersize = formats[i].buffersize;
diff --git a/drivers/media/usb/airspy/airspy.c b/drivers/media/usb/airspy/airspy.c
index 751703db06f5..7a81be7970b2 100644
--- a/drivers/media/usb/airspy/airspy.c
+++ b/drivers/media/usb/airspy/airspy.c
@@ -632,7 +632,6 @@ static int airspy_g_fmt_sdr_cap(struct file *file, void *priv,

 	f->fmt.sdr.pixelformat = s->pixelformat;
 	f->fmt.sdr.buffersize = s->buffersize;
-	memset(f->fmt.sdr.reserved, 0, sizeof(f->fmt.sdr.reserved));

 	return 0;
 }
@@ -647,7 +646,6 @@ static int airspy_s_fmt_sdr_cap(struct file *file, void *priv,
 	if (vb2_is_busy(q))
 		return -EBUSY;

-	memset(f->fmt.sdr.reserved, 0, sizeof(f->fmt.sdr.reserved));
 	for (i = 0; i < NUM_FORMATS; i++) {
 		if (formats[i].pixelformat == f->fmt.sdr.pixelformat) {
 			s->pixelformat = formats[i].pixelformat;
@@ -670,7 +668,6 @@ static int airspy_try_fmt_sdr_cap(struct file *file, void *priv,
 {
 	int i;

-	memset(f->fmt.sdr.reserved, 0, sizeof(f->fmt.sdr.reserved));
 	for (i = 0; i < NUM_FORMATS; i++) {
 		if (formats[i].pixelformat == f->fmt.sdr.pixelformat) {
 			f->fmt.sdr.buffersize = formats[i].buffersize;
diff --git a/drivers/media/usb/hackrf/hackrf.c b/drivers/media/usb/hackrf/hackrf.c
index cec841ad7495..3e535be2c520 100644
--- a/drivers/media/usb/hackrf/hackrf.c
+++ b/drivers/media/usb/hackrf/hackrf.c
@@ -929,7 +929,6 @@ static int hackrf_s_fmt_sdr(struct file *file, void *priv,
 	if (vb2_is_busy(q))
 		return -EBUSY;

-	memset(f->fmt.sdr.reserved, 0, sizeof(f->fmt.sdr.reserved));
 	for (i = 0; i < NUM_FORMATS; i++) {
 		if (f->fmt.sdr.pixelformat == formats[i].pixelformat) {
 			dev->pixelformat = formats[i].pixelformat;
@@ -955,7 +954,6 @@ static int hackrf_g_fmt_sdr(struct file *file, void *priv,
 	dev_dbg(dev->dev, "pixelformat fourcc %4.4s\n",
 			(char *)&dev->pixelformat);

-	memset(f->fmt.sdr.reserved, 0, sizeof(f->fmt.sdr.reserved));
 	f->fmt.sdr.pixelformat = dev->pixelformat;
 	f->fmt.sdr.buffersize = dev->buffersize;

@@ -971,7 +969,6 @@ static int hackrf_try_fmt_sdr(struct file *file, void *priv,
 	dev_dbg(dev->dev, "pixelformat fourcc %4.4s\n",
 			(char *)&f->fmt.sdr.pixelformat);

-	memset(f->fmt.sdr.reserved, 0, sizeof(f->fmt.sdr.reserved));
 	for (i = 0; i < NUM_FORMATS; i++) {
 		if (formats[i].pixelformat == f->fmt.sdr.pixelformat) {
 			f->fmt.sdr.buffersize = formats[i].buffersize;
diff --git a/drivers/media/usb/msi2500/msi2500.c b/drivers/media/usb/msi2500/msi2500.c
index 63882a5248ae..71de6b4c4e4c 100644
--- a/drivers/media/usb/msi2500/msi2500.c
+++ b/drivers/media/usb/msi2500/msi2500.c
@@ -912,7 +912,6 @@ static int msi2500_g_fmt_sdr_cap(struct file *file, void *priv,

 	f->fmt.sdr.pixelformat = dev->pixelformat;
 	f->fmt.sdr.buffersize = dev->buffersize;
-	memset(f->fmt.sdr.reserved, 0, sizeof(f->fmt.sdr.reserved));

 	return 0;
 }
@@ -930,7 +929,6 @@ static int msi2500_s_fmt_sdr_cap(struct file *file, void *priv,
 	if (vb2_is_busy(q))
 		return -EBUSY;

-	memset(f->fmt.sdr.reserved, 0, sizeof(f->fmt.sdr.reserved));
 	for (i = 0; i < dev->num_formats; i++) {
 		if (formats[i].pixelformat == f->fmt.sdr.pixelformat) {
 			dev->pixelformat = formats[i].pixelformat;
@@ -957,7 +955,6 @@ static int msi2500_try_fmt_sdr_cap(struct file *file, void *priv,
 	dev_dbg(dev->dev, "pixelformat fourcc %4.4s\n",
 		(char *)&f->fmt.sdr.pixelformat);

-	memset(f->fmt.sdr.reserved, 0, sizeof(f->fmt.sdr.reserved));
 	for (i = 0; i < dev->num_formats; i++) {
 		if (formats[i].pixelformat == f->fmt.sdr.pixelformat) {
 			f->fmt.sdr.buffersize = formats[i].buffersize;
