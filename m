Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2120454395
	for <lists+linux-media@lfdr.de>; Wed, 17 Nov 2021 10:25:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235030AbhKQJ2l (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Nov 2021 04:28:41 -0500
Received: from mail.kernel.org ([198.145.29.99]:58772 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231377AbhKQJ2k (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Nov 2021 04:28:40 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id D558A6321B;
        Wed, 17 Nov 2021 09:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637141141;
        bh=2NFPJOuua1H2yh5+o5FLJwN4cMgnjF5fSg2Mz48DBrw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=SEBvqBE3NyM9pLZSAH6uWYdC4N57YdQ+qs75FquNbCqJzSRPoqTpMzqNRPZv5xRuW
         seZgOsKNefzaGPc6/QWaJeS1WYEgULexhNlHNFIvrJWGE3GNKFz8DuRSRTckyq41UP
         LtfZvHMqjWhUrYQCfsfefPe3vw/FEHfDt8ET/VkGK1wN35OJT+7cnweo8jvAD+PAXX
         bGhfm1Hrw6nLogE5hUMHQCx85G4WAESDGsNfqZf7czB7BjcUjpuQl4EwusVjPNPqLK
         m1p0WWjh3IK7LRk2T9GduUgAZ04M/+yj5sY7c/0JI1VQKwZ5XpuF9RexAu+6aXvVGQ
         vMHRkDnIpsxKw==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1mnHCF-00Cb61-Aa; Wed, 17 Nov 2021 09:25:39 +0000
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev
Subject: [PATCH 09/13] media: atomisp: get rid of #ifdef HAS_BL
Date:   Wed, 17 Nov 2021 09:25:34 +0000
Message-Id: <e3e4e62c3b9fa421030121ea19bb829fd393f4fb.1637140900.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1637140900.git.mchehab+huawei@kernel.org>
References: <cover.1637140900.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This does nothing but declare extern to a non-existing var.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---

To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH 00/13] at: https://lore.kernel.org/all/cover.1637140900.git.mchehab+huawei@kernel.org/

 drivers/staging/media/atomisp/pci/sh_css_firmware.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css_firmware.h b/drivers/staging/media/atomisp/pci/sh_css_firmware.h
index 66cd38f08f71..a73ce703adfb 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_firmware.h
+++ b/drivers/staging/media/atomisp/pci/sh_css_firmware.h
@@ -29,9 +29,6 @@ struct  sh_css_fw_bi_file_h {
 };
 
 extern struct ia_css_fw_info     sh_css_sp_fw;
-#if defined(HAS_BL)
-extern struct ia_css_fw_info     sh_css_bl_fw;
-#endif /* HAS_BL */
 extern struct ia_css_blob_descr *sh_css_blob_info;
 extern unsigned int sh_css_num_binaries;
 
-- 
2.33.1

