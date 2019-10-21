Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 952DFDE53F
	for <lists+linux-media@lfdr.de>; Mon, 21 Oct 2019 09:24:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727498AbfJUHYL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Oct 2019 03:24:11 -0400
Received: from retiisi.org.uk ([95.216.213.190]:56962 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727047AbfJUHYL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Oct 2019 03:24:11 -0400
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTPS id BA814634C89
        for <linux-media@vger.kernel.org>; Mon, 21 Oct 2019 10:24:00 +0300 (EEST)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1iMS2p-0000QT-Oh
        for linux-media@vger.kernel.org; Mon, 21 Oct 2019 10:23:59 +0300
Date:   Mon, 21 Oct 2019 10:23:59 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL for 5.5] SMIA patches for 5.5
Message-ID: <20191021072359.GC864@valkosipuli.retiisi.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

Here's a set of cleanups, fixes and other improvements for the smiapp
driver.

Please pull.


The following changes since commit 4b1d7c2760d26363c497b959a81f8d055ba767c1:

  media: staging: media: Make use of devm_platform_ioremap_resource (2019-10-16 16:35:15 -0300)

are available in the Git repository at:

  git://linuxtv.org/sailus/media_tree.git tags/smia-5.5-signed

for you to fetch changes up to b87bb57778caa276f332e1fa4fc1e03345143e88:

  smiapp: Rename update_mode as pll_blanking_update (2019-10-21 10:17:38 +0300)

----------------------------------------------------------------
SMIA patches for 5.5

----------------------------------------------------------------
Sakari Ailus (14):
      smiapp: Use the BIT macro where appropriate, remove useless definition
      smiapp: Fix error handling at NVM reading
      smiapp: Refactor reading NVM page
      smiapp: Add definitions for data transfer if capability bits
      smiapp: Don't poll for NVM ready on devices that don't need it
      smiapp: Support probing NVM size
      dt-bindings: smia: Remove documentation of nokia,nvm-size
      smiapp: Destroy sensor's mutex
      smiapp: Don't get binning limits dynamically
      smiapp: Move binning configuration to streaming start
      smiapp: Don't update sensor configuration during power-on init
      smiapp: Use non-binned and binned limits correctly
      smiapp: Register sensor after enabling runtime PM on the device
      smiapp: Rename update_mode as pll_blanking_update

 .../devicetree/bindings/media/i2c/nokia,smia.txt   |   2 -
 drivers/media/i2c/smiapp/smiapp-core.c             | 326 +++++++++------------
 drivers/media/i2c/smiapp/smiapp-reg.h              |  36 ++-
 drivers/media/i2c/smiapp/smiapp.h                  |   3 -
 include/media/i2c/smiapp.h                         |   1 -
 5 files changed, 165 insertions(+), 203 deletions(-)

-- 
Sakari Ailus
