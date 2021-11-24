Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 67F9645CCED
	for <lists+linux-media@lfdr.de>; Wed, 24 Nov 2021 20:14:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351179AbhKXTQt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Nov 2021 14:16:49 -0500
Received: from mail.kernel.org ([198.145.29.99]:52854 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1351108AbhKXTQl (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Nov 2021 14:16:41 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 62A5B6108B;
        Wed, 24 Nov 2021 19:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637781211;
        bh=CblGAAA0HB3TFPgoKWXzvvSTEoAZI59ofB49F09VVUQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=FXVZ1rUKh16GX094m7MK9NIVs0ZwimtcdOx8+ea3ZsMjwThLQb68ct6GzmwFxKlaQ
         NmTrRh5158Y20t4XqSxJbO5WyYV4q6RTBcm4CKduVBpXGXhiVnncdGdRb9mxryy9hW
         LPQcNrX6k54/9Y5YwFfVdHg78AWW2+yimxjdGcNhZcv9Jefo2nnnkZ676EEUTVlv8R
         w55Q7fqTGoeGUdvjrWX86DUUz5KuXpLkRUcKvkkgTFP0OfRp9GvslnGxbrTckg9p2j
         Xcb+orc+I5oZXwwP2es1poLe845AYZZLpgHQfPfPSYGFMhgQzNgnXobmxXZSGjNNrj
         QiTLhJBU0vufQ==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1mpxhs-004Q5X-Je; Wed, 24 Nov 2021 20:13:24 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Xiaofeng Cao <caoxiaofeng@yulong.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH 10/20] media: radio-si476x: drop a container_of() abstraction macro
Date:   Wed, 24 Nov 2021 20:13:13 +0100
Message-Id: <85bd768b1525f29a5710c2139bfa241fc7565fe1.1637781097.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1637781097.git.mchehab+huawei@kernel.org>
References: <cover.1637781097.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This isn't used anywhere. So, drop it.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---

To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH 00/20] at: https://lore.kernel.org/all/cover.1637781097.git.mchehab+huawei@kernel.org/

 drivers/media/radio/radio-si476x.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/media/radio/radio-si476x.c b/drivers/media/radio/radio-si476x.c
index b39a68f83c5f..0bf99e1cd1d8 100644
--- a/drivers/media/radio/radio-si476x.c
+++ b/drivers/media/radio/radio-si476x.c
@@ -312,12 +312,6 @@ struct si476x_radio {
 	u32 audmode;
 };
 
-static inline struct si476x_radio *
-v4l2_dev_to_radio(struct v4l2_device *d)
-{
-	return container_of(d, struct si476x_radio, v4l2dev);
-}
-
 static inline struct si476x_radio *
 v4l2_ctrl_handler_to_radio(struct v4l2_ctrl_handler *d)
 {
-- 
2.33.1

