Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A1BE1ABCA7
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2020 11:18:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392122AbgDPJSQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Apr 2020 05:18:16 -0400
Received: from mga06.intel.com ([134.134.136.31]:54587 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2392128AbgDPJSK (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Apr 2020 05:18:10 -0400
IronPort-SDR: NtdoxGLPJvErDVc0h1lPpKdqnUf5evp9AMnk9+o8flUSbC2L7RQcLAHflM7GMXN0Fe6DUboSM+
 U+Ulp6OuBfzA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2020 02:18:07 -0700
IronPort-SDR: mDtLbSpG08tLMhvBgl94mIxOd00z2KJYYhLuyhl8ZFwHoJKWu5mrm+cUuP5vZMk8Kmf8tw00tM
 O5OHBnY6fMbQ==
X-IronPort-AV: E=Sophos;i="5.72,390,1580803200"; 
   d="scan'208";a="272012230"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2020 02:18:05 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by paasikivi.fi.intel.com (Postfix) with ESMTP id A97C320260;
        Thu, 16 Apr 2020 12:18:03 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1jP0fa-00087c-9b; Thu, 16 Apr 2020 12:18:50 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     rajmohan.mani@intel.com, bingbu.cao@intel.com, tfiga@chromium.org
Subject: [PATCH 0/3] IPU3 ImgU driver parameter struct fixes
Date:   Thu, 16 Apr 2020 12:18:47 +0300
Message-Id: <20200416091850.31177-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi all,

This set addresses parameter struct memory layout changes introduced by
seemingly innocent patches, and adds a sanity check for the struct size to
avoid this from happening again. This only touches the uAPI, not the
ipu3-abi.h that deals with ABI not visible in the driver uAPI. That should
be addressed as well going forward.

The first patch does not probably entirely fix the issues, but with the
second patch added, pahole agrees the struct memory layout is unchanged
from the previous state.

Sakari Ailus (3):
  Revert "staging: imgu: Address a compiler warning on alignment"
  staging: ipu3-imgu: Move alignment attribute to field
  staging: ipu3-imgu: Add a sanity check for the parameter struct size

 drivers/staging/media/ipu3/include/intel-ipu3.h | 7 ++++---
 drivers/staging/media/ipu3/ipu3-css.c           | 7 +++++++
 2 files changed, 11 insertions(+), 3 deletions(-)

-- 
2.20.1

