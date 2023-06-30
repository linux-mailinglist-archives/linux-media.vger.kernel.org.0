Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F1251743D23
	for <lists+linux-media@lfdr.de>; Fri, 30 Jun 2023 16:04:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232402AbjF3OEL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Jun 2023 10:04:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230100AbjF3OEJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Jun 2023 10:04:09 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A8F73A99
        for <linux-media@vger.kernel.org>; Fri, 30 Jun 2023 07:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688133849; x=1719669849;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=yYN3YxkH0xWEXBE/Bd0wREpM2AvEfBSTU9IzSy+0Q9c=;
  b=IuyH3POefAtaHMvKmG30fJZG9AUglQiQGkNbeVn+MF3DpCE0DkXDdJ4A
   cjntnGU/h8SFNcvsPt9FFs6tgjjFdaDmWe7j8VzrHGwKDOStovMY9xu7h
   Uh1V5U2gnbb3afMF7d7G3Zh5XsTSDB+Hl9Bs+8R8Q9TXwnQUWoRzTT2no
   9JajoCrNgQpv4vH0+G4uxqd/itdiqlX2Aq/xt8wRBudl3BKzdBad27JK6
   rpnVitSTOhnVS0y72RrLSccXwJbNROvZubLXwZU5WUmOirrQ+2U9avpCl
   U3W7ZmPyOeQCu7FCrz2QXZTRK6koOnqkaT4SwtXDj5Xg7j023VlH64h5E
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10757"; a="352220850"
X-IronPort-AV: E=Sophos;i="6.01,171,1684825200"; 
   d="scan'208";a="352220850"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2023 07:04:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10757"; a="783086515"
X-IronPort-AV: E=Sophos;i="6.01,171,1684825200"; 
   d="scan'208";a="783086515"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2023 07:03:58 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id C4D1F1203D3;
        Fri, 30 Jun 2023 17:03:54 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH 0/2] Move camera sensor dependencies to top level menu
Date:   Fri, 30 Jun 2023 17:03:52 +0300
Message-Id: <20230630140354.111404-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

This set moves selecting the common sensor driver dependencies to the top
level menu and removes the options from individual driver entries. The
first patch is cc'd to stable from 6.1. It applies with some fuzz while
for 5.15 it applies with a fuzz but to a wrong place. I don't think we'll
need to care much about that version anyway, albeit I'll port one for
that, too, if there that gets reported. Any thouhgts?

Sakari Ailus (2):
  media: i2c: Select V4L2_FWNODE and VIDEO_V4L2_SUBDEV_API for sensors
  media: i2c: Stop selecting common features for individual camera
    drivers

 drivers/media/i2c/Kconfig        | 162 ++-----------------------------
 drivers/media/i2c/ccs/Kconfig    |   3 -
 drivers/media/i2c/et8ek8/Kconfig |   3 -
 3 files changed, 10 insertions(+), 158 deletions(-)

-- 
2.39.2

