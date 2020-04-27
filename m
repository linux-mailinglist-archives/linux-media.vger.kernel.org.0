Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D326F1BA95E
	for <lists+linux-media@lfdr.de>; Mon, 27 Apr 2020 17:57:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728174AbgD0P5I (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 Apr 2020 11:57:08 -0400
Received: from retiisi.org.uk ([95.216.213.190]:54298 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728076AbgD0P5I (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Apr 2020 11:57:08 -0400
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTPS id EEC96634C8F
        for <linux-media@vger.kernel.org>; Mon, 27 Apr 2020 18:56:13 +0300 (EEST)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1jT67B-0001wX-Ed
        for linux-media@vger.kernel.org; Mon, 27 Apr 2020 18:56:13 +0300
Date:   Mon, 27 Apr 2020 18:56:13 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL for 5.8] ImgU driver fixes, cleanups
Message-ID: <20200427155613.GS934@valkosipuli.retiisi.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

Here's a set of ImgU driver cleanups and fixes for 5.8.

Two of the patches are cc'd to the stable tree.

Please pull.


The following changes since commit 4bdbff4da40584ec2225bb429b7c66ad54d19cda:

  media: tuners: Kconfig: add some missing VIDEO_V4L2 dependencies (2020-04-23 07:57:27 +0200)

are available in the Git repository at:

  git://linuxtv.org/sailus/media_tree.git tags/for-5.8-2.2-signed

for you to fetch changes up to 14e37df36473368ce9fd22bc02f4c8e78055be31:

  staging: ipu3-imgu: Add a sanity check for the parameter struct size (2020-04-27 18:53:57 +0300)

----------------------------------------------------------------
IPU3 patches for 5.8.

----------------------------------------------------------------
Bingbu Cao (1):
      media: ipu3.rst: add explanation for running mode

Sakari Ailus (4):
      MAINTAINERS: ipu3-imgu: Add Tian Shu and Bingbu as reviewers
      Revert "staging: imgu: Address a compiler warning on alignment"
      staging: ipu3-imgu: Move alignment attribute to field
      staging: ipu3-imgu: Add a sanity check for the parameter struct size

Tomasz Figa (1):
      media: staging: ipu3: Fix stale list entries on parameter queue failure

 Documentation/admin-guide/media/ipu3.rst        | 27 +++++++++++++++++++++----
 MAINTAINERS                                     |  2 ++
 drivers/staging/media/ipu3/TODO                 |  4 ----
 drivers/staging/media/ipu3/include/intel-ipu3.h |  7 ++++---
 drivers/staging/media/ipu3/ipu3-css.c           |  7 +++++++
 drivers/staging/media/ipu3/ipu3.c               |  2 +-
 6 files changed, 37 insertions(+), 12 deletions(-)

-- 
Sakari Ailus
