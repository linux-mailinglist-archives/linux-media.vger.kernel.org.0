Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3B0667498A6
	for <lists+linux-media@lfdr.de>; Thu,  6 Jul 2023 11:39:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229768AbjGFJjf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Jul 2023 05:39:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229556AbjGFJje (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 Jul 2023 05:39:34 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75643CE
        for <linux-media@vger.kernel.org>; Thu,  6 Jul 2023 02:39:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688636373; x=1720172373;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=aYNO0HJ8RKsLGD1VGuihrG14MY5yI0G+rFvZun7WhNw=;
  b=Bfc5SD3YqTg8qnSZjxs6Fw1C4fbga/EvMcbJNmnBMTIfkUXFRGOYCM/J
   q/MvtShO6FAjF6DAfFObdylwS+BVrAJHS7haAPBRTfkHdWac4ZoI3Gy8/
   zv1Eu1vAQqobn7dJHnKFmimp+hOyt7kz+z4tBaFrcWMrahciqx9QKDtHX
   2tSm0Mxpoe8ChZQw49Stb9QsUDBmfEkfMdgzBOZYPk8Wy/kLTFtpM9ZiW
   O/K9PO5jVf3TlbRydibUoZzb3dCJl2WfyqA5O5nGhoumPYcZL21qZydRC
   krMnLY4wxKkuKUhWFzgBMjYavRN5ecsEgScpF/UwAEwrw5epSiAqwpSGt
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10762"; a="353393395"
X-IronPort-AV: E=Sophos;i="6.01,185,1684825200"; 
   d="scan'208";a="353393395"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2023 02:39:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10762"; a="722741539"
X-IronPort-AV: E=Sophos;i="6.01,185,1684825200"; 
   d="scan'208";a="722741539"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2023 02:39:31 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 056E611F9ED;
        Thu,  6 Jul 2023 12:33:52 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v2 0/2] Move camera sensor dependencies to top level menu
Date:   Thu,  6 Jul 2023 12:33:50 +0300
Message-Id: <20230706093352.193513-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
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

since v1:

- Also include I2C dependency. Remove also VIDEO_DEV dependency which
  isn't needed by sensor drivers.

- Reworded commit messages to account for the changes.

Sakari Ailus (2):
  media: i2c: Add a camera sensor top level menu
  media: i2c: Remove common dependencies from sensor drivers

 drivers/media/i2c/Kconfig        | 236 +++----------------------------
 drivers/media/i2c/ccs/Kconfig    |   5 +-
 drivers/media/i2c/et8ek8/Kconfig |   4 -
 3 files changed, 20 insertions(+), 225 deletions(-)

-- 
2.39.2

