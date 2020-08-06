Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B06123D951
	for <lists+linux-media@lfdr.de>; Thu,  6 Aug 2020 12:39:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729363AbgHFKhs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Aug 2020 06:37:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729346AbgHFKey (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 Aug 2020 06:34:54 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7737C0617A4
        for <linux-media@vger.kernel.org>; Thu,  6 Aug 2020 03:34:50 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id 68DED2993E4
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com
Cc:     dafna.hirschfeld@collabora.com, helen.koike@collabora.com,
        ezequiel@collabora.com, hverkuil@xs4all.nl, kernel@collabora.com,
        dafna3@gmail.com, sakari.ailus@linux.intel.com, mchehab@kernel.org,
        tfiga@chromium.org
Subject: [PATCH v3 3/5] media: staging: rkisp1: remove declaration of unimplemented function 'rkisp1_params_isr_handler'
Date:   Thu,  6 Aug 2020 12:34:15 +0200
Message-Id: <20200806103417.18154-4-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200806103417.18154-1-dafna.hirschfeld@collabora.com>
References: <20200806103417.18154-1-dafna.hirschfeld@collabora.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The file rkisp1-common.h has a function declarion
'rkisp1_params_isr_handler' that is not implemented.
Remove it.

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Acked-by: Helen Koike <helen.koike@collabora.com>
---
 drivers/staging/media/rkisp1/rkisp1-common.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/media/rkisp1/rkisp1-common.h b/drivers/staging/media/rkisp1/rkisp1-common.h
index 7d414f89d79b..6b8fb9909369 100644
--- a/drivers/staging/media/rkisp1/rkisp1-common.h
+++ b/drivers/staging/media/rkisp1/rkisp1-common.h
@@ -330,6 +330,4 @@ void rkisp1_params_disable(struct rkisp1_params *params);
 int rkisp1_params_register(struct rkisp1_device *rkisp1);
 void rkisp1_params_unregister(struct rkisp1_device *rkisp1);
 
-void rkisp1_params_isr_handler(struct rkisp1_device *rkisp1, u32 isp_mis);
-
 #endif /* _RKISP1_COMMON_H */
-- 
2.17.1

