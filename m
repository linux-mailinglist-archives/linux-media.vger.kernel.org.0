Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4DD6DCCD79
	for <lists+linux-media@lfdr.de>; Sun,  6 Oct 2019 02:31:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726888AbfJFA3N (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 5 Oct 2019 20:29:13 -0400
Received: from mga03.intel.com ([134.134.136.65]:13612 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726706AbfJFA3N (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 5 Oct 2019 20:29:13 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 05 Oct 2019 17:29:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,261,1566889200"; 
   d="scan'208";a="183076313"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 05 Oct 2019 17:29:10 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1iGuQA-0000ra-90; Sun, 06 Oct 2019 08:29:10 +0800
Date:   Sun, 6 Oct 2019 08:28:05 +0800
From:   kbuild test robot <lkp@intel.com>
To:     "Carlos E. C. Barbosa" <climacobarbosacee@gmail.com>
Cc:     kbuild-all@01.org, lkcamp@lists.libreplanetbr.org,
        Helen Koike <helen.koike@collabora.com>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [RFC PATCH] media: vimc: vimc_pix_map_fmt_info() can be static
Message-ID: <20191006002805.i2gbquub7egjczhx@332d0cec05f4>
References: <20191005211136.552305-1-carlosecb@tutanota.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191005211136.552305-1-carlosecb@tutanota.com>
X-Patchwork-Hint: ignore
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


Fixes: 4d124d159dff ("media: vimc: get pixformat info from v4l2_format_info to avoid code repetition")
Signed-off-by: kbuild test robot <lkp@intel.com>
---
 vimc-common.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/vimc/vimc-common.c b/drivers/media/platform/vimc/vimc-common.c
index 9ea698810e1a1..c37442aba70b1 100644
--- a/drivers/media/platform/vimc/vimc-common.c
+++ b/drivers/media/platform/vimc/vimc-common.c
@@ -118,7 +118,7 @@ static struct vimc_pix_map_fmt vimc_pix_map_fmt_list[] = {
 	},
 };
 
-struct vimc_pix_map vimc_pix_map_fmt_info(struct vimc_pix_map_fmt *vfmt)
+static struct vimc_pix_map vimc_pix_map_fmt_info(struct vimc_pix_map_fmt *vfmt)
 {
 
 	struct vimc_pix_map vpix = {
