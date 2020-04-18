Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8BD81AEBD7
	for <lists+linux-media@lfdr.de>; Sat, 18 Apr 2020 12:37:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725892AbgDRKg4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 18 Apr 2020 06:36:56 -0400
Received: from mail.kernel.org ([198.145.29.99]:40744 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725879AbgDRKg4 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 18 Apr 2020 06:36:56 -0400
Received: from mail.kernel.org (ip5f5ad4d8.dynamic.kabel-deutschland.de [95.90.212.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 963A82220A;
        Sat, 18 Apr 2020 10:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1587206215;
        bh=BNHwS2MybjnfNhmgbySMKz3pG0msrDqgLlQ3XxWV4qw=;
        h=From:To:Cc:Subject:Date:From;
        b=iKlvs36t+HJdhuz4Njstn7VbfjatGaLkd+mDGIvBvgGJpjlWtd3637ri8XxHKm0H8
         GaB/OMklYlAzTg8ppbQzJF2U0g+RuPhAb3X3ml7Y1KTR09OQRJmV8fbJhtf7Sqrb9p
         6hwJRaOG17cOxjyAYdV3Q9QIRBwxZxUdC95PoPEA=
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
        (envelope-from <mchehab@kernel.org>)
        id 1jPkqD-00838Q-IQ; Sat, 18 Apr 2020 12:36:53 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 0/3] Reorg the media admin-guide
Date:   Sat, 18 Apr 2020 12:36:49 +0200
Message-Id: <cover.1587206071.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.25.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Change numberation and chapter order at the media-admin guide,
in order to place generic documents before driver-specific ones.

Mauro Carvalho Chehab (3):
  media: admin-guide: bt8xx.rst: fix a broken cross-reference
  media: admin-guide: reorganize the guide
  media: admin-guide: split driver-specific indexes to new files

 Documentation/admin-guide/media/bt8xx.rst     |  2 +-
 .../admin-guide/media/cec-drivers.rst         | 10 +++
 .../admin-guide/media/dvb-drivers.rst         | 16 ++++
 Documentation/admin-guide/media/dvb.rst       | 12 +++
 Documentation/admin-guide/media/index.rst     | 89 +++----------------
 ...{v4l-with-ir.rst => remote-controller.rst} |  9 +-
 .../admin-guide/media/v4l-drivers.rst         | 33 +++++++
 7 files changed, 90 insertions(+), 81 deletions(-)
 create mode 100644 Documentation/admin-guide/media/cec-drivers.rst
 create mode 100644 Documentation/admin-guide/media/dvb-drivers.rst
 create mode 100644 Documentation/admin-guide/media/dvb.rst
 rename Documentation/admin-guide/media/{v4l-with-ir.rst => remote-controller.rst} (96%)
 create mode 100644 Documentation/admin-guide/media/v4l-drivers.rst

-- 
2.25.2


