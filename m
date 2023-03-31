Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DD4B26D1C6B
	for <lists+linux-media@lfdr.de>; Fri, 31 Mar 2023 11:32:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230505AbjCaJcj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 31 Mar 2023 05:32:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232131AbjCaJc0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 31 Mar 2023 05:32:26 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A09621A457;
        Fri, 31 Mar 2023 02:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680255126; x=1711791126;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ldv0PlEDUj+2ShgJopWl7OSEHST+AWdP/3Hb4eiTCEo=;
  b=D8RI23fo+QQNdNXI07gzqqevkau/zSNGyIxBCftPkRNCH2ya8haHv4jW
   QqCdCkE2P8C0iyBUmYhoBTekdeSLioWMLAu4OD9N524t76ZnrViJQStQU
   KKOznVvFIdlKFLyUyHpDAvsSez0wp8Q/feMvQ9zFoFa2+lStuprqtcq4D
   0K3afx2hMzC/8anKeBKD02a4rVYLXkbzohxs0hEbgzKABADOmkSCO4UXn
   ceUTt5YUUorXt3ZjE6HvkkjPYb9DLu88q9PWIPLGgKIrOCzRNV+jvjAtR
   cgWIYX7AlySgjRqBQEqjt3Qn3E2aJrQOXZRxuQr5dprKXgzK2PHcyoc7w
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="340132660"
X-IronPort-AV: E=Sophos;i="5.98,307,1673942400"; 
   d="scan'208";a="340132660"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2023 02:31:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="635228629"
X-IronPort-AV: E=Sophos;i="5.98,307,1673942400"; 
   d="scan'208";a="635228629"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2023 02:31:23 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id B0D6F1218A2;
        Fri, 31 Mar 2023 12:31:20 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.94.2)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1piB5D-00DjN2-Er; Fri, 31 Mar 2023 12:30:07 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     devicetree@vger.kernel.org
Subject: [PATCH 0/2] Take maintainership of ov8856
Date:   Fri, 31 Mar 2023 12:29:55 +0300
Message-Id: <20230331092957.3272621-1-sakari.ailus@linux.intel.com>
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

Dongchun's e-mail address no long responds:

The following message to <dongchun.zhu@mediatek.com> was undeliverable.         
The reason for the problem:                                                     
5.1.0 - Unknown address error 550-'Relaying mail to dongchun.zhu@mediatek.com is not allowed'                                                                    

The driver was originally written by an Intel developer(s) (who later
disappeared), in the meantime DT bindings and DT support for the driver
were added by Dongchun.

Sakari Ailus (2):
  MAINTAINERS: Assume ov8856 driver maintainership
  media: dt-bindings: ov8856: Assign maintainership to myself

 Documentation/devicetree/bindings/media/i2c/ov8856.yaml | 2 +-
 MAINTAINERS                                             | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
2.30.2

