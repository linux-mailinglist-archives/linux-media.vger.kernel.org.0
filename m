Return-Path: <linux-media+bounces-61243-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WDDCKIX9AmqrzQEAu9opvQ
	(envelope-from <linux-media+bounces-61243-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 12:14:29 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F91451E5A0
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 12:14:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4E7BA3083689
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 10:09:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DCDC4963B2;
	Tue, 12 May 2026 10:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C9x2meSd"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F4C2346AC4
	for <linux-media@vger.kernel.org>; Tue, 12 May 2026 10:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778580554; cv=none; b=ONFZ2G4b7vkR+0K3rQXno6q887JEEbgk9fdiOlpWPHUOnLGQAqVVRCEoK5CnSk6ym8MKvo9IhkeqSuB+juApqVwLXGBsLa0e9pscVRSdHaYt/KWheU0yy8sL+fK0TnTt9FFl01Jt/RDr/LvOrJRn5xsRgVKMmpLxNt4e/9WHOI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778580554; c=relaxed/simple;
	bh=gSX6KqPA/5Nw3cjKmpw31wmT3V1bR1hYOq73V9FJfu0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eqOtXBXhae5vv1WES5nk7VeSLE6fjTNnC205hb7yeS0Rx1ScW9J4vO6tJQ+gboKmRrBwKSSxFOO8VWp8l4iU6m7EaVlyeOwpxXjHD7iRjqva9hDArl4pDAV8xaSRde6Z8tdcTBeggT96vcvVR9165fAUxmx1TwyNPQCEyjx2ofE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C9x2meSd; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-67b32c695efso10177976a12.1
        for <linux-media@vger.kernel.org>; Tue, 12 May 2026 03:09:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778580550; x=1779185350; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mXp2EXE6kultyDnkZ6jPOv1Hatsx2+KE38CNHXZv9vA=;
        b=C9x2meSdV/R7IqJvMFLv/pfWO10zTCxRaOX4PxuWU2RirvHgW/ATknyRobs6neg27w
         49AIMTjmhxdyhHrYH4u0N7swQp4NORTifeVmx6iMdvMIwNug9IajVurG/+1rhgQO5XoM
         6F9z9ZMpGnHHyabNzw2osspnsa6xh8KD2mTa3oR2VCf7KR0PJDwX6d0ldQkOA2xcVN9o
         GaCs8okEOEA2J32RkqUqjnNNS3ayaPgARZst2hNsfmXbH7oQpFp2xUHkNYsBv4UXmO9d
         3CS/wjO7fcvnfYWSce7ezRR53P5ORO4UwkDCJJxTr8eNZL9cN2pCCYve0ZiIa7t8WpJW
         qo0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778580550; x=1779185350;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mXp2EXE6kultyDnkZ6jPOv1Hatsx2+KE38CNHXZv9vA=;
        b=kAr6u3N8rICQAo/9XuTshlbKtBxwpLobke8oGKcWHKNqvhPGFcBdjVm07gS4pKVcFo
         aEsgP6SSSafYMX/kl+NrLjQqoPovhhW2LuZEcG8O22QDjkavtJFM7vmPiJJxASlT1bWE
         aR1EmRWTxSjrEkGD1V9NElb8VFuh8KULf+GcFgy6Xd68MudmNVYsOgE552hnuLuPD7u4
         g0/xVdWl/+VvGQK5gxwSijqr8516s8UiTJYyFosIPDDGdeozw69JXCRZj8dJoxKoYW4r
         M+Zkq1GOa5xOb4/p3reRqYwUvxmtlzFS6/B0TP8f6t4KAfaB0arZn7KQA9cCRTUKCi1G
         0ADg==
X-Gm-Message-State: AOJu0Yz6TwkLXCY8Lh3QsZGfpFqZFCU4P7HTAgdPiwNhqhoraYysrdNm
	fOmEWRzEaEwVjz5UFiUMAgJIxEHiJEpNN6x12oHYfBEHiQbqbk1yO9Ja
X-Gm-Gg: Acq92OFou/Ot63nBioD7/ssr/B7u8pF77dT2prWH9UsXDp4xW2mLhXQOgh7eSYe80ko
	+5PeJFgaBT6VX0JXN5lMg3/TLZV3I3+Z+BuIWK0SaXLujp576D+NaUrLjztWiGBe8pe0tpdrYpt
	VeHl4xF/fq9/ghp8HO1VwsrXKH9GWf9Wyd4k6qetnzsr6f5GHPay6GWIhrjAouY4NivubK+uW3u
	Q0vEfdxyp0NK3DZdhoalWHeInvsuRYf11AlRnMeI9AMUQ99seIfAL90P9pJZb2vm3ElhdsM6HDE
	A82nCY86RWsALqNm37nKK6OVQsvmzIu3nID8lK6STipqSfRRw5zuMctvWiAwPqhfK7ccG4HegBj
	mKZyKDcK6Jlt9ncr5nCdWg/jajG4190utLBByXHReplU//5KgbsDHFUOe9t6xevqA1T8J50Bjyr
	QbGBssoxEoIYtN
X-Received: by 2002:a17:906:8d8b:b0:bd0:cc2c:8a2e with SMTP id a640c23a62f3a-bd23bd0b7aamr197729866b.20.1778580549933;
        Tue, 12 May 2026 03:09:09 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd09513b8cesm265185266b.38.2026.05.12.03.09.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 03:09:09 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/1] media: i2c: mt9m114: Add get_fwnode_pad operation for IFP
