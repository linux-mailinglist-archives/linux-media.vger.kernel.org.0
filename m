Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 591D3283382
	for <lists+linux-media@lfdr.de>; Mon,  5 Oct 2020 11:41:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725934AbgJEJlL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 5 Oct 2020 05:41:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725887AbgJEJlL (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 5 Oct 2020 05:41:11 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A34C5C0613CE;
        Mon,  5 Oct 2020 02:41:10 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id w11so10060445lfn.2;
        Mon, 05 Oct 2020 02:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:cc:subject:message-id:mime-version:content-disposition;
        bh=+9JAB28L74MMfFB7S55Rs2h7YnjTntIlkqauZG+K27o=;
        b=vF+esWPLigxLLZ0wnzama7Tvs/aAs1OI0OCxkXT38WfkvfXrGP/GpMl9YGn3xMdzPP
         dqbUi0Bs705W70qpDShUEra+tPs+KdsdRJE6PH1HA23E/xPUiB3fE9Bzy+fry1/RGWb5
         HQpHsKKYoxTqoOhmkAMTGYd9iL9dYpTyCoSh5DnGBc6+LvqoFjGaz8sFQRnaIa+EuebY
         h4WwkM1qP3CuesDTETpGqonf3dmwdMRohLfC6Mippneh3v1vZLuvqnPHz/Bw51IP4PoN
         jG78lYlY429xJm4iUe/E2PCWGr0owfH2/bbvh9PSWHVo1ek/dmOCVQ3ST1FNdlCU5TGz
         df5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:cc:subject:message-id:mime-version
         :content-disposition;
        bh=+9JAB28L74MMfFB7S55Rs2h7YnjTntIlkqauZG+K27o=;
        b=BP2gl8zpowFzK2Bqc6gsWtHc7dbjrlfzdM3j31orFTgdkQXjbnCuIlS6aIIh0Xm5Pj
         UpnmLBJfFKBRpnagwGSjSB63ZortAJ/xCiXlkt+qK+pqvpIyb8DiIYAxrNWHpq4MVoDY
         W7Gsv0GFqnkYYc+okig6Zz8s6N9XpXTc5+44jL3nsCBMZUy2Bo8JMSCBrTiCjotYXRUw
         faeum1CHm/8dNCVzVbzf7DZGgv2vajJFrhDIsgeUGNszO5oaTzR7yACN19p19ZXPYgF9
         xKmhPxGRAwJ2JRGNhfHpAsZRwaxVSiuFPEPlN0RBDQC69sKGPRrdiPY9XoGeyuL7ODKe
         cvjA==
X-Gm-Message-State: AOAM530nPRDRvGxGm9w7RRUyiLUz4ENERoJ8LDGShgBoMzPFv75lEldJ
        wLwReJbt9PmTRGE8HJZkOqDuflcW3yj6p+ot
X-Google-Smtp-Source: ABdhPJyqg9BCUpKxLdYVB4TLUg5t8ZiHzdw3yzccmcSllg2D1h9qhZrMz9yfWMhbfIgKB8TqlnCWuA==
X-Received: by 2002:a19:c150:: with SMTP id r77mr2966563lff.288.1601890868791;
        Mon, 05 Oct 2020 02:41:08 -0700 (PDT)
Received: from linux ([185.17.130.172])
        by smtp.gmail.com with ESMTPSA id m2sm2604194lfg.9.2020.10.05.02.41.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2020 02:41:07 -0700 (PDT)
Date:   Mon, 5 Oct 2020 11:41:07 +0200
From:   Leonid Kushnir <leonf008@gmail.com>
Cc:     mchehab@kernel.org, sakari.ailus@linux.intel.com,
        gregkh@linuxfoundation.org, leonf008@gmail.com,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] media: staging: atomisp: Fixed allignment to match open
 parenthesis
Message-ID: <20201005094107.GA44033@linux>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Moved the parameters of the function '__gc0310_write_reg_is_consecutive'
to the right under open parenthesis to fix warning message from
checkpatch.pl: 'CHECK: Alignment should match open parenthesis'.

Signed-off-by: Leonid Kushnir <leonf008@gmail.com>
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
2.25.1

