Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 360F22C69F8
	for <lists+linux-media@lfdr.de>; Fri, 27 Nov 2020 17:46:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732189AbgK0QoS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Nov 2020 11:44:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55990 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731364AbgK0QoR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Nov 2020 11:44:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1606495456;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc; bh=TwpGbXjOlt1kS9wpoNLS5N+Ed2xsTnCZ7b23klTflIs=;
        b=JMD7GrOW8aOHnzcKdc1RtVwjpHp7YCO6SxJYnrxMFrDu8+h935nRv4/v17jxecvTLLHo0O
        ZwYuSaAr3VagWxybL3VepOu1sEiH/8Ad2rsdaVzURgrEhtV5JhVuEUIIvjH3nEjPKKFitO
        +DCPEdlxXV51hbDN2pvcGA7kNUUaK8o=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-257-DCe1En6KNeWr2--4cl6oYA-1; Fri, 27 Nov 2020 11:44:14 -0500
X-MC-Unique: DCe1En6KNeWr2--4cl6oYA-1
Received: by mail-qt1-f198.google.com with SMTP id i14so3537914qtq.18
        for <linux-media@vger.kernel.org>; Fri, 27 Nov 2020 08:44:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=TwpGbXjOlt1kS9wpoNLS5N+Ed2xsTnCZ7b23klTflIs=;
        b=U4jUt9zxhmiCet64aX003IwlfuFeXCcWIsln0agaoglIxxMuEk6NPtU8NJI+Qdg3Ju
         Ok0/x6sZhUDeu4IGM9VNJxXrcSD70WHbJqqdhlL2vbcomYrVThQtjkPLjVfR+/tOuasG
         NFRbu2K1lE/+VmRagCOwDvIv/9Z4+jqExOaSccCLa9M+ZXj19bxGAxWdNh419o6Qatww
         GelPM8kUTyRwvkYkhi/WbMuKhvauAPWqZ0FGJ2PQXtf6HiV39gnyiUaJ70rY03Ey6V9g
         3wHXSYPzdu9rn9ekeQ7avSVrEbI1sAgG/nEemj4xXqXQmAJqzO4wf0GZDXmSfh4N3mVV
         Raww==
X-Gm-Message-State: AOAM532vpWMb/GBWY3AAFBy62qBLKuTv3w563daJNTzdcjWeYfWQGrez
        nUNYh/RYy12Vmj+pqNlAWiJzZCJhv6QNpgk5O/TMEdv36ufJ0aGNv75iS3lCeAOh28uWTAOtvpx
        ndXe2CO6Av5wXcZDK1TNKwLE=
X-Received: by 2002:a37:9d04:: with SMTP id g4mr9419341qke.358.1606495454193;
        Fri, 27 Nov 2020 08:44:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJydEvQKiS/17x/Cvd7NOY/yxXaR8v6isQTidB5yWEDYSbUF8gQewgYqaSQtYkwQ8mZrhHEgLw==
X-Received: by 2002:a37:9d04:: with SMTP id g4mr9419325qke.358.1606495454006;
        Fri, 27 Nov 2020 08:44:14 -0800 (PST)
Received: from trix.remote.csb (075-142-250-213.res.spectrum.com. [75.142.250.213])
        by smtp.gmail.com with ESMTPSA id m68sm5267180qkb.47.2020.11.27.08.44.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2020 08:44:13 -0800 (PST)
From:   trix@redhat.com
To:     edubezval@gmail.com, mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        gustavoars@kernel.org, sakari.ailus@linux.intel.com
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tom Rix <trix@redhat.com>
Subject: [PATCH] [media] si4713: remove trailing semicolon in macro definition
Date:   Fri, 27 Nov 2020 08:44:08 -0800
Message-Id: <20201127164408.2682460-1-trix@redhat.com>
X-Mailer: git-send-email 2.18.4
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Tom Rix <trix@redhat.com>

The macro use will already have a semicolon.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/media/radio/si4713/si4713.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/radio/si4713/si4713.c b/drivers/media/radio/si4713/si4713.c
index 6afa7c3464ab..fcb4030b9091 100644
--- a/drivers/media/radio/si4713/si4713.c
+++ b/drivers/media/radio/si4713/si4713.c
@@ -86,7 +86,7 @@ MODULE_VERSION("0.0.1");
 #define check_command_failed(status)	(!(status & SI4713_CTS) || \
 					(status & SI4713_ERR))
 /* mute definition */
-#define set_mute(p)	((p & 1) | ((p & 1) << 1));
+#define set_mute(p)	((p & 1) | ((p & 1) << 1))
 
 #ifdef DEBUG
 #define DBG_BUFFER(device, message, buffer, size)			\
-- 
2.18.4

