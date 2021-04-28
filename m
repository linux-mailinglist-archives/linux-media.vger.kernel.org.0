Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5014636DEC3
	for <lists+linux-media@lfdr.de>; Wed, 28 Apr 2021 20:07:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243419AbhD1SHt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Apr 2021 14:07:49 -0400
Received: from msg-1.mailo.com ([213.182.54.11]:35236 "EHLO msg-1.mailo.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239935AbhD1SHr (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Apr 2021 14:07:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
        t=1619633077; bh=7hlgpWxI8RDOAaTiJXMHJmjusAlSxGAIvuavLSm+NJs=;
        h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:MIME-Version:
         Content-Type;
        b=M6BMEs62PGRC8fOjrqKiYPGjER2VRGY69XZKigMrh9r3fzSIiEYBMkGyjtUN4yHBv
         RyX8DqGRtz2RJbDzWSpSlSPYWTY1cki+0rTzZ+0q0kpK3Sl9AxuMZpew+UVNMO/opt
         ++oFNJPw8cXjmYX26gQSIu97WaVOXHi1BjA6KqE0=
Received: by 192.168.90.11 [192.168.90.11] with ESMTP
        via ip-206.mailobj.net [213.182.55.206]
        Wed, 28 Apr 2021 20:04:37 +0200 (CEST)
X-EA-Auth: D9acU+5VrOCUhvF5ajQTKCNpZFfSNXGn1i367EQfYqGFv32RsQo9pSqkrlja6tz07PCkVuXSgVy+sorgw26MzkxjFXcamVCk
Date:   Wed, 28 Apr 2021 23:34:29 +0530
From:   Deepak R Varma <drv@mailo.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, drv@mailo.com
Subject: [PATCH v4 0/9] staging: media: atomisp: code cleanup fixes
Message-ID: <cover.1619628317.git.drv@mailo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch set addresses multiple issues reported by  of checkpatch script as
WARNING and CHECK complaints. Other feedback received from the
maintainers is incorporated as well.

Note:
   - The patches should be applied in the ascending order.
   - Patch count revised to 9 from 6
   - patch 1/9 is not being sent since it was already submitted by
     another developer.

Changes since v3:
   Generic change:
   1. Dropped patch 1/9 since it was already submitted to Hans by
      another developer.
   2. Split patch 2 into patch 2 & 3 since they are doing two different
      things.
   3. Added patch 8 & 9 for extended clean up based on patch set feedback
      received.

   Patch Specific change:
   1. patch 1/9 : dropped
   2. patch 2/9 : split into patch 2 & 3
   3. patch 3/9 : introduced
   4. patch 4/9 : none
   5. patch 5/9 : include header file in the clean up
   6. patch 6/9 : none 
   7. patch 7/9 : include dev_info() for replacements 
   8. patch 8/9 : introduced 
   9. patch 9/9 : introduced

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


Deepak R Varma (9):
  staging: media: atomisp: improve function argument alignment
  staging: media: atomisp: balance braces around if...else block
  staging: media: atomisp: remove unnecessary braces
  staging: media: atomisp: use __func__ over function names
  staging: media: atomisp: reformat code comment blocks
  staging: media: atomisp: fix CamelCase variable naming
  staging: media: atomisp: replace raw pr_*() by dev_dbg()
  staging: media: atomisp: remove unnecessary pr_info calls
  staging: media: atomisp: remove unwanted dev_*() calls

 .../media/atomisp/i2c/atomisp-gc0310.c        |  57 +++------
 .../media/atomisp/i2c/atomisp-gc2235.c        |  29 ++---
 .../atomisp/i2c/atomisp-libmsrlisthelper.c    |   6 +-
 .../media/atomisp/i2c/atomisp-lm3554.c        |   2 +-
 .../media/atomisp/i2c/atomisp-mt9m114.c       | 108 ++++++++++--------
 .../media/atomisp/i2c/atomisp-ov2680.c        |  41 ++++---
 .../media/atomisp/i2c/atomisp-ov2722.c        |  10 +-
 drivers/staging/media/atomisp/i2c/mt9m114.h   |   3 +-
 drivers/staging/media/atomisp/i2c/ov2680.h    |  10 +-
 9 files changed, 130 insertions(+), 136 deletions(-)

-- 
2.31.1



