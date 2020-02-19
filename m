Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 22928164226
	for <lists+linux-media@lfdr.de>; Wed, 19 Feb 2020 11:30:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726469AbgBSKat (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 Feb 2020 05:30:49 -0500
Received: from retiisi.org.uk ([95.216.213.190]:33942 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726270AbgBSKat (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 Feb 2020 05:30:49 -0500
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTPS id AE662634C87
        for <linux-media@vger.kernel.org>; Wed, 19 Feb 2020 12:30:05 +0200 (EET)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1j4McI-0001Wq-8Q
        for linux-media@vger.kernel.org; Wed, 19 Feb 2020 12:30:06 +0200
Date:   Wed, 19 Feb 2020 12:30:06 +0200
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL for 5.7] Smiapp driver cleanups, omap3isp fix
Message-ID: <20200219103006.GD5023@valkosipuli.retiisi.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

Here's the usual set of cleanups for the smiapp driver. Also included is a
fix for CCDC block handling in the imap3isp driver that completes the
previous fix.

Please pull.


The following changes since commit bb6d3fb354c5ee8d6bde2d576eb7220ea09862b9:

  Linux 5.6-rc1 (2020-02-09 16:08:48 -0800)

are available in the Git repository at:

  git://linuxtv.org/sailus/media_tree.git tags/for-5.7-2-signed

for you to fetch changes up to 0bc49fb661a2024b7dea91697496a303e458a7af:

  smiapp: Move definitions under driver directory (2020-02-19 12:18:24 +0200)

----------------------------------------------------------------
Smiapp driver patches for 5.7

----------------------------------------------------------------
Sakari Ailus (7):
      omap3isp: Prevent enabling CCDC when stopping streaming
      smiapp: Simplify condition for choosing 8-bit access
      smiapp: Use unaligned get and put functions
      smiapp: Turn limit lookup into a function
      smiapp: Move SMIA limit reading up
      smiapp: Refactor reading SMIA limits
      smiapp: Move definitions under driver directory

 drivers/media/i2c/smiapp/smiapp-core.c    | 259 +++++++++++++++---------------
 drivers/media/i2c/smiapp/smiapp-reg.h     |   4 +
 drivers/media/i2c/smiapp/smiapp-regs.c    |  71 +++-----
 drivers/media/i2c/smiapp/smiapp.h         |  44 ++++-
 drivers/media/platform/omap3isp/ispccdc.c |   4 +
 include/media/i2c/smiapp.h                |  63 --------
 6 files changed, 200 insertions(+), 245 deletions(-)
 delete mode 100644 include/media/i2c/smiapp.h

-- 
Sakari Ailus
