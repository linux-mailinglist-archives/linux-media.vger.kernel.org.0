Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 814BF27B0E9
	for <lists+linux-media@lfdr.de>; Mon, 28 Sep 2020 17:28:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726461AbgI1P2U (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 28 Sep 2020 11:28:20 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:48560 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726380AbgI1P2U (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 28 Sep 2020 11:28:20 -0400
Received: from guri.fritz.box (p200300c7cf13ec00c5de8baad62d6718.dip0.t-ipconnect.de [IPv6:2003:c7:cf13:ec00:c5de:8baa:d62d:6718])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 34CE829A929;
        Mon, 28 Sep 2020 16:28:17 +0100 (BST)
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, dafna.hirschfeld@collabora.com,
        helen.koike@collabora.com, ezequiel@collabora.com,
        hverkuil@xs4all.nl, kernel@collabora.com, dafna3@gmail.com,
        sakari.ailus@linux.intel.com, linux-rockchip@lists.infradead.org,
        mchehab@kernel.org, tfiga@chromium.org
Subject: [PATCH] media: staging: rkisp1: remove TODO item to document quantization handling
Date:   Mon, 28 Sep 2020 17:28:09 +0200
Message-Id: <20200928152809.27490-1-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The quantization handling is already documented
in the file rkisp1.rst so this item can be removed.

Fixes: 6616726907418 (media: staging: rkisp1: allow quantization setting by userspace on the isp source pad)
Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 drivers/staging/media/rkisp1/TODO | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/media/rkisp1/TODO b/drivers/staging/media/rkisp1/TODO
index e7c8398fc2ce..d9360607fbfb 100644
--- a/drivers/staging/media/rkisp1/TODO
+++ b/drivers/staging/media/rkisp1/TODO
@@ -1,6 +1,5 @@
 * Fix pad format size for statistics and parameters entities.
 * Fix checkpatch errors.
-* Add uapi docs. Remember to add documentation of how quantization is handled.
 * streaming paths (mainpath and selfpath) check if the other path is streaming
 in several places of the code, review this, specially that it doesn't seem it
 supports streaming from both paths at the same time.
-- 
2.17.1

