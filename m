Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3388C370604
	for <lists+linux-media@lfdr.de>; Sat,  1 May 2021 08:48:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231254AbhEAGtD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 1 May 2021 02:49:03 -0400
Received: from msg-1.mailo.com ([213.182.54.11]:42358 "EHLO msg-1.mailo.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229505AbhEAGtD (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 1 May 2021 02:49:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
        t=1619851688; bh=JiLdHkQqAQdc8HOZA+v+ql7U6+cmn/TOeYkHlqETiOQ=;
        h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:References:
         MIME-Version:Content-Type:In-Reply-To;
        b=DgcJeBX8vSjU3hBYIx8CBkvur28Q0iVgR9EDOQguqVoW82teqfKzrStx28HqejO2y
         ZS9sDCvyaAfXzs/uFYQmaTGlNmZNuBctlad81AvPpzOqfReKh6ytvMcMa4tQAcAz+O
         rQDaPgFCgv5Md/gQCvhJwUs5Aq8GrCGNy4T3YFyc=
Received: by 192.168.90.14 [192.168.90.14] with ESMTP
        via ip-206.mailobj.net [213.182.55.206]
        Sat,  1 May 2021 08:48:08 +0200 (CEST)
X-EA-Auth: n+oL2fKM0AQBfDrBS9XLL0Vt7txlZtHfAc/hUXjx2E3Qcp1WT7Al30IERw8UERm0pYKUsHiyGjrPzX7YkpNi3QwbhVt6yQ7j
Date:   Sat, 1 May 2021 12:18:03 +0530
From:   Deepak R Varma <drv@mailo.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org, drv@mailo.com
Subject: [PATCH 5/5] staging: media: atomisp: code formatting changes
 sh_css_version.c
Message-ID: <2e2756e00db48165a42b38deaace7edf4feb1450.1619850663.git.drv@mailo.com>
References: <cover.1619850663.git.drv@mailo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1619850663.git.drv@mailo.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Trivial code reformatting changes done according to the coding
style guidelines. These code changes overall improve code readability
and also address chackpatch complaints.

Signed-off-by: Deepak R Varma <drv@mailo.com>
---
 drivers/staging/media/atomisp/pci/sh_css_version.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css_version.c b/drivers/staging/media/atomisp/pci/sh_css_version.c
index fa6de61e4995..f038c61a8499 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_version.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_version.c
@@ -20,8 +20,8 @@
 #include "ia_css_err.h"
 #include "sh_css_firmware.h"
 
-int
-ia_css_get_version(char *version, int max_size) {
+int ia_css_get_version(char *version, int max_size)
+{
 	char *css_version;
 
 	if (!IS_ISP2401)
-- 
2.30.2



