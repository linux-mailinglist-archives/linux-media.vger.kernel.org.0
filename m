Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EFB724530B5
	for <lists+linux-media@lfdr.de>; Tue, 16 Nov 2021 12:31:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235275AbhKPLcv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Nov 2021 06:32:51 -0500
Received: from mail.kernel.org ([198.145.29.99]:35236 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235073AbhKPLcb (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Nov 2021 06:32:31 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id A267A63212;
        Tue, 16 Nov 2021 11:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637062148;
        bh=MxBPtoihvouLfYG8cgHz2T5rgMZ+ePtfb1HqpAzcbiU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=YK8d8QkAVCq2YbW/1buxYjOZ0HqbyXWBhfodZXle8Cqht/6WYRrtApFVGC11TYLWc
         0Gtgd0gr/k3kVj7doWnHJo7XkGsSCv9KzhH0gorbwAv/npt9yG6pX3NGU7Ay3mU+64
         lAjQ3FYI0GyGK9iZFDqBRgTvH6eQWh3R02dFc66zjBxBVlCanYvt2oTMvIvJV4G5g4
         nTQN+5rWgSyqdPLUOxBBQL6+47Ei+FUUQeFv0QdRrYV+DAaakfNO/iyw9kfRvtxY8q
         D9G/6fMr5nmsU3AkJIUv9ff7x1vZqMj4lyzCbLPtEBeUGwrYlWtpduUaDNYN4WcwQF
         LXzd2YvBNrYxg==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1mmwe9-008Qg1-M9; Tue, 16 Nov 2021 11:29:05 +0000
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Martiros Shakhzadyan <vrzh@vrzh.net>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev
Subject: [PATCH 19/23] media: atomisp: get rid of some weird warn-suppress logic
Date:   Tue, 16 Nov 2021 11:29:00 +0000
Message-Id: <581e26c2d24c180f6d619797781f1809c9ce6c4e.1637061474.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1637061474.git.mchehab+huawei@kernel.org>
References: <cover.1637061474.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There are some dead code meant to suppress "CRUN" warnings.

Drop it from sh_css.c, as it doesn't make much sense.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---

To mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH 00/23] at: https://lore.kernel.org/all/cover.1637061474.git.mchehab+huawei@kernel.org/

 drivers/staging/media/atomisp/pci/sh_css.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css.c b/drivers/staging/media/atomisp/pci/sh_css.c
index 5d022bb373a6..6970cf8a5dfe 100644
--- a/drivers/staging/media/atomisp/pci/sh_css.c
+++ b/drivers/staging/media/atomisp/pci/sh_css.c
@@ -8198,15 +8198,6 @@ sh_css_init_host_sp_control_vars(void)
 #endif
 	HIVE_ADDR_host_sp_com = fw->info.sp.host_sp_com;
 
-	(void)HIVE_ADDR_ia_css_ispctrl_sp_isp_started; /* Suppres warnings in CRUN */
-
-	(void)HIVE_ADDR_sp_sleep_mode;
-	(void)HIVE_ADDR_ia_css_dmaproxy_sp_invalidate_tlb;
-#ifndef ISP2401
-	(void)HIVE_ADDR_sp_stop_copy_preview;
-#endif
-	(void)HIVE_ADDR_host_sp_com;
-
 	sp_dmem_store_uint32(SP0_ID,
 			     (unsigned int)sp_address_of(ia_css_ispctrl_sp_isp_started),
 			     (uint32_t)(0));
-- 
2.33.1

