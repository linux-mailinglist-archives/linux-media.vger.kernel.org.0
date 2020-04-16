Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6FE01ABF84
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2020 13:37:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2506453AbgDPLhJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Apr 2020 07:37:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:38620 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2506449AbgDPLhB (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Apr 2020 07:37:01 -0400
Received: from mail.kernel.org (ip5f5ad4d8.dynamic.kabel-deutschland.de [95.90.212.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8F32A21D94;
        Thu, 16 Apr 2020 11:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1587037017;
        bh=msV7t35Fq7F42zL/n4KkGctt9Xh5d81j9nIh7OpqDe8=;
        h=From:To:Cc:Subject:Date:From;
        b=ZeNn+AZqFgwPqazqsJX4/DeIRQidpkuLTiJSzdjD8Vzcw9mGbN/pDPqMG15uFnhq7
         TjrPcVMag8rCWk/CsFYnlLuM/XN3ntgXHP5mIiGXEiStOrAvi/+MIyoRNj4YfS5bLp
         +AC2SxRscy2u1c4rERvCpvwTU25dSRMQPtArg1ag=
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
        (envelope-from <mchehab@kernel.org>)
        id 1jP2pD-007SZ8-0I; Thu, 16 Apr 2020 13:36:55 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 0/4] Improve media admin-guide
Date:   Thu, 16 Apr 2020 13:36:49 +0200
Message-Id: <cover.1587036920.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.25.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Currently, the media admin-guide is just a random set of documents.

Add an introductory chapter and a building guide at the beginning.
While here, add a cardlist for cx231xx boards and update the em28xx
cardlist.

Mauro Carvalho Chehab (4):
  media: admin-guide: add a card list for cx231xx boards
  media: admin-guide: update em28xx cardlist
  media: admin-guide: Add an introduction chapter
  media: admin-guide: add a generic building guide

 Documentation/admin-guide/media/building.rst  | 357 ++++++++++++++++++
 Documentation/admin-guide/media/cardlist.rst  |   1 +
 .../admin-guide/media/cx231xx-cardlist.rst    |  99 +++++
 .../admin-guide/media/em28xx-cardlist.rst     |   4 +
 Documentation/admin-guide/media/index.rst     |   3 +
 Documentation/admin-guide/media/intro.rst     |  25 ++
 6 files changed, 489 insertions(+)
 create mode 100644 Documentation/admin-guide/media/building.rst
 create mode 100644 Documentation/admin-guide/media/cx231xx-cardlist.rst
 create mode 100644 Documentation/admin-guide/media/intro.rst

-- 
2.25.2


