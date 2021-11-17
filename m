Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 13D1045445B
	for <lists+linux-media@lfdr.de>; Wed, 17 Nov 2021 10:57:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235796AbhKQJ77 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Nov 2021 04:59:59 -0500
Received: from mail.kernel.org ([198.145.29.99]:35270 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235757AbhKQJ7z (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Nov 2021 04:59:55 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 45D4261BF9;
        Wed, 17 Nov 2021 09:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637143017;
        bh=06QSVAS4ibv7oCGfjDhYM0EJbP+vMzdqoJg2ejHQ3o0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=KCrtkT4ogqKJwl4JcnVBztXdCVBjiWxC+98DAQR/UckW+Srja55aJn8JJ7hsgVyCk
         ki/TVVGshfHQKooUs46QcCoPyNmM9urCf+Ze+Cs4Rp9RUhPaUJWrikvTWm66YsO35K
         MoKYXdMQdwclzUEubDnOmEdjRElEB9mhDA5qO75OKbrg4gzzPlJZ8hwerpLvj5XIKg
         ODON2UZh3vZDEUVHUHyoRNty9+LEudD9Vx18sX/zBtuv39EFgbT+E3j7gxJujjviMi
         PH8M/5UWSwKPPSBz9g67dt3GoZwecBNdAAmFl3z8fFMJUZck+mfWE18rzzsRFWFuba
         CpmBSHOvFu+7w==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1mnHgV-00DIUq-8e; Wed, 17 Nov 2021 09:56:55 +0000
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev
Subject: [PATCH v2 09/12] media: atomisp: get rid of #ifdef HAS_BL
Date:   Wed, 17 Nov 2021 09:56:51 +0000
Message-Id: <c0a7df148e9d641c622c5ef807da449c99b7fabf.1637142905.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1637142905.git.mchehab+huawei@kernel.org>
References: <cover.1637142905.git.mchehab+huawei@kernel.org>
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
See [PATCH v2 00/12] at: https://lore.kernel.org/all/cover.1637142905.git.mchehab+huawei@kernel.org/

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

