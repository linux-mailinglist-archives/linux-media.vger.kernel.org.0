Return-Path: <linux-media+bounces-17302-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9764F967C4F
	for <lists+linux-media@lfdr.de>; Sun,  1 Sep 2024 23:18:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A8069B21268
	for <lists+linux-media@lfdr.de>; Sun,  1 Sep 2024 21:18:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B070878C6C;
	Sun,  1 Sep 2024 21:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="E/5ssvi1"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DBA556B7C
	for <linux-media@vger.kernel.org>; Sun,  1 Sep 2024 21:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725225528; cv=none; b=sPq65woLLooyG05AK/cwBpZw113q0LG9IknGR/VSNf6xyCa2G2iDf8L62i3GXPg2QMOka4vb+QbtvVePiVyD/QGIVb3I/50j0Y1MI8D+a9fNvZRROIAU6qPjK8oDpGqoSt7YktyAGy3YaPZm82Tr+Yl8xIdrUYAsxT4fuS/0aT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725225528; c=relaxed/simple;
	bh=ILjG5hChGpco5dpJh0wPTWa39drvRORG1RTgz/ISpEw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B4HbcM9aC7f9R2k/+omL/BIIw/9UTNRL9te1BrvChI7+htnRuMUMV40uXVRXUDDCDLjdw8t8qFNmfcNiJ03osTUNHcUGn6UZzuC43Er2Jqsoc/t7jrij7QHE2yElSYs8w/P7dm2FdagNKczaeLfFlcn4+fCPvsS8Xedp1tP8MYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=E/5ssvi1; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1725225525;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CUIyeIlUznQulBuCKWnaUtTqVDRvXFl2dD4Cxl3d2t8=;
	b=E/5ssvi19asvWPSIkynBG80dpwOj1uizqduLZ6PFhXUWf/rhft3ugWML8lR0h+uQefxZ6n
	abb6AnMfhhzy+Y1us1V7KCW3YAS0shhM+uGDVAaqFTx8A5b0GHrVb4CRNyJXml8lhkVi6r
	ZqeOLXNJMRva7V19/cTr9ejOwc5JuqI=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-421-IK7AKuZGOUisObvn7G_MWg-1; Sun,
 01 Sep 2024 17:18:40 -0400
X-MC-Unique: IK7AKuZGOUisObvn7G_MWg-1
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 2B19C1955D50;
	Sun,  1 Sep 2024 21:18:39 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.24])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 37F541955F1B;
	Sun,  1 Sep 2024 21:18:36 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	linux-media@vger.kernel.org
Subject: [PATCH 1/2] media: v4l: Call s_stream() on VCM when it is called on the associated sensor
Date: Sun,  1 Sep 2024 23:18:33 +0200
Message-ID: <20240901211834.145186-2-hdegoede@redhat.com>
In-Reply-To: <20240901211834.145186-1-hdegoede@redhat.com>
References: <20240901211834.145186-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15

Currently VCM drivers power-up the VCM as soon as the VCM's /dev node
is opened and through the runtime-pm device-link to the sensor this
also powers up the sensor.

Powering up the VCM and sensor when the /dev node is opened is undesirable,
without a VCM sensors delay powering up until s_stream(1) is called. This
allows querying / negotiating capabilities without powering things up.

Sometimes a long running daemon like pipewire may keep the /dev node open
all the time. The kernel should still be able to powerdown the VCM + sensor
in this scenario.

VCM drivers should be able to do the same as sensor drivers and only
power-up the VCM when s_stream(1) is called on the VCM subdev, but this
requires that s_stream() is actually called on the VCM when the sensor
starts / stops streaming.

The s_stream() call on sensor subdevs is done by CSI-receiver/ISP drivers.
To avoid needing to change all these call sites to also call s_stream()
on the VCM (if there is one) handle the VCM in the v4l2-core similar to how
the core takes care of turning on/off the privacy LED.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/media/v4l2-core/v4l2-async.c  | 20 +++++++++++++++++++
 drivers/media/v4l2-core/v4l2-subdev.c | 28 +++++++++++++++++++++------
 include/media/v4l2-subdev.h           |  2 ++
 3 files changed, 44 insertions(+), 6 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
index ee884a8221fb..9b854f1d1051 100644
--- a/drivers/media/v4l2-core/v4l2-async.c
+++ b/drivers/media/v4l2-core/v4l2-async.c
@@ -330,6 +330,11 @@ static int v4l2_async_create_ancillary_links(struct v4l2_async_notifier *n,
 		return 0;
 	}
 
+	if (sd->entity.function == MEDIA_ENT_F_LENS) {
+		dev_dbg(n->sd->dev, "Using %s VCM\n", dev_name(sd->dev));
+		n->sd->vcm = sd;
+	}
+
 	link = media_create_ancillary_link(&n->sd->entity, &sd->entity);
 
 	return IS_ERR(link) ? PTR_ERR(link) : 0;
