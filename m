Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 777BB91E44
	for <lists+linux-media@lfdr.de>; Mon, 19 Aug 2019 09:47:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726464AbfHSHrN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Aug 2019 03:47:13 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:33700 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726149AbfHSHrN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Aug 2019 03:47:13 -0400
Received: by mail-pg1-f193.google.com with SMTP id n190so728156pgn.0
        for <linux-media@vger.kernel.org>; Mon, 19 Aug 2019 00:47:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Q4vYYSUs6wMH5c2nOAUQtMwnrtTATw9tC94WbjbFWmI=;
        b=qjhsL2EFExZQQlH0ue7yCvbpLMdXWGz8rkVQaJGif6vK6L01Nj9VR38J3U5h2g9XhS
         /d07Q45s3LArsfCFZG56ltZn6uy6RW3hmgi9kW2r5DcJt2iiyjaZ375UW5tj21MqlTaK
         7RWye+sw6r6jnAZL7k9VQDMrFzYMkYOeZakaCkEbDn/Vcxz9zHCnZSdYO5Hb3BYncIao
         t54Kg/rPZuzzdkUOr4cJTsEgsD7bXJNeb/0CxerdxLGEBQbsZtLKSPbVTAbzt9tScxl2
         5VTRotyq2OFs/JXJiDWEy4vVhLlFkElQcayqonFnZ7n+M6HHGsOQnfqsmJrqUER9NSKv
         gaKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Q4vYYSUs6wMH5c2nOAUQtMwnrtTATw9tC94WbjbFWmI=;
        b=pnspJvt3U4GNRdTm9hgb/WM3l64uHEpO+GwcjnHSdxTNcf6oayDLp3z/Ng9ZZOn6f/
         KHmBCp4kBjj2Km5tgbH6Tvc3oEzRovv5X3wCbikMTzIPuVsiaXcqAr2f+PYUokVI9r/E
         U8beeqXlof92LlqzNIauTKY/bH9gn0gGNFe9GEMUUr3X7tyxFboTiQ7KiBToglCXFQP4
         uHR/Vhh1+e6Is90w/W+re9xsfwU9YHm1uRLeUh8fq4+Tg4EJa1+LrckUQlRqDqQLWDoo
         agTQ53m0upNDfD2zhEYe54U4WYHvMKyCA2hFoDGABmDdfUx4lFVNzkdsJW/hiwmukx+g
         Xpew==
X-Gm-Message-State: APjAAAV40Nva9U9cANVz6MoHKrkFKdVWO3xz4kaHpyp6ZZyA44OXUjV9
        m2cEzpj7FhrC74CvUX3dwssVzIbp
X-Google-Smtp-Source: APXvYqzVbHkHkmiCAfe6cvwL4f+IzAqlB2uz+dE1vN9jPKRLaM+SSNOW5wEdFQUUbdx47LBE578uYA==
X-Received: by 2002:a63:3ec7:: with SMTP id l190mr19174326pga.334.1566200832571;
        Mon, 19 Aug 2019 00:47:12 -0700 (PDT)
Received: from localhost.localdomain ([110.225.16.165])
        by smtp.gmail.com with ESMTPSA id g19sm24314228pfk.0.2019.08.19.00.47.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2019 00:47:12 -0700 (PDT)
From:   Nishka Dasgupta <nishkadg.linux@gmail.com>
To:     mchehab@kernel.org, linux-media@vger.kernel.org, jasmin@anw.at
Cc:     Nishka Dasgupta <nishkadg.linux@gmail.com>
Subject: [PATCH] media: dvb-frontends/cxd2099: Make en_templ constant
Date:   Mon, 19 Aug 2019 13:17:01 +0530
Message-Id: <20190819074701.493-1-nishkadg.linux@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Static structure en_templ, of type dvb_ca_en50221, is not used except to
be copied into a local variable. Hence make it const to prevent
unintended modification of the original fields.
Issue found with Coccinelle.

Signed-off-by: Nishka Dasgupta <nishkadg.linux@gmail.com>
---
 drivers/media/dvb-frontends/cxd2099.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/dvb-frontends/cxd2099.c b/drivers/media/dvb-frontends/cxd2099.c
index 5264e873850e..f88b5355493e 100644
--- a/drivers/media/dvb-frontends/cxd2099.c
+++ b/drivers/media/dvb-frontends/cxd2099.c
@@ -594,7 +594,7 @@ static int write_data(struct dvb_ca_en50221 *ca, int slot, u8 *ebuf, int ecount)
 	return ecount;
 }
 
-static struct dvb_ca_en50221 en_templ = {
+static const struct dvb_ca_en50221 en_templ = {
 	.read_attribute_mem  = read_attribute_mem,
 	.write_attribute_mem = write_attribute_mem,
 	.read_cam_control    = read_cam_control,
-- 
2.19.1

