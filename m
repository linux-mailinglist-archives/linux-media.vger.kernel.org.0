Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E769344959
	for <lists+linux-media@lfdr.de>; Mon, 22 Mar 2021 16:35:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230335AbhCVPeh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Mar 2021 11:34:37 -0400
Received: from mail.kernel.org ([198.145.29.99]:43804 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231383AbhCVPeI (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Mar 2021 11:34:08 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5E9586199F;
        Mon, 22 Mar 2021 15:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1616427246;
        bh=Y7tzRW3RaNTp+QFFHkdSh8LnE1vQBMwZshTMt9CbiII=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=L5q3DWFo85vpPFb20kJVaN4L4R5ewqLzinIA9znk9C4R6myeqdePPFZquYmZuJvPO
         WoMLQV/HvJ8krpIG5MO/FTF/yIy53OjG9BqCE8xU8uKevCEvsTiKTBBR+EjMfXZtiE
         0lPBlRWmZKmrGErD2tm1ocsl45akOZTGOqQU55JSP8pOQ7gnm/YISa1eH0MXQGIvib
         gXHnGF8WI0eDoviZvLNyio6O62xP2bBfnV/aWdPboxikM5J/hjr3ja0SYm2d/egoAu
         daTHKE1hF+xzhUqUPl1TxQacuj6Npo1r2dxV+beMn3K3CwoqcOyRJJ3k0LJewb7cz9
         PGfoXBvWdsRZw==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1lOMZ4-006dpW-Sp; Mon, 22 Mar 2021 16:33:58 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Marc Gonzalez <marc.w.gonzalez@free.fr>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH] media: dvb_frontend: warn if frontend driver has API issues
Date:   Mon, 22 Mar 2021 16:33:57 +0100
Message-Id: <6d5941e3ba77439bbc401207cd87d9b8748d5cb8.1616427172.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210322163329.4afe27ed@coco.lan>
References: <20210322163329.4afe27ed@coco.lan>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

the kAPI for a frontend can use 3 different tuning methods:

1. The hardware tracks internally frequency shifts via its
   own internal zigzag logic;
2. The hardware has a custom zigzag method, implemented via
   fe search() ops;
3. The hardware doesn't have any internal zigzag logic. So,
   the Kernel needs to implement it.

Drivers that use the in-kernel software zigzag are required to
provide some parameters for the zigzag code to work. Failing
to do that will just make the Kernel to tune several times
to the very same frequency, delaying the tuning time for
no good reason. This is actually a kAPI violation
(and an uAPI one, as the frequency shift is exported to the
uAPI).

Emit a warning on such case, as the driver needs to be fixed.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/dvb-core/dvb_frontend.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/media/dvb-core/dvb_frontend.c b/drivers/media/dvb-core/dvb_frontend.c
index 6aaa4d5a504d..0c0af4bd2256 100644
--- a/drivers/media/dvb-core/dvb_frontend.c
+++ b/drivers/media/dvb-core/dvb_frontend.c
@@ -481,6 +481,11 @@ static void dvb_frontend_swzigzag(struct dvb_frontend *fe)
 	struct dvb_frontend_private *fepriv = fe->frontend_priv;
 	struct dtv_frontend_properties *c = &fe->dtv_property_cache, tmp;
 
+
+	if (fepriv->max_drift)
+		dev_warn_once(fe->dvb->device,
+			      "Frontend requested software zigzag, but didn't set the frequency step size\n");
+
 	/* if we've got no parameters, just keep idling */
 	if (fepriv->state & FESTATE_IDLE) {
 		fepriv->delay = 3 * HZ;
-- 
2.30.2

