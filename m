Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E67D38B6B4
	for <lists+linux-media@lfdr.de>; Thu, 20 May 2021 21:07:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235201AbhETTIh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 May 2021 15:08:37 -0400
Received: from msg-2.mailo.com ([213.182.54.12]:48830 "EHLO msg-2.mailo.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232667AbhETTIh (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 May 2021 15:08:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
        t=1621537628; bh=JiLdHkQqAQdc8HOZA+v+ql7U6+cmn/TOeYkHlqETiOQ=;
        h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:References:
         MIME-Version:Content-Type:In-Reply-To;
        b=n0RHHpi8bnKbNjFI9S/jDI+fzODEugbKUc7D99zgbJ6sDq4M8HblPqGeWQCTNm8Wj
         sg3vQJ/WtGACzY7r9iUnFpU9SwX+FYSrxq7hQbXZfEL7DIQiyhD7AaJNgQvwsRsYL+
         e1poNQP+lIiBacww+INPquBYEOQ5R+YPMjiTQrSA=
Received: by 192.168.90.16 [192.168.90.16] with ESMTP
        via ip-206.mailobj.net [213.182.55.206]
        Thu, 20 May 2021 21:07:02 +0200 (CEST)
X-EA-Auth: tOCSZ/LojkyAZOiDcOe529g1Jjr+WHCGzdHhdSY5//DDCtwcnqbmy+J1DQaA4Z1Au3e83ekhUX/Z/VyknOLiCSxAX6jR6b5r
Date:   Fri, 21 May 2021 00:36:43 +0530
From:   Deepak R Varma <drv@mailo.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org, drv@mailo.com
Subject: [PATCH RESEND 5/5] staging: media: atomisp: code formatting changes
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



