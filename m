Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2769D743A90
	for <lists+linux-media@lfdr.de>; Fri, 30 Jun 2023 13:13:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232897AbjF3LNz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Jun 2023 07:13:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232930AbjF3LNo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Jun 2023 07:13:44 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1482F5
        for <linux-media@vger.kernel.org>; Fri, 30 Jun 2023 04:13:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688123606; x=1719659606;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=yrZdsfD+3i5RORdLzVYieZYeMppJ/BkS9ybYxIKCa3o=;
  b=Tfdfhr82mETWa9IouuIqy6bMxERwmaSiC64IzjPBtDJG03TkRFnJmd/6
   9dTukLz44+99X728h3jftLm8y+Nt/JlkrxHqmPoz5v/z9cO++QAgXqxN0
   dOkfDX/cU3MHLckaJe39LzlGfoJWx1GhC0hvVlfFo0shkJAqlZNbKO5EG
   Oe+ra2X311lfLPiE2EvN0/DbT23rjErahnrO7komaPJjGu9tMMT8a3Fe6
   AwTvqXNfuablapnbJUl9hkUXHkRMksfcEdkziXne6in1xPXw90EHK5dC/
   ln69g/GmlKr57+GaouZGbeLV9FR7isLEYu/DhjjDHlQFoX20BSTSPXbUd
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="448748055"
X-IronPort-AV: E=Sophos;i="6.01,170,1684825200"; 
   d="scan'208";a="448748055"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2023 04:13:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="891727909"
X-IronPort-AV: E=Sophos;i="6.01,170,1684825200"; 
   d="scan'208";a="891727909"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2023 04:13:25 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id ECEC811FB8E;
        Fri, 30 Jun 2023 14:03:04 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     mchehab@kernel.org
Subject: [PATCH 0/2] More MAINTAINERS entries
Date:   Fri, 30 Jun 2023 14:03:02 +0300
Message-Id: <20230630110304.98942-1-sakari.ailus@linux.intel.com>
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

Hi folks,

These two patches add two more maintainers entries in anticipation of more
contributors with commit access.

Mauro: would you prefer to be added to the MC entry? You're already listed
as the subsystem maintainer so you'll be included that way in any case.

Sakari Ailus (2):
  media: MAINTAINERS: Add entry for V4L2 async and fwnode frameworks
  media: MAINTAINERS: Add documentation under V4L2 camera sensors

 MAINTAINERS | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

-- 
2.39.2


