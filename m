Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DF04675A7A3
	for <lists+linux-media@lfdr.de>; Thu, 20 Jul 2023 09:19:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231193AbjGTHTV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 Jul 2023 03:19:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231448AbjGTHTP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 Jul 2023 03:19:15 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BB7B2701
        for <linux-media@vger.kernel.org>; Thu, 20 Jul 2023 00:19:07 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 27372618E5
        for <linux-media@vger.kernel.org>; Thu, 20 Jul 2023 07:19:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0149C433C7;
        Thu, 20 Jul 2023 07:19:05 +0000 (UTC)
Message-ID: <d850774e-8030-c240-5dbc-01b57bd6c7af@xs4all.nl>
Date:   Thu, 20 Jul 2023 09:19:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Stanimir Varbanov <stanimir.varbanov@linaro.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH] media: venus: core.h: update kerneldoc
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Document missing fields. This resolves two warnings:

drivers/media/platform/qcom/venus/core.h:226: warning: Function parameter or member 'venus_ver' not described in 'venus_core'
drivers/media/platform/qcom/venus/core.h:501: warning: Function parameter or member 'enc_state' not described in 'venus_inst'

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/platform/qcom/venus/core.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
index 320bde0f83cb..df78bc297c11 100644
--- a/drivers/media/platform/qcom/venus/core.h
+++ b/drivers/media/platform/qcom/venus/core.h
@@ -160,6 +160,7 @@ struct venus_format {
  * @core0_usage_count: usage counter for core0
  * @core1_usage_count: usage counter for core1
  * @root:	debugfs root directory
+ * @venus_ver:	the venus firmware version
  */
 struct venus_core {
 	void __iomem *base;
@@ -386,7 +387,8 @@ enum venus_inst_modes {
  * @ycbcr_enc:	current YCbCr encoding
  * @quantization:	current quantization
  * @xfer_func:	current xfer function
- * @codec_state:	current codec API state (see DEC/ENC_STATE_)
+ * @codec_state:	current decoder API state (see DEC_STATE_)
+ * @enc_state:		current encoder API state (see ENC_STATE_)
  * @reconf_wait:	wait queue for resolution change event
  * @subscriptions:	used to hold current events subscriptions
  * @buf_count:		used to count number of buffers (reqbuf(0))
-- 
2.40.1

