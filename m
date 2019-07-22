Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7B9127052C
	for <lists+linux-media@lfdr.de>; Mon, 22 Jul 2019 18:14:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730742AbfGVQOn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Jul 2019 12:14:43 -0400
Received: from gofer.mess.org ([88.97.38.141]:38555 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728762AbfGVQOm (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Jul 2019 12:14:42 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id C95C26047B; Mon, 22 Jul 2019 17:14:40 +0100 (BST)
Date:   Mon, 22 Jul 2019 17:14:40 +0100
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Cc:     Jan Pieter van Woerkom <jp@jpvw.nl>, A Sun <as1033x@comcast.net>,
        rnd Bergmann <arnd@arndb.de>
Subject: [GIT PULL FOR v5.4] RC & DVB fixes
Message-ID: <20190722161440.2pj5gz4szn2wrhaz@gofer.mess.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

Here is the first batch of dvb & rc changes. 

Thanks
Sean


The following changes since commit 3f98538c7673e5306a126fd3cb7e0a84abc170ee:

  Merge tag 'v5.3-rc1' into patchwork (2019-07-22 07:40:55 -0400)

are available in the Git repository at:

  git://linuxtv.org/syoung/media_tree.git for-v5.4a

for you to fetch changes up to 5f8d28c5a49a8a7b0626e476e9b9933ffdf78d75:

  media: dvbsky: add support for Mygica T230C v2 (2019-07-22 14:31:41 +0100)

----------------------------------------------------------------
A Sun (1):
      media: mceusb: USB reset device following USB clear halt error

Arnd Bergmann (1):
      media: dib0700: fix link error for dibx000_i2c_set_speed

Jan Pieter van Woerkom (2):
      media: si2168: add support for Mygica T230C v2
      media: dvbsky: add support for Mygica T230C v2

Sean Young (4):
      media: mtk-cir: only allow protocols that have software decoders
      media: rc: remove unused #define RC_PROTO_BIT_ALL
      media: mtk-cir: lower de-glitch counter for rc-mm protocol
      media: technisat-usb2: break out of loop at end of buffer

 drivers/media/dvb-frontends/si2168.c        | 11 +++++
 drivers/media/dvb-frontends/si2168.h        |  1 +
 drivers/media/rc/mceusb.c                   | 67 +++++++++++++++++++++++------
 drivers/media/rc/mtk-cir.c                  | 10 ++++-
 drivers/media/usb/dvb-usb-v2/dvbsky.c       |  5 +++
 drivers/media/usb/dvb-usb/dib0700_devices.c |  8 ++++
 drivers/media/usb/dvb-usb/technisat-usb2.c  | 22 +++++-----
 include/media/dvb-usb-ids.h                 |  1 +
 include/media/rc-map.h                      | 16 -------
 9 files changed, 100 insertions(+), 41 deletions(-)
