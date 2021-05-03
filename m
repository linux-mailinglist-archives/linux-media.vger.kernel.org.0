Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5351F371C39
	for <lists+linux-media@lfdr.de>; Mon,  3 May 2021 18:51:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231864AbhECQvr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 May 2021 12:51:47 -0400
Received: from mail.kernel.org ([198.145.29.99]:34512 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232833AbhECQsn (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 3 May 2021 12:48:43 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id D2C8961408;
        Mon,  3 May 2021 16:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620060004;
        bh=M2yy5HQnXYbWqsz1ytJ+MQ4Sp7heKFmPYws9s2g83es=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Im4BWDeLvULcikVNkO5+Lt4I1I5F29C2rQTqVNZ+jApf4JTKmdHPS34QHkc4Q/eMB
         FTCdv7Co2wDUBUJuPSyGfgTPJXCPM/2vSghWK5hRQHArX3GGxlQ4gWZCLXJdMg4+gG
         g24k3N2iCZ7C58u6bO00hAqOqFDKiLKVQgubpAQEGMKZxV+RsXwI4Xo+xlJ5WLRbY3
         xg/2d/l8sWXQB8IsFM2z10sAuQcMnWf7ckeLyRSOZfLWvZynS/DFb6kPBp2/i4Fr6f
         B9lWUonGxEGMX1c3lyhuhKwT26Z9KUoG/3NAgzMkHVideKjAbQWfjaypA4+zFV2cdf
         /M+sdq5CihTQw==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        syzbot+a4e309017a5f3a24c7b3@syzkaller.appspotmail.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sasha Levin <sashal@kernel.org>, linux-media@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 15/57] media: gspca/sq905.c: fix uninitialized variable
Date:   Mon,  3 May 2021 12:38:59 -0400
Message-Id: <20210503163941.2853291-15-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210503163941.2853291-1-sashal@kernel.org>
References: <20210503163941.2853291-1-sashal@kernel.org>
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
index 863c485f4275..65a74060986a 100644
--- a/drivers/media/usb/gspca/sq905.c
+++ b/drivers/media/usb/gspca/sq905.c
@@ -158,7 +158,7 @@ static int
 sq905_read_data(struct gspca_dev *gspca_dev, u8 *data, int size, int need_lock)
 {
 	int ret;
-	int act_len;
+	int act_len = 0;
 
 	gspca_dev->usb_buf[0] = '\0';
 	if (need_lock)
-- 
2.30.2

