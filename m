Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28FBB418B19
	for <lists+linux-media@lfdr.de>; Sun, 26 Sep 2021 22:51:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230088AbhIZUxL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Sep 2021 16:53:11 -0400
Received: from mail.kernel.org ([198.145.29.99]:57650 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230123AbhIZUxI (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Sep 2021 16:53:08 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 93E0761100;
        Sun, 26 Sep 2021 20:51:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1632689491;
        bh=f2KuJJdq2qiMDAjb0OCH7k4yC2rZh+SiOFqxoQttMOs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=kTsVPA0mURHLk6JG8FKxBlRFXAW2b1lxHlS7UGKgWpXi/+bRQNLPeMp3YTW3XBmyH
         sGah9GTV640/vIgDDN0Hil0yx3B89/J+Mf2vG7f7fwM1ppObF0TKvOGRoocKvvJKQI
         2eHHKDsn2aVXr1CAQEo0CGLnVkwGk9nJkm9QSOQzCB6Uxqfv0ACrVOnASDrulXStZ5
         UK1bZnp6wInp6nMJTBsc9m4v1TzsPPOqSgpyreO7iAM8GL37h+tvGd7hjGTsWTRr62
         b78Jb5F1Lbz+5vXxjlYTjbJlumMz/IdtVxJ+eEppRknWeJMlYS5ws9Ms3GVlRpv8w2
         U6EGf+pvA1VnQ==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1mUb7R-001YbB-AG; Sun, 26 Sep 2021 22:51:29 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Michael Kuron <michael.kuron@gmail.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        pb@linuxtv.org
Subject: [PATCH 3/3] media: dib0700: Only touch one bit when start/stop an adapter
Date:   Sun, 26 Sep 2021 22:51:28 +0200
Message-Id: <4214942f248baddec9cfd2b4b2424993ac356a51.1632689033.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1632689033.git.mchehab+huawei@kernel.org>
References: <cover.1632689033.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Only touch the right bit to enable/disable an adapter channel,
without touching the other adapter's one.

Tested on Nova-TD.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/usb/dvb-usb/dib0700_core.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/media/usb/dvb-usb/dib0700_core.c b/drivers/media/usb/dvb-usb/dib0700_core.c
index d7c5836b9271..1caabb51ea47 100644
--- a/drivers/media/usb/dvb-usb/dib0700_core.c
+++ b/drivers/media/usb/dvb-usb/dib0700_core.c
@@ -610,8 +610,6 @@ int dib0700_streaming_ctrl(struct dvb_usb_adapter *adap, int onoff)
 
 	st->buf[3] = 0x00;
 
-	st->channel_state &= ~0x3;
-
 	if ((adap->fe_adap[0].stream.props.endpoint != 2)
 	    && (adap->fe_adap[0].stream.props.endpoint != 3)) {
 		deb_info("the endpoint number (%i) is not correct, use the adapter id instead\n",
@@ -624,7 +622,7 @@ int dib0700_streaming_ctrl(struct dvb_usb_adapter *adap, int onoff)
 	if (onoff)
 		st->channel_state |= 1 << adapt_nr;
 	else
-		st->channel_state |= 1 << (1 - adapt_nr);
+		st->channel_state &= ~(1 << adapt_nr);
 
 	st->buf[2] |= st->channel_state;
 
-- 
2.31.1

