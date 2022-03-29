Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 42F454EB53A
	for <lists+linux-media@lfdr.de>; Tue, 29 Mar 2022 23:26:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233896AbiC2V2O (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 29 Mar 2022 17:28:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233672AbiC2V2M (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 29 Mar 2022 17:28:12 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8175C2274EA;
        Tue, 29 Mar 2022 14:26:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1648589189; x=1680125189;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=1nTr1v4Do1P2RLZHJZeCp8fDJehSpp0OfwYo4ibfl1Y=;
  b=hbukqxqhzqfD+Ig+ESmH6iWSCeV+9Smn7LeWrnD7GOk2BWdQF67dE1u+
   vH/WqPxtWJA0LpSiZAZeHD4BoEZMbo27hjRHGIBk4bmDUw2cvNTghUW9m
   MPzw2PKXqJqePU7ylBe9vneJi4iyUBw1vlk1GV90veFaZkRgLzjcV6f8g
   MzY3CqrDhEMUX2s6HqCGLfFvCQh6fDxfNzpinIzxIwmCbONJHugd4xEOK
   qMb/+Z2gbxYthyE8ibi5YFQjfi4iUMb9MXOIj+cVSpPt136P9Cb0Ef5Nn
   48jbll+7UiteQ6NgDur8WWm8b5uU+z15EdfJZENSs8ofK4GC2kVW9DJ81
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10301"; a="246874625"
X-IronPort-AV: E=Sophos;i="5.90,220,1643702400"; 
   d="scan'208";a="246874625"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2022 14:26:28 -0700
X-IronPort-AV: E=Sophos;i="5.90,220,1643702400"; 
   d="scan'208";a="503061594"
Received: from punajuuri.fi.intel.com (HELO paasikivi.fi.intel.com) ([10.237.72.43])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2022 14:26:26 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by paasikivi.fi.intel.com (Postfix) with ESMTP id A913E203C9;
        Wed, 30 Mar 2022 00:26:24 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.94.2)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1nZJMd-002Spq-47; Wed, 30 Mar 2022 00:26:55 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     devicetree@vger.kernel.org, robh@kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v2 0/2] dw9807 binding and driver compatible changes
Date:   Wed, 30 Mar 2022 00:26:52 +0300
Message-Id: <20220329212654.587451-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello everyone,

These two patches convert dw9807 bindings to json-schema and add a new
compatible string to the dw9807-vcm driver in order to support existing
ACPI firmware.

since v1:

- Use stronger language in a comment related to a compatible string for
  old firmware.

- Remove extra newlines and quotes from bindings.

Sakari Ailus (2):
  dw9807-vcm: Add "dongwoon,dw9807" compatible string
  dt-bindings: Convert Dongwoon dw9807-vcm bindings to json-schema

 .../media/i2c/dongwoon,dw9807-vcm.txt         |  9 ----
 .../media/i2c/dongwoon,dw9807-vcm.yaml        | 43 +++++++++++++++++++
 drivers/media/i2c/dw9807-vcm.c                |  2 +
 3 files changed, 45 insertions(+), 9 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/media/i2c/dongwoon,dw9807-vcm.txt
 create mode 100644 Documentation/devicetree/bindings/media/i2c/dongwoon,dw9807-vcm.yaml

-- 
2.30.2

