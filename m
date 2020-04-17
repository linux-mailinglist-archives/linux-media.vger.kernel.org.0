Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1BE431AE2E6
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2020 18:59:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727896AbgDQQ7D (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Apr 2020 12:59:03 -0400
Received: from mail.kernel.org ([198.145.29.99]:46066 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727123AbgDQQ7B (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Apr 2020 12:59:01 -0400
Received: from mail.kernel.org (ip5f5ad4d8.dynamic.kabel-deutschland.de [95.90.212.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B7C602223C;
        Fri, 17 Apr 2020 16:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1587142740;
        bh=Jg2IGMu1HKXMh3QjTb3oRhIBX3xmwmF4zz7Erzgo3oQ=;
        h=From:To:Cc:Subject:Date:From;
        b=EOFHV+JKhHrht4X8WLCdR1tf3HF1fA14EBKjpFLMzEripyRZd8blKseDtTbfGc1jp
         wH2k84zxXKRosgbC5bNmItTuI5PtJKRJg9q8raxO1P5HNBlBZwJCHdZHtj1QHzGLRe
         F/qRhwfq7vzSWx4yCRTEWxHbblBHHtfYLOd+FAs8=
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
        (envelope-from <mchehab@kernel.org>)
        id 1jPUKO-007wL5-Vo; Fri, 17 Apr 2020 18:58:56 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Richard Fontana <rfontana@redhat.com>,
        Antti Palosaari <crope@iki.fi>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Allison Randal <allison@lohutok.net>,
        Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH 00/15] More media admin-guide documentation improvements
Date:   Fri, 17 Apr 2020 18:58:41 +0200
Message-Id: <cover.1587142382.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.25.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This series contain several patches improving the media documentation.

The last patches on this series are related to the (future) removal of the old
incomplete "cards.rst" documentation, plus cleaning up reduntant info on
other driver-specific places. With this series, all USB IDs supported by the
media subsystem using USB vendor class will be documented.

I should be doing the same for the DVB PCI drivers, making it a complete
reference for the PC devices that are supported by the media subsystem.

Once finished, I should be removing the redundant data elsewhere within
the docs.

Mauro Carvalho Chehab (15):
  media: dvb-usb-ids.h: fix an USB PID name
  media: dvb-usb-v2: use DVB_USB_DEVICE() macro
  media: pwc-if.c: Update comments about each pwc supported model
  media: pwc-if: place USB device list on numberical order
  media: admin-guide: add a card list for cx231xx boards
  media: admin-guide: update em28xx cardlist
  media: admin-guide: Add an introduction chapter
  media: admin-guide: add a generic building guide
  media: admin-guide: improve cardlist.rst documentation
  media: admin-guide: add dvb-usb-v2 card lists
  media: admin-guide: add cardlist for dib0700 driver
  media: admin-guide: add dibusb-mb and dibusb-mc card lists
  media: admin-guide: add support for the remaining dvb-usb boards
  media: admin-guide: add a card list for the Siano driver
  media: admin-guide: add a cardlist for all other USB cards

 Documentation/admin-guide/media/building.rst  | 357 ++++++++++++++++++
 Documentation/admin-guide/media/cardlist.rst  | 134 ++++++-
 .../admin-guide/media/cx231xx-cardlist.rst    |  99 +++++
 .../media/dvb-usb-a800-cardlist.rst           |  16 +
 .../media/dvb-usb-af9005-cardlist.rst         |  20 +
 .../media/dvb-usb-af9015-cardlist.rst         |  80 ++++
 .../media/dvb-usb-af9035-cardlist.rst         |  74 ++++
 .../media/dvb-usb-anysee-cardlist.rst         |  16 +
 .../media/dvb-usb-au6610-cardlist.rst         |  16 +
 .../media/dvb-usb-az6007-cardlist.rst         |  20 +
 .../media/dvb-usb-az6027-cardlist.rst         |  24 ++
 .../media/dvb-usb-ce6230-cardlist.rst         |  18 +
 .../media/dvb-usb-cinergyT2-cardlist.rst      |  16 +
 .../media/dvb-usb-cxusb-cardlist.rst          |  40 ++
 .../media/dvb-usb-dib0700-cardlist.rst        | 162 ++++++++
 .../media/dvb-usb-dibusb-mb-cardlist.rst      |  42 +++
 .../media/dvb-usb-dibusb-mc-cardlist.rst      |  30 ++
 .../media/dvb-usb-digitv-cardlist.rst         |  16 +
 .../media/dvb-usb-dtt200u-cardlist.rst        |  22 ++
 .../media/dvb-usb-dtv5100-cardlist.rst        |  16 +
 .../media/dvb-usb-dvbsky-cardlist.rst         |  42 +++
 .../media/dvb-usb-dw2102-cardlist.rst         |  52 +++
 .../media/dvb-usb-ec168-cardlist.rst          |  16 +
 .../media/dvb-usb-gl861-cardlist.rst          |  20 +
 .../media/dvb-usb-gp8psk-cardlist.rst         |  22 ++
 .../media/dvb-usb-lmedm04-cardlist.rst        |  20 +
 .../media/dvb-usb-m920x-cardlist.rst          |  26 ++
 .../media/dvb-usb-mxl111sf-cardlist.rst       |  36 ++
 .../media/dvb-usb-nova-t-usb2-cardlist.rst    |  16 +
 .../media/dvb-usb-opera1-cardlist.rst         |  16 +
 .../media/dvb-usb-pctv452e-cardlist.rst       |  20 +
 .../media/dvb-usb-rtl28xxu-cardlist.rst       |  80 ++++
 .../media/dvb-usb-technisat-usb2-cardlist.rst |  16 +
 .../media/dvb-usb-ttusb2-cardlist.rst         |  24 ++
 .../media/dvb-usb-umt-010-cardlist.rst        |  16 +
 .../media/dvb-usb-vp702x-cardlist.rst         |  16 +
 .../media/dvb-usb-vp7045-cardlist.rst         |  18 +
 .../media/dvb-usb-zd1301-cardlist.rst         |  16 +
 .../admin-guide/media/em28xx-cardlist.rst     |   4 +
 Documentation/admin-guide/media/index.rst     |   3 +
 Documentation/admin-guide/media/intro.rst     |  25 ++
 .../admin-guide/media/other-usb-cardlist.rst  |  92 +++++
 .../admin-guide/media/siano-cardlist.rst      |  56 +++
 drivers/media/usb/dvb-usb-v2/ec168.c          |  25 +-
 drivers/media/usb/dvb-usb-v2/gl861.c          |   2 +-
 drivers/media/usb/pwc/pwc-if.c                |  54 +--
 include/media/dvb-usb-ids.h                   |   2 +-
 47 files changed, 1909 insertions(+), 44 deletions(-)
 create mode 100644 Documentation/admin-guide/media/building.rst
 create mode 100644 Documentation/admin-guide/media/cx231xx-cardlist.rst
 create mode 100644 Documentation/admin-guide/media/dvb-usb-a800-cardlist.rst
 create mode 100644 Documentation/admin-guide/media/dvb-usb-af9005-cardlist.rst
 create mode 100644 Documentation/admin-guide/media/dvb-usb-af9015-cardlist.rst
 create mode 100644 Documentation/admin-guide/media/dvb-usb-af9035-cardlist.rst
 create mode 100644 Documentation/admin-guide/media/dvb-usb-anysee-cardlist.rst
 create mode 100644 Documentation/admin-guide/media/dvb-usb-au6610-cardlist.rst
 create mode 100644 Documentation/admin-guide/media/dvb-usb-az6007-cardlist.rst
 create mode 100644 Documentation/admin-guide/media/dvb-usb-az6027-cardlist.rst
 create mode 100644 Documentation/admin-guide/media/dvb-usb-ce6230-cardlist.rst
 create mode 100644 Documentation/admin-guide/media/dvb-usb-cinergyT2-cardlist.rst
 create mode 100644 Documentation/admin-guide/media/dvb-usb-cxusb-cardlist.rst
 create mode 100644 Documentation/admin-guide/media/dvb-usb-dib0700-cardlist.rst
 create mode 100644 Documentation/admin-guide/media/dvb-usb-dibusb-mb-cardlist.rst
 create mode 100644 Documentation/admin-guide/media/dvb-usb-dibusb-mc-cardlist.rst
 create mode 100644 Documentation/admin-guide/media/dvb-usb-digitv-cardlist.rst
 create mode 100644 Documentation/admin-guide/media/dvb-usb-dtt200u-cardlist.rst
 create mode 100644 Documentation/admin-guide/media/dvb-usb-dtv5100-cardlist.rst
 create mode 100644 Documentation/admin-guide/media/dvb-usb-dvbsky-cardlist.rst
 create mode 100644 Documentation/admin-guide/media/dvb-usb-dw2102-cardlist.rst
 create mode 100644 Documentation/admin-guide/media/dvb-usb-ec168-cardlist.rst
 create mode 100644 Documentation/admin-guide/media/dvb-usb-gl861-cardlist.rst
 create mode 100644 Documentation/admin-guide/media/dvb-usb-gp8psk-cardlist.rst
 create mode 100644 Documentation/admin-guide/media/dvb-usb-lmedm04-cardlist.rst
 create mode 100644 Documentation/admin-guide/media/dvb-usb-m920x-cardlist.rst
 create mode 100644 Documentation/admin-guide/media/dvb-usb-mxl111sf-cardlist.rst
 create mode 100644 Documentation/admin-guide/media/dvb-usb-nova-t-usb2-cardlist.rst
 create mode 100644 Documentation/admin-guide/media/dvb-usb-opera1-cardlist.rst
 create mode 100644 Documentation/admin-guide/media/dvb-usb-pctv452e-cardlist.rst
 create mode 100644 Documentation/admin-guide/media/dvb-usb-rtl28xxu-cardlist.rst
 create mode 100644 Documentation/admin-guide/media/dvb-usb-technisat-usb2-cardlist.rst
 create mode 100644 Documentation/admin-guide/media/dvb-usb-ttusb2-cardlist.rst
 create mode 100644 Documentation/admin-guide/media/dvb-usb-umt-010-cardlist.rst
 create mode 100644 Documentation/admin-guide/media/dvb-usb-vp702x-cardlist.rst
 create mode 100644 Documentation/admin-guide/media/dvb-usb-vp7045-cardlist.rst
 create mode 100644 Documentation/admin-guide/media/dvb-usb-zd1301-cardlist.rst
 create mode 100644 Documentation/admin-guide/media/intro.rst
 create mode 100644 Documentation/admin-guide/media/other-usb-cardlist.rst
 create mode 100644 Documentation/admin-guide/media/siano-cardlist.rst

-- 
2.25.2


