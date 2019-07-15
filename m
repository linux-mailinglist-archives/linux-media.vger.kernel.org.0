Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A335569DF2
	for <lists+linux-media@lfdr.de>; Mon, 15 Jul 2019 23:24:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730467AbfGOVYI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Jul 2019 17:24:08 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:52806 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730076AbfGOVYI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Jul 2019 17:24:08 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id C9C4A28B679
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Hans Verkuil <hans.verkuil@cisco.com>
Cc:     kernel@collabora.com, linux-media@vger.kernel.org,
        Helen Koike <helen.koike@collabora.com>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH 0/2] Some cleanups for ancillary drivers autoselect
Date:   Mon, 15 Jul 2019 18:23:14 -0300
Message-Id: <20190715212316.352-1-ezequiel@collabora.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro, Hans:

While developing the Rockchip ISP1 driver Helen and I noticed
that the MEDIA_SUBDRV_AUTOSELECT option was a bit confusing,
hiding some menu options, preventing us from jumping to sensor
drivers via the numbered menuconfig shortcuts.

Then, I noticed a user on IRC falling on the same trap,
and so decided the problem was common enough it was worth
a try.

Thanks!
Eze

Ezequiel Garcia (2):
  media: Don't default-enable "ancillary driver autoselect" if EMBEDDED
  media: Don't hide any menu if "ancillary drivers autoselect" is
    enabled

 drivers/media/Kconfig               | 2 +-
 drivers/media/dvb-frontends/Kconfig | 1 -
 drivers/media/i2c/Kconfig           | 1 -
 drivers/media/spi/Kconfig           | 1 -
 drivers/media/tuners/Kconfig        | 1 -
 5 files changed, 1 insertion(+), 5 deletions(-)

-- 
2.22.0

