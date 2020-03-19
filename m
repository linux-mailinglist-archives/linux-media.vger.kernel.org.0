Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 46FC518C320
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2020 23:44:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727392AbgCSWoI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Mar 2020 18:44:08 -0400
Received: from gateway32.websitewelcome.com ([192.185.145.115]:36512 "EHLO
        gateway32.websitewelcome.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726867AbgCSWoI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Mar 2020 18:44:08 -0400
X-Greylist: delayed 1295 seconds by postgrey-1.27 at vger.kernel.org; Thu, 19 Mar 2020 18:44:07 EDT
Received: from cm16.websitewelcome.com (cm16.websitewelcome.com [100.42.49.19])
        by gateway32.websitewelcome.com (Postfix) with ESMTP id 819E7F95AD
        for <linux-media@vger.kernel.org>; Thu, 19 Mar 2020 17:22:32 -0500 (CDT)
Received: from gator4166.hostgator.com ([108.167.133.22])
        by cmsmtp with SMTP
        id F3YejZAxf8vkBF3YejQCj4; Thu, 19 Mar 2020 17:22:32 -0500
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=embeddedor.com; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
        Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=Fch2gw+FxFOXUz75GYw483nOatBMsFwMZSrEf6kFfTg=; b=l3k+wfE4lVqBWzoz4AH1Y3aB4X
        SNG1oTH5L8odnCiD4YykyzsTml/8wJx0Nh3HQ5xOyW9QdscofmWrhUoksFaYLna1vptrw4dH7u0OR
        JQ/z2YgbjGQYyiTjWegOVTfZTG+G0+mabbHUMsPZs9XhLRksK+sWYqVAlQcBuaPl/qkoYYGLyXrB5
        PC3zlrvGU52YVAz6nur+atgPOezOttLLEeDD++9BdlbxykWlKNZRh1gBk7e2iJXpdJx7To+tSUoTe
        XgzlFwksvHPa4oQpM1NfeFzE1xSw8FcfB+JxFOqiKEJ9k1tEzdDLc1Kylt1gxrEJkcj3oMD0MAnj9
        bU+P7o4A==;
Received: from cablelink-189-218-116-241.hosts.intercable.net ([189.218.116.241]:53888 helo=embeddedor)
        by gator4166.hostgator.com with esmtpa (Exim 4.92)
        (envelope-from <gustavo@embeddedor.com>)
        id 1jF3Yc-0023qC-18; Thu, 19 Mar 2020 17:22:30 -0500
Date:   Thu, 19 Mar 2020 17:22:29 -0500
From:   "Gustavo A. R. Silva" <gustavo@embeddedor.com>
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: [PATCH][next] media: venus: hfi_msgs.h: Replace zero-length array
 with flexible-array member
Message-ID: <20200319222229.GA19280@embeddedor.com>
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
X-Exim-ID: 1jF3Yc-0023qC-18
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: cablelink-189-218-116-241.hosts.intercable.net (embeddedor) [189.218.116.241]:53888
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 12
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
 drivers/media/platform/qcom/venus/hfi_msgs.h | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/hfi_msgs.h b/drivers/media/platform/qcom/venus/hfi_msgs.h
index 7694b1d25d9d..526d9f5b487b 100644
--- a/drivers/media/platform/qcom/venus/hfi_msgs.h
+++ b/drivers/media/platform/qcom/venus/hfi_msgs.h
@@ -155,7 +155,7 @@ struct hfi_msg_session_empty_buffer_done_pkt {
 	u32 input_tag;
 	u32 packet_buffer;
 	u32 extradata_buffer;
-	u32 data[0];
+	u32 data[];
 };
 
 struct hfi_msg_session_fbd_compressed_pkt {
@@ -175,7 +175,7 @@ struct hfi_msg_session_fbd_compressed_pkt {
 	u32 picture_type;
 	u32 packet_buffer;
 	u32 extradata_buffer;
-	u32 data[0];
+	u32 data[];
 };
 
 struct hfi_msg_session_fbd_uncompressed_plane0_pkt {
@@ -202,7 +202,7 @@ struct hfi_msg_session_fbd_uncompressed_plane0_pkt {
 	u32 picture_type;
 	u32 packet_buffer;
 	u32 extradata_buffer;
-	u32 data[0];
+	u32 data[];
 };
 
 struct hfi_msg_session_fbd_uncompressed_plane1_pkt {
@@ -211,7 +211,7 @@ struct hfi_msg_session_fbd_uncompressed_plane1_pkt {
 	u32 filled_len;
 	u32 offset;
 	u32 packet_buffer2;
-	u32 data[0];
+	u32 data[];
 };
 
 struct hfi_msg_session_fbd_uncompressed_plane2_pkt {
@@ -220,7 +220,7 @@ struct hfi_msg_session_fbd_uncompressed_plane2_pkt {
 	u32 filled_len;
 	u32 offset;
 	u32 packet_buffer3;
-	u32 data[0];
+	u32 data[];
 };
 
 struct hfi_msg_session_parse_sequence_header_done_pkt {
-- 
2.23.0

