Return-Path: <linux-media+bounces-9743-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2154C8AAC0A
	for <lists+linux-media@lfdr.de>; Fri, 19 Apr 2024 11:52:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8B8C51F210AB
	for <lists+linux-media@lfdr.de>; Fri, 19 Apr 2024 09:52:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E175E128818;
	Fri, 19 Apr 2024 09:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="IYWOB4xi"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5169683CBB
	for <linux-media@vger.kernel.org>; Fri, 19 Apr 2024 09:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713520175; cv=none; b=JC3O97u1tOG6mRBAGAMhz9XO/N8hnK9P0jT8f/IzyDsEVVHeobJiH80L5IRzWA8T3689dyJWqeDRL0ZseqvbmgFxvrttGu06MXWv1kPOxuW4KlJ1Fk4QfSGE1yb7FlYbzhd7rnZHcBxD0bg/0A8dAi4QLwr/OcBSTWUJoPoENG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713520175; c=relaxed/simple;
	bh=IwVC+qmR5b/10H0elYXxcr5eG/G4ClY19WrOjc/vxJY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TYWcaibYLDT9kAhG8mruta3NVFNDDdTWkt9MBsYCSalunVX6O1bp2mZUQEYKdiGmGNOI5aRqZpSfp86Xumu3LE6j1CyCm8USWaXbzRlt3yFL2wZXbN7FOL0k/XJvCqI/lkDC4PQKwwwsdrWEgkE8/hV1ctex+DdO2KmQze+07B8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=IYWOB4xi; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-78f05afc8d6so120955885a.3
        for <linux-media@vger.kernel.org>; Fri, 19 Apr 2024 02:49:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1713520172; x=1714124972; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M/K5Byxt1ig+CQr/X/PeYwmg4ty1EjIby+WFZ625f+g=;
        b=IYWOB4xi57QKQvaMi2xOTTog7GkPX59ZjlhgVswh9TDKqU8F0GJ6dgLaqRJWunFXMb
         LZ3AePDlpQKXyOP7IZ8ZTUhaGnX0kPSU+HP7azWzi/dgZGtXDlur5NSK2u8zEAU/7SnT
         0B8UPHcf8qJSaCnzHKteqwOSbUdY9zt5U3VlQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713520172; x=1714124972;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M/K5Byxt1ig+CQr/X/PeYwmg4ty1EjIby+WFZ625f+g=;
        b=MmlSXnV9oSkSo5VE5WjCVnbu5qm/exNhe5vIjZ4rvxNYxxO6y10Qaw5ghusKy8Hmk1
         q5Vg/v2rK35cDYkd/WSoM5/rJQIV6t1xWfWuPEN+3WBfEKzOLN/ICsESIbOP/VWfuPjk
         ORloQVK9H9l7IPo/dMNDFNw39X3X2iFnyggZkr9lj/vcFkmOzH724LRZSh5foxxZiVyX
         qXa3M9BlcTw/lJv4EDcGf6L4PjP3gjRgcqHMNSj6vXGoLbHLblhaPbtk7OHUSEWwqy0h
         Ky/lljyuGOftqXZIO337B9zA9PQkC1rBFrLNxOTne+c/8jihv7PTMMbhJ4N9QFMfuEKf
         Y+uA==
X-Gm-Message-State: AOJu0YzIH++2ttKeCqyQ+jkxZL1/sLCA4MCkqvncGfV1/hPmodm9+0Pe
	MkPn9Eju2isGdNcYw4ZxVQBB2SaXyOwq5TIqIsgRV1SNWR0ovD7kvDeobE8JPw==
X-Google-Smtp-Source: AGHT+IFgAxI3cudbjf7QENem+4os/v4599VNo77B9jF2HzcU/N2a5nFApf/3c3scTYsGro99atnYNQ==
X-Received: by 2002:a05:620a:8da:b0:78a:68c3:dceb with SMTP id z26-20020a05620a08da00b0078a68c3dcebmr1504339qkz.32.1713520172428;
        Fri, 19 Apr 2024 02:49:32 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id dt14-20020a05620a478e00b0078d735ca917sm1434532qkb.123.2024.04.19.02.49.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Apr 2024 02:49:32 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 19 Apr 2024 09:47:57 +0000
Subject: [PATCH v2 11/26] media: s2255: Use refcount_t instead of atomic_t
 for num_channels
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240419-fix-cocci-v2-11-2119e692309c@chromium.org>
References: <20240419-fix-cocci-v2-0-2119e692309c@chromium.org>
In-Reply-To: <20240419-fix-cocci-v2-0-2119e692309c@chromium.org>
To: Martin Tuma <martin.tuma@digiteqautomotive.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hugues Fruchet <hugues.fruchet@foss.st.com>, 
 Alain Volmat <alain.volmat@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Sowjanya Komatineni <skomatineni@nvidia.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Hans Verkuil <hverkuil@xs4all.nl>, Sergey Kozlov <serjk@netup.ru>, 
 Abylay Ospan <aospan@netup.ru>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Dmitry Osipenko <digetx@gmail.com>, 
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
 Sylvain Petinot <sylvain.petinot@foss.st.com>, 
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev, 
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.12.4

