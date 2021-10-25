Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E56994395EA
	for <lists+linux-media@lfdr.de>; Mon, 25 Oct 2021 14:17:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232846AbhJYMTw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 25 Oct 2021 08:19:52 -0400
Received: from mail.kernel.org ([198.145.29.99]:56246 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233055AbhJYMTm (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 Oct 2021 08:19:42 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id C946C60FE8;
        Mon, 25 Oct 2021 12:17:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1635164239;
        bh=OTfXiKes52lW7hrXozoKbF7ZCiazohPWYoVy7fKvAmM=;
        h=From:To:Cc:Subject:Date:From;
        b=MII536xOFIGLfJtq7fSQ23gwwhCaAq5U+rCgH6H13CadWasHdoVl/avXttHrGVbc1
         Kgs+cZCOWQPfV9T33L1837tocGcTT7ylL0Ne7WyOl3nrqVUkCJde0Kwd9UEChRdecW
         k7nBz4d1p5qkYzMhQMf1EvKI1dfQGrk4GlSTuoqMtQm2yPtlHrBQlNAM3ceRv3BJOZ
         S/jJU4QfdEQjSVLETzTlUXP2MeglOcREE/V7OkcEOiHFRdwRbVW7RygyN2kce1XxSX
         LVUQojktOiYgaFys6UPPD35bMuZupbr798uwWsT2rOD6724s/Uc6WyQpGUCd0DJY3b
         uW8ukSWKL2eZA==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1meyuU-0001mD-Au; Mon, 25 Oct 2021 14:17:02 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Sean Young <sean@mess.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Mike Isely <isely@pobox.com>,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        linux-media@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>
Subject: [PATCH 0/8] media: fix control-message timeouts
Date:   Mon, 25 Oct 2021 14:16:33 +0200
Message-Id: <20211025121641.6759-1-johan@kernel.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

A number of drivers throughout the tree were incorrectly specifying USB
message timeout values in jiffies instead of milliseconds.

This series fixes the media drivers that got it wrong.

Johan


Johan Hovold (8):
  media: mceusb: fix control-message timeouts
  media: redrat3: fix control-message timeouts
  media: flexcop-usb: fix control-message timeouts
  media: cpia2: fix control-message timeouts
  media: em28xx: fix control-message timeouts
  media: pvrusb2: fix control-message timeouts
  media: s2255: fix control-message timeouts
  media: stk1160: fix control-message timeouts

 drivers/media/rc/mceusb.c                |  8 ++++----
 drivers/media/rc/redrat3.c               | 22 +++++++++++-----------
 drivers/media/usb/b2c2/flexcop-usb.c     | 10 +++++-----
 drivers/media/usb/b2c2/flexcop-usb.h     | 12 ++++++------
 drivers/media/usb/cpia2/cpia2_usb.c      |  4 ++--
 drivers/media/usb/em28xx/em28xx-core.c   |  4 ++--
 drivers/media/usb/pvrusb2/pvrusb2-hdw.c  |  8 ++++----
 drivers/media/usb/s2255/s2255drv.c       |  4 ++--
 drivers/media/usb/stk1160/stk1160-core.c |  4 ++--
 9 files changed, 38 insertions(+), 38 deletions(-)

-- 
2.32.0

