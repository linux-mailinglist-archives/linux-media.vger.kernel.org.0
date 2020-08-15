Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F3122452E3
	for <lists+linux-media@lfdr.de>; Sat, 15 Aug 2020 23:56:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729131AbgHOV4E (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 15 Aug 2020 17:56:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729045AbgHOVwQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 15 Aug 2020 17:52:16 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A38D6C02B8CC
        for <linux-media@vger.kernel.org>; Sat, 15 Aug 2020 03:38:01 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id 2D7EA29A94E
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, dafna.hirschfeld@collabora.com,
        helen.koike@collabora.com, ezequiel@collabora.com,
        hverkuil@xs4all.nl, kernel@collabora.com, dafna3@gmail.com,
        sakari.ailus@linux.intel.com, linux-rockchip@lists.infradead.org,
        mchehab@kernel.org, tfiga@chromium.org
Subject: [PATCH v2 14/14] media: staging: rkisp1: params: no need to lock default config
Date:   Sat, 15 Aug 2020 12:37:34 +0200
Message-Id: <20200815103734.31153-15-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200815103734.31153-1-dafna.hirschfeld@collabora.com>
References: <20200815103734.31153-1-dafna.hirschfeld@collabora.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In the function 'rkisp1_params_config_parameter' the lock
is taken while applying the default config. But the lock
only needs to protect the buffers list and the 'is_streaming'
field, so move the locking to lock only what is needed.

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 drivers/staging/media/rkisp1/rkisp1-params.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/rkisp1/rkisp1-params.c b/drivers/staging/media/rkisp1/rkisp1-params.c
index 7d5c21fa630e..6c71da311294 100644
--- a/drivers/staging/media/rkisp1/rkisp1-params.c
+++ b/drivers/staging/media/rkisp1/rkisp1-params.c
@@ -1283,8 +1283,6 @@ static void rkisp1_params_config_parameter(struct rkisp1_params *params)
 {
 	struct rkisp1_cif_isp_hst_config hst = rkisp1_hst_params_default_config;
 
-	spin_lock(&params->config_lock);
-
 	rkisp1_awb_meas_config(params, &rkisp1_awb_params_default_config);
 	rkisp1_awb_meas_enable(params, &rkisp1_awb_params_default_config,
 			       true);
@@ -1309,6 +1307,8 @@ static void rkisp1_params_config_parameter(struct rkisp1_params *params)
 	else
 		rkisp1_csm_config(params, false);
 
+	spin_lock(&params->config_lock);
+
 	/* apply the first buffer if there is one already */
 	if (params->is_streaming)
 		rkisp1_params_apply_params_cfg(params, 0);
-- 
2.17.1

