Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 81AC8525CB2
	for <lists+linux-media@lfdr.de>; Fri, 13 May 2022 10:03:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377950AbiEMHyv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 May 2022 03:54:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377934AbiEMHyt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 May 2022 03:54:49 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC83C27EB82
        for <linux-media@vger.kernel.org>; Fri, 13 May 2022 00:54:48 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 3F96BB82C4D
        for <linux-media@vger.kernel.org>; Fri, 13 May 2022 07:54:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6DCAC34100
        for <linux-media@vger.kernel.org>; Fri, 13 May 2022 07:54:45 +0000 (UTC)
Message-ID: <dff3fd7d-8916-edd8-169f-7287cb044424@xs4all.nl>
Date:   Fri, 13 May 2022 09:54:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Content-Language: en-US
To:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH] media: cec-adap.c: log when claiming LA fails unexpectedly
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

If there is a hardware problem such as someone pulling the CEC line low
continuously, then the POLL message will fail with an error other than
OK, NACK, ABORTED or TIMEOUT. Log the tx_status value in that case to
help debug this.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
diff --git a/drivers/media/cec/core/cec-adap.c b/drivers/media/cec/core/cec-adap.c
index 8bf91b5a7d0e..41a79293ee02 100644
--- a/drivers/media/cec/core/cec-adap.c
+++ b/drivers/media/cec/core/cec-adap.c
@@ -1309,8 +1309,11 @@ static int cec_config_log_addr(struct cec_adapter *adap,
 	 * we assume that something is really weird and that it is not a
 	 * good idea to try and claim this logical address.
 	 */
-	if (i == max_retries)
+	if (i == max_retries) {
+		dprintk(0, "polling for LA %u failed with tx_status=0x%04x\n",
+			log_addr, msg.tx_status);
 		return 0;
+	}
 
 	/*
 	 * Message not acknowledged, so this logical
