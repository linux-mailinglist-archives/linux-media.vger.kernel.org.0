Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2132B6ADB41
	for <lists+linux-media@lfdr.de>; Tue,  7 Mar 2023 11:00:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230371AbjCGKAc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Mar 2023 05:00:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229972AbjCGKAb (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 Mar 2023 05:00:31 -0500
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0E433B23C;
        Tue,  7 Mar 2023 02:00:29 -0800 (PST)
Received: by mail-ed1-x529.google.com with SMTP id o12so49904109edb.9;
        Tue, 07 Mar 2023 02:00:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678183228;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bW3imLrGp8WnT6vZrMOHCljPinwG95AEioNHWio/7vQ=;
        b=L8FEZOA8koMilcVz3cjTV/TbCnAocXh7L/8qUd1x16qbmEZzfksfcMY1XtBXiszSMV
         MutxCKvuzckqOVVh4ZNkhEzZr/Hnl3LQvJ9SxQ1jcGi7AAxWE+VbF3SdHeqnMTvbs/y7
         S3jvNl/i0tSg+nQUGYU+8AcLss+SEWBu4wh9ihDpSbqC7qNAUL6JSmw3DPmzi+RSUIYV
         YWig7z7jztccm3jvIWLisKb3qvLNMib/gYjlAik6f9P809Y9qWQcmbobGPPhE10oOzwq
         4a6wFnRSnMLcKJ8vfumWJT7y3U5/3cYXbhERoS7wmRm4+NfvB5mWDJDNT5hfoDJMCVx8
         I3NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678183228;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bW3imLrGp8WnT6vZrMOHCljPinwG95AEioNHWio/7vQ=;
        b=KvTsDL0Fnhf3d6K10aj2ShFDia9Mhgoo0S75pHr88K/P2rT6eq/1cymBkBjF8twEwH
         lAJyFuF5Kbs+euRyrAV9I0YwzpunKbHa+xUqX41z9chVaRbQKShrIkXdGnJyFmpK9+0H
         C9h+Xx2cLEL6dflvAWyShaQyzWKkR2qkSkvUHhWcnDBRyM/SsyFBOA+kShnEllev4z3h
         WL52UXFlM3INlgxcBGDvq6OVp/Akf3B5LFghglmNxbTh8CEF/MlqBrljeX1TTRWjMz89
         MNekbmvlnPyMqxIEggsr/WAJqLYpDOkwkOCrW+urhhMyeDsZXcvQyPijZuTht0SWzWA4
         AdUg==
X-Gm-Message-State: AO0yUKU3lBC11dW5WtX2kQhAc7eMF1vNPfIV1EBaSRyKr8WiTOW0XMnx
        9Oai+kzXxK/Cp3ZTgpqGczw=
X-Google-Smtp-Source: AK7set+Mu0sSz5kh5LcUFRENpxc7AFUW6iMQai3ePX6vLZBpQmKw5SrwMprhdA8xotXGanAeNWGcwg==
X-Received: by 2002:a17:906:1410:b0:8f6:76da:90dd with SMTP id p16-20020a170906141000b008f676da90ddmr12794941ejc.64.1678183228457;
        Tue, 07 Mar 2023 02:00:28 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id m26-20020a50999a000000b004af73333d6esm6502618edb.53.2023.03.07.02.00.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Mar 2023 02:00:28 -0800 (PST)
Date:   Tue, 7 Mar 2023 13:00:23 +0300
From:   Dan Carpenter <error27@gmail.com>
To:     Oliver Endriss <o.endriss@gmx.de>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Husni Faiz <ahamedhusni73@gmail.com>,
        Li zeming <zeming@nfschina.com>,
        Oliver Endriss <o.endriss@gmx.de>, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, kernel-janitors@vger.kernel.org,
        lwn@lwn.net, smatch@ver.kernel.org
Subject: [PATCH] media: av7110: prevent underflow in write_ts_to_decoder()
Message-ID: <9dbe6804-7fac-4ee1-9e70-c3648cb60ec8@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The buf[4] value comes from the user via ts_play().  It is a value in
the u8 range.  The final length we pass to av7110_ipack_instant_repack()
is "len - (buf[4] + 1) - 4" so add a check to ensure that the length is
not negative.  It's not clear that passing a negative len value does
anything bad necessarily, but it's not best practice.

With the new bounds checking the "if (!len)" condition is no longer
possible or required so remove that.

Fixes: fd46d16d602a ("V4L/DVB (11759): dvb-ttpci: Add TS replay capability")
Signed-off-by: Dan Carpenter <error27@gmail.com>
---
This is from static analysis and not tested.  I debated whether to
return 0 or -1.

 drivers/staging/media/av7110/av7110_av.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/av7110/av7110_av.c b/drivers/staging/media/av7110/av7110_av.c
index 0bf513c26b6b..a5c5bebad306 100644
--- a/drivers/staging/media/av7110/av7110_av.c
+++ b/drivers/staging/media/av7110/av7110_av.c
@@ -823,10 +823,10 @@ static int write_ts_to_decoder(struct av7110 *av7110, int type, const u8 *buf, s
 		av7110_ipack_flush(ipack);
 
 	if (buf[3] & ADAPT_FIELD) {
+		if (buf[4] > len - 1 - 4)
+			return 0;
 		len -= buf[4] + 1;
 		buf += buf[4] + 1;
-		if (!len)
-			return 0;
 	}
 
 	av7110_ipack_instant_repack(buf + 4, len - 4, ipack);
-- 
2.39.1

