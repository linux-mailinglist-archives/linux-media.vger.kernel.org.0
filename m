Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C45A1EE865
	for <lists+linux-media@lfdr.de>; Thu,  4 Jun 2020 18:15:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728972AbgFDQPr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Jun 2020 12:15:47 -0400
Received: from mga06.intel.com ([134.134.136.31]:19445 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726026AbgFDQPr (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 4 Jun 2020 12:15:47 -0400
IronPort-SDR: H2bKQRW1k+jECFqSW6Ky5i1dlnvGdf9V9bsNv2LdfxrCdkj2FggrNJ0wTPiCTvIpXzcpJjswZV
 v5rTLc80H/LA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2020 09:15:45 -0700
IronPort-SDR: p/OhjpS99uZGCPsJPwIefFrkyBkTXEfXoHOvObWrYKxUOvgoj2vVvOFMcGYXDubNz5v/Rk+3OA
 KcfI1EdKXjkQ==
X-IronPort-AV: E=Sophos;i="5.73,472,1583222400"; 
   d="scan'208";a="445555974"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2020 09:15:44 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by paasikivi.fi.intel.com (Postfix) with ESMTP id 0720320163;
        Thu,  4 Jun 2020 19:15:42 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1jgsXV-0002QU-7R; Thu, 04 Jun 2020 19:16:21 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     mchehab@kernel.org
Cc:     linux-media@vger.kernel.org
Subject: [PATCH 0/4] atomisp set_fs() fix
Date:   Thu,  4 Jun 2020 19:16:17 +0300
Message-Id: <20200604161621.9282-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

This set addresses the atomisp IOCTL handling security issues using the
same approach chosen for V4L2. I've rebased them on the current driver in
staging.

Sakari Ailus (4):
  staging: atomisp: There's no struct atomisp_dvs2_coefficients
  staging: atomisp: Fix atomisp_overlay32 compat handling
  staging: atomisp: Fix compat IOCTL handling
  staging: atomisp: Check return value from compat_alloc_user_space

 .../media/atomisp/include/linux/atomisp.h     |   2 +-
 .../staging/media/atomisp/pci/atomisp_cmd.c   |   2 +-
 .../media/atomisp/pci/atomisp_compat_css20.c  |   4 +-
 .../atomisp/pci/atomisp_compat_ioctl32.c      | 934 +++++++++---------
 4 files changed, 477 insertions(+), 465 deletions(-)

-- 
2.20.1

