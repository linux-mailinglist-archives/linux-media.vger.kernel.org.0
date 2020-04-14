Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C182D1A7693
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2020 10:51:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437098AbgDNIvM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Apr 2020 04:51:12 -0400
Received: from mail.kernel.org ([198.145.29.99]:51978 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2437050AbgDNIvJ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Apr 2020 04:51:09 -0400
Received: from mail.kernel.org (ip5f5ad4d8.dynamic.kabel-deutschland.de [95.90.212.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8EB17206E9;
        Tue, 14 Apr 2020 08:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1586854268;
        bh=t1+dr3ujTFMjvSLdLyEXD8Pe1jAE2xCvXRe2uy2VTZ4=;
        h=From:To:Cc:Subject:Date:From;
        b=d5GZMOr1q9Mrj55WMdDLvafZDlRXSyUrUMty/QIR0OJ9tl22h5ayWIdIlthBQcpUM
         PP1RNLj299QlbVPtHm0KDCWZyg8lWdDCSWqVm9iY/faxlxky/8JSecO6wUmYf+PJC7
         EkLDJiQO3kZ9Azhp3zKhgTHN9q6wWu9h+tPRx650=
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
        (envelope-from <mchehab@kernel.org>)
        id 1jOHHe-002wyj-Pa; Tue, 14 Apr 2020 10:51:06 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        Antoine Jacquet <royale@zerezo.com>, linux-usb@vger.kernel.org
Subject: [PATCH 00/19] media: some documentation updates
Date:   Tue, 14 Apr 2020 10:50:46 +0200
Message-Id: <cover.1586854191.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.25.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

While looking at the media reorg struct, I noticed some things that
were outdated. So, I went ahead and started updating some documentation,
in order to make them to reflect the current state.

Mauro Carvalho Chehab (19):
  media: docs: update cardlists
  media: docs: split avermedia.rst contents on two files
  media: docs: dvb_intro.rst: update its contents
  media: docs: intro.rst actually contain DVB references
  media: docs: update avermedia.rst contents
  media: docs: bt8xx.rst: update document info
  media: docs: update bttv.rst information
  media: docs: add a cardlist for cx18 boards
  media: docs: cpia2.rst: do some cleanups
  media: docs: update Digital TV faq.rst
  media: docs: saa7134.rst: update the documentation
  media: docs: zr364xx: update documentation
  media: docs: get rid of obsoleted udev documentation
  media: docs: Add a master topic for the index file
  media: docs: cleanup bttv-devel.rst file
  media: docs: fix references for vimc
  media: docs: move copyrights to the end and update them
  media: docs: add GPLv2 for uAPI guide
  media: docs: add cros-references to the other media guides

 Documentation/admin-guide/media/avermedia.rst | 189 +-----
 Documentation/admin-guide/media/bt8xx.rst     | 134 ++--
 Documentation/admin-guide/media/bttv.rst      | 311 ++++-----
 Documentation/admin-guide/media/cardlist.rst  |   1 +
 Documentation/admin-guide/media/cpia2.rst     |  10 +-
 .../admin-guide/media/cx18-cardlist.rst       |  17 +
 .../admin-guide/media/cx23885-cardlist.rst    |   4 +
 .../admin-guide/media/cx88-cardlist.rst       |   4 +
 Documentation/admin-guide/media/dvb_intro.rst | 616 ++++++++++++++++++
 .../admin-guide/media/dvb_references.rst      |  29 +
 .../admin-guide/media/em28xx-cardlist.rst     |   6 +-
 Documentation/admin-guide/media/faq.rst       | 253 ++++---
 Documentation/admin-guide/media/index.rst     |  44 +-
 Documentation/admin-guide/media/intro.rst     |  23 -
 Documentation/admin-guide/media/saa7134.rst   |  57 +-
 Documentation/admin-guide/media/udev.rst      |  63 --
 Documentation/admin-guide/media/zr364xx.rst   |  28 +-
 .../driver-api/media/drivers/bttv-devel.rst   |  53 +-
 .../driver-api/media/drivers/index.rst        |  37 +-
 .../driver-api/media/drivers/vimc-devel.rst   |   4 +-
 Documentation/driver-api/media/index.rst      |  34 +-
 Documentation/userspace-api/media/index.rst   |  44 +-
 MAINTAINERS                                   |   2 +-
 23 files changed, 1228 insertions(+), 735 deletions(-)
 create mode 100644 Documentation/admin-guide/media/cx18-cardlist.rst
 create mode 100644 Documentation/admin-guide/media/dvb_intro.rst
 create mode 100644 Documentation/admin-guide/media/dvb_references.rst
 delete mode 100644 Documentation/admin-guide/media/intro.rst
 delete mode 100644 Documentation/admin-guide/media/udev.rst

-- 
2.25.2


