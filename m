Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 723A4362C12
	for <lists+linux-media@lfdr.de>; Sat, 17 Apr 2021 01:55:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234965AbhDPX4P (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 16 Apr 2021 19:56:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229719AbhDPX4O (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Apr 2021 19:56:14 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93AE9C061574;
        Fri, 16 Apr 2021 16:55:47 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id p6so21463692wrn.9;
        Fri, 16 Apr 2021 16:55:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4wthoTfG2N095M+QSjMZEKkLwrzkypphGz/WswOOAXA=;
        b=KPfIJgqsbMvWcyeDZgvaohrbarQWY4tQSocA53ct384vzydBOxJohaRVl4SiGaMgoZ
         1zn7QaflcT4O+x1TsLrPBgjDpPeaTdi4qi3Yuf7CqYf4fl2z26SnYsY4kpAjsmpkYLjQ
         Yc40uPVmGBx9Ly0KZtDRgAwS25s6CcNPdfChDaZET/QaIajBQQJjA9s4fK0ye7nfjz43
         z6AJ7t/lnM4NzhmOYZ3E9Eo2rGSk0+ldz7NXZe6lrVa2idBTyhPgcu2sTVHsWzfLXk4R
         SnjMhdNP2lPrkCSD/VFGnmtZCFBAkdrcA3Q78KN2OfK2NHo/nu3OCpsUG19P6vNUslSo
         yq2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4wthoTfG2N095M+QSjMZEKkLwrzkypphGz/WswOOAXA=;
        b=aT3LOtfUTq9+rXQvyNgHXRVyrMx3KVUFCwt7BKEg9q0A0NaP7Pmc3wKbTJs5ddFaHX
         WXejBo5FuAmn0s+UdYbK5KfAKcWlqOlAzJrh4LjS/t87RJSQij7Y25ZdqGzbwDj1EYFm
         /chp8xqGR6r3yk+DFqlRdY4Lfz6cEd+aUFCgBb+RE3udRyglF21zd53eZpoVNJ4G1FaK
         wKRC+Kj539B/1EkKwPoM1rspLsLw7ooU+uu+JPUD19j0qvWjzXEEye9dO0b79k2R2qlP
         f052a6wv/nBY2wf7A41/fOLrEyoDFlzVhDSmet3SpRPtN3QpZdbBUL+IZ77RH9k9lfnv
         S4Rw==
X-Gm-Message-State: AOAM53275WbMl47DHkXLzYwnYeTWBGhfibMmYN787PWFvqvkr4506t0L
        IL6YADG1dEnKCmhGvDxS36Q=
X-Google-Smtp-Source: ABdhPJzokJ3S7/Nvto/qASej34awec78j2EKo6ESTo8Rl9SrWHtb5yFKoYy3nyvWSXx0u5QLfhP9zQ==
X-Received: by 2002:a5d:47ad:: with SMTP id 13mr1601861wrb.56.1618617346324;
        Fri, 16 Apr 2021 16:55:46 -0700 (PDT)
Received: from localhost.localdomain (host-84-13-30-150.opaltelecom.net. [84.13.30.150])
        by smtp.gmail.com with ESMTPSA id u8sm12404539wrr.42.2021.04.16.16.55.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Apr 2021 16:55:45 -0700 (PDT)
From:   Sudip Mukherjee <sudipm.mukherjee@gmail.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Subject: [PATCH] media: sp887x: drop unneeded assignment
Date:   Sat, 17 Apr 2021 00:53:36 +0100
Message-Id: <20210416235336.1552102-1-sudipm.mukherjee@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The pointer 'mem' was initialized to 'fw->data' but immediately after
that it was assigned 'fw->data + 10'. Lets remove the extra assignement
and initialize the pointer to the address its going to use.

Signed-off-by: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
---
 drivers/media/dvb-frontends/sp887x.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/media/dvb-frontends/sp887x.c b/drivers/media/dvb-frontends/sp887x.c
index c89a91a3daf4..146e7f2dd3c5 100644
--- a/drivers/media/dvb-frontends/sp887x.c
+++ b/drivers/media/dvb-frontends/sp887x.c
@@ -140,7 +140,7 @@ static int sp887x_initial_setup (struct dvb_frontend* fe, const struct firmware
 	u8 buf [BLOCKSIZE + 2];
 	int i;
 	int fw_size = fw->size;
-	const unsigned char *mem = fw->data;
+	const unsigned char *mem = fw->data + 10;
 
 	dprintk("%s\n", __func__);
 
@@ -148,8 +148,6 @@ static int sp887x_initial_setup (struct dvb_frontend* fe, const struct firmware
 	if (fw_size < FW_SIZE + 10)
 		return -ENODEV;
 
-	mem = fw->data + 10;
-
 	/* soft reset */
 	sp887x_writereg(state, 0xf1a, 0x000);
 
-- 
2.30.2

