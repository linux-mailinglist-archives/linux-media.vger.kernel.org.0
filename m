Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 51F2E59F3EA
	for <lists+linux-media@lfdr.de>; Wed, 24 Aug 2022 09:06:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231855AbiHXHGZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Aug 2022 03:06:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230441AbiHXHGY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Aug 2022 03:06:24 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3D4D85FE2
        for <linux-media@vger.kernel.org>; Wed, 24 Aug 2022 00:06:23 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id A7180B8237E
        for <linux-media@vger.kernel.org>; Wed, 24 Aug 2022 07:06:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACE6DC433D6;
        Wed, 24 Aug 2022 07:06:20 +0000 (UTC)
Message-ID: <0d32a8a4-e44a-c430-db4e-2e26c4cb36f7@xs4all.nl>
Date:   Wed, 24 Aug 2022 09:06:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
To:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Cc:     Neil Armstrong <narmstrong@baylibre.com>,
        Guenter Roeck <groeck@chromium.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH] cros-ec-cec: limit msg.len to CEC_MAX_MSG_SIZE
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

I expect that the hardware will have limited this to 16, but just in
case it hasn't, check for this corner case.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
diff --git a/drivers/media/cec/platform/cros-ec/cros-ec-cec.c b/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
index 3b583ed4da9d..e5ebaa58be45 100644
--- a/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
+++ b/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
@@ -44,6 +44,8 @@ static void handle_cec_message(struct cros_ec_cec *cros_ec_cec)
 	uint8_t *cec_message = cros_ec->event_data.data.cec_message;
 	unsigned int len = cros_ec->event_size;
 
+	if (len > CEC_MAX_MSG_SIZE)
+		len = CEC_MAX_MSG_SIZE;
 	cros_ec_cec->rx_msg.len = len;
 	memcpy(cros_ec_cec->rx_msg.msg, cec_message, len);
 
