Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BDCE93A9A5B
	for <lists+linux-media@lfdr.de>; Wed, 16 Jun 2021 14:28:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231179AbhFPMas (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Jun 2021 08:30:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:49232 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231303AbhFPMaq (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Jun 2021 08:30:46 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 808846135C;
        Wed, 16 Jun 2021 12:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623846520;
        bh=qMLD5L33JuSzop8XE5CQqNRAcxqJX553vmnX+Xl74Dc=;
        h=From:To:Cc:Subject:Date:From;
        b=L/R2NwoGZMLbmQtky2swZPfqmxZlTIbB4ppAfSV2KG39FufEVQkDEWsG+tSOnkrRo
         Zjx63oN3Kk4Cz/4+sAf/tADqRztyaneLNBu3PCY7MA7UEtFLwEjsYo0I5zpoTz3kIt
         VOb05SczaB9QOKupeFsqMD7GSMF3Y8aU3tJn4FRlyw1lUh8TdUf5BcPQLvlrG6oz60
         61SvPNCFbUn23aUKvv0tAQqnCdfHNjsbTN4QMxy8Gc5yNxk1Mt0ZbqE4paFO1BUp4k
         tggLIXxkvTvzWXb0ZVizM7mgte/VwMYrIOuBriXtcDGKYXs+gJ7DBcb6rSf2qUFkoY
         UsNqeYaRtmUbQ==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1ltUes-004oiL-5M; Wed, 16 Jun 2021 14:28:38 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Yong Deng <yong.deng@magewell.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-sunxi@lists.linux.dev
Subject: [PATCH 00/11] Address some smatch warnings
Date:   Wed, 16 Jun 2021 14:28:26 +0200
Message-Id: <cover.1623846327.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There are currently a couple of smatch warnings at the media subsystem.

This series fix several of them. The end goal is to reduce smatch warnings
to be close to zero, but there are still some work to be done. I'll likely
submit another round along this week.

Mauro Carvalho Chehab (11):
  media: dvb_ca_en50221: avoid speculation from CA slot
  media: dvb_net: avoid speculation from net slot
  media: dvbdev: fix error logic at dvb_register_device()
  media: sun6i-csi: add a missing return code
  media: saa7134: use more meaninful goto labels
  media: saa7134: fix saa7134_initdev error handling logic
  media: siano: fix device register error path
  media: adv7842: better document EDID block size
  media: ttusb-dec: cleanup an error handling logic
  media: dvb-core: frontend: make GET/SET safer
  media: xilinx: simplify get fourcc logic

 drivers/media/common/siano/smsdvb-main.c      |   4 +
 drivers/media/dvb-core/dvb_ca_en50221.c       |   1 +
 drivers/media/dvb-core/dvb_frontend.c         | 213 ++++++++++--------
 drivers/media/dvb-core/dvb_net.c              |  25 +-
 drivers/media/dvb-core/dvbdev.c               |   3 +
 drivers/media/i2c/adv7842.c                   |  33 ++-
 drivers/media/pci/saa7134/saa7134-core.c      |  39 ++--
 .../platform/sunxi/sun6i-csi/sun6i_video.c    |   4 +-
 drivers/media/platform/xilinx/xilinx-dma.c    |   5 +-
 drivers/media/platform/xilinx/xilinx-vip.c    |   6 +-
 drivers/media/usb/ttusb-dec/ttusb_dec.c       |  25 +-
 11 files changed, 201 insertions(+), 157 deletions(-)

-- 
2.31.1


