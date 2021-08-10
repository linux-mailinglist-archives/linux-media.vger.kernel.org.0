Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C62CA3E7DF8
	for <lists+linux-media@lfdr.de>; Tue, 10 Aug 2021 19:07:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229935AbhHJRH2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Aug 2021 13:07:28 -0400
Received: from mail.kernel.org ([198.145.29.99]:50412 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229474AbhHJRH1 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Aug 2021 13:07:27 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9E9F660E9B;
        Tue, 10 Aug 2021 17:07:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1628615225;
        bh=40eaFF8avN00+fbxXyp/z0+R+jHa1WNUdvrM6QIjvTE=;
        h=Date:From:To:Cc:Subject:From;
        b=WqKINDld5jmqcKrrX24zJ1njg91xeEw+Y38BCMvGB65sHuzH35Z0IqKN6zQqAfDTi
         rNKyNvw5EeXGCvQ8CDV71yPHkJMCG9mwCHdfF0yr1dp81wjK+95cFuHRJlJ6FBJTpJ
         Clfum6ebtsrFSbxzhfHKEgtiAXhP02SoAwmZY7/+hjP+4f60lzFI4N8zjZeoKdqOIz
         N5icP8C/qA8gOoGVC3xl3DdHJGXqQgHMa6ZRMAhY4+eFtuj97WJDmi5qsEZXT7QHJ6
         lfCefJ+E1btctSush6kxoWoJszrANIVUhc08x5xxln7zNusIl0PqSakUFjcu7v2lwh
         eAG/iMqOPAatQ==
Date:   Tue, 10 Aug 2021 12:09:55 -0500
From:   "Gustavo A. R. Silva" <gustavoars@kernel.org>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Yong Zhi <yong.zhi@intel.com>
Cc:     linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        linux-hardening@vger.kernel.org
Subject: [PATCH v3] media: staging/intel-ipu3: css: Fix wrong size comparison
 imgu_css_fw_init
Message-ID: <20210810170955.GA49923@embeddedor>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There is a wrong comparison of the total size of the loaded firmware
css->fw->size with the size of a pointer to struct imgu_fw_header.

Turn binary_header into a flexible-array member[1][2], use the
struct_size() helper and fix the wrong size comparison. Notice
that the loaded firmware needs to contain at least one 'struct
imgu_fw_info' item in the binary_header[] array.

It's also worth mentioning that

	"css->fw->size < struct_size(css->fwp, binary_header, 1)"

with binary_header declared as a flexible-array member is equivalent
to

	"css->fw->size < sizeof(struct imgu_fw_header)"

with binary_header declared as a one-element array (as in the original
code).

The replacement of the one-element array with a flexible-array member
also helps with the ongoing efforts to globally enable -Warray-bounds
and get us closer to being able to tighten the FORTIFY_SOURCE routines
on memcpy().

[1] https://en.wikipedia.org/wiki/Flexible_array_member
[2] https://www.kernel.org/doc/html/v5.10/process/deprecated.html#zero-length-and-one-element-arrays

Link: https://github.com/KSPP/linux/issues/79
Link: https://github.com/KSPP/linux/issues/109
Fixes: 09d290f0ba21 ("media: staging/intel-ipu3: css: Add support for firmware management")
Cc: stable@vger.kernel.org
Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
Changes in v3:
 - Integrate the series into a single patch.
 - Adjust relational operator and use struct_size().
 - Update Subject line and changelog text.
 * Thanks to Dan and Sakari for their feedback. :)

Changes in v2:
 - Use flexible array and adjust relational operator in patch 1.
   Link: https://lore.kernel.org/linux-hardening/cover.1627646101.git.gustavoars@kernel.org/

v1:
 Link: https://lore.kernel.org/linux-hardening/cover.1627600430.git.gustavoars@kernel.org/

 drivers/staging/media/ipu3/ipu3-css-fw.c | 7 +++----
 drivers/staging/media/ipu3/ipu3-css-fw.h | 2 +-
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/media/ipu3/ipu3-css-fw.c b/drivers/staging/media/ipu3/ipu3-css-fw.c
index 45aff76198e2..981693eed815 100644
--- a/drivers/staging/media/ipu3/ipu3-css-fw.c
+++ b/drivers/staging/media/ipu3/ipu3-css-fw.c
@@ -124,12 +124,11 @@ int imgu_css_fw_init(struct imgu_css *css)
 	/* Check and display fw header info */
 
 	css->fwp = (struct imgu_fw_header *)css->fw->data;
-	if (css->fw->size < sizeof(struct imgu_fw_header *) ||
+	if (css->fw->size < struct_size(css->fwp, binary_header, 1) ||
 	    css->fwp->file_header.h_size != sizeof(struct imgu_fw_bi_file_h))
 		goto bad_fw;
-	if (sizeof(struct imgu_fw_bi_file_h) +
-	    css->fwp->file_header.binary_nr * sizeof(struct imgu_fw_info) >
-	    css->fw->size)
+	if (struct_size(css->fwp, binary_header,
+			css->fwp->file_header.binary_nr) > css->fw->size)
 		goto bad_fw;
 
 	dev_info(dev, "loaded firmware version %.64s, %u binaries, %zu bytes\n",
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

