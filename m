Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CB0DC7A6105
	for <lists+linux-media@lfdr.de>; Tue, 19 Sep 2023 13:17:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231522AbjISLR2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 Sep 2023 07:17:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229497AbjISLR1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 Sep 2023 07:17:27 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0705DA9
        for <linux-media@vger.kernel.org>; Tue, 19 Sep 2023 04:17:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695122242; x=1726658242;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=VKXhmJ10IepMpDGpEVyfgy/1/d1r8ZLFWovDs+MdkDA=;
  b=QsZQpaeIpCHEg9kAuFMyrJJQiQPCUEVBnIU4WxsWGgWOsbrtwoGr2Yov
   DVSUvFoSC9Vy9k4nl6wRL36rnM+d2ZDFeWwCVB4TvaXKBFHb/fuUnlTdv
   KVDGZeHMjuZapRn8j3Ajy1gaKDyqDZk+oJqn8HAKGC8U8GUopL07XAF5w
   C0EMNnRTVuyLrfkw1jSKd4kNv+8HelH7g/u5iNklL8diFYVMkoXh4o1df
   ls8L5dzuGsyo/pa1M3+LmoZpo5oPdBmdqYEgejlWbTM/DU/3wqqMjO4Vc
   0Jux5uwOGioXAdN0RFfkfJzXapnAT7vE9x01UkpQy0vLlUxmu0nisO92Z
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="383736947"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; 
   d="scan'208";a="383736947"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2023 04:17:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="781273096"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; 
   d="scan'208";a="781273096"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2023 04:17:20 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 68485120BE5;
        Tue, 19 Sep 2023 14:17:17 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1qiYhq-009pyz-1z;
        Tue, 19 Sep 2023 14:15:50 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     "Alessandrelli, Daniele" <daniele.alessandrelli@intel.com>,
        "Murphy, Paul J" <paul.j.murphy@intel.com>
Subject: [PATCH 0/4] Orphan sensor drivers
Date:   Tue, 19 Sep 2023 14:15:36 +0300
Message-Id: <20230919111540.2344757-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi folks,

This set marks four drivers as orphan.

Sakari Ailus (4):
  media: ov9282: Orphan the driver
  media: imx412: Orphan the driver
  media: imx335: Orphan the driver
  media: imx335: Orphan the driver

 MAINTAINERS | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

-- 
2.39.2

