Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7EBF0278BA0
	for <lists+linux-media@lfdr.de>; Fri, 25 Sep 2020 17:00:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729003AbgIYPAA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 25 Sep 2020 11:00:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728038AbgIYPAA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 25 Sep 2020 11:00:00 -0400
Received: from gofer.mess.org (gofer.mess.org [IPv6:2a02:8011:d000:212::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBA11C0613CE
        for <linux-media@vger.kernel.org>; Fri, 25 Sep 2020 07:59:55 -0700 (PDT)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 5571911A001; Fri, 25 Sep 2020 15:59:52 +0100 (BST)
Date:   Fri, 25 Sep 2020 15:59:52 +0100
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL FOR v5.10] Various small fixes
Message-ID: <20200925145951.GA7907@gofer.mess.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

The last changes for v5.10. These should be uncontroversial.

Sean

The following changes since commit 01cc2ec6ea044731e939e5e47f7e115b86f49465:

  media: atomisp: cleanup __printf() atributes on printk messages (2020-09-23 10:19:19 +0200)

are available in the Git repository at:

  git://linuxtv.org/syoung/media_tree.git tags/v5.10c

for you to fetch changes up to 9062169a01befed40403e44fea1f35d92c759b5e:

  bindings: media: gpio-ir-receiver: add linux,autosuspend-period property (2020-09-25 15:37:24 +0100)

----------------------------------------------------------------
v5.10c

----------------------------------------------------------------
Evgeny Novikov (1):
      media: dvb-frontends: rtl2832_sdr: set error code in probe

Joakim Zhang (2):
      media: rc: gpio-ir-recv: add QoS support for cpuidle system
      bindings: media: gpio-ir-receiver: add linux,autosuspend-period property

Oliver Neukum (2):
      media: ati_remote: sanity check for both endpoints
      media: flexcop-usb: sanity checking of endpoint type

Qinglang Miao (1):
      media: flexcop-usb: remove needless check before usb_free_coherent()

Rikard Falkeborn (1):
      media: dvb-frontends: tda18271c2dd: Constify static structs

Vaibhav Gupta (1):
      media: netup_unidvb: drop initialization of PM pointers

 .../devicetree/bindings/media/gpio-ir-receiver.txt |  3 ++
 drivers/media/dvb-frontends/rtl2832_sdr.c          |  1 +
 drivers/media/dvb-frontends/tda18271c2dd.c         | 41 ++++++++---------
 drivers/media/dvb-frontends/tda18271c2dd_maps.h    | 22 ++++-----
 drivers/media/pci/netup_unidvb/netup_unidvb_core.c |  2 -
 drivers/media/rc/ati_remote.c                      |  4 ++
 drivers/media/rc/gpio-ir-recv.c                    | 53 ++++++++++++++++++++++
 drivers/media/usb/b2c2/flexcop-usb.c               |  9 ++--
 drivers/media/usb/b2c2/flexcop-usb.h               |  2 +-
 9 files changed, 97 insertions(+), 40 deletions(-)
