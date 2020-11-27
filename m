Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 036682C69A0
	for <lists+linux-media@lfdr.de>; Fri, 27 Nov 2020 17:45:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731512AbgK0Qle (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Nov 2020 11:41:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22292 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730786AbgK0Qle (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Nov 2020 11:41:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1606495292;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc; bh=lnuam6t1dXzzELpLGRbQVXkdkYHVojrbstXmjNQiiAo=;
        b=FDoKSdmx4qa4PpILEMlSAfVdFoGqqnJgavD0lxvnjOHA51m9Bc8OYoVIINQzUqHtT5K771
        H/03n1QwuJKn3Whfu6u4+eNpK2l3/ylBVD23RafSc8wEPAUMfWv69A3D7tFDQxlAIzXEsU
        IjkP1cJnO1E0nzrgGtVDzADD4Oh+CEg=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-7-p7l3XNDnO6yD7f8J6SIdyA-1; Fri, 27 Nov 2020 11:41:30 -0500
X-MC-Unique: p7l3XNDnO6yD7f8J6SIdyA-1
Received: by mail-qk1-f197.google.com with SMTP id s128so4035160qke.0
        for <linux-media@vger.kernel.org>; Fri, 27 Nov 2020 08:41:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=lnuam6t1dXzzELpLGRbQVXkdkYHVojrbstXmjNQiiAo=;
        b=gBPgW4TgxsOheW3BogvSeRnnr6TAyKcW12BSZhM75Wx//0evmIfk5YC31mA7yphDx9
         6NCN3+JIL/Jc0o4wveuB6xR5pVYIsfYiEq/hvRGVasCH+wTSsiHpUG8wFKDnlCrl1pVU
         /lNniy2PDNfYSDnMkjMIvb2SIJnUO6Pbj+GaLoCav5AGzdFhXn3E/orkJKRgvh4OOkl3
         thy6r7bqpzo0hFHoCNv7j7Y2q/O/CJhZUWuQzKPnnRYyIcuVa2mBv8x1SbkSHGZ0h478
         p09PX9Q/sletpLsOttxBanWAnOy5YrCew/oIPiLYzs9Ooc42GiHiF2aHHaOWzOF1oUTr
         gORQ==
X-Gm-Message-State: AOAM531zBPzw5Q2mDyLcZB1ko49k4p8v2pIhrLac5KtXCJvpJ2Oby+jI
        kfd2AV94ugqQaor0ND4aO99Jiwc2m/mjB8ueDHQCRXUJ8FGPTGhiqj6Adputg/vwFlfwcLl3Vu0
        ZsuddH1oCV8KTumT3hLoixx0=
X-Received: by 2002:ac8:37e5:: with SMTP id e34mr9275445qtc.363.1606495289971;
        Fri, 27 Nov 2020 08:41:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzGVoB1FnATLvFMiWzvnKfj4zWNscV10h/VlSxByCUq/xEQFr+dQD8NalIXyFGn5WsQrgOKMw==
X-Received: by 2002:ac8:37e5:: with SMTP id e34mr9275426qtc.363.1606495289793;
        Fri, 27 Nov 2020 08:41:29 -0800 (PST)
Received: from trix.remote.csb (075-142-250-213.res.spectrum.com. [75.142.250.213])
        by smtp.gmail.com with ESMTPSA id d82sm6166735qkc.14.2020.11.27.08.41.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2020 08:41:29 -0800 (PST)
From:   trix@redhat.com
To:     a.hajda@samsung.com, mchehab@kernel.org
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tom Rix <trix@redhat.com>
Subject: [PATCH] [media] s5k5baf: remove trailing semicolon in macro definition
Date:   Fri, 27 Nov 2020 08:41:23 -0800
Message-Id: <20201127164123.2678983-1-trix@redhat.com>
X-Mailer: git-send-email 2.18.4
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Tom Rix <trix@redhat.com>

The macro use will already have a semicolon.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/media/i2c/s5k5baf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/s5k5baf.c b/drivers/media/i2c/s5k5baf.c
index ec6f22efe19a..6e702b57c37d 100644
--- a/drivers/media/i2c/s5k5baf.c
+++ b/drivers/media/i2c/s5k5baf.c
@@ -510,7 +510,7 @@ static void s5k5baf_write_arr_seq(struct s5k5baf *state, u16 addr,
 
 #define s5k5baf_write_seq(state, addr, seq...) \
 	s5k5baf_write_arr_seq(state, addr, sizeof((char[]){ seq }), \
-			      (const u16 []){ seq });
+			      (const u16 []){ seq })
 
 /* add items count at the beginning of the list */
 #define NSEQ(seq...) sizeof((char[]){ seq }), seq
-- 
2.18.4

