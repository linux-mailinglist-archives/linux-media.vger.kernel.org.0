Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2C723AF907
	for <lists+linux-media@lfdr.de>; Tue, 22 Jun 2021 01:12:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231246AbhFUXOp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Jun 2021 19:14:45 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:53424 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229940AbhFUXOo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Jun 2021 19:14:44 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 551AB1F41F27
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Heiko Stuebner <heiko@sntech.de>,
        Alex Bee <knaerzche@gmail.com>,
        Ezequiel Garcia <ezequiel@collabora.com>, kernel@collabora.com
Subject: [PATCH 0/2] hantro: Small nitpicks
Date:   Mon, 21 Jun 2021 20:11:55 -0300
Message-Id: <20210621231157.226962-1-ezequiel@collabora.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Just a couple nitpicks that I had in the backlog.

Ezequiel Garcia (2):
  hantro: vp8: Move noisy WARN_ON to vpu_debug
  hantro: Make struct hantro_variant.init() optional

 drivers/staging/media/hantro/hantro.h               |  4 ++--
 drivers/staging/media/hantro/hantro_drv.c           | 10 ++++++----
 drivers/staging/media/hantro/hantro_g1_vp8_dec.c    | 13 ++++++++++---
 .../staging/media/hantro/rockchip_vpu2_hw_vp8_dec.c | 13 ++++++++++---
 drivers/staging/media/hantro/sama5d4_vdec_hw.c      |  6 ------
 5 files changed, 28 insertions(+), 18 deletions(-)

-- 
2.30.0

