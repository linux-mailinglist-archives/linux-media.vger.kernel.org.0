Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06D06354810
	for <lists+linux-media@lfdr.de>; Mon,  5 Apr 2021 23:12:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231743AbhDEVNA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 5 Apr 2021 17:13:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229929AbhDEVM7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 5 Apr 2021 17:12:59 -0400
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com [IPv6:2607:f8b0:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37EC4C061788
        for <linux-media@vger.kernel.org>; Mon,  5 Apr 2021 14:12:51 -0700 (PDT)
Received: by mail-ot1-x329.google.com with SMTP id k14-20020a9d7dce0000b02901b866632f29so12660358otn.1
        for <linux-media@vger.kernel.org>; Mon, 05 Apr 2021 14:12:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:message-id:mime-version:content-disposition
         :content-transfer-encoding;
        bh=lYGlm6f9hRZfWcvjLtk2u1uECx/OsINvUuHizYsL5p0=;
        b=AlkB4TUOWI8w6++//9eiTGeZfnj+FP4fONZLRXYacQlcnY2ASqQS42+uUKjTZDjSbv
         3/bHNoxFVTcYO4fhf63MMjhsFau2txb6zXdaeEwPy4/x1/63441TQ4WiyVrZtsFaPUkM
         tGLgfBiPH9oGhS4h+5uC9UqK0q4i7O5qCo/mIBqCSrVNOZAEz1Drk7CA/0XVdOLu9RXC
         muYqjgfoMOYyKijlrQRjBONp3R5rP78j2DOAwRP5wk4MM17mML60RmTAyMBUJlgNgy7m
         //p+aSvmptIQ6Yo/jIdBGir92TTT87dudUiR1HMkQnFTjmmeBpeW+chfvnuW5IYRo9+R
         x6HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:message-id:mime-version
         :content-disposition:content-transfer-encoding;
        bh=lYGlm6f9hRZfWcvjLtk2u1uECx/OsINvUuHizYsL5p0=;
        b=n/08BMcONLJN3yAqjW47YGLG8XQBmYwpubre8Fn7+NZ7kPsFy69tMF/6ShykpbrptY
         AACc+xnNsna7HxiuYloGjFQAayVqJtFMMbABxKElZNReKbUgwTK9ze9bfOWM7D4uHb5t
         bEug+ZakzDqjtbhIGeFymkwMbMlLlxLOYavftwJb09NMM8TwG3jXiVfiFEl4hdiIRxkn
         dCdP26oNsScnGmx+83vkoczd7cdyDGFM7gA5PHi4XvXj3wy3Y0z5ioH1eUMnA06dNRje
         2P/oprd5+Vn09rHkoIx1WLNcWM9xLmNzd1HBMxy+qE6NwNNQwUWe/XS75chg65imV7a/
         Pxng==
X-Gm-Message-State: AOAM530oXVctS8VnL2b7GSgosaeARqRFPaFRQFNQ6itpE6yVwrUUw3qX
        ou8EJ4+eEt0U862ORv9YMuo=
X-Google-Smtp-Source: ABdhPJyKP6WYlSNq8PN6FzokKUDIR0wPYA4MMy8A1vkpGwPPV2Z9I61Q/ajpaJZgN80b1Fkg7s7ljg==
X-Received: by 2002:a9d:1c7:: with SMTP id e65mr23709619ote.259.1617657170705;
        Mon, 05 Apr 2021 14:12:50 -0700 (PDT)
Received: from fedora ([2806:2f0:7000:86b1:c1bc:6875:f962:d652])
        by smtp.gmail.com with ESMTPSA id g13sm4178255otq.3.2021.04.05.14.12.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Apr 2021 14:12:50 -0700 (PDT)
Date:   Mon, 5 Apr 2021 16:12:48 -0500
From:   David Villasana =?iso-8859-1?Q?Jim=E9nez?= 
        <davidvillasana14@gmail.com>
To:     mchehab@kernel.org
Cc:     linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Message-ID: <YGt9UNqRnOx2j+4M@fedora>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com
Bcc: 
Subject: [PATCH] staging: media: atomisp: i2c: Fix alignment to match open
 parenthesis
Reply-To: 

Change alignment of arguments in the function
__gc0310_write_reg_is_consecutive() to match open parenthesis. Issue found
by checkpatch.pl

Signed-off-by: David Villasana Jiménez <davidvillasana14@gmail.com>
---
 drivers/staging/media/atomisp/i2c/atomisp-gc0310.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
index 2b71de722ec3..6be3ee1d93a5 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
@@ -192,8 +192,8 @@ static int __gc0310_buf_reg_array(struct i2c_client *client,
 }
 
 static int __gc0310_write_reg_is_consecutive(struct i2c_client *client,
-	struct gc0310_write_ctrl *ctrl,
-	const struct gc0310_reg *next)
+					     struct gc0310_write_ctrl *ctrl,
+					     const struct gc0310_reg *next)
 {
 	if (ctrl->index == 0)
 		return 1;
-- 
2.30.2

