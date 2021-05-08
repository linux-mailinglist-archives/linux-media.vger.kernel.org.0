Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 598FA3774A3
	for <lists+linux-media@lfdr.de>; Sun,  9 May 2021 02:02:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229732AbhEIADB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 8 May 2021 20:03:01 -0400
Received: from mslow1.mail.gandi.net ([217.70.178.240]:42249 "EHLO
        mslow1.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229570AbhEIADA (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 8 May 2021 20:03:00 -0400
Received: from relay9-d.mail.gandi.net (unknown [217.70.183.199])
        by mslow1.mail.gandi.net (Postfix) with ESMTP id C3E95C2EBF
        for <linux-media@vger.kernel.org>; Sat,  8 May 2021 23:53:01 +0000 (UTC)
X-Originating-IP: 24.194.32.49
Received: from coplandos.local (cpe-24-194-32-49.nycap.res.rr.com [24.194.32.49])
        (Authenticated sender: vrzh@vrzh.net)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id F2751FF80A;
        Sat,  8 May 2021 23:52:38 +0000 (UTC)
From:   Martiros Shakhzadyan <vrzh@vrzh.net>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Martiros Shakhzadyan <vrzh@vrzh.net>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org
Subject: [PATCH 1/4] staging: media: atomisp: Resolve goto style issue in sh_css.c
Date:   Sat,  8 May 2021 19:56:19 -0400
Message-Id: <20210508235622.300394-2-vrzh@vrzh.net>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210508235622.300394-1-vrzh@vrzh.net>
References: <20210508235622.300394-1-vrzh@vrzh.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Change the goto label to lower case.
Remove a space in the goto label.

Signed-off-by: Martiros Shakhzadyan <vrzh@vrzh.net>
---
 drivers/staging/media/atomisp/pci/sh_css.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css.c b/drivers/staging/media/atomisp/pci/sh_css.c
index d26b1301eeb7..53c1001b807b 100644
--- a/drivers/staging/media/atomisp/pci/sh_css.c
+++ b/drivers/staging/media/atomisp/pci/sh_css.c
@@ -5170,7 +5170,7 @@ sh_css_pipe_get_grid_info(struct ia_css_pipe *pipe,
 	if (binary) {
 		err = ia_css_binary_3a_grid_info(binary, info, pipe);
 		if (err)
-			goto ERR;
+			goto err;
 	} else {
 		memset(&info->s3a_grid, 0, sizeof(info->s3a_grid));
 	}
@@ -5195,7 +5195,7 @@ sh_css_pipe_get_grid_info(struct ia_css_pipe *pipe,
 
 	info->vamem_type = IA_CSS_VAMEM_TYPE_2;
 
-ERR :
+err:
 	IA_CSS_LEAVE_ERR_PRIVATE(err);
 	return err;
 }
-- 
2.31.1

