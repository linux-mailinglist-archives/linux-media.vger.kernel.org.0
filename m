Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B8E3356718
	for <lists+linux-media@lfdr.de>; Wed, 26 Jun 2019 12:45:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726462AbfFZKpk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 Jun 2019 06:45:40 -0400
Received: from gofer.mess.org ([88.97.38.141]:56497 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726339AbfFZKpk (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 Jun 2019 06:45:40 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 502E860AD1; Wed, 26 Jun 2019 11:45:38 +0100 (BST)
Date:   Wed, 26 Jun 2019 11:45:38 +0100
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL FOR v5.3] Minor dvb and rc fixes
Message-ID: <20190626104537.gs55wzt3pbs3k63j@gofer.mess.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

These are the last changes for v5.3, I think.

Thanks,
Sean

The following changes since commit 86d617d6c79d79288ca608b6fb0a2467b0e8ddbb:

  media: MAINTAINERS: Add maintainers for Media Controller (2019-06-24 15:07:51 -0400)

are available in the Git repository at:

  git://linuxtv.org/syoung/media_tree.git for-v5.3e

for you to fetch changes up to 25e96a05d90dad52234ff9d52d8b1f47acbd045a:

  media: stv0297: fix frequency range limit (2019-06-26 12:09:35 +0200)

----------------------------------------------------------------
A Sun (1):
      media: mceusb: disable "nonsensical irdata" messages

Arnd Bergmann (1):
      media: dvb_frontend: split dvb_frontend_handle_ioctl function

Bastien Nocera (1):
      media: rc: Prefer KEY_NUMERIC_* for number buttons on remotes

Ding Xiang (1):
      media: rc: remove redundant dev_err message

Mauro Carvalho Chehab (1):
      media: stv0297: fix frequency range limit

 Documentation/media/uapi/rc/rc-tables.rst          |  20 +--
 drivers/media/dvb-core/dvb_frontend.c              | 140 +++++++++++----------
 drivers/media/dvb-frontends/stv0297.c              |   2 +-
 drivers/media/rc/keymaps/rc-adstech-dvb-t-pci.c    |  20 +--
 drivers/media/rc/keymaps/rc-alink-dtu-m.c          |  20 +--
 drivers/media/rc/keymaps/rc-anysee.c               |  20 +--
 drivers/media/rc/keymaps/rc-apac-viewcomp.c        |  20 +--
 drivers/media/rc/keymaps/rc-astrometa-t2hybrid.c   |  20 +--
 drivers/media/rc/keymaps/rc-asus-pc39.c            |  20 +--
 drivers/media/rc/keymaps/rc-asus-ps3-100.c         |  20 +--
 drivers/media/rc/keymaps/rc-ati-x10.c              |  20 +--
 drivers/media/rc/keymaps/rc-avermedia-a16d.c       |  20 +--
 drivers/media/rc/keymaps/rc-avermedia-cardbus.c    |  20 +--
 drivers/media/rc/keymaps/rc-avermedia-dvbt.c       |  20 +--
 drivers/media/rc/keymaps/rc-avermedia-m135a.c      |  40 +++---
 .../media/rc/keymaps/rc-avermedia-m733a-rm-k6.c    |  20 +--
 drivers/media/rc/keymaps/rc-avermedia-rm-ks.c      |  20 +--
 drivers/media/rc/keymaps/rc-avermedia.c            |  20 +--
 drivers/media/rc/keymaps/rc-avertv-303.c           |  20 +--
 drivers/media/rc/keymaps/rc-azurewave-ad-tu700.c   |  20 +--
 drivers/media/rc/keymaps/rc-behold-columbus.c      |  20 +--
 drivers/media/rc/keymaps/rc-behold.c               |  20 +--
 drivers/media/rc/keymaps/rc-budget-ci-old.c        |  20 +--
 drivers/media/rc/keymaps/rc-cinergy-1400.c         |  20 +--
 drivers/media/rc/keymaps/rc-cinergy.c              |  20 +--
 drivers/media/rc/keymaps/rc-d680-dmb.c             |  20 +--
 drivers/media/rc/keymaps/rc-delock-61959.c         |  20 +--
 drivers/media/rc/keymaps/rc-dib0700-nec.c          |  40 +++---
 drivers/media/rc/keymaps/rc-dib0700-rc5.c          | 100 +++++++--------
 drivers/media/rc/keymaps/rc-digitalnow-tinytwin.c  |  20 +--
 drivers/media/rc/keymaps/rc-digittrade.c           |  20 +--
 drivers/media/rc/keymaps/rc-dm1105-nec.c           |  20 +--
 drivers/media/rc/keymaps/rc-dntv-live-dvb-t.c      |  20 +--
 drivers/media/rc/keymaps/rc-dntv-live-dvbt-pro.c   |  20 +--
 drivers/media/rc/keymaps/rc-dtt200u.c              |  20 +--
 drivers/media/rc/keymaps/rc-dvbsky.c               |  20 +--
 drivers/media/rc/keymaps/rc-dvico-mce.c            |  20 +--
 drivers/media/rc/keymaps/rc-dvico-portable.c       |  20 +--
 drivers/media/rc/keymaps/rc-em-terratec.c          |  20 +--
 drivers/media/rc/keymaps/rc-encore-enltv-fm53.c    |  20 +--
 drivers/media/rc/keymaps/rc-encore-enltv.c         |  20 +--
 drivers/media/rc/keymaps/rc-encore-enltv2.c        |  20 +--
 drivers/media/rc/keymaps/rc-eztv.c                 |  20 +--
 drivers/media/rc/keymaps/rc-flydvb.c               |  20 +--
 drivers/media/rc/keymaps/rc-flyvideo.c             |  20 +--
 drivers/media/rc/keymaps/rc-fusionhdtv-mce.c       |  20 +--
 drivers/media/rc/keymaps/rc-gadmei-rm008z.c        |  20 +--
 drivers/media/rc/keymaps/rc-genius-tvgo-a11mce.c   |  20 +--
 drivers/media/rc/keymaps/rc-gotview7135.c          |  20 +--
 drivers/media/rc/keymaps/rc-hauppauge.c            | 100 +++++++--------
 drivers/media/rc/keymaps/rc-hisi-poplar.c          |  20 +--
 drivers/media/rc/keymaps/rc-hisi-tv-demo.c         |  20 +--
 drivers/media/rc/keymaps/rc-iodata-bctv7e.c        |  20 +--
 drivers/media/rc/keymaps/rc-it913x-v1.c            |  40 +++---
 drivers/media/rc/keymaps/rc-it913x-v2.c            |  40 +++---
 drivers/media/rc/keymaps/rc-kaiomy.c               |  20 +--
 drivers/media/rc/keymaps/rc-kworld-315u.c          |  20 +--
 drivers/media/rc/keymaps/rc-kworld-pc150u.c        |  20 +--
 .../media/rc/keymaps/rc-kworld-plus-tv-analog.c    |  24 ++--
 drivers/media/rc/keymaps/rc-leadtek-y04g0051.c     |  20 +--
 drivers/media/rc/keymaps/rc-lme2510.c              |  60 ++++-----
 drivers/media/rc/keymaps/rc-manli.c                |  20 +--
 .../media/rc/keymaps/rc-medion-x10-digitainer.c    |  20 +--
 drivers/media/rc/keymaps/rc-medion-x10-or2x.c      |  20 +--
 drivers/media/rc/keymaps/rc-medion-x10.c           |  20 +--
 drivers/media/rc/keymaps/rc-msi-digivox-ii.c       |  20 +--
 drivers/media/rc/keymaps/rc-msi-digivox-iii.c      |  20 +--
 drivers/media/rc/keymaps/rc-msi-tvanywhere-plus.c  |  20 +--
 drivers/media/rc/keymaps/rc-msi-tvanywhere.c       |  20 +--
 drivers/media/rc/keymaps/rc-nebula.c               |  20 +--
 .../media/rc/keymaps/rc-nec-terratec-cinergy-xs.c  |  40 +++---
 drivers/media/rc/keymaps/rc-norwood.c              |  20 +--
 drivers/media/rc/keymaps/rc-npgtech.c              |  20 +--
 drivers/media/rc/keymaps/rc-pctv-sedna.c           |  20 +--
 drivers/media/rc/keymaps/rc-pinnacle-color.c       |  20 +--
 drivers/media/rc/keymaps/rc-pinnacle-grey.c        |  20 +--
 drivers/media/rc/keymaps/rc-pinnacle-pctv-hd.c     |  20 +--
 drivers/media/rc/keymaps/rc-pixelview-002t.c       |  20 +--
 drivers/media/rc/keymaps/rc-pixelview-mk12.c       |  20 +--
 drivers/media/rc/keymaps/rc-pixelview-new.c        |  20 +--
 drivers/media/rc/keymaps/rc-pixelview.c            |  20 +--
 .../media/rc/keymaps/rc-powercolor-real-angel.c    |  20 +--
 drivers/media/rc/keymaps/rc-proteus-2309.c         |  20 +--
 drivers/media/rc/keymaps/rc-purpletv.c             |  20 +--
 drivers/media/rc/keymaps/rc-pv951.c                |  20 +--
 .../media/rc/keymaps/rc-real-audio-220-32-keys.c   |  20 +--
 drivers/media/rc/keymaps/rc-reddo.c                |  20 +--
 drivers/media/rc/keymaps/rc-snapstream-firefly.c   |  20 +--
 drivers/media/rc/keymaps/rc-su3000.c               |  20 +--
 drivers/media/rc/keymaps/rc-tango.c                |  20 +--
 drivers/media/rc/keymaps/rc-tbs-nec.c              |  20 +--
 drivers/media/rc/keymaps/rc-technisat-ts35.c       |  20 +--
 drivers/media/rc/keymaps/rc-technisat-usb2.c       |  20 +--
 .../media/rc/keymaps/rc-terratec-cinergy-c-pci.c   |  20 +--
 .../media/rc/keymaps/rc-terratec-cinergy-s2-hd.c   |  20 +--
 drivers/media/rc/keymaps/rc-terratec-cinergy-xs.c  |  20 +--
 drivers/media/rc/keymaps/rc-terratec-slim-2.c      |  20 +--
 drivers/media/rc/keymaps/rc-terratec-slim.c        |  20 +--
 drivers/media/rc/keymaps/rc-tevii-nec.c            |  20 +--
 .../media/rc/keymaps/rc-total-media-in-hand-02.c   |  20 +--
 drivers/media/rc/keymaps/rc-total-media-in-hand.c  |  20 +--
 drivers/media/rc/keymaps/rc-trekstor.c             |  20 +--
 drivers/media/rc/keymaps/rc-tt-1500.c              |  20 +--
 drivers/media/rc/keymaps/rc-twinhan-dtv-cab-ci.c   |  20 +--
 drivers/media/rc/keymaps/rc-twinhan1027.c          |  20 +--
 drivers/media/rc/keymaps/rc-videomate-m1f.c        |  20 +--
 drivers/media/rc/keymaps/rc-videomate-s350.c       |  20 +--
 drivers/media/rc/keymaps/rc-videomate-tv-pvr.c     |  20 +--
 drivers/media/rc/keymaps/rc-winfast-usbii-deluxe.c |  20 +--
 drivers/media/rc/keymaps/rc-winfast.c              |  20 +--
 drivers/media/rc/keymaps/rc-xbox-dvd.c             |  20 +--
 drivers/media/rc/keymaps/rc-zx-irdec.c             |  20 +--
 drivers/media/rc/mceusb.c                          |   4 +-
 drivers/media/rc/meson-ir.c                        |   4 +-
 drivers/media/rc/mtk-cir.c                         |   4 +-
 drivers/media/rc/sunxi-cir.c                       |   1 -
 116 files changed, 1336 insertions(+), 1323 deletions(-)
