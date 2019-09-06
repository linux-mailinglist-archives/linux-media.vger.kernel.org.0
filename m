Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A35F4AB293
	for <lists+linux-media@lfdr.de>; Fri,  6 Sep 2019 08:46:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390992AbfIFGqA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Sep 2019 02:46:00 -0400
Received: from retiisi.org.uk ([95.216.213.190]:54386 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726525AbfIFGqA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 6 Sep 2019 02:46:00 -0400
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTPS id CDAB9634C87
        for <linux-media@vger.kernel.org>; Fri,  6 Sep 2019 09:45:46 +0300 (EEST)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1i680A-0000kE-P6
        for linux-media@vger.kernel.org; Fri, 06 Sep 2019 09:45:46 +0300
Date:   Fri, 6 Sep 2019 09:45:46 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL for 5.4] MC fix and sensor driver cleanup
Message-ID: <20190906064546.GD1586@valkosipuli.retiisi.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

Here are a few more patches for 5.4.  Please pull.


The following changes since commit 6f51fdfd8229d5358c2d6e272cf73478866e8ddc:

  media: videobuf-core.c: poll_wait needs a non-NULL buf pointer (2019-09-05 06:26:57 -0300)

are available in the Git repository at:

  git://linuxtv.org/sailus/media_tree.git tags/for-5.4-9-signed

for you to fetch changes up to f3b01a6e3cb600f073eb6cc8a469e518e94ade95:

  media: mc-device.c: fix memleak in media_device_register_entity (2019-09-06 09:19:14 +0300)

----------------------------------------------------------------
MC and sensor driver fixes for 5.4.

----------------------------------------------------------------
Colin Ian King (1):
      media: i2c: mt9m001: make array init_regs static, makes object smaller

zhengbin (1):
      media: mc-device.c: fix memleak in media_device_register_entity

 drivers/media/i2c/mt9m001.c  |  2 +-
 drivers/media/mc/mc-device.c | 65 ++++++++++++++++++++++----------------------
 2 files changed, 34 insertions(+), 33 deletions(-)

-- 
Regards,

Sakari Ailus
