Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 235781AEB70
	for <lists+linux-media@lfdr.de>; Sat, 18 Apr 2020 11:44:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725982AbgDRJoe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 18 Apr 2020 05:44:34 -0400
Received: from mail.kernel.org ([198.145.29.99]:57306 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725862AbgDRJod (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 18 Apr 2020 05:44:33 -0400
Received: from mail.kernel.org (ip5f5ad4d8.dynamic.kabel-deutschland.de [95.90.212.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C9F4421D93;
        Sat, 18 Apr 2020 09:44:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1587203073;
        bh=CMBQFZwbjLmXIAcXmO3eaQpDCWT50kbSHGAweYwNzCg=;
        h=From:To:Cc:Subject:Date:From;
        b=dOv9B9itdv7k3uZtrhZ/DSRyRltwbJJjTDbYI5wc4UPdPLCzjkxlAL+8+aWWefL86
         W4of6nDOB68YU5YExAzgzK1QIYxQFw83jJd4+m0caJmJ5kQcjJzSRlRFZnOswakNTS
         i/VMGA3vt+oN2tyCMAQAwe+44DfP1Z2SMOhtZB0c=
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
        (envelope-from <mchehab@kernel.org>)
        id 1jPk1W-0081Nn-2O; Sat, 18 Apr 2020 11:44:30 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 0/9]  More media admin-guide documentation improvements (part 2)
Date:   Sat, 18 Apr 2020 11:44:20 +0200
Message-Id: <cover.1587202259.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.25.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This series complement the series I sent on Friday, improving the media
cards list.

After this series, all non-staging main drivers should be documented there.

Mauro Carvalho Chehab (9):
  media: admin-guide: split DVB cards.rst
  media: admin-guide: replace the frontend drivers list
  media: admin-guide: add a list of media PCI cards
  media: admin-guide: add a table with USB drivers
  media: admin-guide: add a list of platform drivers
  media: admin-guide: add a list of I2C drivers
  media: admin-guide: add SPI cards to platform drivers
  media: admin-guide: add card lists for radio and firewire
  media: admin-guide: add test-drivers

 Documentation/admin-guide/media/cardlist.rst  | 557 +++++++++++++++++-
 Documentation/admin-guide/media/cards.rst     | 146 -----
 .../admin-guide/media/frontend-cardlist.rst   | 226 +++++++
 Documentation/admin-guide/media/index.rst     |   1 -
 4 files changed, 780 insertions(+), 150 deletions(-)
 delete mode 100644 Documentation/admin-guide/media/cards.rst
 create mode 100644 Documentation/admin-guide/media/frontend-cardlist.rst

-- 
2.25.2


