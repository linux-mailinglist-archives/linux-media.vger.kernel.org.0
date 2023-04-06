Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 900336D9EE5
	for <lists+linux-media@lfdr.de>; Thu,  6 Apr 2023 19:35:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239229AbjDFRfy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Apr 2023 13:35:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238771AbjDFRfs (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 Apr 2023 13:35:48 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90F2DAD3C
        for <linux-media@vger.kernel.org>; Thu,  6 Apr 2023 10:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680802523; x=1712338523;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=2rL9BfUmlbbok1IVImawe/ac+9yJXwM36pEWrWFe7Xg=;
  b=J9EhP+F6XcWBqpxkSijtQCEela0AuUms4ORtBjrIncuntvzbuCWOqmKX
   X4jJ8AFfyeQKCgysVe28sCoexeVidGX7Y+uNPipJzGv7z9PWErJWf6Ve6
   SGsTs4W0ssNlCoU7SFLQxUhq5mwWY672IRv11W8UPrzoR7v++lggOPYoc
   tMWjEDX5BhH3MBx/5VG8jTM5x1gFny0Df5Kk+xYW32oKrpHNNEWlHEoBs
   s+w0KbWme7Kp8ZpC2cWt2by2kYX6mFD3pvyUOOkr8ThITfI4G4A96z4+R
   YBIrn2gN+TCmQnCG478Y00H3myjo6vgoA83EfPis0YwyUmCHBT87HXa34
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="370629608"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; 
   d="scan'208";a="370629608"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2023 10:34:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="664558661"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; 
   d="scan'208";a="664558661"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2023 10:34:31 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id AA505121387
        for <linux-media@vger.kernel.org>; Thu,  6 Apr 2023 20:34:29 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH 0/4] CCS fixes and improvements
Date:   Thu,  6 Apr 2023 20:34:24 +0300
Message-Id: <20230406173428.19855-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi folks,

This set adds support for reading the 16-bit sensor revision register as
well as designates CCS static data file names for SMIA++ and SMIA
compliant devices. The latter can be considered as a fix as the driver was
attempting to read CCS static data file names for non-CCS sensors with CCS
identification information (which obviously was incorrect).

Sakari Ailus (4):
  media: ccs: Support 16-bit sensor revision number register
  media: ccs: Apply module manufacturer hack on non-CCS devices only
  media: ccs: Differentiate SMIA and MIPI vendors in static data
  media: ccs: Document CCS static data file names

 .../driver-api/media/drivers/ccs/ccs.rst      |  22 ++++
 drivers/media/i2c/ccs/ccs-core.c              | 104 ++++++++++++------
 2 files changed, 93 insertions(+), 33 deletions(-)

-- 
2.30.2

