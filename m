Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D83CE45CCF0
	for <lists+linux-media@lfdr.de>; Wed, 24 Nov 2021 20:14:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351320AbhKXTQv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Nov 2021 14:16:51 -0500
Received: from mail.kernel.org ([198.145.29.99]:53152 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1351191AbhKXTQq (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Nov 2021 14:16:46 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 814B361055;
        Wed, 24 Nov 2021 19:13:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637781216;
        bh=g8A7lF8+fn2PzwFNuJ8BU8zrppsHJw1vl6cD4Y+Gc90=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=V1M9K5IOWLaPJer8zHJZ7NWArxUY3c79AaeieiD4VE6GtTgPwMLMpZqZGclkswBoY
         KjrhnyMeXrevCRgF05KmnYrk/4Jnt8lGmyLw13TAOXsCvi3hL1r3GLBILqLgj72cjd
         Rb1CctITyG9Okzl0s90hWkIz3MnCeMkmkSFREj1uzSY961vsNN/OIozrdxleqcTW8m
         7L6rqGYjrfH5O5tUHn/FYJ9j5QnQvgERRvcMdGJ6p4gdJ8soFJBs9ovYEAu9n3sYuP
         JKMggaJOj5tkoZEmYKDTSSl2pUGc6kG5/bStnrXo7pcNa4+saHE+dsVz9crkSdDEvr
         ZXjqanOV1QXZg==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1mpxhs-004Q66-Oo; Wed, 24 Nov 2021 20:13:24 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Bixuan Cui <cuibixuan@huawei.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        llvm@lists.linux.dev
Subject: [PATCH 20/20] media: mxl5005s: drop some dead code
Date:   Wed, 24 Nov 2021 20:13:23 +0100
Message-Id: <b1b447e2f3e1ec0c3e9716f4f74d056461f69ab3.1637781097.git.mchehab+huawei@kernel.org>
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

As reported by clang (with W=1), the ctrlVal var is never used.

Yet, there are even some loops to estimate it. As this is dead
code, remove it. If ever needed, someone could revert this
patch.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---

To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH 00/20] at: https://lore.kernel.org/all/cover.1637781097.git.mchehab+huawei@kernel.org/

 drivers/media/tuners/mxl5005s.c | 14 +-------------
 1 file changed, 1 insertion(+), 13 deletions(-)

diff --git a/drivers/media/tuners/mxl5005s.c b/drivers/media/tuners/mxl5005s.c
index f6e82a8e7d37..ab4c43df9d18 100644
--- a/drivers/media/tuners/mxl5005s.c
+++ b/drivers/media/tuners/mxl5005s.c
@@ -3414,9 +3414,8 @@ static u16 MXL_ControlWrite_Group(struct dvb_frontend *fe, u16 controlNum,
 	u32 value, u16 controlGroup)
 {
 	struct mxl5005s_state *state = fe->tuner_priv;
-	u16 i, j, k;
+	u16 i, j;
 	u32 highLimit;
-	u32 ctrlVal;
 
 	if (controlGroup == 1) /* Initial Control */ {
 
@@ -3432,9 +3431,6 @@ static u16 MXL_ControlWrite_Group(struct dvb_frontend *fe, u16 controlNum,
 							(u8)(state->Init_Ctrl[i].bit[j]),
 							(u8)((value>>j) & 0x01));
 					}
-					ctrlVal = 0;
-					for (k = 0; k < state->Init_Ctrl[i].size; k++)
-						ctrlVal += state->Init_Ctrl[i].val[k] * (1 << k);
 				} else
 					return -1;
 			}
@@ -3454,9 +3450,6 @@ static u16 MXL_ControlWrite_Group(struct dvb_frontend *fe, u16 controlNum,
 							(u8)(state->CH_Ctrl[i].bit[j]),
 							(u8)((value>>j) & 0x01));
 					}
-					ctrlVal = 0;
-					for (k = 0; k < state->CH_Ctrl[i].size; k++)
-						ctrlVal += state->CH_Ctrl[i].val[k] * (1 << k);
 				} else
 					return -1;
 			}
@@ -3477,11 +3470,6 @@ static u16 MXL_ControlWrite_Group(struct dvb_frontend *fe, u16 controlNum,
 							(u8)(state->MXL_Ctrl[i].bit[j]),
 							(u8)((value>>j) & 0x01));
 					}
-					ctrlVal = 0;
-					for (k = 0; k < state->MXL_Ctrl[i].size; k++)
-						ctrlVal += state->
-							MXL_Ctrl[i].val[k] *
-							(1 << k);
 				} else
 					return -1;
 			}
-- 
2.33.1

