Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1B352B149F
	for <lists+linux-media@lfdr.de>; Thu, 12 Sep 2019 20:56:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727538AbfILS4E (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Sep 2019 14:56:04 -0400
Received: from mailoutvs9.siol.net ([185.57.226.200]:51018 "EHLO mail.siol.net"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726008AbfILS4E (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Sep 2019 14:56:04 -0400
Received: from localhost (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTP id 1CBC0521637;
        Thu, 12 Sep 2019 20:56:02 +0200 (CEST)
X-Virus-Scanned: amavisd-new at psrvmta10.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
        by localhost (psrvmta10.zcs-production.pri [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id lL0ERO98_Ars; Thu, 12 Sep 2019 20:56:01 +0200 (CEST)
Received: from mail.siol.net (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTPS id C35CF5223A8;
        Thu, 12 Sep 2019 20:56:01 +0200 (CEST)
Received: from localhost.localdomain (cpe-86-58-59-25.static.triera.net [86.58.59.25])
        (Authenticated sender: 031275009)
        by mail.siol.net (Postfix) with ESMTPSA id 6E0E9521637;
        Thu, 12 Sep 2019 20:56:01 +0200 (CEST)
From:   Jernej Skrabec <jernej.skrabec@siol.net>
To:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] media: vim2m: Fix abort issue
Date:   Thu, 12 Sep 2019 20:55:55 +0200
Message-Id: <20190912185555.9221-1-jernej.skrabec@siol.net>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Currently, if start streaming -> stop streaming -> start streaming
sequence is executed, driver will end job prematurely, if ctx->translen
is higher than 1, because "aborting" flag is still set from previous
stop streaming command.

Fix that by clearing "aborting" flag in start streaming handler.

Fixes: 96d8eab5d0a1 ("V4L/DVB: [v5,2/2] v4l: Add a mem-to-mem videobuf fr=
amework test device")
Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
---
Hi!

This was only compile tested. Any suggestion how to properly test it
would be appreciated.

Best regards,
Jernej

 drivers/media/platform/vim2m.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/platform/vim2m.c b/drivers/media/platform/vim2=
m.c
index acd3bd48c7e2..2d79cdc130c5 100644
--- a/drivers/media/platform/vim2m.c
+++ b/drivers/media/platform/vim2m.c
@@ -1073,6 +1073,9 @@ static int vim2m_start_streaming(struct vb2_queue *=
q, unsigned int count)
 	if (!q_data)
 		return -EINVAL;
=20
+	if (V4L2_TYPE_IS_OUTPUT(q->type))
+		ctx->aborting =3D 0;
+
 	q_data->sequence =3D 0;
 	return 0;
 }
--=20
2.23.0

