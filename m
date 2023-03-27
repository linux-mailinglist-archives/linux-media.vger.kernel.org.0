Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 414E76C9E14
	for <lists+linux-media@lfdr.de>; Mon, 27 Mar 2023 10:38:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233188AbjC0Iib (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 Mar 2023 04:38:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233196AbjC0Ihq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Mar 2023 04:37:46 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D42C76AF
        for <linux-media@vger.kernel.org>; Mon, 27 Mar 2023 01:32:21 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 4BD59B80EBC
        for <linux-media@vger.kernel.org>; Mon, 27 Mar 2023 08:32:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB940C4339C
        for <linux-media@vger.kernel.org>; Mon, 27 Mar 2023 08:32:02 +0000 (UTC)
Message-ID: <4a188eb2-19c4-d9b3-634e-9dd96cc5cac9@xs4all.nl>
Date:   Mon, 27 Mar 2023 10:32:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH] Documentation: admin-guide: cec.rst: document NTP issue
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The CEC pin framework is affected by NTP daemons speeding up or slowing
down the system clock. Document this and explain how to fix this for
chronyd.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
diff --git a/Documentation/admin-guide/media/cec.rst b/Documentation/admin-guide/media/cec.rst
index 656dec7e0182..6b30e355cf23 100644
--- a/Documentation/admin-guide/media/cec.rst
+++ b/Documentation/admin-guide/media/cec.rst
@@ -55,6 +55,15 @@ Miscellaneous:
   you can control the CEC line through this driver. This supports error
   injection as well.

+- cec-gpio and Allwinner A10 (or any other driver that uses the CEC pin
+  framework to drive the CEC pin directly): the CEC pin framework uses
+  high-resolution timers. These timers are affected by NTP daemons that
+  speed up or slow down the clock to sync with the official time. The
+  chronyd server will by default increase or decrease the clock by
+  1/12th. This will cause the CEC timings to go out of spec. To fix this,
+  add a 'maxslewrate 40000' line to chronyd.conf. This limits the clock
+  frequency change to 1/25th, which keeps the CEC timings within spec.
+

 Utilities
 =========
