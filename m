Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4493F2CEDBF
	for <lists+linux-media@lfdr.de>; Fri,  4 Dec 2020 13:11:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730141AbgLDMLA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Dec 2020 07:11:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728306AbgLDMK5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 4 Dec 2020 07:10:57 -0500
Received: from hillosipuli.retiisi.eu (unknown [IPv6:2a01:4f9:c010:4572::e8:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80D01C0613D1
        for <linux-media@vger.kernel.org>; Fri,  4 Dec 2020 04:10:16 -0800 (PST)
Received: from valkosipuli.localdomain (unknown [IPv6:fd35:1bc8:1a6:d3d5::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id E37E4634C24
        for <linux-media@vger.kernel.org>; Fri,  4 Dec 2020 14:08:56 +0200 (EET)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1kl9tR-0003Oc-BE
        for linux-media@vger.kernel.org; Fri, 04 Dec 2020 14:08:57 +0200
Date:   Fri, 4 Dec 2020 14:08:57 +0200
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL for 5.11] Some fixes to the recently merged stuff
Message-ID: <20201204120857.GJ4351@valkosipuli.retiisi.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

Here are a few fixes for patches recently merged, the CCS and the OV02A01
sensor drivers.

Please pull.


The following changes since commit 63288c829b1a5991d8f8c15cab596108ed206ba6:

  media: pixfmt-compressed.rst: fix 'bullet' formatting (2020-12-03 12:27:34 +0100)

are available in the Git repository at:

  git://linuxtv.org/sailus/media_tree.git tags/for-5.11-6-signed

for you to fetch changes up to e8cf4c4cd9ce5ca27bc35a52eaf246ec43c4cc9b:

  ccs: Fix return value from probe (2020-12-04 13:52:14 +0200)

----------------------------------------------------------------
V4L2 patches for 5.11

----------------------------------------------------------------
Arnd Bergmann (2):
      media: i2c: fix an uninitialized error code
      media: ccs: avoid printing an uninitialized variable

Sakari Ailus (1):
      ccs: Fix return value from probe

 drivers/media/i2c/ccs/ccs-core.c | 5 ++---
 drivers/media/i2c/ov02a10.c      | 4 +++-
 2 files changed, 5 insertions(+), 4 deletions(-)

-- 
Sakari Ailus
