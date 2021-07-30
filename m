Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9968D3DB82F
	for <lists+linux-media@lfdr.de>; Fri, 30 Jul 2021 14:05:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238709AbhG3MFp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Jul 2021 08:05:45 -0400
Received: from mail.kernel.org ([198.145.29.99]:45638 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230263AbhG3MFp (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Jul 2021 08:05:45 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 955DD60F01;
        Fri, 30 Jul 2021 12:05:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1627646740;
        bh=/YlnU4V3aPDSJabKbYYPbeEQmm/CqFf1w/7AEVfRlFY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=OCnEFos0dJ2x7MMIS264xEhMeVRksdxI281u3TeuppryAu0qZNns6/HavEw2ZmnSM
         JKkgPHFZGnTN0pMJha1YMZKpaCQ6kNcLwhd0uTn0r14upyD8smdxAuxOelTDFSBbUI
         D3L7yIQqQerdQWBtOrecQCWzI23Bc5+u4/9/vUrYaHRl33+7MrP28hT799aiFzCfCB
         n6hIc6yJAvd1uGh5uXRVws93pBX0j9yk0A9xsTCxvnF3XDlsi+rbEXwAV4oWEqMlQH
         B2JSK7L96ho5qjc54RA/7zmg3vO56GEIFmcuJLQqzcyu4lDY4ufIYsYzixcs4x8e5e
         82sjCEO1CaubA==
Date:   Fri, 30 Jul 2021 07:08:13 -0500
From:   "Gustavo A. R. Silva" <gustavoars@kernel.org>
To:     linux-kernel@vger.kernel.org
Cc:     Yong Zhi <yong.zhi@intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-hardening@vger.kernel.org,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Dan Carpenter <dan.carpenter@oracle.com>
Subject: [PATCH v2 1/2] media: staging/intel-ipu3: css: Fix wrong size
 comparison
Message-ID: <184d96f95d6261b1a91704eb68adbd0a2e1c2cc2.1627646101.git.gustavoars@kernel.org>
References: <cover.1627646101.git.gustavoars@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1627646101.git.gustavoars@kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There is a wrong comparison of the total size of the loaded firmware
css->fw->size with the size of a pointer to struct imgu_fw_header.

Fix this by using the right operand 'struct imgu_fw_header' for
sizeof, instead of 'struct imgu_fw_header *' and turn binary_header
into a flexible-array member. Also, adjust the relational operator
to be '<=' instead of '<', as it seems that the intention of the
comparison is to determine if the loaded firmware contains any
'struct imgu_fw_info' items in the binary_header[] array than merely
the file_header (struct imgu_fw_bi_file_h).

The replacement of the one-element array with a flexible-array member
also help with the ongoing efforts to globally enable -Warray-bounds
and get us closer to being able to tighten the FORTIFY_SOURCE routines
on memcpy().

Link: https://github.com/KSPP/linux/issues/79
Link: https://github.com/KSPP/linux/issues/109
Fixes: 09d290f0ba21 ("media: staging/intel-ipu3: css: Add support for firmware management")
Cc: stable@vger.kernel.org
Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---

It'd be just great if someone that knows this code better can confirm
these changes are correct. In particular the adjustment of the
relational operator. Thanks!

Changes in v2:
 - Use flexible array and adjust relational operator, accordingly.
 - Update changelog text.

 drivers/staging/media/ipu3/ipu3-css-fw.c | 2 +-
 drivers/staging/media/ipu3/ipu3-css-fw.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/ipu3/ipu3-css-fw.c b/drivers/staging/media/ipu3/ipu3-css-fw.c
index 45aff76198e2..630cb5186b48 100644
--- a/drivers/staging/media/ipu3/ipu3-css-fw.c
+++ b/drivers/staging/media/ipu3/ipu3-css-fw.c
@@ -124,7 +124,7 @@ int imgu_css_fw_init(struct imgu_css *css)
 	/* Check and display fw header info */
 
 	css->fwp = (struct imgu_fw_header *)css->fw->data;
-	if (css->fw->size < sizeof(struct imgu_fw_header *) ||
+	if (css->fw->size <= sizeof(struct imgu_fw_header) ||
 	    css->fwp->file_header.h_size != sizeof(struct imgu_fw_bi_file_h))
 		goto bad_fw;
 	if (sizeof(struct imgu_fw_bi_file_h) +
diff --git a/drivers/staging/media/ipu3/ipu3-css-fw.h b/drivers/staging/media/ipu3/ipu3-css-fw.h
index 3c078f15a295..c0bc57fd678a 100644
--- a/drivers/staging/media/ipu3/ipu3-css-fw.h
+++ b/drivers/staging/media/ipu3/ipu3-css-fw.h
@@ -171,7 +171,7 @@ struct imgu_fw_bi_file_h {
 
 struct imgu_fw_header {
 	struct imgu_fw_bi_file_h file_header;
-	struct imgu_fw_info binary_header[1];	/* binary_nr items */
+	struct imgu_fw_info binary_header[];	/* binary_nr items */
 };
 
 /******************* Firmware functions *******************/
-- 
2.27.0

