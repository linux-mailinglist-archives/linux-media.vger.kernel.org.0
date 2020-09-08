Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21DF4261022
	for <lists+linux-media@lfdr.de>; Tue,  8 Sep 2020 12:42:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729576AbgIHKlh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Sep 2020 06:41:37 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:38673 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729539AbgIHK0b (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 8 Sep 2020 06:26:31 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id FapHkWzhXMeQuFapIkfd95; Tue, 08 Sep 2020 12:26:12 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1599560773; bh=A5e5PrYoY6MRBhyUUYvjIRuog3xhq6LmyZBbNGIDnuo=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=paxoFfOD1gxdzPAFWT8tG5JwFokt7Ed1aWP746WbQ9W3TdAaFzWaO4YLWereFabq4
         1nbulknNVqKNtf5wDse6rywyhKrNVhXJuNE49YBuR8dsZBTyJcV5Ssk0w+lbuFJYvt
         YZ2EIdxl/st/4iJY/slBaoSB8sf7VjsDDvw7pW9l9Eeq4wjj3rPQTN7ETeb8Bgmldo
         zuAWTp/35Au7KeNKNxKOML5iJ3AMM4bEqeWgvzyM1/kRxQDpOQjX00ChGHCbDeZDZR
         XnXA7/Yr1AkVll2u/lYahScpcpPlAv1fpirP5Hu0IfZq0lZfqO6lzU3QA39Cj8Gpg0
         JC6rvNB7axniw==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 1/2] cec-core.c: stop kthread_config before kthread
Date:   Tue,  8 Sep 2020 12:26:10 +0200
Message-Id: <20200908102611.471265-2-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200908102611.471265-1-hverkuil-cisco@xs4all.nl>
References: <20200908102611.471265-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfBN2Q8OdUTxNwwXZKp4mIW5k45gcUuld5aOh0wpvINrX/ZgTkWJw2/5rJe28JxnzNFzzD/qZ30AO02STTnm91z/poRB+6GsCItnNEfd08WIu1oS/LRZz
 V1uNcGd33Mxcg7OAbokpSI+jvNQyVPPvF12hEoKhF2aXOHNr/GTyLpMj4UGnmVURT2sjaPN9yYJNW/LFZUsquywqokZQMJHyORvPBTXbCvZIovSou+5bWR1m
 EiDGmgdhQIcUFsNV2+bx3tX7QVlmxOiP6r4Djhq82IKUVOuUSl8hmParvYJtqARw
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The kthread_config relies on the main kthread (message processing
loop) to be present, so stop kthread_config before kthread.

It's unlikely to be a problem (and I've never seen any issues), but
if nothing else it makes sense to stop the threads in this order.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/cec/core/cec-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/cec/core/cec-core.c b/drivers/media/cec/core/cec-core.c
index 3ee16f672d68..ece236291f35 100644
--- a/drivers/media/cec/core/cec-core.c
+++ b/drivers/media/cec/core/cec-core.c
@@ -396,9 +396,9 @@ void cec_delete_adapter(struct cec_adapter *adap)
 {
 	if (IS_ERR_OR_NULL(adap))
 		return;
-	kthread_stop(adap->kthread);
 	if (adap->kthread_config)
 		kthread_stop(adap->kthread_config);
+	kthread_stop(adap->kthread);
 	if (adap->ops->adap_free)
 		adap->ops->adap_free(adap);
 #ifdef CONFIG_MEDIA_CEC_RC
-- 
2.27.0

