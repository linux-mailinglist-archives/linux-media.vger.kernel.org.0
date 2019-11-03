Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AFD41ED314
	for <lists+linux-media@lfdr.de>; Sun,  3 Nov 2019 12:23:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727500AbfKCLXn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 3 Nov 2019 06:23:43 -0500
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:44407 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727379AbfKCLXn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 3 Nov 2019 06:23:43 -0500
Received: from tschai.fritz.box ([46.9.232.237])
        by smtp-cloud8.xs4all.net with ESMTPA
        id RDysiydASTzKrRDyvigk6e; Sun, 03 Nov 2019 12:23:41 +0100
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: [PATCH 0/8] Fix various smatch warnings/errors
Date:   Sun,  3 Nov 2019 12:23:30 +0100
Message-Id: <20191103112338.22569-1-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfEVchTi5+ur4oUq7P3sCR5H4uIbKRMdeP1rG1Fg9JRutyr0C3qIdaHDPt7Z5a/j+6xu6B20EhI7bH9nfV2+/RUAvMIkwQj78S5OzVG5NyI4hPxF7GDOU
 It30CwUZTX2s2cpjia9Qb7MxQW3bae+gqGnXOic+MHhe4fYLEQu4/BxnBou4YVd6z2bCozXQph5FOw==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Various fixes for smatch warnings/errors. There are still two
remaining for vivid, but those two are a bit more complicated.

Regards,

	Hans

Hans Verkuil (8):
  am437x: fix smatch warning
  smiapp: smiapp_start_streaming(): replace return by goto
  mtk-vpu: fix two smatch warnings
  rc/ite-cir: fix smatch warning
  em28xx: fix two smatch warnings
  ti-vpe: fix smatch error
  ov6650: fix smatch warning
  mantis: fix two smatch errors

 drivers/media/i2c/ov6650.c                  | 2 +-
 drivers/media/i2c/smiapp/smiapp-core.c      | 4 ++--
 drivers/media/pci/mantis/hopper_cards.c     | 4 +---
 drivers/media/pci/mantis/mantis_cards.c     | 4 +---
 drivers/media/platform/am437x/am437x-vpfe.c | 1 -
 drivers/media/platform/mtk-vpu/mtk_vpu.c    | 4 ++--
 drivers/media/platform/ti-vpe/vpdma.c       | 2 +-
 drivers/media/rc/ite-cir.c                  | 2 +-
 drivers/media/usb/em28xx/em28xx-i2c.c       | 4 ++--
 9 files changed, 11 insertions(+), 16 deletions(-)

-- 
2.23.0

