Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 732E626338
	for <lists+linux-media@lfdr.de>; Wed, 22 May 2019 13:51:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729215AbfEVLvK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 May 2019 07:51:10 -0400
Received: from retiisi.org.uk ([95.216.213.190]:56756 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727464AbfEVLvK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 May 2019 07:51:10 -0400
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTPS id BEE91634C7B
        for <linux-media@vger.kernel.org>; Wed, 22 May 2019 14:50:47 +0300 (EEST)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.89)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1hTPlf-0000ni-MN
        for linux-media@vger.kernel.org; Wed, 22 May 2019 14:50:47 +0300
Date:   Wed, 22 May 2019 14:50:47 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL for 5.3] Videobuf2 corner case fixes
Message-ID: <20190522115047.7iid3axhq443q7ka@valkosipuli.retiisi.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

Here are the videobuf2 corner case fixes.

Please pull.


The following changes since commit bc8c479a5b19bd44f7379e42e627170957985ee9:

  media: venus: helpers: fix dynamic buffer mode for v4 (2019-05-21 09:03:25 -0400)

are available in the git repository at:

  ssh://linuxtv.org/git/sailus/media_tree.git tags/vb2-fix-5.3-1-signed

for you to fetch changes up to 1e210b78171d7d60e4053a8f865efac1693e2213:

  videobuf2-core.h: Document the alloc memop size argument as page aligned (2019-05-22 12:03:24 +0300)

----------------------------------------------------------------
vb2 corner case fixes

----------------------------------------------------------------
Sakari Ailus (3):
      videobuf2-core: Prevent size alignment wrapping buffer size to 0
      videobuf2-dma-sg: Prevent size from overflowing
      videobuf2-core.h: Document the alloc memop size argument as page aligned

 drivers/media/common/videobuf2/videobuf2-core.c   | 5 +++++
 drivers/media/common/videobuf2/videobuf2-dma-sg.c | 2 +-
 include/media/videobuf2-core.h                    | 3 ++-
 3 files changed, 8 insertions(+), 2 deletions(-)

-- 
Sakari Ailus
