Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E7F17BE333
	for <lists+linux-media@lfdr.de>; Wed, 25 Sep 2019 19:16:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2442784AbfIYRQS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Sep 2019 13:16:18 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:60238 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730327AbfIYRQR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Sep 2019 13:16:17 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: koike)
        with ESMTPSA id 7123C28B470
From:   Helen Koike <helen.koike@collabora.com>
To:     linux-media@vger.kernel.org, hverkuil@xs4all.nl,
        kernel@collabora.com
Cc:     Helen Koike <helen.koike@collabora.com>
Subject: [PATCH] v4l2-ctl: add missing subdev usage in --help-all
Date:   Wed, 25 Sep 2019 14:16:05 -0300
Message-Id: <20190925171605.27271-1-helen.koike@collabora.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

--help-all option was not displaying options from --help-subdev.
Add missing subdev_usage() in usage_all() to fix it.

Signed-off-by: Helen Koike <helen.koike@collabora.com>
---
 utils/v4l2-ctl/v4l2-ctl.cpp | 1 +
 1 file changed, 1 insertion(+)

diff --git a/utils/v4l2-ctl/v4l2-ctl.cpp b/utils/v4l2-ctl/v4l2-ctl.cpp
index 77e0d369..aa4742c5 100644
--- a/utils/v4l2-ctl/v4l2-ctl.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl.cpp
@@ -299,6 +299,7 @@ static void usage_all(void)
        vbi_usage();
        sdr_usage();
        meta_usage();
+       subdev_usage();
        selection_usage();
        misc_usage();
        streaming_usage();
-- 
2.22.0

