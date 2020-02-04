Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1B5EE152043
	for <lists+linux-media@lfdr.de>; Tue,  4 Feb 2020 19:13:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727477AbgBDSNS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Feb 2020 13:13:18 -0500
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:40409 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727355AbgBDSNS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 4 Feb 2020 13:13:18 -0500
Received: from [192.168.2.10] ([46.9.235.248])
        by smtp-cloud9.xs4all.net with ESMTPA
        id z2hFiucdo2Mf2z2hIiba8S; Tue, 04 Feb 2020 19:13:17 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1580839997; bh=zNNb0S/pEMagm2oXbxzdXtihog79FGP2kVgJuu37t+I=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=nnqT2dQbVFjZhPF7fFkhLTFAmJPUFWT9qloCnka5XbbTA30P6DBzT/pj8IyoJe/uN
         gw80GbW7A55CvbxNfRaGfn3wdv9mozyH+NP1zaO69auWG8AVk3UDA89Q4qpy7ClKS/
         R6F0rn+NaoW9W9fVwbIOjEz4/1G4sznKMNI3qgdr0Zw/PYaG5di/pimiROEa6Moo+S
         F+bXsCVmm7SlRuey5wXP0vzYKkuAKHfHNBplKpcTu8iXS6bwj4yteHYjxAdH60VwrJ
         qKhjcoVZ228K5qousoBxhDYkmK2buG9SetabPn/Ew2fwDDWVnG671wuYhsY0TVldGw
         /S5wzO7QGTjFg==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH] mc-entity.c: use WARN_ON, validate link pads
Message-ID: <0645786f-754e-c897-bd15-a9371e72a405@xs4all.nl>
Date:   Tue, 4 Feb 2020 19:13:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfLT4r4vwkBj1Nuz831S8K/43s3ro1uZDoJk/lfbyOQo/x942YyC6esAaFF1VuNUIHOYyXdhQsheZG/LM1h3kCwvYw7IN49mSF89qVEMOiHVcaSN72gpl
 jk1eq1p7TFk5ZWQuM1mQdoNWBLpq3MMrlH/Pn9iLH4q0P87Kf8X1q5hG02T012hUEJgcIKkZHNbBZA==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use WARN_ON instead of BUG_ON.

Add two new WARN_ONs to verify that the source pad is really a source
and that the sink pad is really a sink.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
index 7c429ce98bae..0f1461ac00f0 100644
--- a/drivers/media/mc/mc-entity.c
+++ b/drivers/media/mc/mc-entity.c
@@ -662,9 +662,14 @@ media_create_pad_link(struct media_entity *source, u16 source_pad,
 	struct media_link *link;
 	struct media_link *backlink;

-	BUG_ON(source == NULL || sink == NULL);
-	BUG_ON(source_pad >= source->num_pads);
-	BUG_ON(sink_pad >= sink->num_pads);
+	if (WARN_ON(source == NULL || sink == NULL) ||
+	    WARN_ON(source_pad >= source->num_pads) ||
+	    WARN_ON(sink_pad >= sink->num_pads))
+		return -EINVAL;
+	if (WARN_ON(!(source->pads[source_pad].flags & MEDIA_PAD_FL_SOURCE)))
+		return -EINVAL;
+	if (WARN_ON(!(sink->pads[sink_pad].flags & MEDIA_PAD_FL_SINK)))
+		return -EINVAL;

 	link = media_add_link(&source->links);
 	if (link == NULL)
