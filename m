Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 07E7363A99D
	for <lists+linux-media@lfdr.de>; Mon, 28 Nov 2022 14:33:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230156AbiK1Ndu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 28 Nov 2022 08:33:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231272AbiK1Ndt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 28 Nov 2022 08:33:49 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16C0E111B
        for <linux-media@vger.kernel.org>; Mon, 28 Nov 2022 05:33:49 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A7A0161178
        for <linux-media@vger.kernel.org>; Mon, 28 Nov 2022 13:33:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9241DC433C1;
        Mon, 28 Nov 2022 13:33:47 +0000 (UTC)
Message-ID: <2bff9dd2-e4ef-1b10-e64e-3c62849eb3b0@xs4all.nl>
Date:   Mon, 28 Nov 2022 14:33:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Content-Language: en-US
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Robert Schlabbach <robert_s@gmx.net>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH] media/frontend.h.rst.exceptions: add exceptions for new dvb
 defines
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

After some dvb/frontend.h additions, building the documentation
gives lots of warnings. Add the missing pieces to
frontend.h.rst.exceptions.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
diff --git a/Documentation/userspace-api/media/frontend.h.rst.exceptions b/Documentation/userspace-api/media/frontend.h.rst.exceptions
index 6283702c08c8..8b73fee11a79 100644
--- a/Documentation/userspace-api/media/frontend.h.rst.exceptions
+++ b/Documentation/userspace-api/media/frontend.h.rst.exceptions
@@ -86,6 +86,13 @@ ignore symbol APSK_16
 ignore symbol APSK_32
 ignore symbol DQPSK
 ignore symbol QAM_4_NR
+ignore symbol QAM_1024
+ignore symbol QAM_4096
+ignore symbol APSK_8_L
+ignore symbol APSK_16_L
+ignore symbol APSK_32_L
+ignore symbol APSK_64
+ignore symbol APSK_64_L

 ignore symbol SEC_VOLTAGE_13
 ignore symbol SEC_VOLTAGE_18
@@ -119,6 +126,22 @@ ignore symbol FEC_AUTO
 ignore symbol FEC_3_5
 ignore symbol FEC_9_10
 ignore symbol FEC_2_5
+ignore symbol FEC_1_3
+ignore symbol FEC_1_4
+ignore symbol FEC_5_9
+ignore symbol FEC_7_9
+ignore symbol FEC_8_15
+ignore symbol FEC_11_15
+ignore symbol FEC_13_18
+ignore symbol FEC_9_20
+ignore symbol FEC_11_20
+ignore symbol FEC_23_36
+ignore symbol FEC_25_36
+ignore symbol FEC_13_45
+ignore symbol FEC_26_45
+ignore symbol FEC_28_45
+ignore symbol FEC_32_45
+ignore symbol FEC_77_90

 ignore symbol TRANSMISSION_MODE_AUTO
 ignore symbol TRANSMISSION_MODE_1K
@@ -143,6 +166,7 @@ ignore symbol GUARD_INTERVAL_19_256
 ignore symbol GUARD_INTERVAL_PN420
 ignore symbol GUARD_INTERVAL_PN595
 ignore symbol GUARD_INTERVAL_PN945
+ignore symbol GUARD_INTERVAL_1_64

 ignore symbol HIERARCHY_NONE
 ignore symbol HIERARCHY_AUTO
@@ -163,6 +187,9 @@ ignore symbol ROLLOFF_35
 ignore symbol ROLLOFF_20
 ignore symbol ROLLOFF_25
 ignore symbol ROLLOFF_AUTO
+ignore symbol ROLLOFF_15
+ignore symbol ROLLOFF_10
+ignore symbol ROLLOFF_5

 ignore symbol INVERSION_ON
 ignore symbol INVERSION_OFF
@@ -187,6 +214,7 @@ ignore symbol SYS_DAB
 ignore symbol SYS_DSS
 ignore symbol SYS_CMMB
 ignore symbol SYS_DVBH
+ignore symbol SYS_DVBC2

 ignore symbol ATSCMH_SCCC_BLK_SEP
 ignore symbol ATSCMH_SCCC_BLK_COMB
