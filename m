Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 98B3D36A5C9
	for <lists+linux-media@lfdr.de>; Sun, 25 Apr 2021 10:40:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229637AbhDYIlG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 25 Apr 2021 04:41:06 -0400
Received: from msg-1.mailo.com ([213.182.54.11]:40842 "EHLO msg-1.mailo.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229485AbhDYIlF (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 25 Apr 2021 04:41:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
        t=1619340015; bh=5liUc+da+ixTCoXc9F2Wovsz5zapQhdjMTOmkF7fQAU=;
        h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:MIME-Version:
         Content-Type;
        b=YnBJPcdf/Af42jGadmL9TIb9IzOIHsjVBLHgvIpFYwSaUyYWqdCzmmGFke9Uzmk/Y
         RO+sYQbH/PhBTSFJ+f3W+qMqwKMFJnGB3dmL/NtwbYWjpO78vVZYYw/nFINz5bX+V8
         cSqfof7Va2q550wjFLdrURI1S4IP9ev2nuPy0RWE=
Received: by 192.168.90.16 [192.168.90.16] with ESMTP
        via ip-206.mailobj.net [213.182.55.206]
        Sun, 25 Apr 2021 10:40:15 +0200 (CEST)
X-EA-Auth: HV6lrtq01prdfPlae/6UoMtV+bXHYWao8X0BG04YPCQb0xECfOR6ALwaUhRxevAF5dFXed6CDuVbiimgnnsitW1j7dOQD+J9
Date:   Sun, 25 Apr 2021 14:10:09 +0530
From:   Deepak R Varma <drv@mailo.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, drv@mailo.com
Subject: [PATCH RESEND v3 0/6] staging: media: atomisp: code cleanup fixes
Message-ID: <cover.1619199344.git.drv@mailo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch set addresses different kinds of checkpatch WARNING and
CHECK complaints.

Note: 
   - Patch set being resent due a email messageID issue in the earlier
     patch set.
   - The patches should be applied in the ascending order.

Changes since v2:
   Generic change:
   1. Correct patch versioning in patch subject

   Patch Specific change:
   1. patch 1/6 : none
   2. patch 2/6 : none
   3. patch 3/6 : none
   4. patch 4/6 :
        a. Tag Fabio Auito for the patch suggestion

   5. patch 5/6 : none
   6. patch 6/6:
        a. Tag Fabio Auito for the patch suggestion

Changes since v1:
   Generic change:
   1. The patch set is being resent from an email account that matches with
      the patch signed-of-by tag. Issue highlighted by Hans Verkuil.

   Patch specific changes:
   1. patch 1/6 : none
   2. patch 2/6 : none
   3. patch 3/6 : none
   4. patch 4/6 : implement following changes suggested by Fabio Aiuto
        a. Corrected commenting style
        b. Similar style implemented for other comment blocks in
           the same files.
   5. patch 5/6 : none
   6. patch 6/6: implement following changes suggested by Fabio Aiuto
        a. use dev_info instead of pr_info
        b. update patch log message accordingly


Deepak R Varma (6):
  staging: media: atomisp: improve function argument alignment
  staging: media: atomisp: balance braces around if...else block
  staging: media: atomisp: use __func__ over function names
  staging: media: atomisp: reformat code comment blocks
  staging: media: atomisp: fix CamelCase variable naming
  staging: media: atomisp: replace raw printk() by dev_info()

 .../media/atomisp/i2c/atomisp-gc0310.c        |  14 +--
 .../media/atomisp/i2c/atomisp-gc2235.c        |  29 ++---
 .../atomisp/i2c/atomisp-libmsrlisthelper.c    |   6 +-
 .../media/atomisp/i2c/atomisp-lm3554.c        |   2 +-
 .../media/atomisp/i2c/atomisp-mt9m114.c       | 106 ++++++++++--------
 .../media/atomisp/i2c/atomisp-ov2680.c        |  43 ++++---
 .../media/atomisp/i2c/atomisp-ov2722.c        |  10 +-
 7 files changed, 116 insertions(+), 94 deletions(-)

-- 
2.25.1