Use an API that resembles more the actual use of num_channels.

Found by cocci:
drivers/media/usb/s2255/s2255drv.c:2362:5-24: WARNING: atomic_dec_and_test variation before object free at line 2363.
drivers/media/usb/s2255/s2255drv.c:1557:5-24: WARNING: atomic_dec_and_test variation before object free at line 1558.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/s2255/s2255drv.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/media/usb/s2255/s2255drv.c b/drivers/media/usb/s2255/s2255drv.c
index 8e1de1e8bd12..a6e450181fd0 100644
--- a/drivers/media/usb/s2255/s2255drv.c
+++ b/drivers/media/usb/s2255/s2255drv.c
@@ -247,7 +247,7 @@ struct s2255_vc {
 struct s2255_dev {
 	struct s2255_vc         vc[MAX_CHANNELS];
 	struct v4l2_device      v4l2_dev;
-	atomic_t                num_channels;
+	refcount_t		num_channels;
 	int			frames;
 	struct mutex		lock;	/* channels[].vdev.lock */
 	struct mutex		cmdlock; /* protects cmdbuf */
@@ -1550,11 +1550,11 @@ static void s2255_video_device_release(struct video_device *vdev)
 		container_of(vdev, struct s2255_vc, vdev);
 
 	dprintk(dev, 4, "%s, chnls: %d\n", __func__,
-		atomic_read(&dev->num_channels));
+		refcount_read(&dev->num_channels));
 
 	v4l2_ctrl_handler_free(&vc->hdl);
 
-	if (atomic_dec_and_test(&dev->num_channels))
+	if (refcount_dec_and_test(&dev->num_channels))
 		s2255_destroy(dev);
 	return;
 }
@@ -1659,7 +1659,7 @@ static int s2255_probe_v4l(struct s2255_dev *dev)
 				"failed to register video device!\n");
 			break;
 		}
-		atomic_inc(&dev->num_channels);
+		refcount_inc(&dev->num_channels);
 		v4l2_info(&dev->v4l2_dev, "V4L2 device registered as %s\n",
 			  video_device_node_name(&vc->vdev));
 
@@ -1667,11 +1667,11 @@ static int s2255_probe_v4l(struct s2255_dev *dev)
 	pr_info("Sensoray 2255 V4L driver Revision: %s\n",
 		S2255_VERSION);
 	/* if no channels registered, return error and probe will fail*/
-	if (atomic_read(&dev->num_channels) == 0) {
+	if (refcount_read(&dev->num_channels) == 0) {
 		v4l2_device_unregister(&dev->v4l2_dev);
 		return ret;
 	}
-	if (atomic_read(&dev->num_channels) != MAX_CHANNELS)
+	if (refcount_read(&dev->num_channels) != MAX_CHANNELS)
 		pr_warn("s2255: Not all channels available.\n");
 	return 0;
 }
@@ -2221,7 +2221,7 @@ static int s2255_probe(struct usb_interface *interface,
 		goto errorFWDATA1;
 	}
 
-	atomic_set(&dev->num_channels, 0);
+	refcount_set(&dev->num_channels, 0);
 	dev->pid = id->idProduct;
 	dev->fw_data = kzalloc(sizeof(struct s2255_fw), GFP_KERNEL);
 	if (!dev->fw_data)
@@ -2341,12 +2341,12 @@ static void s2255_disconnect(struct usb_interface *interface)
 {
 	struct s2255_dev *dev = to_s2255_dev(usb_get_intfdata(interface));
 	int i;
-	int channels = atomic_read(&dev->num_channels);
+	int channels = refcount_read(&dev->num_channels);
 	mutex_lock(&dev->lock);
 	v4l2_device_disconnect(&dev->v4l2_dev);
 	mutex_unlock(&dev->lock);
 	/*see comments in the uvc_driver.c usb disconnect function */
-	atomic_inc(&dev->num_channels);
+	refcount_inc(&dev->num_channels);
 	/* unregister each video device. */
 	for (i = 0; i < channels; i++)
 		video_unregister_device(&dev->vc[i].vdev);
@@ -2359,7 +2359,7 @@ static void s2255_disconnect(struct usb_interface *interface)
 		dev->vc[i].vidstatus_ready = 1;
 		wake_up(&dev->vc[i].wait_vidstatus);
 	}
-	if (atomic_dec_and_test(&dev->num_channels))
+	if (refcount_dec_and_test(&dev->num_channels))
 		s2255_destroy(dev);
 	dev_info(&interface->dev, "%s\n", __func__);
 }

-- 
2.44.0.769.g3c40516874-goog