Date: Tue, 12 May 2026 13:08:58 +0300
Message-ID: <20260512100858.54493-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260512100858.54493-1-clamor95@gmail.com>
References: <20260512100858.54493-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 0F91451E5A0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-61243-lists,linux-media=lfdr.de];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[linux.intel.com,ideasonboard.com,kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-0.995];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Currently, the driver's binding exposes only one endpoint, which maps to
the IFP subdevice's SOURCE pad. This configuration causes failures for
many devices using this camera because both the DT binding and the
one-to-one pad mapping logic map the endpoint to the wrong pad. Fix this
by implementing the get_fwnode_pad operation for the IFP, which correctly
matches the endpoint to the corresponding IFP pad.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/media/i2c/mt9m114.c | 44 ++++++++++++++++++++++++++++---------
 1 file changed, 34 insertions(+), 10 deletions(-)

diff --git a/drivers/media/i2c/mt9m114.c b/drivers/media/i2c/mt9m114.c
index e395e2d14e97..16c2582551d3 100644
--- a/drivers/media/i2c/mt9m114.c
+++ b/drivers/media/i2c/mt9m114.c
@@ -1020,14 +1020,6 @@ static int mt9m114_stop_streaming(struct mt9m114 *sensor)
 	return ret;
 }
 
-/* -----------------------------------------------------------------------------
- * Common Subdev Operations
- */
-
-static const struct media_entity_operations mt9m114_entity_ops = {
-	.link_validate = v4l2_subdev_link_validate,
-};
-
 /* -----------------------------------------------------------------------------
  * Pixel Array Control Operations
  */
@@ -1381,6 +1373,10 @@ static const struct v4l2_subdev_internal_ops mt9m114_pa_internal_ops = {
 	.init_state = mt9m114_pa_init_state,
 };
 
+static const struct media_entity_operations mt9m114_pa_entity_ops = {
+	.link_validate = v4l2_subdev_link_validate,
+};
+
 static int mt9m114_pa_init(struct mt9m114 *sensor)
 {
 	struct v4l2_ctrl_handler *hdl = &sensor->pa.hdl;
@@ -1403,7 +1399,7 @@ static int mt9m114_pa_init(struct mt9m114 *sensor)
 
 	/* Initialize the media entity. */
 	sd->entity.function = MEDIA_ENT_F_CAM_SENSOR;
-	sd->entity.ops = &mt9m114_entity_ops;
+	sd->entity.ops = &mt9m114_pa_entity_ops;
 	pads[0].flags = MEDIA_PAD_FL_SOURCE;
 	ret = media_entity_pads_init(&sd->entity, 1, pads);
 	if (ret < 0)
@@ -2092,6 +2088,29 @@ static int mt9m114_ifp_registered(struct v4l2_subdev *sd)
 	return 0;
 }
 
+/*
+ * The IFP has only one fwnode endpoint, which corresponds to the pad
+ * linked to the PA (PA SINK), while it should be the SOURCE for the
+ * next media device in the pipe.
+ */
+static int mt9m114_ifp_get_fwnode_pad(struct media_entity *entity,
+				      struct fwnode_endpoint *endpoint)
+{
+	struct v4l2_subdev *sd = media_entity_to_v4l2_subdev(entity);
+	struct mt9m114 *sensor = ifp_to_mt9m114(sd);
+	struct fwnode_handle *ifp_port = dev_fwnode(&sensor->client->dev);
+	struct fwnode_handle *ifp_ep;
+	int ret;
+
+	ifp_ep = fwnode_graph_get_next_endpoint(ifp_port, NULL);
+
+	ret = endpoint->local_fwnode == ifp_ep ? 1 : -ENXIO;
+
+	fwnode_handle_put(ifp_ep);
+
+	return ret;
+}
+
 static const struct v4l2_subdev_video_ops mt9m114_ifp_video_ops = {
 	.s_stream = mt9m114_ifp_s_stream,
 };
@@ -2119,6 +2138,11 @@ static const struct v4l2_subdev_internal_ops mt9m114_ifp_internal_ops = {
 	.unregistered = mt9m114_ifp_unregistered,
 };
 
+static const struct media_entity_operations mt9m114_ifp_entity_ops = {
+	.link_validate = v4l2_subdev_link_validate,
+	.get_fwnode_pad = mt9m114_ifp_get_fwnode_pad,
+};
+
 static int mt9m114_ifp_init(struct mt9m114 *sensor)
 {
 	struct v4l2_subdev *sd = &sensor->ifp.sd;
@@ -2136,7 +2160,7 @@ static int mt9m114_ifp_init(struct mt9m114 *sensor)
 
 	/* Initialize the media entity. */
 	sd->entity.function = MEDIA_ENT_F_PROC_VIDEO_ISP;
-	sd->entity.ops = &mt9m114_entity_ops;
+	sd->entity.ops = &mt9m114_ifp_entity_ops;
 	pads[0].flags = MEDIA_PAD_FL_SINK;
 	pads[1].flags = MEDIA_PAD_FL_SOURCE;
 	ret = media_entity_pads_init(&sd->entity, 2, pads);
-- 
2.51.0


