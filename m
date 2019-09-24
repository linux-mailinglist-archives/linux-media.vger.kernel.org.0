Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E4C56BC6A7
	for <lists+linux-media@lfdr.de>; Tue, 24 Sep 2019 13:23:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2504679AbfIXLXh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Sep 2019 07:23:37 -0400
Received: from mga03.intel.com ([134.134.136.65]:20229 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2504665AbfIXLXh (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Sep 2019 07:23:37 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 24 Sep 2019 04:23:36 -0700
X-IronPort-AV: E=Sophos;i="5.64,543,1559545200"; 
   d="scan'208";a="182884359"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 24 Sep 2019 04:23:35 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by paasikivi.fi.intel.com (Postfix) with ESMTP id E7BC9202F9;
        Tue, 24 Sep 2019 14:23:03 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1iCiuw-00075E-79; Tue, 24 Sep 2019 14:23:38 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     devicetree@vger.kernel.org
Subject: [PATCH 0/7] SMIA NVM handling improvements
Date:   Tue, 24 Sep 2019 14:23:31 +0300
Message-Id: <20190924112338.27180-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi all,

This set removes the need for the nokia,nvm-size property, and contains
small fixes and improvements as well.

Sakari Ailus (7):
  smiapp: Use the BIT macro where appropriate, remove useless definition
  smiapp: Fix error handling at NVM reading
  smiapp: Refactor reading NVM page
  smiapp: Add definitions for data transfer if capability bits
  smiapp: Don't poll for NVM ready on devices that don't need it
  smiapp: Support probing NVM size
  dt-bindings: smia: Remove documentation of nokia,nvm-size

 .../bindings/media/i2c/nokia,smia.txt         |   2 -
 drivers/media/i2c/smiapp/smiapp-core.c        | 164 ++++++++++--------
 drivers/media/i2c/smiapp/smiapp-reg.h         |  36 ++--
 drivers/media/i2c/smiapp/smiapp.h             |   3 -
 include/media/i2c/smiapp.h                    |   1 -
 5 files changed, 108 insertions(+), 98 deletions(-)

-- 
2.20.1

