Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 21402161927
	for <lists+linux-media@lfdr.de>; Mon, 17 Feb 2020 18:52:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729802AbgBQRwU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Feb 2020 12:52:20 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:43090 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728463AbgBQRwU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Feb 2020 12:52:20 -0500
Received: from localhost.localdomain (p200300CB87166A0024B68010760D030E.dip0.t-ipconnect.de [IPv6:2003:cb:8716:6a00:24b6:8010:760d:30e])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 50E8D293E72;
        Mon, 17 Feb 2020 17:52:19 +0000 (GMT)
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     dafna.hirschfeld@collabora.com, helen.koike@collabora.com,
        ezequiel@collabora.com, hverkuil@xs4all.nl, kernel@collabora.com,
        dafna3@gmail.com, sakari.ailus@linux.intel.com,
        linux-rockchip@lists.infradead.org, mchehab@kernel.org
Subject: [PATCH] media: staging: rkisp1: remove serialization item in the TODO file
Date:   Mon, 17 Feb 2020 18:52:09 +0100
Message-Id: <20200217175209.8279-1-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The item 'Fix serialization on subdev ops.' was solved,
so remove it from the TODO file.

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
This patch is a follow-up patch of the patchset:
'media: staging: rkisp1: add serialization to the isp and resizer ops'

 drivers/staging/media/rkisp1/TODO | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/media/rkisp1/TODO b/drivers/staging/media/rkisp1/TODO
index 03cd9a4e70f7..0aa9877dd64a 100644
--- a/drivers/staging/media/rkisp1/TODO
+++ b/drivers/staging/media/rkisp1/TODO
@@ -1,4 +1,3 @@
-* Fix serialization on subdev ops.
 * Don't use v4l2_async_notifier_parse_fwnode_endpoints_by_port().
 e.g. isp_parse_of_endpoints in drivers/media/platform/omap3isp/isp.c
 cio2_parse_firmware in drivers/media/pci/intel/ipu3/ipu3-cio2.c.
-- 
2.17.1

