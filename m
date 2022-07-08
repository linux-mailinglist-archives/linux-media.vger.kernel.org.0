Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 426CE56B4AD
	for <lists+linux-media@lfdr.de>; Fri,  8 Jul 2022 10:45:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237571AbiGHIpl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 8 Jul 2022 04:45:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237447AbiGHIpl (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 8 Jul 2022 04:45:41 -0400
Received: from meesny.iki.fi (meesny.iki.fi [IPv6:2001:67c:2b0:1c1::201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8414814B6
        for <linux-media@vger.kernel.org>; Fri,  8 Jul 2022 01:45:37 -0700 (PDT)
Received: from localhost (dsl-hkibng31-58c389-173.dhcp.inet.fi [88.195.137.173])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: msmakela)
        by meesny.iki.fi (Postfix) with ESMTPSA id 392CE20050;
        Fri,  8 Jul 2022 11:45:33 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
        t=1657269933;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=0YH5pEDRJV8p2mgUkO3oryf9R5a7GNM9nJT9y3333uI=;
        b=UlEQnh5ZILSofJQXSorLaNftwij2gH64z+IYuLJSxq7Lnn6nYtM7Hw8WJ98FxY6pOxVqXG
        oEC5RY9TpbyRSuqK96xkwKbxI3u9upCTvPRBLi//X3JySYxPppMEXSFdWl4GKM1LQE2tvj
        7hvX19gV4iF8HtHrCwE0GfcwNA34gxI=
From:   =?UTF-8?q?Marko=20M=C3=A4kel=C3=A4?= <marko.makela@iki.fi>
To:     linux-media@vger.kernel.org
Cc:     Sean Young <sean@mess.org>,
        =?UTF-8?q?Marko=20M=C3=A4kel=C3=A4?= <marko.makela@iki.fi>
Subject: [PATCH] media: lirc: ensure lirc device receives repeats
Date:   Fri,  8 Jul 2022 11:44:59 +0300
Message-Id: <20220708084459.7472-1-marko.makela@iki.fi>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <Ysff5PEy580LIg8w@gofer.mess.org>
References: <Ysff5PEy580LIg8w@gofer.mess.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=meesny; t=1657269933;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=0YH5pEDRJV8p2mgUkO3oryf9R5a7GNM9nJT9y3333uI=;
        b=I8eHsCjBMEHrPfGjTR3RDELrhQCue2sFSnfh4hxC5sQJcT1dfrR6UeFi9+o760mAGA0c7f
        NYKHxc/JaDSeJD5Iu1vNa1CsaY/ffXfEX5PWZE1k+xAMAUGHLnTJKrOdsxYzMXi9vfRYVA
        nKmm+5WyARaCR0YnKAe4aMakTSyrkrw=
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=msmakela smtp.mailfrom=marko.makela@iki.com
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1657269933; a=rsa-sha256; cv=none;
        b=WWzFJbHo/Bn5aT8xWnY4sYG+lCDFKMJEIVuWwD2LfH2gDMQmBc7VLR/o/oqfKkGEVZ3fMg
        QZ/ksl8yonse2Q3/RnGcmSCYKwdbn2tpL6GIlzM+mwDX56ILzJnG6K7st6JZUyB6cOQy2v
        XHvemhACjwbFQCRhf5vNYWQt1VKJYDw=
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,T_SCC_BODY_TEXT_LINE,T_SPF_PERMERROR
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Pressing a button on a remote control unit will typically lead to
messages being sent several times per second until the button is released.

Some remote control units indicate long key presses by sending
special "repeat" messages, for which the protocol driver calls
rc_repeat(). Other units repeat the same message over and over,
which will be handled by calling rc_keydown().

The function rc_keydown() never set the LIRC "repeat" flag to distinguish
repeated messages that were sent due to a long keypress, and messages
sent due to repeated short keypresses. While a user-space program may
implement special logic to distinguish long keypresses, it is much simpler
to be able to rely on the flag.

Commit de142c32410649e64d44928505ffad2176a96a9e ("media: lirc: implement
reading scancode") would never set the LIRC_SCANCODE_FLAG_REPEAT flag.
Commit b66218fddfd29f315a103db811152ab0c95fb054
("media: lirc: ensure lirc device receives nec repeats") fixed it up for
rc_repeat() but not rc_keydown().

Signed-off-by: Marko Mäkelä <marko.makela@iki.fi>
Co-developed-by: Sean Young <sean@mess.org>
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

