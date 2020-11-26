Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A4B52C510A
	for <lists+linux-media@lfdr.de>; Thu, 26 Nov 2020 10:25:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731638AbgKZJYO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Nov 2020 04:24:14 -0500
Received: from gofer.mess.org ([88.97.38.141]:41481 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730318AbgKZJYN (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Nov 2020 04:24:13 -0500
Received: by gofer.mess.org (Postfix, from userid 1000)
        id AD29211A001; Thu, 26 Nov 2020 09:24:12 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mess.org; s=2020;
        t=1606382652; bh=gEl5oN9cF/lSKitfhMZQHo5mdbug1Hgfbk9W1sIhelo=;
        h=Date:From:To:Subject:From;
        b=pMeoenzFDGR5V1PJCuOqciOvowrLg665j9KPQ3pgJ5uivc0/fezPj+v+oSC7H8iu+
         qf24o+3pS9DfJtgON9joWoOeC/ZCUcntQi/TrDHA9+KAeYTPb/4W350h0NgprKMPH4
         BWQLaoYnVhjYkY9RmWu6sGIQ0SibHVZKhP8DVum1+SvjXF9KXoKT6DfmkqJa+PWdmO
         EC96wD3PUiL6wqCYWh/SbdbqGXU1L0cZDQpJzijaOFjTgpNMPEYSn2bSwapE7mbm5X
         5Bil73KBAsskJtvSOecDHbzgu6BzDnQLHVruSYFSskw039hjPeGhtyUtRpeUB0TOTw
         uiWJYKVAv4ynw==
Date:   Thu, 26 Nov 2020 09:24:12 +0000
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL FOR v5.11] RC/DVB fixes #2
Message-ID: <20201126092412.GA16924@gofer.mess.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit 4863b93cfd2dfe88557f820b3399c3fa2163ec43:

  media: camss: csiphy: Set rate on csiX_phy clock on SDM630/660 (2020-11-25 15:02:44 +0100)

are available in the Git repository at:

  git://linuxtv.org/syoung/media_tree.git tags/v5.11c

for you to fetch changes up to 7923089c680ed565451ebe4e27531b30c8468a57:

  media: lirc: fix lirc.h documentation generation (2020-11-26 09:06:44 +0000)

----------------------------------------------------------------
v5.11c

----------------------------------------------------------------
Christian Hewitt (1):
      media: rc: add keymap for KHAMSIN remote

Kai Muenz (1):
      media: dvb-usb: Add Hauppauge MAX S2's USB-IDs

Keita Suzuki (1):
      media: siano: fix memory leak of debugfs members in smsdvb_hotplug

Sean Young (1):
      media: lirc: fix lirc.h documentation generation

 Documentation/devicetree/bindings/media/rc.yaml    |  1 +
 .../userspace-api/media/lirc.h.rst.exceptions      |  1 +
 drivers/media/common/siano/smsdvb-main.c           |  5 +-
 drivers/media/rc/keymaps/Makefile                  |  1 +
 drivers/media/rc/keymaps/rc-khamsin.c              | 75 ++++++++++++++++++++++
 drivers/media/usb/dvb-usb/dw2102.c                 |  8 ++-
 include/media/rc-map.h                             |  1 +
 7 files changed, 90 insertions(+), 2 deletions(-)
 create mode 100644 drivers/media/rc/keymaps/rc-khamsin.c
