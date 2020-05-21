Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E79881DCB04
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2020 12:26:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728397AbgEUK0y (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 May 2020 06:26:54 -0400
Received: from gofer.mess.org ([88.97.38.141]:60487 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727034AbgEUK0y (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 May 2020 06:26:54 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id F0960C6334; Thu, 21 May 2020 11:26:52 +0100 (BST)
Date:   Thu, 21 May 2020 11:26:52 +0100
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL FOR v5.8] Small DVB fixes
Message-ID: <20200521102652.GA30462@gofer.mess.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit 960b2dee908b0fc51cf670841de13b40b44aaaae:

  media: dt-bindings: phy: phy-rockchip-dphy-rx0: move rockchip dphy rx0 bindings out of staging (2020-05-20 15:22:27 +0200)

are available in the Git repository at:

  git://linuxtv.org/syoung/media_tree.git tags/v5.8e

for you to fetch changes up to 81e7e69e0ddf94c34135ea123f66d024c917ed62:

  media: dvb-usb: Add Cinergy S2 PCIe Dual Port support (2020-05-21 10:19:20 +0100)

----------------------------------------------------------------
v5.8e

----------------------------------------------------------------
Brad Love (1):
      media: dvbdev: Fix tuner->demod media controller link

Dirk Nehring (1):
      media: dvb-usb: Add Cinergy S2 PCIe Dual Port support

 drivers/media/dvb-core/dvbdev.c    |  5 +++--
 drivers/media/usb/dvb-usb/dw2102.c | 25 +++++++++++++++++++++----
 include/media/dvb-usb-ids.h        |  3 +++
 3 files changed, 27 insertions(+), 6 deletions(-)
