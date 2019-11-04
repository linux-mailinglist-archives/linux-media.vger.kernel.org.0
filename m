Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4829CEDC75
	for <lists+linux-media@lfdr.de>; Mon,  4 Nov 2019 11:26:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728367AbfKDK0I (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 Nov 2019 05:26:08 -0500
Received: from retiisi.org.uk ([95.216.213.190]:57838 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727499AbfKDK0I (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 4 Nov 2019 05:26:08 -0500
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTPS id DDC30634C87
        for <linux-media@vger.kernel.org>; Mon,  4 Nov 2019 12:24:59 +0200 (EET)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1iRZXe-0002IM-Uz
        for linux-media@vger.kernel.org; Mon, 04 Nov 2019 12:24:58 +0200
Date:   Mon, 4 Nov 2019 12:24:58 +0200
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL for 5.5] Hi556 sensor driver
Message-ID: <20191104102458.GQ6253@valkosipuli.retiisi.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

Here's the driver for the Hynix hi556 sensor.

Please pull.


The following changes since commit a4260ea49547aa0c84c353f9de5998a0315d89fe:

  media: sun4i: Add H3 deinterlace driver (2019-10-24 19:07:59 -0300)

are available in the Git repository at:

  git://linuxtv.org/sailus/media_tree.git tags/for-5.5-8-signed

for you to fetch changes up to a9a1c1acad9d094a32a8bfa7eabc1b1726b4001d:

  hi556: Add support for Hi-556 sensor (2019-11-04 12:20:56 +0200)

----------------------------------------------------------------
hi556 driver for 5.5

----------------------------------------------------------------
Shawn Tu (1):
      hi556: Add support for Hi-556 sensor

 MAINTAINERS                |    7 +
 drivers/media/i2c/Kconfig  |   12 +
 drivers/media/i2c/Makefile |    1 +
 drivers/media/i2c/hi556.c  | 1200 ++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 1220 insertions(+)
 create mode 100644 drivers/media/i2c/hi556.c

-- 
Sakari Ailus
