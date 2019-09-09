Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4FDD2AD37E
	for <lists+linux-media@lfdr.de>; Mon,  9 Sep 2019 09:16:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732292AbfIIHQf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Sep 2019 03:16:35 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:35381 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1732269AbfIIHQd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 9 Sep 2019 03:16:33 -0400
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud7.xs4all.net with ESMTPA
        id 7DuVi0IDq50xT7DuZi8OkN; Mon, 09 Sep 2019 09:16:31 +0200
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Bard Winther <bwinther@cisco.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH] v4l2-dv-timings.c: fix format string
Message-ID: <2d6d9415-0a5a-ccaa-494f-1844dd573caa@xs4all.nl>
Date:   Mon, 9 Sep 2019 09:16:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfGWkt7ekk1lg/3tc9B0YfAHAoK7rwBh/xB+VOZb2vMkxhQo99wGpdmxkJ3h24vOuVK10Ixs76pNH4ga525yfYW7WmH/6vQ6C/RpHxSiuMN93V0nYV+LJ
 Qaq/BK9AxxqAOOLevtaKNSOgFUQu5PnUGJkf8UxiECrNO8UWYD0w8rCAQKHxkSUeNPRUMiZ16f/cz7VFUIk6t+TMdfaQh+KAeuQ=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

It should be "%u.%02u" instead of "%u.%u".

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Reported-by: Bard Winther <bwinther@cisco.com>
---
diff --git a/drivers/media/v4l2-core/v4l2-dv-timings.c b/drivers/media/v4l2-core/v4l2-dv-timings.c
index 4f23e939ead0..0607a5d0d051 100644
--- a/drivers/media/v4l2-core/v4l2-dv-timings.c
+++ b/drivers/media/v4l2-core/v4l2-dv-timings.c
@@ -293,7 +293,7 @@ void v4l2_print_dv_timings(const char *dev_prefix, const char *prefix,
 	if (prefix == NULL)
 		prefix = "";

-	pr_info("%s: %s%ux%u%s%u.%u (%ux%u)\n", dev_prefix, prefix,
+	pr_info("%s: %s%ux%u%s%u.%02u (%ux%u)\n", dev_prefix, prefix,
 		bt->width, bt->height, bt->interlaced ? "i" : "p",
 		fps / 100, fps % 100, htot, vtot);

