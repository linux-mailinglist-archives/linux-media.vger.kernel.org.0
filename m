Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0FCB9152057
	for <lists+linux-media@lfdr.de>; Tue,  4 Feb 2020 19:19:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727494AbgBDST2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Feb 2020 13:19:28 -0500
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:39715 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727483AbgBDST2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 4 Feb 2020 13:19:28 -0500
Received: from [192.168.2.10] ([46.9.235.248])
        by smtp-cloud9.xs4all.net with ESMTPA
        id z2nCiuduY2Mf2z2nGibafI; Tue, 04 Feb 2020 19:19:26 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1580840366; bh=LbmqlBjRst2slais2X6rwWtixBF5YLiUo/4F59q22qY=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=b1B5bgn0uLcC2KeAA9b4lrZ2bhJRISd3IDZQ8KE1NCGl5pPLGRG1+Nfjyu2Bt0GsP
         5ctXlxdSocV2v6i2md9njVtg95Lriw7kH/rgKTVpXBNGX3uFrOE+sM8mUHJ8unQdTC
         VwNKaL5gUgrIdKHop24kodjw3c9QUAjtUQru3+T3OsL4lZy3I3FN1laxTiEo1by/EW
         wHmWLZcYjs2anC18wp6ACxxulbpnklB8YWB0fQwVbvMeF84Hk6U0yutzoB+3NcLKZO
         ezc74YvquC+6PxIYcxdcslPJ8pIwtVcs/Hjg3qU7H+WHpCuYx0wm6U9VLE5OWp4bmM
         am1Zk0ALY71GA==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH for v5.6] mc-entity.c: use & to check pad flags, not ==
Message-ID: <ac1e8940-91c6-b07c-e3ae-55f32931f9c1@xs4all.nl>
Date:   Tue, 4 Feb 2020 19:19:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfK+YXI6qWhxrr+Nk7FUV43HYDWXRXSpL97VmRW3GQfWXN2PIdepJXfxFb/YXBQOheF2WseUVeGSN5OC8L3C9y9jb+Uu7ybQSVnkfWYBiD7HLgNOHXuob
 ZQF2gyKXETTJ9SdYWEaxzmK8atOq4tGV1gAKNtFY12d/dspGIOHM1itIdOt+BGWiw7ryoq8FyuzW6OcLB5dOXLtKpr6wdfQlFcQbo5ZLVKvUX807Jn11olLd
 izGqtZG0v6wTmAx2R3t2MB2EN3zAjLWcb4g8fVuPWKo=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

These are bits so to test if a pad is a sink you use & but not ==.

It looks like the only reason this hasn't caused problems before is that
media_get_pad_index() is currently only used with pads that do not set the
MEDIA_PAD_FL_MUST_CONNECT flag. So a pad really had only the SINK or SOURCE
flag set and nothing else.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: <stable@vger.kernel.org>      # for v5.3 and up
---
diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
index 7c429ce98bae..0f1461ac00f0 100644
--- a/drivers/media/mc/mc-entity.c
+++ b/drivers/media/mc/mc-entity.c
@@ -639,9 +639,9 @@ int media_get_pad_index(struct media_entity *entity, bool is_sink,
 		return -EINVAL;

 	for (i = 0; i < entity->num_pads; i++) {
-		if (entity->pads[i].flags == MEDIA_PAD_FL_SINK)
+		if (entity->pads[i].flags & MEDIA_PAD_FL_SINK)
 			pad_is_sink = true;
-		else if (entity->pads[i].flags == MEDIA_PAD_FL_SOURCE)
+		else if (entity->pads[i].flags & MEDIA_PAD_FL_SOURCE)
 			pad_is_sink = false;
 		else
 			continue;	/* This is an error! */
