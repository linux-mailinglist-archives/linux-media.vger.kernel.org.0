Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1F8725B62C
	for <lists+linux-media@lfdr.de>; Wed,  2 Sep 2020 23:53:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726762AbgIBVxh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Sep 2020 17:53:37 -0400
Received: from mga14.intel.com ([192.55.52.115]:28379 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726298AbgIBVxg (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 2 Sep 2020 17:53:36 -0400
IronPort-SDR: UEHGVqqIJF83VjGmb0/9lDVoqbdIzjYT1TQpW8ckrnnApx8h7Ape1g1tX3aHAJzsBfwiMgfD6F
 fPcza0AsR82g==
X-IronPort-AV: E=McAfee;i="6000,8403,9732"; a="156754222"
X-IronPort-AV: E=Sophos;i="5.76,384,1592895600"; 
   d="scan'208";a="156754222"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2020 14:53:35 -0700
IronPort-SDR: BrfkZlFUKv0sf9RjV1BkCgqjbxl5VZNFtrvfekZO8CvLqrXxPckPYHyTjmWtfZJJoyzU0YIXVK
 XtiKGwc1PC4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,384,1592895600"; 
   d="scan'208";a="325951664"
Received: from lkp-server02.sh.intel.com (HELO eb469fda2af7) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 02 Sep 2020 14:53:34 -0700
Received: from kbuild by eb469fda2af7 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kDahB-0000Gc-Jp; Wed, 02 Sep 2020 21:53:33 +0000
Date:   Thu, 3 Sep 2020 05:53:23 +0800
From:   kernel test robot <lkp@intel.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     kbuild-all@lists.01.org, linux-media@vger.kernel.org,
        0day robot <lkp@intel.com>
Subject: [RFC PATCH] Revert "wlcore: wl1271_check_aes_cmac_cypher() can be
 static
Message-ID: <20200902215322.GA42069@779141fe2fa5>
References: <202009030534.oYAQhUQX%lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202009030534.oYAQhUQX%lkp@intel.com>
X-Patchwork-Hint: ignore
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


Signed-off-by: kernel test robot <lkp@intel.com>
---
 main.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ti/wlcore/main.c b/drivers/net/wireless/ti/wlcore/main.c
index 090692f4f9e1d..7197ffef07fb1 100644
--- a/drivers/net/wireless/ti/wlcore/main.c
+++ b/drivers/net/wireless/ti/wlcore/main.c
@@ -1092,7 +1092,7 @@ static int wl12xx_chip_wakeup(struct wl1271 *wl, bool plt)
 	return ret;
 }
 
-bool wl1271_check_aes_cmac_cypher(struct wl1271 *wl)
+static bool wl1271_check_aes_cmac_cypher(struct wl1271 *wl)
 {
 	int ver[5] = { };
 	int ret;
