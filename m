Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4557A341523
	for <lists+linux-media@lfdr.de>; Fri, 19 Mar 2021 06:54:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233933AbhCSFyR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 19 Mar 2021 01:54:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233941AbhCSFyI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 19 Mar 2021 01:54:08 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6D72C06174A
        for <linux-media@vger.kernel.org>; Thu, 18 Mar 2021 22:54:07 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id q6-20020a17090a4306b02900c42a012202so4304784pjg.5
        for <linux-media@vger.kernel.org>; Thu, 18 Mar 2021 22:54:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=H2onNyMv0+ob/okZPqoYsmcDlvNeiUOmNnhS+8A8w4M=;
        b=C8SKwinwmwSUzf5AlT9yBNtEOjHhq+9nRDgun2x7axvox9mO9RmbDDOYset/McEz4q
         LJhTTNko1qjcO2Sh1oXzR/iqyl9hsAl0lOMIXFo7Ea+gxhCspcR57FeZ+2llp7BXVYiA
         5gVkJo/EG7KxNMId/41ri84R8fuRz4GsyLWSg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=H2onNyMv0+ob/okZPqoYsmcDlvNeiUOmNnhS+8A8w4M=;
        b=l3/+yFxrpQBvw1Pd8OWXrfI1YQ4OHinJ9swF6FOFv1h6JWGEN9zgBcakamMmmMOHLF
         AfVh/eOxUhXiIeg2nh/qemaH/iD/uK8/NEoa3InxGVxjxladLlDQScNg5kVnoFcbEebv
         SJrkCQdlwXPIPAN2msKk48GNt0lUay4ugxpTV4omz+jvkAaeZJI0A5/hcaUFB5Ab4Ou1
         AOZ1Nm7BoH6TZzZesA2WsQuuot03Gt4ITCRsSAnmj9bIiqAVqOYnQrhPYVyIHq9mnMPz
         2j/UEr/HWr/7wz3+r/f+szCt19WS/oBcpgPmVy/oHbKeb7icsv+4CWaNWAdBGD9/tl7P
         O3Tg==
X-Gm-Message-State: AOAM532DIASmRIQWq/JbMO4fnQwonMsHanZCPqMGMyDJiUTrKVCzrlq8
        wcvPUiLMfG1jK+OXRPf2SqW8Bw==
X-Google-Smtp-Source: ABdhPJwBJIVaqetY0pJPd1jFqZzlJCm42nUgGVEXObUT1HHZrsn7+lVmW2zrxq8DFoQkuOtzPe/rUA==
X-Received: by 2002:a17:902:9a97:b029:e6:cb9a:292a with SMTP id w23-20020a1709029a97b02900e6cb9a292amr10264047plp.14.1616133247329;
        Thu, 18 Mar 2021 22:54:07 -0700 (PDT)
Received: from senozhatsky.flets-east.jp ([2409:10:2e40:5100:6577:f83d:5865:dfac])
        by smtp.gmail.com with ESMTPSA id o13sm4043704pgv.40.2021.03.18.22.54.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Mar 2021 22:54:06 -0700 (PDT)
From:   Sergey Senozhatsky <senozhatsky@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Ricardo Ribalda <ribalda@chromium.org>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCHv3 6/6] MAINTAINERS: update Senozhatsky email address
Date:   Fri, 19 Mar 2021 14:53:42 +0900
Message-Id: <20210319055342.127308-7-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.31.0.rc2.261.g7f71774620-goog
In-Reply-To: <20210319055342.127308-1-senozhatsky@chromium.org>
References: <20210319055342.127308-1-senozhatsky@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

I don't check my @gmail.com addresses often enough these days.

Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 MAINTAINERS | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index b2baeb5e4a68..01b000cd5774 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14433,7 +14433,7 @@ F:	kernel/sched/psi.c
 
 PRINTK
 M:	Petr Mladek <pmladek@suse.com>
-M:	Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
+M:	Sergey Senozhatsky <senozhatsky@chromium.org>
 R:	Steven Rostedt <rostedt@goodmis.org>
 R:	John Ogness <john.ogness@linutronix.de>
 S:	Maintained
@@ -19293,7 +19293,7 @@ F:	drivers/net/vrf.c
 VSPRINTF
 M:	Petr Mladek <pmladek@suse.com>
 M:	Steven Rostedt <rostedt@goodmis.org>
-M:	Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
+M:	Sergey Senozhatsky <senozhatsky@chromium.org>
 R:	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
 R:	Rasmus Villemoes <linux@rasmusvillemoes.dk>
 S:	Maintained
@@ -19944,7 +19944,7 @@ F:	drivers/staging/media/zoran/
 ZRAM COMPRESSED RAM BLOCK DEVICE DRVIER
 M:	Minchan Kim <minchan@kernel.org>
 M:	Nitin Gupta <ngupta@vflare.org>
-R:	Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
+R:	Sergey Senozhatsky <senozhatsky@chromium.org>
 L:	linux-kernel@vger.kernel.org
 S:	Maintained
 F:	Documentation/admin-guide/blockdev/zram.rst
@@ -19958,7 +19958,7 @@ F:	drivers/tty/serial/zs.*
 ZSMALLOC COMPRESSED SLAB MEMORY ALLOCATOR
 M:	Minchan Kim <minchan@kernel.org>
 M:	Nitin Gupta <ngupta@vflare.org>
-R:	Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
+R:	Sergey Senozhatsky <senozhatsky@chromium.org>
 L:	linux-mm@kvack.org
 S:	Maintained
 F:	Documentation/vm/zsmalloc.rst
-- 
2.31.0.rc2.261.g7f71774620-goog

