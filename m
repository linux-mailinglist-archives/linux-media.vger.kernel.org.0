Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C5BDE365873
	for <lists+linux-media@lfdr.de>; Tue, 20 Apr 2021 14:06:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232227AbhDTMGC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Apr 2021 08:06:02 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:57980 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232177AbhDTMF7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Apr 2021 08:05:59 -0400
Received: from deskari.lan (91-157-208-71.elisa-laajakaista.fi [91.157.208.71])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 79659E2E;
        Tue, 20 Apr 2021 14:05:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1618920325;
        bh=kNMWszgQAE0VV5ESrEWrhXo5lbHfeNrD2nArmbRhLPs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=J+FBjFQNoTE4yFW8qhsi/vTXL263bUgLKM0uc/Juxi1sOUkjySfo0FJRSitkUGwda
         d6LPZe9ark6Ab7EYh/qcU/P53CvPte69mBkgD2YE6ULyNnWe0Wx/LqjDCw4tdSfIm9
         RFYd0MdnLBtCD6MSf0NjbkAnAYgSyJ6LuhekbQE4=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     Benoit Parrot <bparrot@ti.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Pratyush Yadav <p.yadav@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>, linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v2 21/35] media: ti-vpe: cal: handle cal_ctx_v4l2_register error
Date:   Tue, 20 Apr 2021 15:04:19 +0300
Message-Id: <20210420120433.902394-22-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210420120433.902394-1-tomi.valkeinen@ideasonboard.com>
References: <20210420120433.902394-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

cal_async_notifier_complete() doesn't handle errors returned from
cal_ctx_v4l2_register(). Add the error handling.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/platform/ti-vpe/cal.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index ba8821a3b262..9e051c2e84a9 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -743,8 +743,12 @@ static int cal_async_notifier_complete(struct v4l2_async_notifier *notifier)
 	int ret = 0;
 
 	for (i = 0; i < ARRAY_SIZE(cal->ctx); ++i) {
-		if (cal->ctx[i])
-			cal_ctx_v4l2_register(cal->ctx[i]);
+		if (!cal->ctx[i])
+			continue;
+
+		ret = cal_ctx_v4l2_register(cal->ctx[i]);
+		if (ret)
+			return ret;
 	}
 
 	if (cal_mc_api)
-- 
2.25.1

