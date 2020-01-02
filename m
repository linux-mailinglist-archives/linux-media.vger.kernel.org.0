Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EF9B412E6EB
	for <lists+linux-media@lfdr.de>; Thu,  2 Jan 2020 14:47:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728395AbgABNr7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Jan 2020 08:47:59 -0500
Received: from retiisi.org.uk ([95.216.213.190]:56656 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728378AbgABNr7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 2 Jan 2020 08:47:59 -0500
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTPS id 09A3E634C86;
        Thu,  2 Jan 2020 15:46:58 +0200 (EET)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1in0oU-0001sr-AW; Thu, 02 Jan 2020 15:46:58 +0200
Date:   Thu, 2 Jan 2020 15:46:58 +0200
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com
Subject: [GIT PULL for 5.6] Smiapp PM patches and omap3isp fixes
Message-ID: <20200102134658.GH5050@valkosipuli.retiisi.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

Here's a few fixes for omap3isp plus cleanups for the smiapp driver.

Please pull.


The following changes since commit 0885acd77eb4644fd88f6d9f41e433f4ee9bc37a:

  media: vivid: support multiplanar touch devices (2019-12-16 13:24:16 +0100)

are available in the Git repository at:

  git://linuxtv.org/sailus/media_tree.git tags/smiapp-pm-5.6-1-signed

for you to fetch changes up to 5836ef92ac0205bfb6d354b39aabf2fab54f6666:

  smiapp: Put the device again if starting streaming fails (2020-01-02 14:59:35 +0200)

----------------------------------------------------------------
smiapp patches for 5.6

----------------------------------------------------------------
Sakari Ailus (4):
      omap3isp: Ignore failure of stopping streaming on external subdev
      omap3isp: Don't restart CCDC if we're about to stop
      smiapp: Avoid maintaining power state information
      smiapp: Put the device again if starting streaming fails

 drivers/media/i2c/smiapp/smiapp-core.c    | 198 +++++++++++++++++-------------
 drivers/media/i2c/smiapp/smiapp-regs.c    |   3 -
 drivers/media/i2c/smiapp/smiapp.h         |   1 -
 drivers/media/platform/omap3isp/isp.c     |   8 +-
 drivers/media/platform/omap3isp/ispccdc.c |  12 +-
 5 files changed, 126 insertions(+), 96 deletions(-)

-- 
Sakari Ailus
