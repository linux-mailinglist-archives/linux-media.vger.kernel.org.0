Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C5060467FBC
	for <lists+linux-media@lfdr.de>; Fri,  3 Dec 2021 23:13:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1383358AbhLCWQb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Dec 2021 17:16:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1383349AbhLCWQb (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Dec 2021 17:16:31 -0500
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E582C061353
        for <linux-media@vger.kernel.org>; Fri,  3 Dec 2021 14:13:06 -0800 (PST)
Received: by mail-wr1-x436.google.com with SMTP id j3so8633018wrp.1
        for <linux-media@vger.kernel.org>; Fri, 03 Dec 2021 14:13:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3ukJJrqELSntA8Y6N70SiOqGzN/ome64jrFVHGi3tkY=;
        b=e6JFDJEBDmWuJ0FxAgOD6nfpiUyP7+09NPa1NdU5VHhOsCzxyond+UuEPL5pumP6jT
         Nq7446rP/LUsK03pPjpRvsjQMpUPmeGzQieqz7j26W0SuPX3aWAn/JchvkjA6AianaZi
         TYYY93sGRVuWVxzCIOoZNSQvNqwG3QC3YMVVE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3ukJJrqELSntA8Y6N70SiOqGzN/ome64jrFVHGi3tkY=;
        b=V+RhWamEke/vB3sZnhBBd+39yJLmdAQHM3uR+XImewp4MiUCXx9gI1mZ0JC1BqV+9w
         YaREkqI4M9Syd69ulbEk8cVZoR1JFmfBDtvnn8Rjvh/Gr0gmecoCUfpL3VHlXnTduR2c
         R325L+bXJDgdjN+3GYxrESdfEU714sfUmuRK+yKLGjjlbnys6Te2dM811fablg3PwMn/
         k3Mdr5iaUiR1KKQcwRbtCme4/o2ti73kVXfYS0AslIrXJKOrHcQ4R1EzF0c6vk1d5qzI
         COyE0z8fJJQwy1EDbnyqsTO6a5C2yFRcVxKblU9A1gEm8FnvEbUn3217/2vnUtWBhQ3s
         G1Gg==
X-Gm-Message-State: AOAM532KeTak9I63sByYXaQ3OnOESID0tbUBKISEdYVIdf7j09yOfUG9
        MRPRoiK8qJpSpJE2m/Gffc/JOnimZwH0GQ==
X-Google-Smtp-Source: ABdhPJx4LacZTDD1/gltoV9b4z74S5Znq3RdsAVJILUzVauJMDBpwo0vBnzP3WGV2qx7OMlzO1I5ng==
X-Received: by 2002:adf:fe81:: with SMTP id l1mr25311620wrr.522.1638569585109;
        Fri, 03 Dec 2021 14:13:05 -0800 (PST)
Received: from taos.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id f7sm7849710wmg.6.2021.12.03.14.13.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Dec 2021 14:13:04 -0800 (PST)
From:   Petko Manolov <petko.manolov@konsulko.com>
To:     linux-media@vger.kernel.org
Cc:     Petko Manolov <petko.manolov@konsulko.com>
Subject: [RFC PATCH 5/5] adds i2c/ explicitly to Makefile
Date:   Sat,  4 Dec 2021 00:12:47 +0200
Message-Id: <20211203221247.46324-6-petko.manolov@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211203221247.46324-1-petko.manolov@konsulko.com>
References: <20211203221247.46324-1-petko.manolov@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Signed-off-by: Petko Manolov <petko.manolov@konsulko.com>
---
 drivers/staging/media/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/media/Makefile b/drivers/staging/media/Makefile
index 5b5afc5b03a0..e2b34361ec37 100644
--- a/drivers/staging/media/Makefile
+++ b/drivers/staging/media/Makefile
@@ -11,3 +11,4 @@ obj-$(CONFIG_VIDEO_HANTRO)	+= hantro/
 obj-$(CONFIG_VIDEO_IPU3_IMGU)	+= ipu3/
 obj-$(CONFIG_VIDEO_ZORAN)	+= zoran/
 obj-$(CONFIG_DVB_AV7110)	+= av7110/
+obj-y				+= i2c/
-- 
2.30.2

