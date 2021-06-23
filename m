Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F9183B1626
	for <lists+linux-media@lfdr.de>; Wed, 23 Jun 2021 10:46:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230053AbhFWIsg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Jun 2021 04:48:36 -0400
Received: from mail.kernel.org ([198.145.29.99]:56362 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229930AbhFWIse (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Jun 2021 04:48:34 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2DEA7611C1;
        Wed, 23 Jun 2021 08:46:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624437977;
        bh=20Wb14EbOvgiOYlOPRi00TSueCOobAF5wMGQvt+VUV4=;
        h=From:To:Cc:Subject:Date:From;
        b=Zh4RZ6/rWswlrSCdSolWiUuuOaPMisZXKLz52sb3YWNowOVcdTf71z1yRxCAp3wM8
         sRuPRZOmJfZWx8ZqoA06pzMNTf7Lwau2KifDtKsKRFWEQt7+/2ahvceWdRBZr7MDLd
         YzE5PO+Kah1K2W0qi9ds7s6Fl+lUMMW0KcP4RV7ymVZA2uFGKlu9WhzsnTF9vETwdA
         g80Qw8D5mEYPiONA/4BxDpZQE+fTqo4GT/WBvs4aBDAXD+/U8HWBXI78ICbAbs8y10
         rnudVtBu0qUkWryzEHqz3CEIs+9eIQbRF4rTZ6qCQ+he9tYnn0k1Px4Q2tBydNagRq
         o+Fz5vPweSZnA==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1lvyWV-0001ry-1D; Wed, 23 Jun 2021 10:46:15 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Antti Palosaari <crope@iki.fi>,
        Eero Lehtinen <debiangamer2@gmail.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Johan Hovold <johan@kernel.org>
Subject: [PATCH 0/2] media: rtl28xxu: fix regression in linux-next
Date:   Wed, 23 Jun 2021 10:45:19 +0200
Message-Id: <20210623084521.7105-1-johan@kernel.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

A patch addressing a new USB core warning in rtl28xxu ended up causing a
regression. As this was caught before the patch was committed it was
superseded by a v2. Unfortunately, the first erroneous version ended up
being applied to the media tree anyway.

This reverts the first version of the patch and resends the second
version.

Mauro and Hans, I've reported this issue to you both repeatedly over the
course of three weeks but you never replied to any of mails. I'm not
sure what went wrong, but I would assume that regressions would be
handled with a bit more urgency. Are you not receiving my mails or was
this perhaps a case of it not being clear who of you should act on the
reports?

2021-05-24: v1 posted

	https://lore.kernel.org/r/20210524110920.24599-4-johan@kernel.org

2021-05-31: Request not apply v1

	https://lore.kernel.org/r/YLSWeyy1skooTmqD@hovoldconsulting.com

2021-05-31: v2 posted

	https://lore.kernel.org/r/20210531094434.12651-4-johan@kernel.org

2021-06-02: v1 applied to media tree and a request to drop it was sent
            in response to the automatic notification mail

2021-06-07: Second request to drop v1 with a question of how best to
            proceed to fix the regression otherwise

	https://lore.kernel.org/r/YL3MCGY5wTsW2kEF@hovoldconsulting.com

Johan


Johan Hovold (2):
  Revert "media: rtl28xxu: fix zero-length control request"
  media: rtl28xxu: fix zero-length control request

 drivers/media/usb/dvb-usb-v2/rtl28xxu.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

-- 
2.31.1

