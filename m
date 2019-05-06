Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AB80A144ED
	for <lists+linux-media@lfdr.de>; Mon,  6 May 2019 09:03:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726319AbfEFHDh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 May 2019 03:03:37 -0400
Received: from mx7.zte.com.cn ([202.103.147.169]:57104 "EHLO mxct.zte.com.cn"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725710AbfEFHDg (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 6 May 2019 03:03:36 -0400
Received: from mse-fl2.zte.com.cn (unknown [10.30.14.239])
        by Forcepoint Email with ESMTPS id 98DE1B7A88021896A8CC;
        Mon,  6 May 2019 15:03:33 +0800 (CST)
Received: from notes_smtp.zte.com.cn ([10.30.1.239])
        by mse-fl2.zte.com.cn with ESMTP id x4673OIW076249;
        Mon, 6 May 2019 15:03:24 +0800 (GMT-8)
        (envelope-from wen.yang99@zte.com.cn)
Received: from fox-host8.localdomain ([10.74.120.8])
          by szsmtp06.zte.com.cn (Lotus Domino Release 8.5.3FP6)
          with ESMTP id 2019050615032859-10027945 ;
          Mon, 6 May 2019 15:03:28 +0800 
From:   Wen Yang <wen.yang99@zte.com.cn>
To:     linux-kernel@vger.kernel.org
Cc:     wang.yi59@zte.com.cn, Wen Yang <wen.yang99@zte.com.cn>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-media@vger.kernel.org
Subject: [PATCH 0/4] fix leaked of_node references in drivers/media
Date:   Mon, 6 May 2019 15:05:14 +0800
Message-Id: <1557126318-21487-1-git-send-email-wen.yang99@zte.com.cn>
X-Mailer: git-send-email 1.8.3.1
X-MIMETrack: Itemize by SMTP Server on SZSMTP06/server/zte_ltd(Release 8.5.3FP6|November
 21, 2013) at 2019-05-06 15:03:28,
        Serialize by Router on notes_smtp/zte_ltd(Release 9.0.1FP7|August  17, 2016) at
 2019-05-06 15:03:22,
        Serialize complete at 2019-05-06 15:03:22
X-MAIL: mse-fl2.zte.com.cn x4673OIW076249
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The call to of_get_cpu_node/of_find_compatible_node/of_parse_phandle...
returns a node pointer with refcount incremented thus it must be
explicitly decremented after the last usage.

We developed a coccinelle SmPL to detect  drivers/media/ code and
found some issues.
This patch series fixes those issues.

Wen Yang (4):
  media: venus: firmware: fix leaked of_node references
  media: mtk-vpu: fix leaked of_node references
  media: mtk-vcodec: fix leaked of_node references
  media: xilinx: fix leaked of_node references

 drivers/media/platform/exynos4-is/fimc-is.c           | 1 +
 drivers/media/platform/exynos4-is/media-dev.c         | 1 +
 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c | 2 +-
 drivers/media/platform/mtk-vpu/mtk_vpu.c              | 2 +-
 drivers/media/platform/qcom/venus/firmware.c          | 6 ++++--
 drivers/media/platform/xilinx/xilinx-vipp.c           | 8 +++++---
 6 files changed, 13 insertions(+), 7 deletions(-)

Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc: linux-media@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

-- 
2.9.5

