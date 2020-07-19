Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 63DDF22527F
	for <lists+linux-media@lfdr.de>; Sun, 19 Jul 2020 17:34:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726131AbgGSPe5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 19 Jul 2020 11:34:57 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:22500 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726024AbgGSPe4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 19 Jul 2020 11:34:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1595172895;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc; bh=hg0lbQ+8VwQQXpzy5TW+xgK9mc47o+v0BPDpQo4cPu8=;
        b=YtzduNBdR8ICl6qxb5te06vQ4oo2P71bO49h9zvyTTqVZt9k4K/3D7OLQ/MN1u4fHNb4Cp
        ca49X0cPFI+8Cb2BaahsVAmgkIJ3hGadfL6COKHREuM/Zk2c3UwUlOMpgChQXaOdizxVbw
        qYfXu5F9Ow76rmDnbEAfv+6rCzoNS8Q=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-342-W3LRd6MsNIK0OJwMOqeQEA-1; Sun, 19 Jul 2020 11:34:53 -0400
X-MC-Unique: W3LRd6MsNIK0OJwMOqeQEA-1
Received: by mail-qk1-f199.google.com with SMTP id k16so9734776qkh.12
        for <linux-media@vger.kernel.org>; Sun, 19 Jul 2020 08:34:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=hg0lbQ+8VwQQXpzy5TW+xgK9mc47o+v0BPDpQo4cPu8=;
        b=G9V1UQyFGPE9q8r10FSC/Y18djfzZmJc/gMfRtT23RW52jALtZkWBM6BnvOYjCpJtu
         MIdE4Em5YtwoYhmzmBqmNonQF0IBce2RmOjMzOg/v1S/TTep9e/mIIpJi8H0mKVgiJkq
         kdOGaAy8e/Znqg2BOHUR2QoTNDBka7qZsdmtBBx4rqLnUHpw6Ju9pC/lShPPW5rB5TiJ
         T2QBrMMvCJTYTeqtsb0luRTpqJEdl3Dx2FBR4lgM6YuieYUFhmKaaoCyg7KC+2qTEGxX
         NWkx7Y3fNn/8VH6/6+LIvfRHfIL9Z6ZwddOJf7HY5U6gpAuGOrWe3jqeSH7SLNzppBn4
         hLvQ==
X-Gm-Message-State: AOAM532ylbM3nmg0SZx9x+174qnGIFTRumbBOyf0V2tbdiFIFQSt1BNf
        hMbjlxUGdYPVK5c7QSy5kzwrSu6/O7UW0V+f13TPS/v5OvWzK+WLNjIG8+klF5rY5YMlfeeo29H
        MFqgM4X3mslKc9AyyYnJfND4=
X-Received: by 2002:a37:c41:: with SMTP id 62mr1987978qkm.189.1595172893435;
        Sun, 19 Jul 2020 08:34:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzd0wlLchxDWkT1Yrjr6nyemXEfsQcDGUHLhm0O1Jt4XLIvOQ22rvO90Nx2qRedFDcV14D1Qg==
X-Received: by 2002:a37:c41:: with SMTP id 62mr1987953qkm.189.1595172893175;
        Sun, 19 Jul 2020 08:34:53 -0700 (PDT)
Received: from trix.remote.csb (075-142-250-213.res.spectrum.com. [75.142.250.213])
        by smtp.gmail.com with ESMTPSA id p63sm15410662qkc.80.2020.07.19.08.34.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2020 08:34:52 -0700 (PDT)
From:   trix@redhat.com
To:     kyungmin.park@samsung.com, riverful.kim@samsung.com,
        mchehab@kernel.org, s.nawrocki@samsung.com
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tom Rix <trix@redhat.com>
Subject: [PATCH] media: m5mols: Check function pointer in m5mols_sensor_power
Date:   Sun, 19 Jul 2020 08:34:47 -0700
Message-Id: <20200719153447.4380-1-trix@redhat.com>
X-Mailer: git-send-email 2.18.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Tom Rix <trix@redhat.com>

clang static analysis reports this error

m5mols_core.c:767:4: warning: Called function pointer
  is null (null dereference) [core.CallAndMessage]
    info->set_power(&client->dev, 0);
    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

In other places, the set_power ptr is checked.
So add a check.

Fixes: bc125106f8af ("[media] Add support for M-5MOLS 8 Mega Pixel camera ISP")

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/media/i2c/m5mols/m5mols_core.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/m5mols/m5mols_core.c b/drivers/media/i2c/m5mols/m5mols_core.c
index de295114ca48..21666d705e37 100644
--- a/drivers/media/i2c/m5mols/m5mols_core.c
+++ b/drivers/media/i2c/m5mols/m5mols_core.c
@@ -764,7 +764,8 @@ static int m5mols_sensor_power(struct m5mols_info *info, bool enable)
 
 		ret = regulator_bulk_enable(ARRAY_SIZE(supplies), supplies);
 		if (ret) {
-			info->set_power(&client->dev, 0);
+			if (info->set_power)
+				info->set_power(&client->dev, 0);
 			return ret;
 		}
 
-- 
2.18.1

