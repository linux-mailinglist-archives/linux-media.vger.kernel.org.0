Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CE76613019E
	for <lists+linux-media@lfdr.de>; Sat,  4 Jan 2020 10:31:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726133AbgADJb4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 4 Jan 2020 04:31:56 -0500
Received: from gofer.mess.org ([88.97.38.141]:46263 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726094AbgADJb4 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 4 Jan 2020 04:31:56 -0500
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 4EC0711A001; Sat,  4 Jan 2020 09:31:54 +0000 (GMT)
Date:   Sat, 4 Jan 2020 09:31:54 +0000
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL FOR v5.6] More RC & DVB
Message-ID: <20200104093154.GA10172@gofer.mess.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

Building the kernel with clang produces some useful warnings, which I've
started patching up. There are a bunch of formatting changes and some new
hardware support.

Thanks
Sean

The following changes since commit 51e40a0dbe53cebe1f4b85bb47e250dc5a89b254:

  media: sun4i-csi: Add support for A10 CSI1 camera sensor interface (2020-01-04 08:21:35 +0100)

are available in the Git repository at:

  git://linuxtv.org/syoung/media_tree.git tags/v5.6b

for you to fetch changes up to 642048081c8618f4b7ae9f0aa3f2c644f9578956:

  media: rc: ir-hix5hd2: add hi3796cv300-ir support (2020-01-04 08:41:39 +0000)

----------------------------------------------------------------
v5.6b

----------------------------------------------------------------
Daniel W. S. Almeida (6):
      media: dvb_dummy_fe: Fix ERROR: POINTER_LOCATION, AVOID_EXTERN and long lines
      media: dvb_dummy_fe: Add blank line after declaration
      media: dvb_dummy_fe: change printk to pr_warn
      media: as102: improve formatting
      Documentation: media: dtv-frontend.rst: fix a few minor typos
      media: au8522: improve formatting

Johann Friedrichs (1):
      media: dvb-core: Fix receiving invalid EIT-sections

Sean Young (4):
      media: dib7000m: incorrect format specifier detected by clang
      media: dib7000p: incorrect format specifier detected by clang
      media: dib0070: incorrect format specifiers detected by clang
      media: dib0090: incorrect format specifier detected by clang

Shawn Guo (2):
      dt-bindings: media: add "hisilicon,hi3796cv300-ir" compatible
      media: rc: ir-hix5hd2: add hi3796cv300-ir support

 .../devicetree/bindings/media/hix5hd2-ir.txt       |  3 +-
 Documentation/media/kapi/dtv-frontend.rst          | 16 ++---
 drivers/media/dvb-core/dvb_demux.c                 |  1 +
 drivers/media/dvb-frontends/as102_fe.c             |  3 +-
 drivers/media/dvb-frontends/au8522_decoder.c       |  2 +-
 drivers/media/dvb-frontends/dib0070.c              | 23 +++---
 drivers/media/dvb-frontends/dib0090.c              |  3 +-
 drivers/media/dvb-frontends/dib7000m.c             |  2 +-
 drivers/media/dvb-frontends/dib7000p.c             |  2 +-
 drivers/media/dvb-frontends/dvb_dummy_fe.c         | 81 ++++++++++++++--------
 drivers/media/dvb-frontends/dvb_dummy_fe.h         | 12 ++--
 drivers/media/rc/ir-hix5hd2.c                      | 79 ++++++++++++++++-----
 12 files changed, 154 insertions(+), 73 deletions(-)
