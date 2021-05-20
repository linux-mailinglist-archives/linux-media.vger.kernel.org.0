Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 713DF38B679
	for <lists+linux-media@lfdr.de>; Thu, 20 May 2021 21:01:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236472AbhETTCd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 May 2021 15:02:33 -0400
Received: from msg-2.mailo.com ([213.182.54.12]:48110 "EHLO msg-2.mailo.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234486AbhETTCc (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 May 2021 15:02:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
        t=1621537260; bh=TWiNdURZ1lEp1xpr9VOsip1Riwkh1Q/WyXtAZIvp1sQ=;
        h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:MIME-Version:
         Content-Type;
        b=SPPufKj9kVK2eOk1QrPiYUYx0AWJv1/WFfUYzBgiUpPuZpQgqLOXHo/MHP9caAPgG
         KtNMVaHwX4/juv1rN0T9QGc5rSALATZXkKo2jJemMO/RgxLBDLiREGsA5W0NtxqhRb
         w28YgHe5zz8VUIJU01uc+6fqqvnmhQtJRhdPm5aM=
Received: by 192.168.90.15 [192.168.90.15] with ESMTP
        via ip-206.mailobj.net [213.182.55.206]
        Thu, 20 May 2021 21:00:59 +0200 (CEST)
X-EA-Auth: kLc09m6AjTNTFQ0pDF3o6BRXVrApVEscOKBZcnucRK2aUaeIHyBXoUEW0budx8Cf2EqYjjCVjRFTxnnHUlLs7BB0iKLx2byc
Date:   Fri, 21 May 2021 00:30:41 +0530
From:   Deepak R Varma <drv@mailo.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org, drv@mailo.com
Subject: [PATCH RESEND 0/5] staging: media: atomisp: code formatting changes
Message-ID: <cover.1619850663.git.drv@mailo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch set overall improves the code organisation and readability of
the files of atomisp drivers. There are several complaints reported by
checkpatch including ERROR and WARNING types on the files under atomisp/pci
directory.

The changes are proposed on a per file basis since there are many
issues to be addressed in each individual file. The patches are built
on the media_tree/for-v5.14-out1 tree/branch.


Deepak R Varma (5):
  staging: media: atomisp: code formatting changes atomisp_csi2.c
  staging: media: atomisp: code formatting changes sh_css_mipi.c
  staging: media: atomisp: code formatting changes sh_css_params.c
  staging: media: atomisp: code formatting changes sh_css_sp.c
  staging: media: atomisp: code formatting changes sh_css_version.c

 .../staging/media/atomisp/pci/atomisp_csi2.c  |  72 +-
 .../staging/media/atomisp/pci/sh_css_mipi.c   | 170 ++--
 .../staging/media/atomisp/pci/sh_css_params.c | 929 +++++++++---------
 drivers/staging/media/atomisp/pci/sh_css_sp.c | 471 ++++-----
 .../media/atomisp/pci/sh_css_version.c        |   4 +-
 5 files changed, 754 insertions(+), 892 deletions(-)

-- 
2.30.2



