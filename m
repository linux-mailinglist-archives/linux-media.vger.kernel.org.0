Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ECACB2DDEA6
	for <lists+linux-media@lfdr.de>; Fri, 18 Dec 2020 07:32:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732845AbgLRGcF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Dec 2020 01:32:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732830AbgLRGcF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Dec 2020 01:32:05 -0500
Received: from mail-vk1-xa2c.google.com (mail-vk1-xa2c.google.com [IPv6:2607:f8b0:4864:20::a2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE315C0617A7;
        Thu, 17 Dec 2020 22:31:24 -0800 (PST)
Received: by mail-vk1-xa2c.google.com with SMTP id o195so277218vka.9;
        Thu, 17 Dec 2020 22:31:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=ObGsyMvKVeZhdZNtJYABaU0OlJzGDwB1XTw5HknW98w=;
        b=VFY3JDneellkJcK8fYUVTCjVjLvTQGFBTOpQ+FcvioJZaW8NGsgNGTsbcW3XB6Tt+S
         vdcJ1my23f1CCFk+cZORa89okkBo6WV6G37/jzi0Y/f+REpDi83m2yGN9LlovKCugbkk
         jXUbWgamW6lh8w5sozE2Ro+o9gpyTIMFHYIXGtwP2LRiv29gEQVUzhw/tAXZsdjEWFt4
         JpZ2TUWUFxq050CXhu4+q3MXtFRUI0/94n665+rB+oJjwnGyjzMq5DmtHcXPsbjRiSKr
         vljtCtT6CM9GPs5riUa1+6abH1pEV46km5sKVxchSSiBERkJ8O9gCSaEOPvHy4gKdlLB
         LUkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=ObGsyMvKVeZhdZNtJYABaU0OlJzGDwB1XTw5HknW98w=;
        b=TwjGW/Qd5UwiJ92vvFkM0dKTA3dgfwoMrj+nWsNqvZRnS+tTj19x/poejTiVgLjPiU
         DCiKY3Cv5BcXu0i/2bEdjL0rRX/hZAhbBBGgZVgH4PFK75SF5bQso+BUmcsdecZVNNgu
         kYojMArUjN20udHxZtMErO45bfmh70fq4irAtgbp4C/ol3NylXnioIFVqTb9dsCIWXus
         /0jqU2IR0XCSDeDFuf6ooVaOILnZAagtFruTLe517dkw0UrMjL6ICsgxefTDfY3axx6B
         xTso3GXvFGzxGBjf5IolIlhLj27D/YptIviUx4C6cJhcFl9rs3nuiwKfa4cGemOmM7Fx
         GTlA==
X-Gm-Message-State: AOAM5306tgLp/ia1sYrZIp2uJ6b0Q93gSCLoSgG3Zo0XO4nTi1nuXYR6
        XdU3p4Mhwqz9QSuwcLmROic=
X-Google-Smtp-Source: ABdhPJwusp5qfzxGF3xU1e4T41++sftUUha7hkzsv1ZJgAf6AII7ZhzXQxkfSjBbxWwnO+5U46Veig==
X-Received: by 2002:a1f:9ed4:: with SMTP id h203mr2102352vke.1.1608273083917;
        Thu, 17 Dec 2020 22:31:23 -0800 (PST)
Received: from fedora ([179.48.251.236])
        by smtp.gmail.com with ESMTPSA id b19sm949757vsq.18.2020.12.17.22.31.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Dec 2020 22:31:23 -0800 (PST)
Date:   Fri, 18 Dec 2020 01:31:17 -0500
From:   Nigel Christian <nigel.l.christian@gmail.com>
To:     hverkuil-cisco@xs4all.nl, mchehab@kernel.org,
        sakari.ailus@linux.intel.com, dan.carpenter@oracle.com,
        gustavoars@kernel.org
Cc:     linux-media@vger.kernel.org, trivial@kernel.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] media: cec: fix trivial style warnings
Message-ID: <20201218063117.GA80700@fedora>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Comment has 'then' repeated twice. Let's clean it up.
Use unsigned int to maintain naming consistency.

Signed-off-by: Nigel Christian <nigel.l.christian@gmail.com>
---
 drivers/media/cec/core/cec-adap.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/cec/core/cec-adap.c b/drivers/media/cec/core/cec-adap.c
index d5d5d28d0b36..79fa36de8a04 100644
--- a/drivers/media/cec/core/cec-adap.c
+++ b/drivers/media/cec/core/cec-adap.c
@@ -1296,7 +1296,7 @@ static int cec_config_log_addr(struct cec_adapter *adap,
 	/*
 	 * If we are unable to get an OK or a NACK after max_retries attempts
 	 * (and note that each attempt already consists of four polls), then
-	 * then we assume that something is really weird and that it is not a
+	 * we assume that something is really weird and that it is not a
 	 * good idea to try and claim this logical address.
 	 */
 	if (i == max_retries)
@@ -1735,7 +1735,7 @@ int __cec_s_log_addrs(struct cec_adapter *adap,
 		const u8 feature_sz = ARRAY_SIZE(log_addrs->features[0]);
 		u8 *features = log_addrs->features[i];
 		bool op_is_dev_features = false;
-		unsigned j;
+		unsigned int j;
 
 		log_addrs->log_addr[i] = CEC_LOG_ADDR_INVALID;
 		if (log_addrs->log_addr_type[i] > CEC_LOG_ADDR_TYPE_UNREGISTERED) {
-- 
2.29.2

