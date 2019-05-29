Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 03B972D7A6
	for <lists+linux-media@lfdr.de>; Wed, 29 May 2019 10:22:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726722AbfE2IWS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 May 2019 04:22:18 -0400
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:60775 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726112AbfE2IWS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 May 2019 04:22:18 -0400
Received: from [IPv6:2001:983:e9a7:1:352c:d076:e7aa:19ae] ([IPv6:2001:983:e9a7:1:352c:d076:e7aa:19ae])
        by smtp-cloud7.xs4all.net with ESMTPA
        id Vtqhh3rY63qlsVtqihsC4e; Wed, 29 May 2019 10:22:16 +0200
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH] cec-adap: fix regression in ping sanity check
Message-ID: <e77e1168-088d-f70a-d0f5-a0fbdb312e16@xs4all.nl>
Date:   Wed, 29 May 2019 10:22:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfFaFaFlqO0PkCDktSZD1r3/mq9rdnEheFUqbA6S+Vit4MTxikPH0kb/h1rsVK3ve3QJddRhYsvV4Oib3YNzb3GoRjz80S4cOcpAJdjlqAZ/5epssBwmI
 6isHj15nH/9Krgv24uQOlzt2lh4fTTEq4Xfy9PrLm60WEN1NCI2TviUbjpr5T/SVCgkqLekvNxw4U8K4bhQcNctWD8T7+QC+EHXhMKdfi8HGfY8V4ksDu8R5
 kqnKkllf2u6lstYu/MZndnvBXFbPi82SVg9xZFv41QU=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Commit b6c96e156825 inadvertently also dropped the 'msg->len > 1' test
from the preceding sanity check. This caused compliance test failures.

Fixes: b6c96e156825 ("media: cec: allow any initiator for Ping and Image/Text View On")
Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/cec/cec-adap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/cec/cec-adap.c b/drivers/media/cec/cec-adap.c
index 5827d8c3742a..ac3683a7b2ab 100644
--- a/drivers/media/cec/cec-adap.c
+++ b/drivers/media/cec/cec-adap.c
@@ -809,7 +809,7 @@ int cec_transmit_msg_fh(struct cec_adapter *adap, struct cec_msg *msg,
 				__func__);
 			return -EINVAL;
 		}
-		if (adap->is_configured &&
+		if (msg->len > 1 && adap->is_configured &&
 		    !cec_has_log_addr(adap, cec_msg_initiator(msg))) {
 			dprintk(1, "%s: initiator has unknown logical address %d\n",
 				__func__, cec_msg_initiator(msg));
-- 
2.20.1


