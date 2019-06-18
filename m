Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7FBCF4A168
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2019 15:02:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726023AbfFRNCJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 Jun 2019 09:02:09 -0400
Received: from retiisi.org.uk ([95.216.213.190]:37546 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725913AbfFRNCJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 Jun 2019 09:02:09 -0400
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTPS id 7F848634C7B
        for <linux-media@vger.kernel.org>; Tue, 18 Jun 2019 16:01:44 +0300 (EEST)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.89)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1hdDk8-0000sA-Gn
        for linux-media@vger.kernel.org; Tue, 18 Jun 2019 16:01:44 +0300
Date:   Tue, 18 Jun 2019 16:01:44 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL for 5.3] Sensor driver patches
Message-ID: <20190618130144.jhictljz365qflur@valkosipuli.retiisi.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

Here are a few sensor driver patches for 5.3. Please pull.


The following changes since commit 513dbd35b5d93c45fa7291147f21fc0227a9f999:

  media: add SPDX headers to some files (2019-06-12 11:42:27 -0400)

are available in the git repository at:

  ssh://linuxtv.org/git/sailus/media_tree.git tags/for-5.3-3-signed

for you to fetch changes up to 0208b75e9cf2ef5e4107f2266830c64fef81e6f2:

  media: mt9m111: add regulator support (2019-06-18 14:51:44 +0300)

----------------------------------------------------------------
Sensor driver improvements for 5.3

----------------------------------------------------------------
Janusz Krzysztofik (1):
      media: ov6650: Fix device node exposed without proper locking

Robert Jarzmik (1):
      media: mt9m111: add regulator support

Sakari Ailus (2):
      v4l2-fwnode: Avoid using PTR_ERR(NULL)
      ov9640: Don't check for NULL on devm_gpiod_get return values

Shobhit Kukreti (1):
      media: i2c: Fix Unnecessary Semicolon Warning Reported by coccicheck

 drivers/media/i2c/mt9m111.c           | 17 +++++++++++++++++
 drivers/media/i2c/ov13858.c           |  4 ++--
 drivers/media/i2c/ov2685.c            |  2 +-
 drivers/media/i2c/ov5695.c            |  2 +-
 drivers/media/i2c/ov6650.c            |  1 -
 drivers/media/i2c/ov9640.c            |  4 ++--
 drivers/media/v4l2-core/v4l2-fwnode.c |  2 +-
 7 files changed, 24 insertions(+), 8 deletions(-)

-- 
Sakari Ailus
