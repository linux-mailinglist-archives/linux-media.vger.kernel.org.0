Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 200CB18C37E
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2020 00:09:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727237AbgCSXJP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Mar 2020 19:09:15 -0400
Received: from gateway20.websitewelcome.com ([192.185.67.41]:11978 "EHLO
        gateway20.websitewelcome.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726867AbgCSXJP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Mar 2020 19:09:15 -0400
X-Greylist: delayed 1502 seconds by postgrey-1.27 at vger.kernel.org; Thu, 19 Mar 2020 19:09:14 EDT
Received: from cm12.websitewelcome.com (cm12.websitewelcome.com [100.42.49.8])
        by gateway20.websitewelcome.com (Postfix) with ESMTP id 23401400C81CF
        for <linux-media@vger.kernel.org>; Thu, 19 Mar 2020 16:08:25 -0500 (CDT)
Received: from gator4166.hostgator.com ([108.167.133.22])
        by cmsmtp with SMTP
        id F3Zxj0BW51s2xF3ZyjiYjH; Thu, 19 Mar 2020 17:23:54 -0500
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=embeddedor.com; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
        Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=6URqdS67bk0WU5yZN4/DlVoCb44PpZDm7Vl22nZSfqw=; b=LBBXdvcPHn6gf+mMZhQkYAC9xC
        vGwDbqJPNc7Ukn8xPPYLMkkpdDpUT0CRoBLHfjW3opok/8ZoNsOQCA8D0E8WKVQuNyj2uwfu1+uKm
        sONHDJg9Al6UwwLaXCRaunJnH2L0tN+WjJ+bs6cEjOpQFh2rEp8l2hqvaJcPk+0YoBaG0IX77Ylv9
        OuMUmGbFo0o5zyjxH4/0p0oqLvkNLxuSPeHL0WYubFV32xQrqTTYmdBO3FFJiUcSQxkmFhPXTlJk1
        /59X03wbcGPVVUB1nXGfbGUfA1pfpUB6gLk0x7JN45SYE7O6fDOkS2Hgvl8vfUqAKRD7h+Gz+3lSh
        hLEIfV5A==;
Received: from cablelink-189-218-116-241.hosts.intercable.net ([189.218.116.241]:53894 helo=embeddedor)
        by gator4166.hostgator.com with esmtpa (Exim 4.92)
        (envelope-from <gustavo@embeddedor.com>)
        id 1jF3Zw-0024Kc-Fd; Thu, 19 Mar 2020 17:23:52 -0500
Date:   Thu, 19 Mar 2020 17:23:52 -0500
From:   "Gustavo A. R. Silva" <gustavo@embeddedor.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: [PATCH][next] media: usb: pwc: pwc.h: Replace zero-length array with
 flexible-array member
Message-ID: <20200319222352.GA19476@embeddedor.com>
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
X-Exim-ID: 1jF3Zw-0024Kc-Fd
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: cablelink-189-218-116-241.hosts.intercable.net (embeddedor) [189.218.116.241]:53894
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 17
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
 drivers/media/usb/pwc/pwc.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/usb/pwc/pwc.h b/drivers/media/usb/pwc/pwc.h
index 3362962d0d00..b02a3c7b7742 100644
--- a/drivers/media/usb/pwc/pwc.h
+++ b/drivers/media/usb/pwc/pwc.h
@@ -193,7 +193,7 @@ struct pwc_raw_frame {
 				   decompressor) */
 	__u8   cmd[4];		/* the four byte of the command (in case of
 				   nala, only the first 3 bytes is filled) */
-	__u8   rawframe[0];	/* frame_size = H / 4 * vbandlength */
+	__u8   rawframe[];	/* frame_size = H / 4 * vbandlength */
 } __packed;
 
 /* intermediate buffers with raw data from the USB cam */
-- 
2.23.0

