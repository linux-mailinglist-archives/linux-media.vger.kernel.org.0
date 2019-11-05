Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3B192EF716
	for <lists+linux-media@lfdr.de>; Tue,  5 Nov 2019 09:17:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387782AbfKEIRj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Nov 2019 03:17:39 -0500
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:58897 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2387590AbfKEIRj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 5 Nov 2019 03:17:39 -0500
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud9.xs4all.net with ESMTPA
        id Ru1piftts9P9bRu1tiYtac; Tue, 05 Nov 2019 09:17:34 +0100
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH] v4l2-device.h: fix typo: putss -> puts
Message-ID: <b9e73b81-d097-5913-4faa-8a9eb449ac8b@xs4all.nl>
Date:   Tue, 5 Nov 2019 09:17:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfOD+XUEgAp/zCy8iCRGfYyTRU5Uo3VgjQqUJanQWXoN68xlk2/AX6HK/wmfSncmdN5PrZ5+93IDkdFldV2069VNIxJJGvz4UvgTtmn/5drsg4u5Nnwro
 +VDJyd/HFagU15ld7R1ZwHm/9y0JDN8mvPhCwpUJYDgCOc8XOY3aw6UeGqnmtyog++KaFwHPJgxApA==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fix typo: putss -> puts

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
diff --git a/include/media/v4l2-device.h b/include/media/v4l2-device.h
index e0b8f2602670..5f36e0d2ede6 100644
--- a/include/media/v4l2-device.h
+++ b/include/media/v4l2-device.h
@@ -72,7 +72,7 @@ static inline void v4l2_device_get(struct v4l2_device *v4l2_dev)
 }

 /**
- * v4l2_device_put - putss a V4L2 device reference
+ * v4l2_device_put - puts a V4L2 device reference
  *
  * @v4l2_dev: pointer to struct &v4l2_device
  *

