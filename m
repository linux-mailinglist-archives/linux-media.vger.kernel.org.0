Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54DFD3AC4D5
	for <lists+linux-media@lfdr.de>; Fri, 18 Jun 2021 09:19:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232136AbhFRHVM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Jun 2021 03:21:12 -0400
Received: from m12-18.163.com ([220.181.12.18]:51198 "EHLO m12-18.163.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231386AbhFRHVL (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Jun 2021 03:21:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
        s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=NKms5
        e9j+hQt3hhmNxwMuv3JmzyBCEeuefOvQnVEqu4=; b=l9Vljod303Hk+Npx8Vb26
        xmWGt7Uz3Gxyf+BEVkbRczNjl5hxYI63wIXemyfefUZyVk84fQhWrsGSfU4F33XS
        2Jbb5iP6ERa/yu5jkDjjqfQDLmhBWRE8x7G8AExVAAZIkKRw1CT4RRAn70hgl8oj
        WIJZT6q3s0XV+ZWJJsmWgY=
Received: from localhost.localdomain (unknown [218.17.89.92])
        by smtp14 (Coremail) with SMTP id EsCowABXXtbfSMxgeEHVqA--.3348S2;
        Fri, 18 Jun 2021 15:18:55 +0800 (CST)
From:   lijian_8010a29@163.com
To:     mchehab@kernel.org
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        lijian <lijian@yulong.com>
Subject: [PATCH] media: dvb-frontends: cx24117: Delete 'break' after 'goto'
Date:   Fri, 18 Jun 2021 15:17:57 +0800
Message-Id: <20210618071757.76236-1-lijian_8010a29@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: EsCowABXXtbfSMxgeEHVqA--.3348S2
X-Coremail-Antispam: 1Uf129KBjvdXoWruw1rKFW7uw18Aw1DXr15XFb_yoW3JrX_uw
        nrXr1fZrWktF1jyF1jqr1Sv3yqyry09w1v9a4jyry3JrWfWFy3Jr1qva47JryDW3WUuFnY
        va98Xrs2kay0kjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU5eCJPUUUUU==
X-Originating-IP: [218.17.89.92]
X-CM-SenderInfo: 5olmxttqbyiikqdsmqqrwthudrp/1tbiEQC1UF7+3wTq6AAAsN
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: lijian <lijian@yulong.com>

break is not useful after a goto, so delete 'break' after 'goto'.

Signed-off-by: lijian <lijian@yulong.com>
---
 drivers/media/dvb-frontends/cx24117.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/dvb-frontends/cx24117.c b/drivers/media/dvb-frontends/cx24117.c
index 9fccc906d85a..ac6e47d81b9e 100644
--- a/drivers/media/dvb-frontends/cx24117.c
+++ b/drivers/media/dvb-frontends/cx24117.c
@@ -1172,7 +1172,6 @@ struct dvb_frontend *cx24117_attach(const struct cx24117_config *config,
 			"%s: Error attaching frontend %d\n",
 			KBUILD_MODNAME, demod);
 		goto error1;
-		break;
 	case 1:
 		/* new priv instance */
 		priv->i2c = i2c;
-- 
2.25.1


