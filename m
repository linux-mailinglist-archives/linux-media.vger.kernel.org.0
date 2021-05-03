Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4CB68371C8B
	for <lists+linux-media@lfdr.de>; Mon,  3 May 2021 18:55:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232793AbhECQxI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 May 2021 12:53:08 -0400
Received: from mail.kernel.org ([198.145.29.99]:32774 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231329AbhECQu7 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 3 May 2021 12:50:59 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9D5BD6193B;
        Mon,  3 May 2021 16:41:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620060083;
        bh=45JJugUo8IOeD/S4+MXrRtrfp8plDJ3A8oXfswPBWbg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=AsnrImmindvSX3OiviKvx2yRlqpYS8vgU+EuXfB6W9HdsNjogKb4KOlrDmGJ48G0Z
         jXVbeodUtYYp31bhJZ9SsWNF5iCAgrWMTk9L1K/ffeOOq2hS2gtpomB/IxibkPShw/
         iHM6umD4wbjR8KE/liQyZiqk0Nh7/rV1hwVm/xMWgHfw3PB4tAHqFpSPhWY85Yu3Ys
         xVpblxq2Ohl030L0rFa3fg/580ZF+SDvPkO7Cm7BbeE0kC5PystJCK8OajP3m2q6mb
         biqTU5TRK9yDx5dIHzH4LPIdo72VBe+Xgp//veIsOQnXbIbEDsoIlKO42HOgsbJgF7
         GoOasPWiBv1xA==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        syzbot+a4e309017a5f3a24c7b3@syzkaller.appspotmail.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sasha Levin <sashal@kernel.org>, linux-media@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 09/35] media: gspca/sq905.c: fix uninitialized variable
Date:   Mon,  3 May 2021 12:40:43 -0400
Message-Id: <20210503164109.2853838-9-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210503164109.2853838-1-sashal@kernel.org>
References: <20210503164109.2853838-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Hans Verkuil <hverkuil-cisco@xs4all.nl>

[ Upstream commit eaaea4681984c79d2b2b160387b297477f0c1aab ]

act_len can be uninitialized if usb_bulk_msg() returns an error.
Set it to 0 to avoid a KMSAN error.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Reported-by: syzbot+a4e309017a5f3a24c7b3@syzkaller.appspotmail.com
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/media/usb/gspca/sq905.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/usb/gspca/sq905.c b/drivers/media/usb/gspca/sq905.c
index ffea9c35b0a0..13676af42cfc 100644
--- a/drivers/media/usb/gspca/sq905.c
+++ b/drivers/media/usb/gspca/sq905.c
@@ -167,7 +167,7 @@ static int
 sq905_read_data(struct gspca_dev *gspca_dev, u8 *data, int size, int need_lock)
 {
 	int ret;
-	int act_len;
+	int act_len = 0;
 
 	gspca_dev->usb_buf[0] = '\0';
 	if (need_lock)
-- 
2.30.2

