Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B1DA57BB420
	for <lists+linux-media@lfdr.de>; Fri,  6 Oct 2023 11:22:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231373AbjJFJW1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Oct 2023 05:22:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231215AbjJFJW0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 6 Oct 2023 05:22:26 -0400
Received: from gofer.mess.org (gofer.mess.org [IPv6:2a02:8011:d000:212::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 379DE93
        for <linux-media@vger.kernel.org>; Fri,  6 Oct 2023 02:22:25 -0700 (PDT)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 10855100092; Fri,  6 Oct 2023 10:22:22 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
        t=1696584142; bh=Z9KX5+nm5muo/ZUiWxnH8IzC/Uz2p7CrkwM5SBxDIXk=;
        h=Date:From:To:Subject:From;
        b=NhbPMipJAXvirH7FFeiTk/grij60XflSIF/Lj9GqKmuS8w7aWaZ4pB0i007necd8U
         AB3D4x2EztjeskMkaEQnvsB9x5egT1lJlijHUT1sQqfE3cDWmmrDQfUDzWWGzT1FSQ
         MKv6NU0EltKXa45UushkkG5vgiHjVscMJI1Bk+N514TPxkwNeGue5Xe9QNIB69xvrz
         E3akxhUO1oWy+zPN5naD2x2c5jbtzIEH6auRczaFgajnsmsrIgWIEYYL6/XX+fOXXI
         xSQoQAP9MdMlu8yX3VFK4S7wWNGfTbYKsmCaaa4Kevsdd7hN77tIXot6B/EhRN/hBN
         AWxiHaUHWxzSQ==
Date:   Fri, 6 Oct 2023 10:22:21 +0100
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL FOR v6.7] More rc fixes
Message-ID: <ZR/RzbrHMZjn2jrh@gofer.mess.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit 135b40f46aa67e7655cea124ce1ce624e5d1a093:

  media: Documentation: Split camera sensor documentation (2023-10-05 15:40:41 +0200)

are available in the Git repository at:

  git://linuxtv.org/syoung/media_tree.git tags/v6.7b

for you to fetch changes up to 014834c20601309310ad253e529a39b0a98f5abf:

  media: imon: fix access to invalid resource for the second interface (2023-10-06 10:04:51 +0100)

----------------------------------------------------------------
v6.7b

----------------------------------------------------------------
Hans Verkuil (1):
      media/rc/keymaps: add missing MODULE_DESCRIPTION to keymaps

Takashi Iwai (1):
      media: imon: fix access to invalid resource for the second interface

 drivers/media/rc/imon.c                               | 6 ++++++
 drivers/media/rc/keymaps/rc-adstech-dvb-t-pci.c       | 1 +
 drivers/media/rc/keymaps/rc-alink-dtu-m.c             | 1 +
 drivers/media/rc/keymaps/rc-anysee.c                  | 1 +
 drivers/media/rc/keymaps/rc-apac-viewcomp.c           | 1 +
 drivers/media/rc/keymaps/rc-astrometa-t2hybrid.c      | 1 +
 drivers/media/rc/keymaps/rc-asus-pc39.c               | 1 +
 drivers/media/rc/keymaps/rc-asus-ps3-100.c            | 1 +
 drivers/media/rc/keymaps/rc-ati-tv-wonder-hd-600.c    | 1 +
 drivers/media/rc/keymaps/rc-ati-x10.c                 | 1 +
 drivers/media/rc/keymaps/rc-avermedia-a16d.c          | 1 +
 drivers/media/rc/keymaps/rc-avermedia-cardbus.c       | 1 +
 drivers/media/rc/keymaps/rc-avermedia-dvbt.c          | 1 +
 drivers/media/rc/keymaps/rc-avermedia-m135a.c         | 1 +
 drivers/media/rc/keymaps/rc-avermedia-m733a-rm-k6.c   | 1 +
 drivers/media/rc/keymaps/rc-avermedia-rm-ks.c         | 1 +
 drivers/media/rc/keymaps/rc-avermedia.c               | 1 +
 drivers/media/rc/keymaps/rc-avertv-303.c              | 1 +
 drivers/media/rc/keymaps/rc-azurewave-ad-tu700.c      | 1 +
 drivers/media/rc/keymaps/rc-beelink-gs1.c             | 1 +
 drivers/media/rc/keymaps/rc-beelink-mxiii.c           | 1 +
 drivers/media/rc/keymaps/rc-behold-columbus.c         | 1 +
 drivers/media/rc/keymaps/rc-behold.c                  | 1 +
 drivers/media/rc/keymaps/rc-budget-ci-old.c           | 1 +
 drivers/media/rc/keymaps/rc-cinergy-1400.c            | 1 +
 drivers/media/rc/keymaps/rc-cinergy.c                 | 1 +
 drivers/media/rc/keymaps/rc-ct-90405.c                | 1 +
 drivers/media/rc/keymaps/rc-d680-dmb.c                | 1 +
 drivers/media/rc/keymaps/rc-dib0700-nec.c             | 1 +
 drivers/media/rc/keymaps/rc-dib0700-rc5.c             | 1 +
 drivers/media/rc/keymaps/rc-digitalnow-tinytwin.c     | 1 +
 drivers/media/rc/keymaps/rc-digittrade.c              | 1 +
 drivers/media/rc/keymaps/rc-dm1105-nec.c              | 1 +
 drivers/media/rc/keymaps/rc-dntv-live-dvb-t.c         | 1 +
 drivers/media/rc/keymaps/rc-dntv-live-dvbt-pro.c      | 1 +
 drivers/media/rc/keymaps/rc-dreambox.c                | 1 +
 drivers/media/rc/keymaps/rc-dtt200u.c                 | 1 +
 drivers/media/rc/keymaps/rc-dvbsky.c                  | 1 +
 drivers/media/rc/keymaps/rc-dvico-mce.c               | 1 +
 drivers/media/rc/keymaps/rc-dvico-portable.c          | 1 +
 drivers/media/rc/keymaps/rc-em-terratec.c             | 1 +
 drivers/media/rc/keymaps/rc-encore-enltv-fm53.c       | 1 +
 drivers/media/rc/keymaps/rc-encore-enltv.c            | 1 +
 drivers/media/rc/keymaps/rc-encore-enltv2.c           | 1 +
 drivers/media/rc/keymaps/rc-evga-indtube.c            | 1 +
 drivers/media/rc/keymaps/rc-eztv.c                    | 1 +
 drivers/media/rc/keymaps/rc-flydvb.c                  | 1 +
 drivers/media/rc/keymaps/rc-flyvideo.c                | 1 +
 drivers/media/rc/keymaps/rc-fusionhdtv-mce.c          | 1 +
 drivers/media/rc/keymaps/rc-gadmei-rm008z.c           | 1 +
 drivers/media/rc/keymaps/rc-geekbox.c                 | 1 +
 drivers/media/rc/keymaps/rc-genius-tvgo-a11mce.c      | 1 +
 drivers/media/rc/keymaps/rc-gotview7135.c             | 1 +
 drivers/media/rc/keymaps/rc-hauppauge.c               | 1 +
 drivers/media/rc/keymaps/rc-hisi-poplar.c             | 1 +
 drivers/media/rc/keymaps/rc-hisi-tv-demo.c            | 1 +
 drivers/media/rc/keymaps/rc-imon-mce.c                | 1 +
 drivers/media/rc/keymaps/rc-imon-pad.c                | 1 +
 drivers/media/rc/keymaps/rc-imon-rsc.c                | 1 +
 drivers/media/rc/keymaps/rc-iodata-bctv7e.c           | 1 +
 drivers/media/rc/keymaps/rc-it913x-v1.c               | 1 +
 drivers/media/rc/keymaps/rc-it913x-v2.c               | 1 +
 drivers/media/rc/keymaps/rc-kaiomy.c                  | 1 +
 drivers/media/rc/keymaps/rc-khadas.c                  | 1 +
 drivers/media/rc/keymaps/rc-khamsin.c                 | 1 +
 drivers/media/rc/keymaps/rc-kworld-315u.c             | 1 +
 drivers/media/rc/keymaps/rc-kworld-pc150u.c           | 1 +
 drivers/media/rc/keymaps/rc-kworld-plus-tv-analog.c   | 1 +
 drivers/media/rc/keymaps/rc-leadtek-y04g0051.c        | 1 +
 drivers/media/rc/keymaps/rc-lme2510.c                 | 1 +
 drivers/media/rc/keymaps/rc-manli.c                   | 1 +
 drivers/media/rc/keymaps/rc-mecool-kii-pro.c          | 1 +
 drivers/media/rc/keymaps/rc-mecool-kiii-pro.c         | 1 +
 drivers/media/rc/keymaps/rc-medion-x10.c              | 1 +
 drivers/media/rc/keymaps/rc-minix-neo.c               | 1 +
 drivers/media/rc/keymaps/rc-msi-digivox-ii.c          | 1 +
 drivers/media/rc/keymaps/rc-msi-digivox-iii.c         | 1 +
 drivers/media/rc/keymaps/rc-msi-tvanywhere-plus.c     | 1 +
 drivers/media/rc/keymaps/rc-msi-tvanywhere.c          | 1 +
 drivers/media/rc/keymaps/rc-nebula.c                  | 1 +
 drivers/media/rc/keymaps/rc-nec-terratec-cinergy-xs.c | 1 +
 drivers/media/rc/keymaps/rc-norwood.c                 | 1 +
 drivers/media/rc/keymaps/rc-npgtech.c                 | 1 +
 drivers/media/rc/keymaps/rc-odroid.c                  | 1 +
 drivers/media/rc/keymaps/rc-pctv-sedna.c              | 1 +
 drivers/media/rc/keymaps/rc-pine64.c                  | 1 +
 drivers/media/rc/keymaps/rc-pinnacle-color.c          | 1 +
 drivers/media/rc/keymaps/rc-pinnacle-grey.c           | 1 +
 drivers/media/rc/keymaps/rc-pinnacle-pctv-hd.c        | 1 +
 drivers/media/rc/keymaps/rc-pixelview-002t.c          | 1 +
 drivers/media/rc/keymaps/rc-pixelview-mk12.c          | 1 +
 drivers/media/rc/keymaps/rc-pixelview-new.c           | 1 +
 drivers/media/rc/keymaps/rc-pixelview.c               | 1 +
 drivers/media/rc/keymaps/rc-powercolor-real-angel.c   | 1 +
 drivers/media/rc/keymaps/rc-proteus-2309.c            | 1 +
 drivers/media/rc/keymaps/rc-purpletv.c                | 1 +
 drivers/media/rc/keymaps/rc-pv951.c                   | 1 +
 drivers/media/rc/keymaps/rc-rc6-mce.c                 | 1 +
 drivers/media/rc/keymaps/rc-real-audio-220-32-keys.c  | 1 +
 drivers/media/rc/keymaps/rc-reddo.c                   | 1 +
 drivers/media/rc/keymaps/rc-snapstream-firefly.c      | 1 +
 drivers/media/rc/keymaps/rc-streamzap.c               | 1 +
 drivers/media/rc/keymaps/rc-su3000.c                  | 1 +
 drivers/media/rc/keymaps/rc-tanix-tx3mini.c           | 1 +
 drivers/media/rc/keymaps/rc-tanix-tx5max.c            | 1 +
 drivers/media/rc/keymaps/rc-tbs-nec.c                 | 1 +
 drivers/media/rc/keymaps/rc-technisat-ts35.c          | 1 +
 drivers/media/rc/keymaps/rc-technisat-usb2.c          | 1 +
 drivers/media/rc/keymaps/rc-terratec-cinergy-c-pci.c  | 1 +
 drivers/media/rc/keymaps/rc-terratec-cinergy-s2-hd.c  | 1 +
 drivers/media/rc/keymaps/rc-terratec-cinergy-xs.c     | 1 +
 drivers/media/rc/keymaps/rc-terratec-slim-2.c         | 1 +
 drivers/media/rc/keymaps/rc-terratec-slim.c           | 1 +
 drivers/media/rc/keymaps/rc-tevii-nec.c               | 1 +
 drivers/media/rc/keymaps/rc-tivo.c                    | 1 +
 drivers/media/rc/keymaps/rc-total-media-in-hand-02.c  | 1 +
 drivers/media/rc/keymaps/rc-total-media-in-hand.c     | 1 +
 drivers/media/rc/keymaps/rc-trekstor.c                | 1 +
 drivers/media/rc/keymaps/rc-tt-1500.c                 | 1 +
 drivers/media/rc/keymaps/rc-twinhan-dtv-cab-ci.c      | 1 +
 drivers/media/rc/keymaps/rc-twinhan1027.c             | 1 +
 drivers/media/rc/keymaps/rc-vega-s9x.c                | 1 +
 drivers/media/rc/keymaps/rc-videomate-m1f.c           | 1 +
 drivers/media/rc/keymaps/rc-videomate-s350.c          | 1 +
 drivers/media/rc/keymaps/rc-videomate-tv-pvr.c        | 1 +
 drivers/media/rc/keymaps/rc-videostrong-kii-pro.c     | 1 +
 drivers/media/rc/keymaps/rc-wetek-hub.c               | 1 +
 drivers/media/rc/keymaps/rc-wetek-play2.c             | 1 +
 drivers/media/rc/keymaps/rc-winfast-usbii-deluxe.c    | 1 +
 drivers/media/rc/keymaps/rc-winfast.c                 | 1 +
 drivers/media/rc/keymaps/rc-x96max.c                  | 1 +
 drivers/media/rc/keymaps/rc-xbox-360.c                | 1 +
 drivers/media/rc/keymaps/rc-xbox-dvd.c                | 1 +
 drivers/media/rc/keymaps/rc-zx-irdec.c                | 1 +
 134 files changed, 139 insertions(+)
