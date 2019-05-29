Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 76B772DBBC
	for <lists+linux-media@lfdr.de>; Wed, 29 May 2019 13:25:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725948AbfE2LZZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 May 2019 07:25:25 -0400
Received: from retiisi.org.uk ([95.216.213.190]:53500 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725914AbfE2LZZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 May 2019 07:25:25 -0400
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTPS id A101C634C7B
        for <linux-media@vger.kernel.org>; Wed, 29 May 2019 14:25:17 +0300 (EEST)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.89)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1hVwhp-0000TN-GX
        for linux-media@vger.kernel.org; Wed, 29 May 2019 14:25:17 +0300
Date:   Wed, 29 May 2019 14:25:17 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL for 5.3] ImgU driver warning fixes
Message-ID: <20190529112517.bzgwluhhhdi7nqdb@valkosipuli.retiisi.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

Here are the warning fixes for the ImgU driver. There's also a patch
dropping support for page sizes other than 4 kiB --- the hardware doesn't
have that either.

Please pull.


The following changes since commit 2c41cc0be07b5ee2f1167f41cd8a86fc5b53d82c:

  media: venus: firmware: fix leaked of_node references (2019-05-24 09:03:06 -0400)

are available in the git repository at:

  ssh://linuxtv.org/git/sailus/media_tree.git tags/ipu3-warn-5.3-1-signed

for you to fetch changes up to 2d6220de348248e68c8f5045e3060ca212d6e70f:

  staging: imgu: Drop support for other page sizes (2019-05-29 13:42:57 +0300)

----------------------------------------------------------------
ipu3 warning fixes

----------------------------------------------------------------
Sakari Ailus (5):
      staging: imgu: Address a compiler warning on alignment
      staging: imgu: Remove redundant checks
      staging: imgu: Address compiler / checker warnings in MMU code
      Revert "media: ipu3: shut up warnings produced with W=1"
      staging: imgu: Drop support for other page sizes

 drivers/staging/media/ipu3/Makefile             |   6 --
 drivers/staging/media/ipu3/TODO                 |   2 -
 drivers/staging/media/ipu3/include/intel-ipu3.h |   2 +-
 drivers/staging/media/ipu3/ipu3-css-fw.c        |   6 +-
 drivers/staging/media/ipu3/ipu3-dmamap.c        |  15 +--
 drivers/staging/media/ipu3/ipu3-mmu.c           | 125 ++++++++++--------------
 drivers/staging/media/ipu3/ipu3-mmu.h           |   5 +-
 7 files changed, 59 insertions(+), 102 deletions(-)

-- 
Kind regards,

Sakari Ailus
