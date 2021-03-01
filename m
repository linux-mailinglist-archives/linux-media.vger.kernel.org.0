Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91A9332873F
	for <lists+linux-media@lfdr.de>; Mon,  1 Mar 2021 18:24:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237933AbhCARW2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Mar 2021 12:22:28 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:33336 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237751AbhCARTb (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 1 Mar 2021 12:19:31 -0500
Received: from guri.fritz.box (p200300c7cf38380081778a42153c5979.dip0.t-ipconnect.de [IPv6:2003:c7:cf38:3800:8177:8a42:153c:5979])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 3319C1F45165;
        Mon,  1 Mar 2021 17:18:44 +0000 (GMT)
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, dafna.hirschfeld@collabora.com,
        helen.koike@collabora.com, ezequiel@collabora.com,
        hverkuil@xs4all.nl, kernel@collabora.com, dafna3@gmail.com,
        sakari.ailus@linux.intel.com, linux-rockchip@lists.infradead.org,
        mchehab@kernel.org, tfiga@chromium.org
Subject: [PATCH v2 2/2] media: rkisp1: params: fix wrong bits settings
Date:   Mon,  1 Mar 2021 18:18:35 +0100
Message-Id: <20210301171835.24202-3-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210301171835.24202-1-dafna.hirschfeld@collabora.com>
References: <20210301171835.24202-1-dafna.hirschfeld@collabora.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The histogram mode is set using 'rkisp1_params_set_bits'.
Only the bits of the mode should be the value argument for
that function. Otherwise bits outside the mode mask are
turned on which is not what was intended.

Fixes: bae1155cf579 ("media: staging: rkisp1: add output device for parameters")
Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 drivers/media/platform/rockchip/rkisp1/rkisp1-params.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
index 0e69d888e572..885a59bcd6c7 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
@@ -1233,7 +1233,6 @@ static void rkisp1_params_config_parameter(struct rkisp1_params *params)
 	memset(hst.hist_weight, 0x01, sizeof(hst.hist_weight));
 	rkisp1_hst_config(params, &hst);
 	rkisp1_param_set_bits(params, RKISP1_CIF_ISP_HIST_PROP,
-			      ~RKISP1_CIF_ISP_HIST_PROP_MODE_MASK |
 			      rkisp1_hst_params_default_config.mode);
 
 	/* set the  range */
-- 
2.17.1

