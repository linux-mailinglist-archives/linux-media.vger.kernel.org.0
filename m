Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 19CC3743CF7
	for <lists+linux-media@lfdr.de>; Fri, 30 Jun 2023 15:45:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232002AbjF3Npp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Jun 2023 09:45:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231950AbjF3Npn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Jun 2023 09:45:43 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5EECA423A
        for <linux-media@vger.kernel.org>; Fri, 30 Jun 2023 06:45:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688132715; x=1719668715;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=uUb0T+K1nSzdcn2FdDy30ArkdEwpoIVH8BZNFqscGXM=;
  b=S95e5kejGuFoMSxO3YfokigKRS1PYgytwawrPJZ2b9R4UNhbG3S/WoY2
   x4Mc4qq//SDaZN28swCyUG9hwclLX0P698SpFKke6eCxTqH6bRwEcpvMS
   9zMgFA6Mou7xWdvUopp+DB5sFPWWhTa/3reZEUHjSEvqdo/VBXrBiuydX
   kvFD1WLR3S4kwEcW0Be+a5OCOEie/Fik5L3W8ZUdtbspeN+kI4f6HFhLo
   6ny29ag+nKyxW9j2kW2yPLCT5dNtB64X5NhdRx5D6L8d23Rm0xSXyD5DT
   80EdoraGZQUreKnkUjvKjMfGGizBEgjwXUHLcog8+aXLlkixgYFWB5J6e
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="362438550"
X-IronPort-AV: E=Sophos;i="6.01,170,1684825200"; 
   d="scan'208";a="362438550"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2023 06:45:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="783083685"
X-IronPort-AV: E=Sophos;i="6.01,170,1684825200"; 
   d="scan'208";a="783083685"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2023 06:45:11 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 0F9E81203D3;
        Fri, 30 Jun 2023 16:45:06 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     Wentong Wu <wentong.wu@intel.com>, bingbu.cao@linux.intel.com,
        andriy.shevchenko@intel.com, zhifeng.wang@intel.com,
        xiang.ye@intel.com, tian.shu.qiu@intel.com,
        Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH v2 0/2] IVSC support for IPU bridge
Date:   Fri, 30 Jun 2023 16:45:04 +0300
Message-Id: <20230630134506.109269-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

I rebased the IVSC support patch on Hans de Goede's IPU bridge fixes and
cleanups. I've tested it on MS Surface Go 2. I also added a patch to move
the pre-existing exported symbol to the same namespace than the rest.

Sakari Ailus (1):
  media: ipu-bridge: Make exported IPU bridge symbol GPL-only in a NS

Wentong Wu (1):
  media: ipu-bridge: add IVSC support

 drivers/media/pci/intel/ipu-bridge.c | 197 ++++++++++++++++++++++++++-
 include/media/ipu-bridge.h           |  19 ++-
 2 files changed, 208 insertions(+), 8 deletions(-)

-- 
2.39.2

