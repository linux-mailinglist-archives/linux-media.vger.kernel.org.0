Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB0E224B599
	for <lists+linux-media@lfdr.de>; Thu, 20 Aug 2020 12:26:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729023AbgHTK0C (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 Aug 2020 06:26:02 -0400
Received: from retiisi.org.uk ([95.216.213.190]:60482 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730394AbgHTKZ6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 Aug 2020 06:25:58 -0400
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTPS id CA57F634C89
        for <linux-media@vger.kernel.org>; Thu, 20 Aug 2020 13:24:47 +0300 (EEST)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1k8hkV-0002od-Kj
        for linux-media@vger.kernel.org; Thu, 20 Aug 2020 13:24:47 +0300
Date:   Thu, 20 Aug 2020 13:24:47 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     linux-media@vger.kernel.org
Subject: [GIT FIXES FOR 5.9] Dependency fixes
Message-ID: <20200820102447.GE7145@valkosipuli.retiisi.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

Here are a few small Kconfig fixes that fix build breakages.

Please pull.


The following changes since commit 9123e3a74ec7b934a4a099e98af6a61c2f80bbf5:

  Linux 5.9-rc1 (2020-08-16 13:04:57 -0700)

are available in the Git repository at:

  git://linuxtv.org/sailus/media_tree.git tags/fixes-5.9-1-signed

for you to fetch changes up to 341dc3019ce40b06f5fc434b9e99673c70a3bcda:

  max9286: Depend on OF_GPIO (2020-08-20 13:11:02 +0300)

----------------------------------------------------------------
V4L2 fixes for 5.9

----------------------------------------------------------------
Jacopo Mondi (1):
      media: i2c: imx214: select V4L2_FWNODE

Sakari Ailus (1):
      max9286: Depend on OF_GPIO

 drivers/media/i2c/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

-- 
Sakari Ailus
