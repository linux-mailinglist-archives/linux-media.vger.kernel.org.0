Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AA00B756CB3
	for <lists+linux-media@lfdr.de>; Mon, 17 Jul 2023 21:04:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230355AbjGQTEX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Jul 2023 15:04:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229722AbjGQTEW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Jul 2023 15:04:22 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42878138
        for <linux-media@vger.kernel.org>; Mon, 17 Jul 2023 12:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689620661; x=1721156661;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=u9RKG0GXdBZqVICUXK6KfGDE+LKA9wRyEgmL7LWhpZk=;
  b=lGmAeQCJVDiYITx7j/GWjYxzMtUU9EPn9Fp0E1OOBBDib1XVkzR8MbU6
   fxA+hEYF0Ko21Gyxz6iMZ8p7Lwi9h7YwrEWwmCSyVeR2Nk835RT8gNpi8
   jw0cpX0Xz647zLLb+nBBDkKBXEavUOXdNfVFm2r6HUtfhLTQSFCQFQNAy
   DzDjDnnYOPF1ujdUCBauaGtuWra7Us/V3gg0oNt/Hhp0BJtrSyYNvtL2G
   UfjGEnWUxCbMlfkZvf2doErWaDAMkwafrTx5SCjTbR1op5jN4aUmBF8kf
   0RH1Eof5/HmXEW1kyyE6yhebmA1JgYlAm3VHK9+X0ySMcm3kkrWw0jAIF
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="369567824"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; 
   d="scan'208";a="369567824"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2023 12:04:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="673641218"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; 
   d="scan'208";a="673641218"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2023 12:04:17 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 03F0011F910;
        Mon, 17 Jul 2023 22:04:15 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1qLTV8-004sCm-2B;
        Mon, 17 Jul 2023 22:03:18 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     mchehab@kernel.org
Subject: [PATCH v2 0/2] More MAINTAINERS entries
Date:   Mon, 17 Jul 2023 22:03:06 +0300
Message-Id: <20230717190308.1161664-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi folks,                                                                       

These two patches add two more maintainers entries in anticipation of more
contributors with commit access.

Mauro: would you prefer to be added to the MC entry? You're already listed
as the subsystem maintainer so you'll be included that way in any case.

since v1:

- Split the lens drivers off the sensor section, reword commit message.

Sakari Ailus (2):
  media: MAINTAINERS: Add entry for V4L2 async and fwnode frameworks
  media: MAINTAINERS: Split sensors and lens drivers, add documentation

 MAINTAINERS | 25 +++++++++++++++++++++----
 1 file changed, 21 insertions(+), 4 deletions(-)

-- 
2.39.2

