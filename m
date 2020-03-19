Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7610F18C31D
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2020 23:43:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727313AbgCSWna (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Mar 2020 18:43:30 -0400
Received: from gateway36.websitewelcome.com ([192.185.188.18]:21104 "EHLO
        gateway36.websitewelcome.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726867AbgCSWna (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Mar 2020 18:43:30 -0400
X-Greylist: delayed 1341 seconds by postgrey-1.27 at vger.kernel.org; Thu, 19 Mar 2020 18:43:29 EDT
Received: from cm16.websitewelcome.com (cm16.websitewelcome.com [100.42.49.19])
        by gateway36.websitewelcome.com (Postfix) with ESMTP id 5B2D3402A82E7
        for <linux-media@vger.kernel.org>; Thu, 19 Mar 2020 16:37:12 -0500 (CDT)
Received: from gator4166.hostgator.com ([108.167.133.22])
        by cmsmtp with SMTP
        id F3XIjZ9Iu8vkBF3XIjQB4m; Thu, 19 Mar 2020 17:21:08 -0500
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=embeddedor.com; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
        Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=Ejt0U9xF8uKBQhWJIyxqaJFvv89Skw/oMh2ar5ojGfw=; b=oLL9zKsAPSXHRamY1lZiC24mzX
        fQX8i72OeDaqcpVp8/PJVj5aA78c3JqbnBMdplk0/2pWLsMtG2EPsz06hUsK481YU+AZQMGVoDF0l
        v1WLi3sWfeJREHcXXp7cMa6d/L97gZKSE211pMuv4Sk5reihfLKkZONGc0hoIZEO1XLfDFkyOpzoH
        0GnAvrSDYPdcNp04p8FmFk6N0yqekinAwNGzWrKHFAjn0NUl0T4rXYPzQ1lVOIt89q9JzsDiyFd6w
        ks7KMEcjLZiYEyh2yqrW3bitKFa0mg+haCXd9xN+IzocGZriL8FCKPeHyNIJxPHX1yngUQ1MEyKba
        VfavbZBw==;
Received: from cablelink-189-218-116-241.hosts.intercable.net ([189.218.116.241]:53880 helo=embeddedor)
        by gator4166.hostgator.com with esmtpa (Exim 4.92)
        (envelope-from <gustavo@embeddedor.com>)
        id 1jF3XH-0023Gm-0B; Thu, 19 Mar 2020 17:21:07 -0500
Date:   Thu, 19 Mar 2020 17:21:05 -0500
From:   "Gustavo A. R. Silva" <gustavo@embeddedor.com>
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: [PATCH][next] media: venus: hfi_cmds.h: Replace zero-length array
 with flexible-array member
Message-ID: <20200319222105.GA19104@embeddedor.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 189.218.116.241
X-Source-L: No
X-Exim-ID: 1jF3XH-0023Gm-0B
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: cablelink-189-218-116-241.hosts.intercable.net (embeddedor) [189.218.116.241]:53880
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 5
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The current codebase makes use of the zero-length array language
extension to the C90 standard, but the preferred mechanism to declare
variable-length types such as these ones is a flexible array member[1][2],
introduced in C99:

struct foo {
        int stuff;
        struct boo array[];
};

By making use of the mechanism above, we will get a compiler warning
in case the flexible array does not occur last in the structure, which
will help us prevent some kind of undefined behavior bugs from being
inadvertently introduced[3] to the codebase from now on.

Also, notice that, dynamic memory allocations won't be affected by
this change:

"Flexible array members have incomplete type, and so the sizeof operator
may not be applied. As a quirk of the original implementation of
zero-length arrays, sizeof evaluates to zero."[1]

This issue was found with the help of Coccinelle.

[1] https://gcc.gnu.org/onlinedocs/gcc/Zero-Length.html
[2] https://github.com/KSPP/linux/issues/21
[3] commit 76497732932f ("cxgb3/l2t: Fix undefined behaviour")

Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
---
 drivers/media/platform/qcom/venus/hfi_cmds.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/venus/hfi_cmds.h b/drivers/media/platform/qcom/venus/hfi_cmds.h
index cae9d5d61c0c..83705e237f1c 100644
--- a/drivers/media/platform/qcom/venus/hfi_cmds.h
+++ b/drivers/media/platform/qcom/venus/hfi_cmds.h
@@ -107,7 +107,7 @@ struct hfi_session_abort_pkt {
 struct hfi_session_set_property_pkt {
 	struct hfi_session_hdr_pkt shdr;
 	u32 num_properties;
-	u32 data[0];
+	u32 data[];
 };
 
 struct hfi_session_set_buffers_pkt {
-- 
2.23.0

