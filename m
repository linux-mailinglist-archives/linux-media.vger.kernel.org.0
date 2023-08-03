Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DACB276E777
	for <lists+linux-media@lfdr.de>; Thu,  3 Aug 2023 13:56:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234709AbjHCL4O (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Aug 2023 07:56:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235028AbjHCL4M (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Aug 2023 07:56:12 -0400
Received: from mgamail.intel.com (unknown [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52EE230C2
        for <linux-media@vger.kernel.org>; Thu,  3 Aug 2023 04:56:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691063770; x=1722599770;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=efLMIOPiMv+hlhDnrUVz2VPPkFQsvNpewSQjxo0n51A=;
  b=k/lM/6m8KgSJPrwOoyNx0gBvzxAREFBexIJ78aUPlqYpwaSjLzYAIMfR
   ogJ7btodMk3ZZcvillcKqRSfDK1MFa9kshL2l35sHLMWFYuradyJWzZCZ
   wRbbf2aKaJqJZdtP/VQm3GpYr6TitnJ61CdwnvHSz3uPUyUIa2F+/AY/p
   ayJxpOsUfOfwRGobWcuraJqTroes1aRVIerj76cYZBXIqoSxpVz0rS/b4
   I4r6Vu/rdDIw8Bxh1+mZOZuoaa/zqigOd/RYL5eM4McxFxcvRFLbMeXTy
   pBvgGZV336yOcumcwZzXNWRvViHvK8QzhsgeLsd56dX1dClLkyiO3av0p
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="369845867"
X-IronPort-AV: E=Sophos;i="6.01,252,1684825200"; 
   d="scan'208";a="369845867"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2023 04:56:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="799528479"
X-IronPort-AV: E=Sophos;i="6.01,252,1684825200"; 
   d="scan'208";a="799528479"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2023 04:56:06 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 2B2C3120AB8;
        Thu,  3 Aug 2023 14:56:04 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1qRWvw-006ikP-0g;
        Thu, 03 Aug 2023 14:56:00 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Wentong Wu <wentong.wu@intel.com>, hdegoede@redhat.com,
        djrscally@gmail.com, laurent.pinchart@ideasonboard.com,
        linux-media@vger.kernel.org
Cc:     bingbu.cao@linux.intel.com, zhifeng.wang@intel.com,
        xiang.ye@intel.com, tian.shu.qiu@intel.com
Subject: [PATCH v11 0/2] media: pci: intel: ivsc: Add driver of Intel Visual     Sensing Controller(IVSC)
Date:   Thu,  3 Aug 2023 14:55:48 +0300
Message-Id: <20230803115550.1601965-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi folks,

Here's just a small update to Wentong's MEI ACE+CSI patches.

v10 is here
<URL:https://lore.kernel.org/linux-media/1690631575-15124-1-git-send-email-wentong.wu@intel.com/>.

since v10:

- Update V4L2 async API usage.

- Fix owner configuration for MEI ACE --- wrong enum was being used, thus
  ownership was always assigned to the host.

Wentong Wu (2):
  media: pci: intel: ivsc: Add CSI submodule
  media: pci: intel: ivsc: Add ACE submodule

 drivers/media/pci/intel/Kconfig        |   1 +
 drivers/media/pci/intel/Makefile       |   1 +
 drivers/media/pci/intel/ivsc/Kconfig   |  12 +
 drivers/media/pci/intel/ivsc/Makefile  |   9 +
 drivers/media/pci/intel/ivsc/mei_ace.c | 579 +++++++++++++++++
 drivers/media/pci/intel/ivsc/mei_csi.c | 825 +++++++++++++++++++++++++
 6 files changed, 1427 insertions(+)
 create mode 100644 drivers/media/pci/intel/ivsc/Kconfig
 create mode 100644 drivers/media/pci/intel/ivsc/Makefile
 create mode 100644 drivers/media/pci/intel/ivsc/mei_ace.c
 create mode 100644 drivers/media/pci/intel/ivsc/mei_csi.c

-- 
2.39.2

