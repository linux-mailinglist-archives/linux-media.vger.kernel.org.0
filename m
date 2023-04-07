Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E58C66DB186
	for <lists+linux-media@lfdr.de>; Fri,  7 Apr 2023 19:19:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230303AbjDGRTW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 7 Apr 2023 13:19:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230112AbjDGRTA (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 7 Apr 2023 13:19:00 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4655A198D
        for <linux-media@vger.kernel.org>; Fri,  7 Apr 2023 10:18:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680887939; x=1712423939;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=B4J/NLbvxo7vt9nxpuJmmqi9PO3TYUR/8VFCB8Z6wao=;
  b=iLqW7kTFRnwtHgq1KtcIhRPS851zMXC0/GLDv0WWsKhXexbypndPQtgp
   IvJhow6eeVOWz0YDEU0b0hiYPes4D47VL5og0cZoFVe+FVl+ddZxF8Ov7
   8SqlW67JaX+eTgz1wJSO2c6Ol+fFFVnzaCuk0VtjLSv7TXsCMJmDJLQ/s
   LvsIXAdxUIVbJJe7lnPpmEAMnICPAhS171SaZo/gnS5VkLbXcOFnJRaus
   T9I7ZWnt2OANmnOaigA+IJzdZ8eLZ9+2WsCt8vmo2nJfN5ln/IWeljb22
   WDxJmgCHUO6kFVTsRKh7ZKCanWhdaaDmWIRvXsnLirRdtSNG/WxIXu0eI
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10673"; a="341782434"
X-IronPort-AV: E=Sophos;i="5.98,327,1673942400"; 
   d="scan'208";a="341782434"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2023 10:18:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10673"; a="752103582"
X-IronPort-AV: E=Sophos;i="5.98,327,1673942400"; 
   d="scan'208";a="752103582"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2023 10:18:48 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 7C3031207D2
        for <linux-media@vger.kernel.org>; Fri,  7 Apr 2023 20:09:33 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH v2 0/4] CCS fixes and improvements
Date:   Fri,  7 Apr 2023 20:09:27 +0300
Message-Id: <20230407170931.30842-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
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

since v2:

- Wrap a few long lines in the 3rd patch.

Sakari Ailus (4):
  media: ccs: Support 16-bit sensor revision number register
  media: ccs: Apply module manufacturer hack on non-CCS devices only
  media: ccs: Differentiate SMIA and MIPI vendors in static data
  media: ccs: Document CCS static data file names

 .../driver-api/media/drivers/ccs/ccs.rst      |  22 ++++
 drivers/media/i2c/ccs/ccs-core.c              | 105 ++++++++++++------
 2 files changed, 94 insertions(+), 33 deletions(-)

-- 
2.30.2

