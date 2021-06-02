Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 610F0398DD2
	for <lists+linux-media@lfdr.de>; Wed,  2 Jun 2021 17:05:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230406AbhFBPHK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Jun 2021 11:07:10 -0400
Received: from mail.kernel.org ([198.145.29.99]:37130 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230440AbhFBPHJ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 2 Jun 2021 11:07:09 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id E2620613B4;
        Wed,  2 Jun 2021 15:05:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622646326;
        bh=b+jdtrhtRI+ZjAAV+yF/Av7G1IK6LL708dZnBgdl8Mg=;
        h=From:To:Cc:Subject:Date:From;
        b=rO14wyPdQMjHckz8zEb6yN5k81W9JYtgjReylqQNKdBvIz6Z/tNwzFq0bebvWIyfw
         Zo8v4LtUCXSjSQLBx2UJEgT/O8t4/VXTV9DdIRjZyDdtNCVEQB9I3qWp6L9kihKmuB
         E21RyyRY3g7qOTbNBEWSkCM6/NVlsOVPGLOTaTFhFPGloAoS/562akzz3tld0PX6MF
         UpJxHsoNNMjTozdA0D4YxFUSNifAOUJmnqRcIE2RKfTUEx7fdNSaxq+BcyI5hFij5e
         mzt7fQJ5YW/cOyiPfNk5kRGTYvcBF9UDofhoS28+AMY1OeTAEUtxqiKQCm5hPMloGf
         1O5mmKSK53eMw==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1loSQu-006WaY-My; Wed, 02 Jun 2021 17:05:24 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Antti Palosaari <crope@iki.fi>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Michael Tretter <m.tretter@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Sean Young <sean@mess.org>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Subject: [PATCH 0/6] media: replace some chars on C files
Date:   Wed,  2 Jun 2021 17:05:17 +0200
Message-Id: <cover.1622646256.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There are a couple of non-ASCII characters inside the media code
that aren't agregating anything useful besides what's provided
by their ASCII equivalents. So, let's replace those.

Mauro Carvalho Chehab (6):
  media: gspca: ov519: replace RIGHT SINGLE QUOTATION MARK
  media: rtl28xxu: replace a NO-BREAK SPACE character
  media: allegro-dvt: avoid EN DASH char
  media: saa7134: drop a NO-BREAK SPACE
  media: rc: ite-cir: replace some an EN DASH
  media: pci: tw5864: avoid usage of some characters

 drivers/media/pci/saa7134/saa7134-tvaudio.c   |  2 +-
 drivers/media/pci/tw5864/tw5864-reg.h         | 62 +++++++++----------
 drivers/media/platform/allegro-dvt/nal-h264.c |  2 +-
 drivers/media/platform/allegro-dvt/nal-hevc.c |  2 +-
 drivers/media/rc/ite-cir.h                    |  2 +-
 drivers/media/usb/dvb-usb-v2/rtl28xxu.c       |  2 +-
 drivers/media/usb/gspca/ov519.c               |  2 +-
 7 files changed, 37 insertions(+), 37 deletions(-)

-- 
2.31.1


