Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 631742740EE
	for <lists+linux-media@lfdr.de>; Tue, 22 Sep 2020 13:34:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726593AbgIVLeW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Sep 2020 07:34:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726563AbgIVLeN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Sep 2020 07:34:13 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DE4FC0613D1
        for <linux-media@vger.kernel.org>; Tue, 22 Sep 2020 04:34:13 -0700 (PDT)
Received: from guri.fritz.box (p200300c7cf13ec005877be1094b7a29d.dip0.t-ipconnect.de [IPv6:2003:c7:cf13:ec00:5877:be10:94b7:a29d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id B5CB029B49E;
        Tue, 22 Sep 2020 12:34:10 +0100 (BST)
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, dafna.hirschfeld@collabora.com,
        helen.koike@collabora.com, ezequiel@collabora.com,
        hverkuil@xs4all.nl, kernel@collabora.com, dafna3@gmail.com,
        sakari.ailus@linux.intel.com, linux-rockchip@lists.infradead.org,
        mchehab@kernel.org, tfiga@chromium.org
Subject: [PATCH v3 03/12] media: staging: rkisp1: params: use the new effect value in cproc config
Date:   Tue, 22 Sep 2020 13:33:53 +0200
Message-Id: <20200922113402.12442-4-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200922113402.12442-1-dafna.hirschfeld@collabora.com>
References: <20200922113402.12442-1-dafna.hirschfeld@collabora.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The cproc (color processing) configuration needs to know if
an image effect is configured. The code uses the image effect
in 'cur_params' which is the first params buffer queued in the stream.
This is the wrong place to read the value. The value should be
taken from the current params buffer.

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Acked-by: Helen Koike <helen.koike@collabora.com>
---
 drivers/staging/media/rkisp1/rkisp1-params.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/rkisp1/rkisp1-params.c b/drivers/staging/media/rkisp1/rkisp1-params.c
index 8bd7cc622e4f..ab2deb57b1eb 100644
--- a/drivers/staging/media/rkisp1/rkisp1-params.c
+++ b/drivers/staging/media/rkisp1/rkisp1-params.c
@@ -552,7 +552,7 @@ static void rkisp1_cproc_config(struct rkisp1_params *params,
 				const struct rkisp1_cif_isp_cproc_config *arg)
 {
 	struct rkisp1_cif_isp_isp_other_cfg *cur_other_cfg =
-						&params->cur_params.others;
+		container_of(arg, struct rkisp1_cif_isp_isp_other_cfg, cproc_config);
 	struct rkisp1_cif_isp_ie_config *cur_ie_config =
 						&cur_other_cfg->ie_config;
 	u32 effect = cur_ie_config->effect;
-- 
2.17.1

