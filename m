Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 87CA21ED476
	for <lists+linux-media@lfdr.de>; Wed,  3 Jun 2020 18:41:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726099AbgFCQk7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 Jun 2020 12:40:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725904AbgFCQk7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 3 Jun 2020 12:40:59 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0623DC08C5C0;
        Wed,  3 Jun 2020 09:40:58 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id a127so1940528pfa.12;
        Wed, 03 Jun 2020 09:40:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zSsRjQVeqzJlkafl/aYe8wKiajVfX5PGUdsv//gCtIc=;
        b=bX+6Mu192lu/2h8881PNWPLVXQ3zIwZ6R9xI32RBvGsT6XZ9z0MTWynTG9bb4G/e15
         S7vfIBLpXOnyc5xNijc5OCFEQH5AGXD3vNXubqDR4H8KL06gLp+QTH3WQs6IK9cYatTQ
         kyjd8ZwsInHMPYJ6/dqasLi/MSYJQrbpRcranAO3LWYr0iUk057YYB/O6pYuGN+0ewSi
         a9HBpGDmfqzdUvt6N2DBmpMs+Nw6Zh8mS/D8qVE6bR3OFgCLiHtJX6CrCeHrYzdE0Tqm
         /pHN9h9XH23momKxov4QZi9WYMneXeUEMuVSnyHvg9laiEa4hQfQw+5P2ZD4ndDUE6Fc
         3B6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zSsRjQVeqzJlkafl/aYe8wKiajVfX5PGUdsv//gCtIc=;
        b=BSfo0v9gMmocYXIKhpSAahnCG6RhmX/EMFjAMEET4gFSJ+6MxDKDn0btEtg/Z2ZtXD
         ZtsgHbygcKCylNpu7Cu2yhXGcJWCBWZf1OwVdrsEwan+xZxRKutB2wGNvjnv1bESzqn/
         p8qoJfj2B+b8K39ZNbgcZ+cXT1Nn961tXvfp0uyZUS4U2viAp0Tdb8tTYDcQqBbKY6AL
         qJGoYRevtj+vO4lQKrE6vZU53WpfHIaxJeYyTs3Ys67TQY6U/0o3Bbx3r0UhG5vcj9ma
         yQEl1IBTyZZDECosiwIpolKnNzrHewr6279ki4fyRioTQH8e65GEA4XbV5JIAF9yeMeL
         4Nfg==
X-Gm-Message-State: AOAM531S9UhoqPuQJ58MhgxIEcrJHo7gGo10v9/oeL/hwLeZLMnAOMST
        J8geipCcnKbpMTLe0UeCGKw=
X-Google-Smtp-Source: ABdhPJyAqM9NRasAmW/5DFt/1B7CD8A1GjXPL0PjhxkT2A5C6GdDP7OINYr0jjP8Ffvwg6T0HGl+sQ==
X-Received: by 2002:a17:90a:642:: with SMTP id q2mr732481pje.71.1591202458251;
        Wed, 03 Jun 2020 09:40:58 -0700 (PDT)
Received: from suzukaze.ipads-lab.se.sjtu.edu.cn ([202.120.40.82])
        by smtp.gmail.com with ESMTPSA id b14sm2086360pgb.32.2020.06.03.09.40.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2020 09:40:57 -0700 (PDT)
From:   Chuhong Yuan <hslester96@gmail.com>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Lubomir Rintel <lkundrak@v3.sk>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, Chuhong Yuan <hslester96@gmail.com>
Subject: [PATCH v2] media: marvell-ccic: Add missed v4l2_async_notifier_cleanup()
Date:   Thu,  4 Jun 2020 00:40:48 +0800
Message-Id: <20200603164048.2101106-1-hslester96@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

mccic_register() forgets to cleanup the notifier in its error handler.
mccic_shutdown() also misses calling v4l2_async_notifier_cleanup().
Add the missed calls to fix them.

Fixes: 3eefe36cc00c ("media: marvell-ccic: use async notifier to get the sensor")
Signed-off-by: Chuhong Yuan <hslester96@gmail.com>
---
Changes in v2:
  - Also add v4l2_async_notifier_cleanup() for mccic_shutdown().
  - Modify description.

 drivers/media/platform/marvell-ccic/mcam-core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/platform/marvell-ccic/mcam-core.c b/drivers/media/platform/marvell-ccic/mcam-core.c
index 09775b6624c6..326e79b8531c 100644
--- a/drivers/media/platform/marvell-ccic/mcam-core.c
+++ b/drivers/media/platform/marvell-ccic/mcam-core.c
@@ -1940,6 +1940,7 @@ int mccic_register(struct mcam_camera *cam)
 out:
 	v4l2_async_notifier_unregister(&cam->notifier);
 	v4l2_device_unregister(&cam->v4l2_dev);
+	v4l2_async_notifier_cleanup(&cam->notifier);
 	return ret;
 }
 EXPORT_SYMBOL_GPL(mccic_register);
@@ -1961,6 +1962,7 @@ void mccic_shutdown(struct mcam_camera *cam)
 	v4l2_ctrl_handler_free(&cam->ctrl_handler);
 	v4l2_async_notifier_unregister(&cam->notifier);
 	v4l2_device_unregister(&cam->v4l2_dev);
+	v4l2_async_notifier_cleanup(&cam->notifier);
 }
 EXPORT_SYMBOL_GPL(mccic_shutdown);
 
-- 
2.26.2

