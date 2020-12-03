Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5BB6D2CDA19
	for <lists+linux-media@lfdr.de>; Thu,  3 Dec 2020 16:26:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728459AbgLCP0T (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Dec 2020 10:26:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726751AbgLCP0R (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Dec 2020 10:26:17 -0500
Received: from hillosipuli.retiisi.eu (unknown [IPv6:2a01:4f9:c010:4572::e8:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CA57C061A4E
        for <linux-media@vger.kernel.org>; Thu,  3 Dec 2020 07:25:37 -0800 (PST)
Received: from valkosipuli.localdomain (unknown [IPv6:fd35:1bc8:1a6:d3d5::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 5CD25634C24
        for <linux-media@vger.kernel.org>; Thu,  3 Dec 2020 17:24:21 +0200 (EET)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1kkqSz-0003Ej-Pi
        for linux-media@vger.kernel.org; Thu, 03 Dec 2020 17:24:21 +0200
Date:   Thu, 3 Dec 2020 17:24:21 +0200
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL for 5.11] CCS PLL feature support improvements
Message-ID: <20201203152421.GF4351@valkosipuli.retiisi.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

This set adds support for additional CCS PLL features which effectively
allows supporting modern devices from mid-range and up.

I have one more set to post to the list, but I guess that may need to wait
for 5.12. Also, feel free to postpone this until 5.12 if needed.

Please pull.


The following changes since commit 63288c829b1a5991d8f8c15cab596108ed206ba6:

  media: pixfmt-compressed.rst: fix 'bullet' formatting (2020-12-03 12:27:34 +0100)

are available in the Git repository at:

  git://linuxtv.org/sailus/media_tree.git tags/ccs-v4-pll-cphy-2-signed

for you to fetch changes up to 13c167095b90f5260774a59798e1c7c05d0d82d7:

  ccs: Add support for obtaining C-PHY configuration from firmware (2020-12-03 15:54:50 +0200)

----------------------------------------------------------------
CCS PLL feature support improvements

----------------------------------------------------------------
Sakari Ailus (38):
      ccs-pll: Don't use div_u64 to divide a 32-bit number
      ccs-pll: Split limits and PLL configuration into front and back parts
      ccs-pll: Use correct VT divisor for calculating VT SYS divisor
      ccs-pll: End search if there are no better values available
      ccs-pll: Remove parallel bus support
      ccs-pll: Differentiate between CSI-2 D-PHY and C-PHY
      ccs-pll: Move the flags field down, away from 8-bit fields
      ccs-pll: Document the structs in the header as well as the function
      ccs-pll: Use the BIT macro
      ccs-pll: Begin calculation from OP system clock frequency
      ccs-pll: Fix condition for pre-PLL divider lower bound
      ccs-pll: Avoid overflow in pre-PLL divisor lower bound search
      ccs-pll: Fix comment on check against maximum PLL multiplier
      ccs-pll: Fix check for PLL multiplier upper bound
      ccs-pll: Use explicit 32-bit unsigned type
      ccs-pll: Add support for lane speed model
      ccs: Add support for lane speed model
      ccs-pll: Add support for decoupled OP domain calculation
      ccs-pll: Add support for extended input PLL clock divider
      ccs-pll: Support two cycles per pixel on OP domain
      ccs-pll: Add support flexible OP PLL pixel clock divider
      ccs-pll: Add sanity checks
      ccs-pll: Add C-PHY support
      ccs-pll: Split off VT subtree calculation
      ccs-pll: Check for derating and overrating, support non-derating sensors
      ccs-pll: Better separate OP and VT sub-tree calculation
      ccs-pll: Print relevant information on PLL tree
      ccs-pll: Rework bounds checks
      ccs-pll: Make VT divisors 16-bit
      ccs-pll: Fix VT post-PLL divisor calculation
      ccs-pll: Separate VT divisor limit calculation from the rest
      ccs-pll: Add trivial dual PLL support
      ccs: Dual PLL support
      ccs-pll: Add support for DDR OP system and pixel clocks
      ccs: Add support for DDR OP SYS and OP PIX clocks
      ccs: Print written register values
      ccs-pll: Print pixel rates
      ccs: Add support for obtaining C-PHY configuration from firmware

 drivers/media/i2c/ccs-pll.c            | 986 +++++++++++++++++++++++----------
 drivers/media/i2c/ccs-pll.h            | 177 ++++--
 drivers/media/i2c/ccs/ccs-core.c       | 161 ++++--
 drivers/media/i2c/ccs/ccs-quirk.c      |   5 +-
 drivers/media/i2c/ccs/ccs-reg-access.c |   4 +
 5 files changed, 974 insertions(+), 359 deletions(-)


-- 
Sakari Ailus
