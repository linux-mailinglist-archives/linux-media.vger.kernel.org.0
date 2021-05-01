Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C89CC3705EF
	for <lists+linux-media@lfdr.de>; Sat,  1 May 2021 08:43:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230337AbhEAGoK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 1 May 2021 02:44:10 -0400
Received: from msg-1.mailo.com ([213.182.54.11]:41924 "EHLO msg-1.mailo.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229505AbhEAGoK (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 1 May 2021 02:44:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
        t=1619851390; bh=d3WL2gA2XAUnc6D2ONecCXP5byI2wSg4bDECMI4RMxg=;
        h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:MIME-Version:
         Content-Type;
        b=ZRUqjCG1bMPsw770xKEiwz9XzzBUtbgczS9TSb71i85IqTxSISfvTR9RgxHK6SAPw
         DKQsIC21b1W9eJzddlwQ3MH3ISV9xFmNHCl4GAyG99VBI1zbhA4K2ZRVpugHq8lWm7
         cvnHu1mx+M+f0A9h/mXaFkYn4WcBr6LB+ptdCwLs=
Received: by 192.168.90.16 [192.168.90.16] with ESMTP
        via ip-206.mailobj.net [213.182.55.206]
        Sat,  1 May 2021 08:43:10 +0200 (CEST)
X-EA-Auth: aorXokUL045zv58Vn/CrdmwgxYKaUVEP5UMMTSECyPc0RO0tye9oPFXBiQUD4gB6tcPVY26l2cP6NXPcJaBdGl7tpBZdJdIP
Date:   Sat, 1 May 2021 12:13:04 +0530
From:   Deepak R Varma <drv@mailo.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org, drv@mailo.com
Subject: [PATCH 0/5] staging: media: atomisp: code formatting changes
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



