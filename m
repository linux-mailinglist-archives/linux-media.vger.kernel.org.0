Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A58973ABA72
	for <lists+linux-media@lfdr.de>; Thu, 17 Jun 2021 19:15:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232266AbhFQRRp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Jun 2021 13:17:45 -0400
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:44843 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232176AbhFQRRp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Jun 2021 13:17:45 -0400
Received: (Authenticated sender: jacopo@jmondi.org)
        by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id CEB26E0002;
        Thu, 17 Jun 2021 17:15:35 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: [RFC 3/4] media: v4l2-async: Call post_register() subdev op
Date:   Thu, 17 Jun 2021 19:16:10 +0200
Message-Id: <20210617171611.80542-4-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210617171611.80542-1-jacopo+renesas@jmondi.org>
References: <20210617171611.80542-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Call the "post_register()" subdev operation on a just registered
subdevice, immediately after having called the 'bound' notifier
operation on the parent.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 drivers/media/v4l2-core/v4l2-async.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
index 0836e01e59ca..8656b50ee799 100644
--- a/drivers/media/v4l2-core/v4l2-async.c
+++ b/drivers/media/v4l2-core/v4l2-async.c
@@ -293,6 +293,16 @@ static int v4l2_async_match_notify(struct v4l2_async_notifier *notifier,
 		return ret;
 	}
 
+	if (!(notifier->flags & V4L2_ASYNC_NOTIFIER_SKIP_POST_REGISTER) &&
+	    sd->ops->core && sd->ops->core->post_register) {
+		ret = sd->ops->core->post_register(sd);
+		if (ret) {
+			v4l2_async_notifier_call_unbind(notifier, sd, sd->asd);
+			v4l2_device_unregister_subdev(sd);
+			return ret;
+		}
+	}
+
 	/* Remove from the waiting list */
 	list_del(&asd->list);
 	sd->asd = asd;
-- 
2.31.1

