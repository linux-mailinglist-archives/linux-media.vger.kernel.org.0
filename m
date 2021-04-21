Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD6CC367108
	for <lists+linux-media@lfdr.de>; Wed, 21 Apr 2021 19:12:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242840AbhDURMu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Apr 2021 13:12:50 -0400
Received: from msg-2.mailo.com ([213.182.54.12]:58694 "EHLO msg-2.mailo.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237498AbhDURMu (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Apr 2021 13:12:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
        t=1619023739; bh=kO86EZ56z9kx93HN97W2Kc1jw38KW2HRp30zM/cXH9w=;
        h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:MIME-Version:
         Content-Type;
        b=NRrZivBf9mEo8IpEJsWK2MD6Q1gGxq0LmaAWj+gS37fvI/NLvV/ObRDNveUucf6Gz
         TBQznhE9UPhul8lUKZTIrpG4w0R3Y6qYIMJ0fYtnliZ9nuS82O/Ec+j3UK6Ez738yn
         5cGq3AehrFmz+4CfSJuj2dcoUSfvG17gbCaOoEDY=
Received: by 192.168.90.12 [192.168.90.12] with ESMTP
        via ip-206.mailobj.net [213.182.55.206]
        Wed, 21 Apr 2021 18:48:58 +0200 (CEST)
X-EA-Auth: CWc/7tw3YHir2Ke1oWYL2f9zDXPAUWn8mA3hQHW2H4Gu7pXtxIju5Qr6a38k3Fj3kS7CuNmt2Un3wOTfG90G4eeGOs3TFHHy
Date:   Wed, 21 Apr 2021 22:18:49 +0530
From:   Deepak R Varma <drv@mailo.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, mh12gx2825@gmail.com, drv@mailo.com
Subject: [PATCH v1 0/6] staging: media: atomisp: code cleanup fixes
Message-ID: <cover.1619022192.git.drv@mailo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch set addresses different kinds of checkpatch WARNING and
CHECK complaints.

Note: The patches should be applied in the ascending order.

Changes in v1:
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



