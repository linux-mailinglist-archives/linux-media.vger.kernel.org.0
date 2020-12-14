Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A19822D971C
	for <lists+linux-media@lfdr.de>; Mon, 14 Dec 2020 12:11:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389880AbgLNLLU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Dec 2020 06:11:20 -0500
Received: from faui03.informatik.uni-erlangen.de ([131.188.30.103]:36574 "EHLO
        faui03.informatik.uni-erlangen.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729843AbgLNLLN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Dec 2020 06:11:13 -0500
Received: from cipterm0.informatik.uni-erlangen.de (cipterm0.cip.cs.fau.de [131.188.30.90])
        by faui03.informatik.uni-erlangen.de (Postfix) with ESMTP id 8077F240B5A
        for <linux-media@vger.kernel.org>; Mon, 14 Dec 2020 12:10:20 +0100 (CET)
Received: by cipterm0.informatik.uni-erlangen.de (Postfix, from userid 67858)
        id DE9123280146; Mon, 14 Dec 2020 12:02:54 +0100 (CET)
From:   Philipp Gerlesberger <Philipp.Gerlesberger@fau.de>
To:     linux-kernel@vger.kernel.org
Cc:     Philipp Gerlesberger <Philipp.Gerlesberger@fau.de>,
        ij72uhux@stud.informatik.uni-erlangen.de,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@i4.cs.fau.de, gregkh@linuxfoundation.org,
        sakari.ailus@linux.intel.com, mchehab@kernel.org
Subject: [PATCH v2 08/12] media: atomisp: Delete braces
Date:   Mon, 14 Dec 2020 12:01:52 +0100
Message-Id: <20201214110156.6152-9-Philipp.Gerlesberger@fau.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201214110156.6152-1-Philipp.Gerlesberger@fau.de>
References: <20201214110156.6152-1-Philipp.Gerlesberger@fau.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

WARNING:BRACES: braces {} are not necessary for single statement blocks

Co-developed-by: Andrey Khlopkov <ij72uhux@stud.informatik.uni-erlangen.de>
Signed-off-by: Andrey Khlopkov <ij72uhux@stud.informatik.uni-erlangen.de>
Signed-off-by: Philipp Gerlesberger <Philipp.Gerlesberger@fau.de>
---
 drivers/staging/media/atomisp/pci/runtime/timer/src/timer.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/runtime/timer/src/timer.c b/drivers/staging/media/atomisp/pci/runtime/timer/src/timer.c
index 00b54a0613bb..08f5c3ea6d29 100644
--- a/drivers/staging/media/atomisp/pci/runtime/timer/src/timer.c
+++ b/drivers/staging/media/atomisp/pci/runtime/timer/src/timer.c
@@ -23,9 +23,7 @@ int ia_css_timer_get_current_tick(struct ia_css_clock_tick *curr_ts)
 {
 	assert(curr_ts);
 	if (!curr_ts)
-	{
 		return -EINVAL;
-	}
 	curr_ts->ticks = (clock_value_t)gp_timer_read(GP_TIMER_SEL);
 	return 0;
 }
-- 
2.20.1

