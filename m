Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 44BA445CCEF
	for <lists+linux-media@lfdr.de>; Wed, 24 Nov 2021 20:14:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351181AbhKXTQu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Nov 2021 14:16:50 -0500
Received: from mail.kernel.org ([198.145.29.99]:53126 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1351186AbhKXTQq (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Nov 2021 14:16:46 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 66A93601FA;
        Wed, 24 Nov 2021 19:13:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637781216;
        bh=xF2TmJGxWdp9cd88FGUNpQVb/0Ad7bsiidrScjdYCZM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=eA1rMYWEsfjSTj7tJcG44cWjKuq39FihjZNnOPOOYku/294JwGh4EfcxwCJNV+gx9
         83WIyZ1h1gbdKoaXe0nTS8jp4yArn34K3FHTsAf32BilhbsoLVnsBqxxO8q3MruZn9
         aIx4fCf58a1/n1QWpBzod0s9Y9rnLo89qmAJJ47PCFnS4jyiNb96wgtY72+ScL3zGg
         o56vioNQTwmEoY6itDnp+IV4ZlnfGNPjnOtE6ezwZXW22ztjxDb2gJLCCBTKmOPh+D
         e17Qvy718LMm8PHK6ylBQHwv+1w3fwRaIRfltV2Q9BMunu5e+n69Dm8EU7KhzKxYTK
         K8PEa/aLjUsAg==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1mpxhs-004Q63-OK; Wed, 24 Nov 2021 20:13:24 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH 19/20] media: cobalt: drop an unused variable
Date:   Wed, 24 Nov 2021 20:13:22 +0100
Message-Id: <ed14f3d4d03fbeb8d42d1bc6ffcb4d49ee18a8d2.1637781097.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1637781097.git.mchehab+huawei@kernel.org>
References: <cover.1637781097.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The clock_control value is read but never actually used. Based on
a comment at the code, it has to be reset at the function.

So, drop the variable that stores its value.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---

To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH 00/20] at: https://lore.kernel.org/all/cover.1637781097.git.mchehab+huawei@kernel.org/

 drivers/media/pci/cobalt/cobalt-cpld.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/media/pci/cobalt/cobalt-cpld.c b/drivers/media/pci/cobalt/cobalt-cpld.c
index 3d8026483ac3..fad882459d23 100644
--- a/drivers/media/pci/cobalt/cobalt-cpld.c
+++ b/drivers/media/pci/cobalt/cobalt-cpld.c
@@ -236,7 +236,6 @@ bool cobalt_cpld_set_freq(struct cobalt *cobalt, unsigned f_out)
 	u8 n1, hsdiv;
 	u8 regs[6];
 	int found = 0;
-	u16 clock_ctrl;
 	int retries = 3;
 
 	for (i = 0; i < ARRAY_SIZE(multipliers); i++) {
@@ -260,9 +259,7 @@ bool cobalt_cpld_set_freq(struct cobalt *cobalt, unsigned f_out)
 	hsdiv = multipliers[i_best].hsdiv - 4;
 	rfreq = div_u64(dco << 28, f_xtal);
 
-	clock_ctrl = cpld_read(cobalt, SI570_CLOCK_CTRL);
-	clock_ctrl |= S01755_REG_CLOCK_CTRL_BITMAP_CLKHSMA_FPGA_CTRL;
-	clock_ctrl |= S01755_REG_CLOCK_CTRL_BITMAP_CLKHSMA_EN;
+	cpld_read(cobalt, SI570_CLOCK_CTRL);
 
 	regs[0] = (hsdiv << 5) | (n1 >> 2);
 	regs[1] = ((n1 & 0x3) << 6) | (rfreq >> 32);
-- 
2.33.1

