Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E26381F8677
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2020 05:58:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726527AbgFND6q (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 13 Jun 2020 23:58:46 -0400
Received: from mta-p8.oit.umn.edu ([134.84.196.208]:54882 "EHLO
        mta-p8.oit.umn.edu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726486AbgFND6q (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 13 Jun 2020 23:58:46 -0400
Received: from localhost (unknown [127.0.0.1])
        by mta-p8.oit.umn.edu (Postfix) with ESMTP id 49l10j2mmWz9vKYf
        for <linux-media@vger.kernel.org>; Sun, 14 Jun 2020 03:58:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at umn.edu
Received: from mta-p8.oit.umn.edu ([127.0.0.1])
        by localhost (mta-p8.oit.umn.edu [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id j3SIF197YNOy for <linux-media@vger.kernel.org>;
        Sat, 13 Jun 2020 22:58:45 -0500 (CDT)
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mta-p8.oit.umn.edu (Postfix) with ESMTPS id 49l10j144hz9vKYq
        for <linux-media@vger.kernel.org>; Sat, 13 Jun 2020 22:58:45 -0500 (CDT)
DMARC-Filter: OpenDMARC Filter v1.3.2 mta-p8.oit.umn.edu 49l10j144hz9vKYq
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-p8.oit.umn.edu 49l10j144hz9vKYq
Received: by mail-il1-f200.google.com with SMTP id n2so9574102ilq.4
        for <linux-media@vger.kernel.org>; Sat, 13 Jun 2020 20:58:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umn.edu; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hhIKBGmqbJZD2/EwCInV9JueuS4QBg/TzIdZhuT04so=;
        b=V82Y7IxYt5myDvWrWYU85kEaDVnykoiHnRjZw7XLB8ovpaG/UkQxDZeiDmtdvpGZ8E
         vT+HtI+Hjd53me5vLAJC11ZZc7vcS9N0F5n6YQbWAAWDMYAmVp5u+8taNSGuhrLhw8NH
         FcPiV7tpfC8w0B2RJlwmZR5uFwiQ0qHpOKa1VWb/Rbr0YeXyL8piFVFOhuv6KpRf99gn
         XHo0liTiY7FexoqmECUELjTguzUxwH5fOQ47eDdlRYf/RdGlY3QK+P/CmLOIuov0W2FK
         aD+NZO/qfuV5XxPnURmpcT0Iw9xSZ4vhMpT8koIzvyM7E5Y2kyXwf0Wc9fwJRJWZ5DQ1
         tj5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hhIKBGmqbJZD2/EwCInV9JueuS4QBg/TzIdZhuT04so=;
        b=D8mc41Ge7C43eK1pW7G09eLS77lxLfvmqRz86y0xd/pmnTd621YqFIEV3RVUNY0ll+
         H2AUvEfjjKuKYrhi0sV89URKzhTODEC4do1TwSQIAdTypm0/2A0un7mfnfAxYV2GK9Lw
         mXgmcg2XW85Jqp4YZUVTL+wJcGR5ksUwQoJGe0wMbyUfQv0amyEB2dbU5nQRIXMRMEaL
         Yeqa/qSdFkYDmSZTSrl/d4q7Jrz5PLOtw9D5UArhooLLYbfAfMscd54vr4Ro9mLzwa1B
         p6Q0R0KBrTEMYgstWTWs7z53dwbddawSSratabMsxiPvqAopiLrKi30cnzMhGAjEee87
         XSkA==
X-Gm-Message-State: AOAM5314ip2UHHhDaJBVERe0TESwFNK+8M9+OaHapm85V+F/lXoVAz+c
        ig2NECC1moxmmlbKhedn7xdAjNnXM9NBwd/ZjrU7hnTaFYMAuJCQXne+21ziZW1cSQVQJ092VbP
        lurQxOHs/+1/fiTLP5q6zAL5UObo=
X-Received: by 2002:a05:6602:2cd1:: with SMTP id j17mr21245437iow.69.1592107124753;
        Sat, 13 Jun 2020 20:58:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyO1B7U8ikrq7aKx2yj6RR17DvybRPxV9+eUWs5QjsmQSESLHWolL/HUylyNwRUrTgELYQ2lQ==
X-Received: by 2002:a05:6602:2cd1:: with SMTP id j17mr21245432iow.69.1592107124542;
        Sat, 13 Jun 2020 20:58:44 -0700 (PDT)
Received: from syssec1.cs.umn.edu ([2607:ea00:101:3c74:49fa:9c47:e40b:9c40])
        by smtp.gmail.com with ESMTPSA id i10sm5656112ilp.28.2020.06.13.20.58.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2020 20:58:44 -0700 (PDT)
From:   Aditya Pakki <pakki001@umn.edu>
To:     pakki001@umn.edu
Cc:     kjlu@umn.edu, wu000273@umn.edu,
        Hugues Fruchet <hugues.fruchet@st.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] media: st-delta: Fix reference count leak in delta_run_work
Date:   Sat, 13 Jun 2020 22:58:41 -0500
Message-Id: <20200614035842.131456-1-pakki001@umn.edu>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

delta_run_work() calls delta_get_sync() that increments
the reference counter. In case of failure, decrement the reference
count by calling delta_put_autosuspend().

Signed-off-by: Aditya Pakki <pakki001@umn.edu>
---
 drivers/media/platform/sti/delta/delta-v4l2.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/sti/delta/delta-v4l2.c b/drivers/media/platform/sti/delta/delta-v4l2.c
index 2503224eeee5..c691b3d81549 100644
--- a/drivers/media/platform/sti/delta/delta-v4l2.c
+++ b/drivers/media/platform/sti/delta/delta-v4l2.c
@@ -954,8 +954,10 @@ static void delta_run_work(struct work_struct *work)
 	/* enable the hardware */
 	if (!dec->pm) {
 		ret = delta_get_sync(ctx);
-		if (ret)
+		if (ret) {
+			delta_put_autosuspend(ctx);
 			goto err;
+		}
 	}
 
 	/* decode this access unit */
-- 
2.25.1

