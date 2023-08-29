Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DF11078BDCD
	for <lists+linux-media@lfdr.de>; Tue, 29 Aug 2023 07:32:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235619AbjH2FY4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 29 Aug 2023 01:24:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235727AbjH2FYh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 29 Aug 2023 01:24:37 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C8D619A
        for <linux-media@vger.kernel.org>; Mon, 28 Aug 2023 22:24:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693286675; x=1724822675;
  h=from:to:cc:subject:date:message-id;
  bh=ZhIomhZ04fOaJX+TOWycQN8ZiSw5hTnfafiJlngXBew=;
  b=OaX4neciH0zaRjnY2lqTBuqXSHaIi7ZIvo00+LoMj8JNpcOs1ezQuYNz
   tN1ZkgGHyqHyoj1VeqCAtC5Ph1g1/zqhZP+0k0C2jIv8GAUXq6cZAiwQ/
   PJXdHMdVbtU5syaJVGvE7nLW/DVN3/RPuZrbdC3g+YCDlvA5VR92o7cJv
   MVKJZbt8xHK9SAZOYM/cRfFInmurfL+UCXKiBkxgWZL2BpVWJcZ8GnI1+
   EX56uQ78CGZF8BeRByqXcnA6z3CGywcY0Y2S69fDSX3g1vmnd+Y5Ok1MN
   QyjvyPpYEb4wPLb51qXoe+Bh9Wgn+uympN5t3eXbSCHwfmWJC2Uxuc4C3
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="354792601"
X-IronPort-AV: E=Sophos;i="6.02,208,1688454000"; 
   d="scan'208";a="354792601"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2023 22:24:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="688370881"
X-IronPort-AV: E=Sophos;i="6.02,208,1688454000"; 
   d="scan'208";a="688370881"
Received: from shsensorbuild2.sh.intel.com ([10.239.134.197])
  by orsmga003.jf.intel.com with ESMTP; 28 Aug 2023 22:24:31 -0700
From:   Wentong Wu <wentong.wu@intel.com>
To:     sakari.ailus@linux.intel.com, linux-media@vger.kernel.org
Cc:     zhifeng.wang@intel.com, Wentong Wu <wentong.wu@intel.com>
Subject: [PATCH v4 0/3] load ivsc driver modules automatically
Date:   Tue, 29 Aug 2023 13:24:25 +0800
Message-Id: <1693286668-13055-1-git-send-email-wentong.wu@intel.com>
X-Mailer: git-send-email 2.7.4
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The modalias of ivsc mei devices are built based only on its own
UUID. But with additional name identifier, the driver module alias
can't match with ivsc devices' modalias, so remove name identifier
to help depmod loading ivsc driver modules automatically.
At the same time, this patch makes sure IPU bridge is initialized
before probing ace device to fix probe order problem founded after
automatically loading ivsc driver modules is enabled.

---
v4:
 - add cover letter

v3:
 - make commit message more clear

Wentong Wu (3):
  media: ivsc: csi: remove name identifier
  media: ivsc: ace: remove name identifier
  media: ivsc: ace: probe ace device after IPU bridge is initialized.

 drivers/media/pci/intel/ivsc/mei_ace.c | 9 +++++----
 drivers/media/pci/intel/ivsc/mei_csi.c | 5 ++---
 2 files changed, 7 insertions(+), 7 deletions(-)

-- 
2.7.4

