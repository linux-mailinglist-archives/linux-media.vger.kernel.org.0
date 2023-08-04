Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 13D2276FF28
	for <lists+linux-media@lfdr.de>; Fri,  4 Aug 2023 13:01:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231734AbjHDLBS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Aug 2023 07:01:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231733AbjHDLAy (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 4 Aug 2023 07:00:54 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8D99126
        for <linux-media@vger.kernel.org>; Fri,  4 Aug 2023 03:59:44 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 4E81761F94
        for <linux-media@vger.kernel.org>; Fri,  4 Aug 2023 10:59:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68504C433C8
        for <linux-media@vger.kernel.org>; Fri,  4 Aug 2023 10:59:43 +0000 (UTC)
Message-ID: <58b2384d-6f2a-7ee5-1ca3-5c5f24c85311@xs4all.nl>
Date:   Fri, 4 Aug 2023 12:59:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH] media: firewire: firedtv-avc.c: replace BUG with proper,
 error return
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This resolves this smatch error:

drivers/media/firewire/firedtv-avc.c:602 avc_tuner_dsd() error: uninitialized symbol 'pos'.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/firewire/firedtv-avc.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/firewire/firedtv-avc.c b/drivers/media/firewire/firedtv-avc.c
index 71991f8638e6..a36c28412170 100644
--- a/drivers/media/firewire/firedtv-avc.c
+++ b/drivers/media/firewire/firedtv-avc.c
@@ -597,7 +597,8 @@ int avc_tuner_dsd(struct firedtv *fdtv,
 	case FIREDTV_DVB_C: pos = avc_tuner_dsd_dvb_c(fdtv, p); break;
 	case FIREDTV_DVB_T: pos = avc_tuner_dsd_dvb_t(fdtv, p); break;
 	default:
-		BUG();
+		ret = -EIO;
+		goto unlock;
 	}
 	pad_operands(c, pos);

@@ -612,6 +613,7 @@ int avc_tuner_dsd(struct firedtv *fdtv,
 	if (status)
 		*status = r->operand[2];
 #endif
+unlock:
 	mutex_unlock(&fdtv->avc_mutex);

 	if (ret == 0)
-- 
2.40.1

