Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AEA6D458B46
	for <lists+linux-media@lfdr.de>; Mon, 22 Nov 2021 10:26:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239048AbhKVJ3X (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Nov 2021 04:29:23 -0500
Received: from mail.kernel.org ([198.145.29.99]:59084 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238944AbhKVJ3W (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Nov 2021 04:29:22 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0C33260F6B;
        Mon, 22 Nov 2021 09:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637573176;
        bh=vwguznC0LIciCvAwhzGbB97MM3fdENySXXEsqm6FmRQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Qv6HXkwuoviE/85V5MWT7j0d/2BY2hNVKRJbsg9fOBcxe7Q+gK+p+tCLsDbwBj1dh
         5nFuKLAyZTR610P04fNIvuy4/unLd/ZkAY+V0RwnWBThtmlBiOPMmoVd7/wvYWIP4o
         PCKNeRLBfeTQs7CXFqaQ75M0iyGXFkiFd0X4/Gn7d2u8On2B7GDHevifXYv85R8x0i
         aX6jmdw36TA1vq4nYPG1ety9pe/B+kcWyVZM0TlNcAWo9AnpZ6UY549Nl/Ij3BYGRU
         T3/YTHG/qlSEZMEK5b/LXICzHjDuc29M/9MlyOlsMx6anWAh8XbU5gdrcJQid1x4vS
         VVA52i3h2pvmw==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1mp5aX-003hie-72; Mon, 22 Nov 2021 09:26:13 +0000
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        llvm@lists.linux.dev
Subject: [PATCH 10/10] media: omap3isp: avoid warnings at IS_OUT_OF_BOUNDS()
Date:   Mon, 22 Nov 2021 09:26:12 +0000
Message-Id: <b70f819b11e024649f113be1158f34b24914a1ed.1637573097.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1637573097.git.mchehab+huawei@kernel.org>
References: <cover.1637573097.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Clang with W=1 produces the following warnings:

drivers/media/platform/omap3isp/isph3a_af.c:173:6: error: result of comparison of constant 256 with expression of type '__u8' (aka 'unsigned char') is always false [-Werror,-Wtautological-constant-out-of-range-compare]
        if (IS_OUT_OF_BOUNDS(paxel_cfg->height, OMAP3ISP_AF_PAXEL_HEIGHT_MIN,
            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/media/platform/omap3isp/isph3a_af.c:24:33: note: expanded from macro 'IS_OUT_OF_BOUNDS'
        (((value) < (min)) || ((value) > (max)))
                               ~~~~~~~ ^ ~~~~~
drivers/media/platform/omap3isp/isph3a_af.c:179:6: error: result of comparison of constant 256 with expression of type '__u8' (aka 'unsigned char') is always false [-Werror,-Wtautological-constant-out-of-range-compare]
        if (IS_OUT_OF_BOUNDS(paxel_cfg->width, OMAP3ISP_AF_PAXEL_WIDTH_MIN,
            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/media/platform/omap3isp/isph3a_af.c:24:33: note: expanded from macro 'IS_OUT_OF_BOUNDS'
        (((value) < (min)) || ((value) > (max)))
                               ~~~~~~~ ^ ~~~~~
2 errors generated.

Use a typecast to avoid such warnings.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---

To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH 00/10] at: https://lore.kernel.org/all/cover.1637573097.git.mchehab+huawei@kernel.org/

 drivers/media/platform/omap3isp/isph3a_af.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/omap3isp/isph3a_af.c b/drivers/media/platform/omap3isp/isph3a_af.c
index a65cfdfa9637..de7b116d0122 100644
--- a/drivers/media/platform/omap3isp/isph3a_af.c
+++ b/drivers/media/platform/omap3isp/isph3a_af.c
@@ -21,7 +21,7 @@
 #include "ispstat.h"
 
 #define IS_OUT_OF_BOUNDS(value, min, max)		\
-	(((value) < (min)) || ((value) > (max)))
+	((((unsigned int)value) < (min)) || (((unsigned int)value) > (max)))
 
 static void h3a_af_setup_regs(struct ispstat *af, void *priv)
 {
-- 
2.33.1

