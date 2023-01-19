Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2D58767341C
	for <lists+linux-media@lfdr.de>; Thu, 19 Jan 2023 10:02:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229787AbjASJC1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Jan 2023 04:02:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229446AbjASJCZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Jan 2023 04:02:25 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6C7867977
        for <linux-media@vger.kernel.org>; Thu, 19 Jan 2023 01:02:22 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 4148961381
        for <linux-media@vger.kernel.org>; Thu, 19 Jan 2023 09:02:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13ADCC433D2;
        Thu, 19 Jan 2023 09:02:20 +0000 (UTC)
Message-ID: <dcf1db75-d9cc-62cc-fa12-baf1b2b3bf31@xs4all.nl>
Date:   Thu, 19 Jan 2023 10:02:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Content-Language: en-US
To:     "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Cc:     Maxime Ripard <maxime@cerno.tech>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH] drm/vc4: hdmi: make CEC adapter name unique
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The bcm2711 has two HDMI outputs, each with their own CEC adapter.
The CEC adapter name has to be unique, but it is currently
hardcoded to "vc4" for both outputs. Change this to use the card_name
from the variant information in order to make the adapter name unique.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index b39a1ba2c29b..d4c112c03f58 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -3018,7 +3018,8 @@ static int vc4_hdmi_cec_init(struct vc4_hdmi *vc4_hdmi)
 	}

 	vc4_hdmi->cec_adap = cec_allocate_adapter(&vc4_hdmi_cec_adap_ops,
-						  vc4_hdmi, "vc4",
+						  vc4_hdmi,
+						  vc4_hdmi->variant->card_name,
 						  CEC_CAP_DEFAULTS |
 						  CEC_CAP_CONNECTOR_INFO, 1);
 	ret = PTR_ERR_OR_ZERO(vc4_hdmi->cec_adap);
-- 
2.39.0

