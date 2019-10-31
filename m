Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DBCEEEB3FD
	for <lists+linux-media@lfdr.de>; Thu, 31 Oct 2019 16:33:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728376AbfJaPdy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 31 Oct 2019 11:33:54 -0400
Received: from retiisi.org.uk ([95.216.213.190]:34880 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727860AbfJaPdy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 31 Oct 2019 11:33:54 -0400
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTPS id 12295634C87
        for <linux-media@vger.kernel.org>; Thu, 31 Oct 2019 17:33:02 +0200 (EET)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1iQCRZ-0001mb-3S
        for linux-media@vger.kernel.org; Thu, 31 Oct 2019 17:33:01 +0200
Date:   Thu, 31 Oct 2019 17:33:01 +0200
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL for 5.5] Ipu3 and smiapp driver patches
Message-ID: <20191031153300.GL6253@valkosipuli.retiisi.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

Here's a small set of ipu3 and smiapp driver patches for 5.5.

Please pull.


The following changes since commit a4260ea49547aa0c84c353f9de5998a0315d89fe:

  media: sun4i: Add H3 deinterlace driver (2019-10-24 19:07:59 -0300)

are available in the Git repository at:

  git://linuxtv.org/sailus/media_tree.git tags/for-5.5-7-signed

for you to fetch changes up to ccf9b64233bde660c2a37e3a5a6990b1accca0a2:

  media: smiapp: unlock on error in smiapp_start_streaming() (2019-10-31 17:25:56 +0200)

----------------------------------------------------------------
Imgu and smiapp patches for 5.5

----------------------------------------------------------------
Bingbu Cao (3):
      doc-rst: add more info for resolution change blocks in ipu3
      doc-rst: ipu3: clarification on data type conversion of IEFD CU
      media: staging/intel-ipu3: remove the unnecessary compiler flags

Dan Carpenter (1):
      media: smiapp: unlock on error in smiapp_start_streaming()

 Documentation/media/v4l-drivers/ipu3.rst        |  53 +++-
 Documentation/media/v4l-drivers/ipu3_rcb.svg    | 331 ++++++++++++++++++++++++
 MAINTAINERS                                     |   1 +
 drivers/media/i2c/smiapp/smiapp-core.c          |   4 +-
 drivers/staging/media/ipu3/Makefile             |   6 -
 drivers/staging/media/ipu3/TODO                 |   5 -
 drivers/staging/media/ipu3/include/intel-ipu3.h |   5 +
 7 files changed, 384 insertions(+), 21 deletions(-)
 create mode 100644 Documentation/media/v4l-drivers/ipu3_rcb.svg

-- 
Sakari Ailus
