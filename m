Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD9EF336FC4
	for <lists+linux-media@lfdr.de>; Thu, 11 Mar 2021 11:21:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232278AbhCKKUs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Mar 2021 05:20:48 -0500
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:38309 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232281AbhCKKUa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Mar 2021 05:20:30 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id KIQYlPLX0C40pKIQflKo5j; Thu, 11 Mar 2021 11:20:29 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1615458029; bh=x+/ZbTt23p/+dac52j/JFWmgQXhbMZVNHj84EAsXDMs=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=QyAhZUHtARYbrQtwiMjNpO2lS5F2TwyWzj7DND5zsOuc7SQblzfNNHcoJCIk4Pq/z
         4sPlC3MSojlnREKmJyhNY9y7HU8HrMo1LGwZJsEzrt1rPG0tFWd7SnwWBUvR/jUTwz
         9y+T6jAh9kKtRIDXWCpBps5HqNZbmOD7DwCv4jI/Qn7LuEvsA1dDc832r+mNTttEME
         2FIWnD3XeZPXb+Ma70ovh7WQNbp0KjH6wTIkn8N6f5fjFLE8AOL21EveboFrnO7FAm
         47uoj0qKqtQV2fbZvClvjGUQJalav/pn5vqhfLbWP928MAHBAYHyZBowPM4SLONZaF
         aeEGHgKLWoCUA==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH 06/13] vsp1/vsp1_drm.h: add missing 'struct' kernel-doc keyword
Date:   Thu, 11 Mar 2021 11:20:15 +0100
Message-Id: <20210311102022.96954-7-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210311102022.96954-1-hverkuil-cisco@xs4all.nl>
References: <20210311102022.96954-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfJ2t2hEZx/QeWjdRyHoE/3o+ITKtl1JBIhvi1AKPJPEiDGao1h+/Sg4NVx25QIPjhcgyHLu1I1hUODliM2dBLTwkxpqIEab/wIQCIgAQ2SGffk2RzLw3
 SZrOEPdycO75DKE/yJCc4p4985KciOw7LYIZCDmCG0e4qJVMAz90hpx3JUkY8J4zuAZauMq8VeSLTeR7bLVra2uBFD3eLj8JZyEassPQc6SygCtyBkJLb5wM
 GRoEEne9GUTFoE6mUwgcyCyWnKHwlSkHTQNXH+j4WT1FOTyYiXqPluKQ1a4G0RBA
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The kernel-doc documentation for two structs was missing the
'struct' keyword.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/vsp1/vsp1_drm.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/vsp1/vsp1_drm.h b/drivers/media/platform/vsp1/vsp1_drm.h
index e85ad4366fbb..ab8b7e3161a2 100644
--- a/drivers/media/platform/vsp1/vsp1_drm.h
+++ b/drivers/media/platform/vsp1/vsp1_drm.h
@@ -18,7 +18,7 @@
 #include "vsp1_pipe.h"
 
 /**
- * vsp1_drm_pipeline - State for the API exposed to the DRM driver
+ * struct vsp1_drm_pipeline - State for the API exposed to the DRM driver
  * @pipe: the VSP1 pipeline used for display
  * @width: output display width
  * @height: output display height
@@ -47,7 +47,7 @@ struct vsp1_drm_pipeline {
 };
 
 /**
- * vsp1_drm - State for the API exposed to the DRM driver
+ * struct vsp1_drm - State for the API exposed to the DRM driver
  * @pipe: the VSP1 DRM pipeline used for display
  * @lock: protects the BRU and BRS allocation
  * @inputs: source crop rectangle, destination compose rectangle and z-order
-- 
2.30.1

