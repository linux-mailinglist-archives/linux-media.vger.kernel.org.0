Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DB953766C00
	for <lists+linux-media@lfdr.de>; Fri, 28 Jul 2023 13:46:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236296AbjG1Lq5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 Jul 2023 07:46:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234466AbjG1Lqy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Jul 2023 07:46:54 -0400
Received: from mgamail.intel.com (unknown [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2A283AB4
        for <linux-media@vger.kernel.org>; Fri, 28 Jul 2023 04:46:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690544813; x=1722080813;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=qqaSz5CNWHYq0dyqEDupiVxJHO3IJvreVIBCD1o1iKg=;
  b=VTmN6+L40tqEnccfyaVGgmWF/AceMhPGF79QGCBoJixb14A7VBIPvv8p
   Y/lRdS4Dm6m0a7ADGRyOV/N0sDDHVkNQbWs4Ynw0vjiqT5Z4Y6Ky+8QZ6
   FMccIaHD2XxC00BwUrApmGTgsRh9rotcRe5riGQxXL5aiGhaItwF1qLKH
   i6IiGQcxr0C1mBlAvsfc2WXdMLvjs1yoJ7vL+S7cGQfatTNULGCtlIJS3
   aZetLdc07HqP4r+pvhLVLnUeuY6zxfdYaKEZKV4IbOP3KzPGKc7aEi4tf
   U5iE8LD0w1oingnOBYTD0rNo3ZpSqGpaV4X1iZVfA+C1b9vlrypSxR5N/
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="434858359"
X-IronPort-AV: E=Sophos;i="6.01,237,1684825200"; 
   d="scan'208";a="434858359"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2023 04:46:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="730713007"
X-IronPort-AV: E=Sophos;i="6.01,237,1684825200"; 
   d="scan'208";a="730713007"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2023 04:46:51 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 9AB4611FAE0;
        Fri, 28 Jul 2023 14:46:48 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1qPLuX-004yNq-1t;
        Fri, 28 Jul 2023 14:45:33 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     mchehab@kernel.org
Subject: [PATCH v3 0/2] More MAINTAINERS entries
Date:   Fri, 28 Jul 2023 14:45:21 +0300
Message-Id: <20230728114523.1185414-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
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

since v2:

- Fix misordered file entry

since v1:

- Split the lens drivers off the sensor section, reword commit message.

Sakari Ailus (2):
  media: MAINTAINERS: Add entry for V4L2 async and fwnode frameworks
  media: MAINTAINERS: Split sensors and lens drivers, add documentation

 MAINTAINERS | 25 +++++++++++++++++++++----
 1 file changed, 21 insertions(+), 4 deletions(-)

-- 
2.39.2

