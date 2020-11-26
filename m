Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E4492C545A
	for <lists+linux-media@lfdr.de>; Thu, 26 Nov 2020 14:02:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389750AbgKZNBD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Nov 2020 08:01:03 -0500
Received: from mail.kernel.org ([198.145.29.99]:44536 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389266AbgKZNBC (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Nov 2020 08:01:02 -0500
Received: from mail.kernel.org (ip5f5ad5d3.dynamic.kabel-deutschland.de [95.90.213.211])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A6A9821D7E;
        Thu, 26 Nov 2020 13:01:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606395661;
        bh=z1G7JuRBOm2MCobBgCtQEHeLyiUS240r7MXCWKxhybk=;
        h=From:To:Cc:Subject:Date:From;
        b=qqdmHUn5X4xdUll9i4TolJLMCnyHXPvl7WubRm/UI7L6TXcF+TQcuyfbK58eFT1Ul
         7Gfr1LECcrPkVztvFznrVIuCJTtOe4c/64g4k1DC/xRahcPyKEurxT3w/C3jxiICzd
         dZJwkBIuvM9mLM7340nI/g0qa3chiCtviwkHDz2g=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kiGtN-005rbK-Q2; Thu, 26 Nov 2020 14:00:57 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Sean Young <sean@mess.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] Improve LIRC documentation
Date:   Thu, 26 Nov 2020 14:00:54 +0100
Message-Id: <cover.1606395586.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sean,

Those two patches improve LIRC uAPI docs by adding the structs documented at
lirc.h to the output of Documentation/output/userspace-api/media/rc/lirc-dev-intro.html

Please review.

Mauro Carvalho Chehab (2):
  media: docs: uAPI: rc: dual-license the docs with GPL v2
  media: rc: improve LIRC documentation

 Documentation/userspace-api/media/rc/keytable.c.rst |  2 +-
 .../userspace-api/media/rc/lirc-dev-intro.rst       | 13 ++++++++++---
 Documentation/userspace-api/media/rc/lirc-dev.rst   |  2 +-
 Documentation/userspace-api/media/rc/lirc-func.rst  |  2 +-
 .../userspace-api/media/rc/lirc-get-features.rst    |  2 +-
 .../userspace-api/media/rc/lirc-get-rec-mode.rst    |  2 +-
 .../media/rc/lirc-get-rec-resolution.rst            |  2 +-
 .../userspace-api/media/rc/lirc-get-send-mode.rst   |  2 +-
 .../userspace-api/media/rc/lirc-get-timeout.rst     |  2 +-
 .../userspace-api/media/rc/lirc-header.rst          |  2 +-
 Documentation/userspace-api/media/rc/lirc-read.rst  |  2 +-
 .../media/rc/lirc-set-measure-carrier-mode.rst      |  2 +-
 .../media/rc/lirc-set-rec-carrier-range.rst         |  2 +-
 .../userspace-api/media/rc/lirc-set-rec-carrier.rst |  2 +-
 .../media/rc/lirc-set-rec-timeout-reports.rst       |  2 +-
 .../userspace-api/media/rc/lirc-set-rec-timeout.rst |  2 +-
 .../media/rc/lirc-set-send-carrier.rst              |  2 +-
 .../media/rc/lirc-set-send-duty-cycle.rst           |  2 +-
 .../media/rc/lirc-set-transmitter-mask.rst          |  2 +-
 .../media/rc/lirc-set-wideband-receiver.rst         |  2 +-
 Documentation/userspace-api/media/rc/lirc-write.rst |  2 +-
 Documentation/userspace-api/media/rc/rc-intro.rst   |  2 +-
 Documentation/userspace-api/media/rc/rc-protos.rst  |  2 +-
 .../userspace-api/media/rc/rc-sysfs-nodes.rst       |  2 +-
 .../userspace-api/media/rc/rc-table-change.rst      |  2 +-
 Documentation/userspace-api/media/rc/rc-tables.rst  |  2 +-
 .../userspace-api/media/rc/remote_controllers.rst   |  2 +-
 include/uapi/linux/lirc.h                           |  2 +-
 28 files changed, 37 insertions(+), 30 deletions(-)

-- 
2.28.0