@@ -871,6 +876,21 @@ void v4l2_async_unregister_subdev(struct v4l2_subdev *sd)
 	if (!sd->async_list.next)
 		return;
 
+#if defined(CONFIG_MEDIA_CONTROLLER)
+	if (sd->entity.function == MEDIA_ENT_F_LENS && sd->v4l2_dev && sd->v4l2_dev->mdev) {
+		struct media_entity *entity;
+
+		media_device_for_each_entity(entity, sd->v4l2_dev->mdev) {
+			struct v4l2_subdev *it = media_entity_to_v4l2_subdev(entity);
+
+			if (it->vcm == sd) {
+				dev_dbg(it->dev, "Clearing VCM\n");
+				it->vcm = NULL;
+			}
+		}
+	}
+#endif
+
 	v4l2_subdev_put_privacy_led(sd);
 
 	mutex_lock(&list_lock);
diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index 7c5812d55315..24a68d90f686 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -148,17 +148,33 @@ static int subdev_close(struct file *file)
 }
 #endif /* CONFIG_VIDEO_V4L2_SUBDEV_API */
 
-static void v4l2_subdev_enable_privacy_led(struct v4l2_subdev *sd)
+static void v4l2_subdev_enable_privacy_led_and_vcm(struct v4l2_subdev *sd)
 {
 #if IS_REACHABLE(CONFIG_LEDS_CLASS)
 	if (!IS_ERR_OR_NULL(sd->privacy_led))
 		led_set_brightness(sd->privacy_led,
 				   sd->privacy_led->max_brightness);
 #endif
+
+	if (sd->vcm && !sd->vcm_enabled &&
+	    v4l2_subdev_has_op(sd->vcm, video, s_stream)) {
+		int ret;
+
+		ret = v4l2_subdev_call(sd->vcm, video, s_stream, 1);
+		if (ret)
+			dev_err(sd->vcm->dev, "Error powering on VCM: %d\n", ret);
+		else
+			sd->vcm_enabled = true;
+	}
 }
 
-static void v4l2_subdev_disable_privacy_led(struct v4l2_subdev *sd)
+static void v4l2_subdev_disable_privacy_led_and_vcm(struct v4l2_subdev *sd)
 {
+	if (sd->vcm && sd->vcm_enabled) {
+		v4l2_subdev_call(sd->vcm, video, s_stream, 0);
+		sd->vcm_enabled = false;
+	}
+
 #if IS_REACHABLE(CONFIG_LEDS_CLASS)
 	if (!IS_ERR_OR_NULL(sd->privacy_led))
 		led_set_brightness(sd->privacy_led, 0);
@@ -466,9 +482,9 @@ static int call_s_stream(struct v4l2_subdev *sd, int enable)
 		sd->s_stream_enabled = enable;
 
 		if (enable)
-			v4l2_subdev_enable_privacy_led(sd);
+			v4l2_subdev_enable_privacy_led_and_vcm(sd);
 		else
-			v4l2_subdev_disable_privacy_led(sd);
+			v4l2_subdev_disable_privacy_led_and_vcm(sd);
 	}
 
 	return ret;
@@ -2289,7 +2305,7 @@ int v4l2_subdev_enable_streams(struct v4l2_subdev *sd, u32 pad,
 	 * for all cases.
 	 */
 	if (!use_s_stream && !already_streaming)
-		v4l2_subdev_enable_privacy_led(sd);
+		v4l2_subdev_enable_privacy_led_and_vcm(sd);
 
 done:
 	if (!use_s_stream)
@@ -2382,7 +2398,7 @@ int v4l2_subdev_disable_streams(struct v4l2_subdev *sd, u32 pad,
 done:
 	if (!use_s_stream) {
 		if (!v4l2_subdev_is_streaming(sd))
-			v4l2_subdev_disable_privacy_led(sd);
+			v4l2_subdev_disable_privacy_led_and_vcm(sd);
 
 		v4l2_subdev_unlock_state(state);
 	}
diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index bd235d325ff9..6568a0cc070b 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -1094,6 +1094,7 @@ struct v4l2_subdev {
 	 */
 
 	struct led_classdev *privacy_led;
+	struct v4l2_subdev *vcm;
 
 	/*
 	 * TODO: active_state should most likely be changed from a pointer to an
@@ -1104,6 +1105,7 @@ struct v4l2_subdev {
 	struct v4l2_subdev_state *active_state;
 	u64 enabled_pads;
 	bool s_stream_enabled;
+	bool vcm_enabled;
 };
 
 
-- 
2.46.0


