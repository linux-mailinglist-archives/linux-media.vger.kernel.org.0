Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 478FA566580
	for <lists+linux-media@lfdr.de>; Tue,  5 Jul 2022 10:54:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231153AbiGEIyU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Jul 2022 04:54:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229933AbiGEIyT (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Jul 2022 04:54:19 -0400
Received: from meesny.iki.fi (meesny.iki.fi [IPv6:2001:67c:2b0:1c1::201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1516B116B
        for <linux-media@vger.kernel.org>; Tue,  5 Jul 2022 01:54:18 -0700 (PDT)
Received: from localhost (dsl-hkibng31-58c389-173.dhcp.inet.fi [88.195.137.173])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: msmakela)
        by meesny.iki.fi (Postfix) with ESMTPSA id 02F1E20191;
        Tue,  5 Jul 2022 11:54:13 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
        t=1657011254;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=sfC6G4taA3+DNf0Uc1lz77iXINmBfKFzBeXvcki9CZM=;
        b=nv69mqyDw9YNVHGNzAaj49XustuC6Vb6C+RFDjyYTSaLQotDoD8xgYCrBUO6gabJrM1xJc
        jEtKbcB4EvSijiM9Qd1HlFF9v7+ENkFysYdPJICRJVCKgBlxrynKow32UBO2zEDOF5QB6t
        XLxrxZk+Ravhb0SeoebI+ljNDpPH9Nw=
From:   =?UTF-8?q?Marko=20M=C3=A4kel=C3=A4?= <marko.makela@iki.fi>
To:     linux-media@vger.kernel.org
Cc:     Sean Young <sean@mess.org>,
        =?UTF-8?q?Marko=20M=C3=A4kel=C3=A4?= <marko.makela@iki.fi>
Subject: [PATCH] media: rc: Always report LIRC repeat flag
Date:   Tue,  5 Jul 2022 11:53:58 +0300
Message-Id: <20220705085358.44418-1-marko.makela@iki.fi>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=meesny; t=1657011254;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=sfC6G4taA3+DNf0Uc1lz77iXINmBfKFzBeXvcki9CZM=;
        b=H1Z7aHjf+agGhLtXUGks5C+SMDGD7tyoMMYE+E/sBXF4BOmu0W+4QfF4Ws+v1DE8oX0qIV
        E057ZGKA8L04SqdaJK1flufQyF+J+HuH0jtaOWbPU2V9ng6gsGL2CtQWFfKjDDQSOLZZ3b
        etLweF/qiVm0kBvlkw4X8QloUkcdLQg=
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=msmakela smtp.mailfrom=marko.makela@iki.com
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1657011254; a=rsa-sha256; cv=none;
        b=TwLvVnjRMYczhxM9Y+EsMz2qnQW18bWjsWcSvZjZeBAjhEU3lEagXWTdC6wgzeJLh6W1kK
        hUN4n9aAiD8ml938syUUyn3xmETV8QCoV+T4FLDz9mCPsKy4TdBHTBzekw2TwQzk1FwLvM
        HMf2ELkuDQyO1EVCp6Dl8AdU2T5RsEw=
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,T_SCC_BODY_TEXT_LINE,T_SPF_PERMERROR
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The flag LIRC_SCANCODE_FLAG_REPEAT was never set by rc_keydown().
Previously it was only set by rc_repeat(), but not all protocol
decoders invoke that function.

Signed-off-by: Marko Mäkelä <marko.makela@iki.fi>
---
 drivers/media/rc/rc-main.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/rc/rc-main.c b/drivers/media/rc/rc-main.c
index b90438a71c80..d914197245eb 100644
--- a/drivers/media/rc/rc-main.c
+++ b/drivers/media/rc/rc-main.c
@@ -786,7 +786,8 @@ static void ir_do_keydown(struct rc_dev *dev, enum rc_proto protocol,
 			  dev->last_toggle   != toggle);
 	struct lirc_scancode sc = {
 		.scancode = scancode, .rc_proto = protocol,
-		.flags = toggle ? LIRC_SCANCODE_FLAG_TOGGLE : 0,
+		.flags = (toggle ? LIRC_SCANCODE_FLAG_TOGGLE : 0) |
+		(!new_event ? LIRC_SCANCODE_FLAG_REPEAT : 0),
 		.keycode = keycode
 	};
 
-- 
2.36.1

