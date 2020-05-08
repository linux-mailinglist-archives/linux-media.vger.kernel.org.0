Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D00F1CA780
	for <lists+linux-media@lfdr.de>; Fri,  8 May 2020 11:48:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726690AbgEHJsA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 8 May 2020 05:48:00 -0400
Received: from gofer.mess.org ([88.97.38.141]:43885 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725815AbgEHJsA (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 8 May 2020 05:48:00 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 3DF32C6429; Fri,  8 May 2020 10:47:59 +0100 (BST)
Date:   Fri, 8 May 2020 10:47:59 +0100
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL FOR v5.8] Small fixes
Message-ID: <20200508094758.GC1214@gofer.mess.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit 5b9f8e4ac9473962fa0e824fd1f04138600d459d:

  media: ipu3.rst: fix a build warning (2020-05-06 14:49:41 +0200)

are available in the Git repository at:

  git://linuxtv.org/syoung/media_tree.git tags/v5.8d

for you to fetch changes up to 9757af7af9480de959e3a13b96a8f506b12740b8:

  media: dvb-frontends: remove redundant initialization of variable status (2020-05-08 09:26:21 +0100)

----------------------------------------------------------------
v5.8d

----------------------------------------------------------------
Colin Ian King (4):
      media: dvb: remove redundant assignment to variable bw
      media: stv0900_core: remove redundant assignment to variable val
      media: mantis_dvb: remove redundant initialization to variable result
      media: dvb-frontends: remove redundant initialization of variable status

Jia-Ju Bai (1):
      media: usb: ttusb-dec: reduce the number of memory reads in ttusb_dec_handle_irq()

Sean Young (2):
      media: gpio-ir-tx: improve precision of transmitted signal due to scheduling
      media: gpio-ir-tx: allow transmission without carrier

 drivers/media/dvb-frontends/cxd2880/cxd2880_top.c |  2 +-
 drivers/media/dvb-frontends/drxk_hard.c           |  2 +-
 drivers/media/dvb-frontends/stv0900_core.c        |  2 +-
 drivers/media/pci/mantis/mantis_dvb.c             |  2 +-
 drivers/media/rc/gpio-ir-tx.c                     | 51 ++++++++++++++++++-----
 drivers/media/usb/ttusb-dec/ttusb_dec.c           |  9 ++--
 6 files changed, 50 insertions(+), 18 deletions(-)
