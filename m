Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6A7D37993E2
	for <lists+linux-media@lfdr.de>; Sat,  9 Sep 2023 02:38:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345761AbjIIAiS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 8 Sep 2023 20:38:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345681AbjIIAiH (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 8 Sep 2023 20:38:07 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DEF22109;
        Fri,  8 Sep 2023 17:37:45 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85767C433C9;
        Sat,  9 Sep 2023 00:37:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1694219846;
        bh=Qd5o1b4jwJ1my+Tga8LmjbFt+S3Q+DRExWx15qkTncc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=l8MIqvJCc+yz6dzXcvodtMyszd3NbgfyMiNn2ox9us34MSYvSjrTaeD45mnMCF5nC
         gv5Oa07pnyQs+6zvgVFX7Aaf/o8PltYz4uE2bguRPCKwpSbIy/harPJodc8QEroTB7
         cFxeyzKAWDzVIbnrunaLsTCjLNtfHzGwX50tMwnUuBqtV/0sYQ165AGxTlROFNxhAS
         L1h+ieZN+lXijRxF3t1br7tNDlqFBOv3iJ2c9sNWefjIwKqSLsXYkhwxbgF10RcqMC
         mfb3gF3XobExPNXMMBuO9JDSGmuP/OLWIyvdbMsOsPmApnwQPCCvglIPKEM00kiKEv
         La65TZmdee5BA==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Zhang Shurong <zhang_shurong@foxmail.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sasha Levin <sashal@kernel.org>, mchehab@kernel.org,
        linux-media@vger.kernel.org
Subject: [PATCH AUTOSEL 6.4 04/25] media: af9005: Fix null-ptr-deref in af9005_i2c_xfer
Date:   Fri,  8 Sep 2023 20:36:52 -0400
Message-Id: <20230909003715.3579761-4-sashal@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230909003715.3579761-1-sashal@kernel.org>
References: <20230909003715.3579761-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.4.15
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Zhang Shurong <zhang_shurong@foxmail.com>

[ Upstream commit f4ee84f27625ce1fdf41e8483fa0561a1b837d10 ]

In af9005_i2c_xfer, msg is controlled by user. When msg[i].buf
is null and msg[i].len is zero, former checks on msg[i].buf would be
passed. Malicious data finally reach af9005_i2c_xfer. If accessing
msg[i].buf[0] without sanity check, null ptr deref would happen.
We add check on msg[i].len to prevent crash.

Similar commit:
commit 0ed554fd769a
("media: dvb-usb: az6027: fix null-ptr-deref in az6027_i2c_xfer()")

Signed-off-by: Zhang Shurong <zhang_shurong@foxmail.com>
Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/media/usb/dvb-usb/af9005.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/media/usb/dvb-usb/af9005.c b/drivers/media/usb/dvb-usb/af9005.c
index 0827bf3d4e8c7..13604e6acdb83 100644
--- a/drivers/media/usb/dvb-usb/af9005.c
+++ b/drivers/media/usb/dvb-usb/af9005.c
@@ -422,6 +422,10 @@ static int af9005_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msg[],
 		if (ret == 0)
 			ret = 2;
 	} else {
+		if (msg[0].len < 2) {
+			ret = -EOPNOTSUPP;
+			goto unlock;
+		}
 		/* write one or more registers */
 		reg = msg[0].buf[0];
 		addr = msg[0].addr;
@@ -431,6 +435,7 @@ static int af9005_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msg[],
 			ret = 1;
 	}
 
+unlock:
 	mutex_unlock(&d->i2c_mutex);
 	return ret;
 }
-- 
2.40.1

