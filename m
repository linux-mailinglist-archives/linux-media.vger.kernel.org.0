Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 159A9591E4
	for <lists+linux-media@lfdr.de>; Fri, 28 Jun 2019 05:19:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726996AbfF1DTP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Jun 2019 23:19:15 -0400
Received: from out1.zte.com.cn ([202.103.147.172]:37136 "EHLO mxct.zte.com.cn"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726542AbfF1DTO (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Jun 2019 23:19:14 -0400
X-Greylist: delayed 936 seconds by postgrey-1.27 at vger.kernel.org; Thu, 27 Jun 2019 23:19:13 EDT
Received: from mse-fl1.zte.com.cn (unknown [10.30.14.238])
        by Forcepoint Email with ESMTPS id 095FE8AAAF48D3D3EE33;
        Fri, 28 Jun 2019 11:03:36 +0800 (CST)
Received: from notes_smtp.zte.com.cn ([10.30.1.239])
        by mse-fl1.zte.com.cn with ESMTP id x5S32eAx063726;
        Fri, 28 Jun 2019 11:02:40 +0800 (GMT-8)
        (envelope-from wen.yang99@zte.com.cn)
Received: from fox-host8.localdomain ([10.74.120.8])
          by szsmtp06.zte.com.cn (Lotus Domino Release 8.5.3FP6)
          with ESMTP id 2019062811031002-1800716 ;
          Fri, 28 Jun 2019 11:03:10 +0800 
From:   Wen Yang <wen.yang99@zte.com.cn>
To:     linux-kernel@vger.kernel.org
Cc:     wang.yi59@zte.com.cn, Wen Yang <wen.yang99@zte.com.cn>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-media@vger.kernel.org
Subject: [PATCH 0/3] fix leaked of_node references in drivers/media
Date:   Fri, 28 Jun 2019 11:01:13 +0800
Message-Id: <1561690876-20977-1-git-send-email-wen.yang99@zte.com.cn>
X-Mailer: git-send-email 1.8.3.1
X-MIMETrack: Itemize by SMTP Server on SZSMTP06/server/zte_ltd(Release 8.5.3FP6|November
 21, 2013) at 2019-06-28 11:03:10,
        Serialize by Router on notes_smtp/zte_ltd(Release 9.0.1FP7|August  17, 2016) at
 2019-06-28 11:02:45,
        Serialize complete at 2019-06-28 11:02:45
X-MAIL: mse-fl1.zte.com.cn x5S32eAx063726
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

Wen Yang (3):
  media: xilinx: fix leaked of_node references
  media: exynos4-is: fix leaked of_node references
  media: ti-vpe: fix leaked of_node references

 drivers/media/platform/exynos4-is/fimc-is.c   |  1 +
 drivers/media/platform/exynos4-is/media-dev.c |  2 ++
 drivers/media/platform/ti-vpe/cal.c           |  1 +
 drivers/media/platform/xilinx/xilinx-tpg.c    | 18 +++++++++++++-----
 drivers/media/platform/xilinx/xilinx-vipp.c   |  8 +++++---
 5 files changed, 22 insertions(+), 8 deletions(-)

Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc: linux-media@vger.kernel.org

-- 
2.9.5

