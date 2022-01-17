Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3FAFC491041
	for <lists+linux-media@lfdr.de>; Mon, 17 Jan 2022 19:28:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242576AbiAQS1I (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Jan 2022 13:27:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242074AbiAQS1E (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Jan 2022 13:27:04 -0500
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3FDDC06173E
        for <linux-media@vger.kernel.org>; Mon, 17 Jan 2022 10:27:03 -0800 (PST)
Received: by mail-ed1-x52e.google.com with SMTP id k15so69067534edk.13
        for <linux-media@vger.kernel.org>; Mon, 17 Jan 2022 10:27:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cKwU2z0WzA6eXQxgtc3caEqVcpArN/pRGPxwhgA1Nc4=;
        b=YTt7Qi7y/uU1VdwxKGR/sNUDhDVueC1mcA/WpAjQ9pPOiXP4tVdnt0G0LfVX1EOq2J
         G+1VR4LBQ5d1z6WbledtfytoOVB6nEW4eFjQybcjraXgnMl/Edx83ZCq149HbhDeQai7
         KCXAj+bC2Fk3bB9G4Gtlt+euMbd1IoqkiKYGk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cKwU2z0WzA6eXQxgtc3caEqVcpArN/pRGPxwhgA1Nc4=;
        b=yB6y9qNk6ljWTsORZYzIHww1W6ynqbe5qhaj+DS6F8vFRnefA6BjqwZ9lnTi7w0Hr3
         7/3cuA4tylqG/4fDGDrQIpn8f3XkHp5Al+EJvM4J9dHedirU8B9YY4476D9VTMYR9Yi5
         zkJB+ixivR20VvnLMoJsw5w9qoYS0/xHEBBQHw9aLV0yK1RzNcG9n3R354wNHEKUPqQD
         k9cUi/+T1kFgHKT2gaGE3ozfYtlYMICL9UeOcg4eyIHDk/6OYJ5myMOm+djXqLeNoXzD
         9BUFQp13a1gdViwMghTNYJESE4hYdoIlJ9CjEY8V00yOlX6onkt3LbYDFSlbm2M4+eJ3
         2LIQ==
X-Gm-Message-State: AOAM5337NEoVyeZkXSR3TizzS3zBg6/hbeLMtM6nuQlKXmZ6UgVUYBsX
        pylwDZUJwmFhvafXUw009ckR2A==
X-Google-Smtp-Source: ABdhPJzg0fiKPTbN7d9qhzbpAB13l0/jmPcmZm5H77obfav/9qZ6paGnpcIS0mqhaE+W202LBpGezw==
X-Received: by 2002:a17:906:e295:: with SMTP id gg21mr18308367ejb.375.1642444022462;
        Mon, 17 Jan 2022 10:27:02 -0800 (PST)
Received: from alco.lan (80.71.134.83.ipv4.parknet.dk. [80.71.134.83])
        by smtp.gmail.com with ESMTPSA id la10sm4657462ejc.22.2022.01.17.10.27.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jan 2022 10:27:02 -0800 (PST)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Nicolas Dufresne <nicolas@ndufresne.ca>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        tfiga@chromium.org,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v3 1/3] media: v4l2-dev.c: Add Meta: to the name of metadata devices
Date:   Mon, 17 Jan 2022 19:26:56 +0100
Message-Id: <20220117182658.468993-2-ribalda@chromium.org>
X-Mailer: git-send-email 2.34.1.703.g22d0c6ccf7-goog
In-Reply-To: <20220117182658.468993-1-ribalda@chromium.org>
References: <20220117182658.468993-1-ribalda@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Devices with Metadata output (like uvc), create two video devices, one
for the data itself and another one for the metadata.

Add a "Meta: " to the beginning of the device name, as suggested by Mauro,
to avoid having multiple devices with the same name.

Fixes v4l2-compliance:
Media Controller ioctls:
     fail: v4l2-test-media.cpp(205): v2_entity_names_set.find(key) != v2_entity_names_set.end()
   test MEDIA_IOC_G_TOPOLOGY: FAIL
     fail: v4l2-test-media.cpp(394): num_data_links != num_links
   test MEDIA_IOC_ENUM_ENTITIES/LINKS: FAIL

Suggested-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/v4l2-core/v4l2-dev.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
index d03ace324db0..98be80010702 100644
--- a/drivers/media/v4l2-core/v4l2-dev.c
+++ b/drivers/media/v4l2-core/v4l2-dev.c
@@ -901,6 +901,15 @@ int __video_register_device(struct video_device *vdev,
 	if (WARN_ON(type != VFL_TYPE_SUBDEV && !vdev->device_caps))
 		return -EINVAL;
 
+	/* Add Meta: to metadata device names */
+	if (vdev->device_caps &
+	    (V4L2_CAP_META_CAPTURE | V4L2_CAP_META_OUTPUT)) {
+		char aux[sizeof(vdev->name)];
+
+		snprintf(aux, sizeof(aux), "Meta: %s", vdev->name);
+		strscpy(vdev->name, aux, sizeof(aux));
+	}
+
 	/* v4l2_fh support */
 	spin_lock_init(&vdev->fh_lock);
 	INIT_LIST_HEAD(&vdev->fh_list);
-- 
2.34.1.703.g22d0c6ccf7-goog

