Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 68CD615058E
	for <lists+linux-media@lfdr.de>; Mon,  3 Feb 2020 12:42:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727368AbgBCLma (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Feb 2020 06:42:30 -0500
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:46619 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727077AbgBCLma (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 3 Feb 2020 06:42:30 -0500
Received: from tschai.fritz.box ([46.9.235.248])
        by smtp-cloud8.xs4all.net with ESMTPA
        id ya7UiS6YMn7E5ya7Zi3Ugs; Mon, 03 Feb 2020 12:42:29 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1580730149; bh=67ArWTzvLjIlWnv/fcD26tvBOx0Ecj91rzVvpBDzU/U=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=DXsBFu0RbevjV6/lpIfz24dVJytGWHHEAA08em1Txa6Q9F/9wuPVP11bnwux0aUgD
         Nq4q5me8fEvBxFG2wd+mmWCkNQX97wVENZCVb+N0ztknb64ZCZzHGAtrgcQYtfvBVY
         xbC4RKmHZBQjLFB/B7aFHPJPitOjqGm1hQp8m+x8v6a0LP0lcIlDh4bTMjB2MRhV4y
         c3uh5p+6B365gLkFYqwBQKoIdp6AgLtKsOBFC6F1NmHKIOsIPBbJDKyu5I4RiCOB3e
         x+9SvvNr4ax+d3nv8qwtpnUnh+dIBxcRaNVaJML44tMGw7n0IbPT2oOHsQA+yrL8pB
         ghdVKxxWEih5g==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Matt Ranostay <matt.ranostay@konsulko.com>
Subject: [PATCH 08/11] media/i2c/video-i2c: rename VFL_TYPE_GRABBER to _VIDEO
Date:   Mon,  3 Feb 2020 12:41:16 +0100
Message-Id: <20200203114119.1177490-9-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200203114119.1177490-1-hverkuil-cisco@xs4all.nl>
References: <20200203114119.1177490-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfNA7tlWQO9+VYXzSmWAQtZnLv9cm1mfpXXL3Diz9gMU3P6deIqCz8FLWdIPuuYQVnddVmc7sYMQIaZKq5HC/CgUtOtvlz0LIA4qdCtjpSDk4ZBIZJKcQ
 XsJTeLs02zjKb/SUrx/3ahk7N+RP+bHkORHVxf0v2MqmE7/5GCKXc1Bfe4tcSz1tw4MhUCrq6uCw7kypL2AnQP95m/vnjF7H+iDPgxoJxKIhS3Kh8TLi1FhR
 BfcekJYMB8HaDgtu8L2Esv+nCaMSRLlB5WqJhSEsN20=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

'GRABBER' is a weird name, all other types map to the /dev
device names. Rename to 'VIDEO' to be consistent with the
other types.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Matt Ranostay <matt.ranostay@konsulko.com>
---
 drivers/media/i2c/video-i2c.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/video-i2c.c b/drivers/media/i2c/video-i2c.c
index 078141712c88..3c770ecd4bf7 100644
--- a/drivers/media/i2c/video-i2c.c
+++ b/drivers/media/i2c/video-i2c.c
@@ -858,7 +858,7 @@ static int video_i2c_probe(struct i2c_client *client,
 		}
 	}
 
-	ret = video_register_device(&data->vdev, VFL_TYPE_GRABBER, -1);
+	ret = video_register_device(&data->vdev, VFL_TYPE_VIDEO, -1);
 	if (ret < 0)
 		goto error_pm_disable;
 
-- 
2.24.0

