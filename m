Return-Path: <linux-media+bounces-9357-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CFB828A4E5B
	for <lists+linux-media@lfdr.de>; Mon, 15 Apr 2024 14:03:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0D83E1C21294
	for <lists+linux-media@lfdr.de>; Mon, 15 Apr 2024 12:03:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D04166BFC0;
	Mon, 15 Apr 2024 12:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hyhaxuc/"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB59D6BFB0
	for <linux-media@vger.kernel.org>; Mon, 15 Apr 2024 12:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713182573; cv=none; b=O1yuW+5Dq+4kB18GalNvk50ezbFTbDr/9NlHRwCeDeUlAQ0sjuMywmax91cA1WFcHKBAOHkKC0CDswIeB4kuTlbiS9gjJ9fuChHqD6ifDNNasaGA6wjAGTL54kqPuX03d6TXuCvdALEnvt1Hux/ujgdtbFOjGE4u2/QBSG3rbdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713182573; c=relaxed/simple;
	bh=8abwr+b3L1AaVGNNdHGX2GedwzaDTMXGCg2UGiHzzKQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OviPXeRc4YxDZuaeqyOoO7ijwaOQlfIvRc+Y+NqYex7T5NyFJfr4la+buYaDT2ZMoZftRtk3SQ2Hnr36S2cfo1VzM9W0fB2QFNFCJMubIk+eLKuzDnGuJei21lUtZfAzZdnUaQs+QmW762sS8ieR94Ep+tf8fovQzsrfYY3pgcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hyhaxuc/; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713182571;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yjnGO37/1HmO/T1PUaHWC4oTgJQkZ4oUbzDCgOMCbEE=;
	b=hyhaxuc/BlmpZA0ZM4Mi6vwQoLMyT1OxZNsPrVfV/JOz3esYlaOtN2WfWcD5gZTih3Ugfw
	GxpkxNydi69NEPvzNqogkWWP/M42L7CMmgXPmFlXUzzU+Vf5ou+3woIPp4QsccPHRTJzGG
	Ts80DXft8CGNqyXo6BPNuTxJY6ip3Bw=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-656-yUjjsIzLNn-pcdUxDmFnJA-1; Mon,
 15 Apr 2024 08:02:47 -0400
X-MC-Unique: yUjjsIzLNn-pcdUxDmFnJA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2E2D928C97C7;
	Mon, 15 Apr 2024 12:02:47 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.195.17])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E5FB6C13FA2;
	Mon, 15 Apr 2024 12:02:45 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kate Hsuan <hpa@redhat.com>,
	Tsuchiya Yuto <kitakar@gmail.com>,
	Fabio Aiuto <fabioaiuto83@gmail.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 09/23] media: atomisp: Drop atomisp_pipe_check() from atomisp_link_setup()
Date: Mon, 15 Apr 2024 14:02:06 +0200
Message-ID: <20240415120220.219480-10-hdegoede@redhat.com>
In-Reply-To: <20240415120220.219480-1-hdegoede@redhat.com>
References: <20240415120220.219480-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8

The media-controller core (__media_entity_setup_link()) already checks
that the pads of the link are not streaming before calling the setup_link()
pad-op so calling atomisp_pipe_check() is not necessary;

and taking isp->mutex inside the setup_link() pad-op leads to a possible
ABBA deadlock vs the media-device graph_mutex which in the case of
the setup_link() pad-op is taken before calling the op, while in other
scenarios the graph_mutex is taken after the isp->mutex.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/pci/atomisp_subdev.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_subdev.c b/drivers/staging/media/atomisp/pci/atomisp_subdev.c
index 53225958c23b..1bb33460210c 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_subdev.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_subdev.c
@@ -644,7 +644,7 @@ static int atomisp_link_setup(struct media_entity *entity,
 					      entity);
 	struct atomisp_sub_device *asd = v4l2_get_subdevdata(sd);
 	struct atomisp_device *isp = asd->isp;
-	int i, ret;
+	int i;
 
 	/* ISP's source is immutable */
 	if (local != &asd->pads[ATOMISP_SUBDEV_PAD_SINK]) {
@@ -663,12 +663,6 @@ static int atomisp_link_setup(struct media_entity *entity,
 		return -EINVAL;
 	}
 
-	mutex_lock(&isp->mutex);
-	ret = atomisp_pipe_check(&asd->video_out, true);
-	mutex_unlock(&isp->mutex);
-	if (ret)
-		return ret;
-
 	/* Turn off the sensor on link disable */
 	if (!(flags & MEDIA_LNK_FL_ENABLED)) {
 		atomisp_s_sensor_power(isp, i, 0);
-- 
2.44.0


