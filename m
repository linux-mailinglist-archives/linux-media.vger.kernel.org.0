Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49FD82C6983
	for <lists+linux-media@lfdr.de>; Fri, 27 Nov 2020 17:41:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731150AbgK0Qit (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Nov 2020 11:38:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33250 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727936AbgK0Qit (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Nov 2020 11:38:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1606495127;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc; bh=6soT6kNKicKwHaQhV8mD54KLa9zz/Qcn5Otsr8QXwTM=;
        b=h6LwHu5OEe2eUwq6bOMgNRMd1jd4ezbhWNpFEos50HuBeRjJgZg9zVcL4pNVMcsEKORrc0
        LuLUqHSR1SPHcOaQtD6NwoXA1SIrLnbQQABQB3HGFWoZz74YFvabg3pGaKdU+PC/9LxuzD
        GlpxCRvVym51OPw8zRE97APW8E4yyDU=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-545-HvKOB1MVPDukY6vL-pXKow-1; Fri, 27 Nov 2020 11:38:45 -0500
X-MC-Unique: HvKOB1MVPDukY6vL-pXKow-1
Received: by mail-qv1-f70.google.com with SMTP id f2so343114qvb.7
        for <linux-media@vger.kernel.org>; Fri, 27 Nov 2020 08:38:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=6soT6kNKicKwHaQhV8mD54KLa9zz/Qcn5Otsr8QXwTM=;
        b=qMalMtXTS2FEhm2Pblm3tbd19tlgWBjttL86HI3L9OQNxgmbib7Wq8c1n0XPLafbOs
         sg44uHomDqzie62Xqo5mekAhhlrkm0PMUocTqKBB3iFbzktYcBYEjg1MqhzhPhZRxNVE
         ZAm5YOgEOHZjSCnwyn2PWRhU7GkWxxYWxPtaBRk1IM3TBL2kMlHLnwIm0nslREhORS6o
         17TZyIlUPxWd0TZnARAmTjMDCcNGz6xGPIlTh4B+iSaNEFVmkHiQlNkE56JpUh60r/9e
         tIHaWYkyFOv8OQvmPzzeMFyloU7HMTrmyX0ZVU7uRHm40ZQ/mA8HVjVdE0KdZa68FBlS
         mDdg==
X-Gm-Message-State: AOAM532KVPrWG4WEWeDnWkZkdESbFSWhooJ8GoU3HjpEFfK1im3e4Fek
        tNzwOnhAlsbMB8YW/bZXtKl9JvUjqECQM3NsOe9nd9uQK5fWC6xbr5DrOs5uNUpcLZIP7BdZOLF
        C2IkbV7/FU8mh4eqZw/OSVcY=
X-Received: by 2002:a05:620a:88e:: with SMTP id b14mr9390521qka.434.1606495125525;
        Fri, 27 Nov 2020 08:38:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyEax7A2+M8txf8NSzvaWLDdcvfzjlcpauJT2nU/N8D/Jln7Bke0Usecu86i7miEwyXlfxTxA==
X-Received: by 2002:a05:620a:88e:: with SMTP id b14mr9390508qka.434.1606495125347;
        Fri, 27 Nov 2020 08:38:45 -0800 (PST)
Received: from trix.remote.csb (075-142-250-213.res.spectrum.com. [75.142.250.213])
        by smtp.gmail.com with ESMTPSA id c128sm6013643qkg.66.2020.11.27.08.38.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2020 08:38:44 -0800 (PST)
From:   trix@redhat.com
To:     mchehab@kernel.org
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tom Rix <trix@redhat.com>
Subject: [PATCH] [media] b2c2: remove trailing semicolon in macro definition
Date:   Fri, 27 Nov 2020 08:38:36 -0800
Message-Id: <20201127163836.2675604-1-trix@redhat.com>
X-Mailer: git-send-email 2.18.4
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Tom Rix <trix@redhat.com>

The macro use will already have a semicolon.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/media/common/b2c2/flexcop-hw-filter.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/common/b2c2/flexcop-hw-filter.c b/drivers/media/common/b2c2/flexcop-hw-filter.c
index 335f30a54ba8..c5a3345c99e9 100644
--- a/drivers/media/common/b2c2/flexcop-hw-filter.c
+++ b/drivers/media/common/b2c2/flexcop-hw-filter.c
@@ -69,7 +69,7 @@ vpid.vregname.field = onoff ? pid : 0x1fff; \
 vpid.vregname.trans_field = transval; \
 v208.ctrl_208.enablefield = onoff; \
 fc->write_ibi_reg(fc, vregname, vpid); \
-fc->write_ibi_reg(fc, ctrl_208, v208);
+fc->write_ibi_reg(fc, ctrl_208, v208)
 
 static void flexcop_pid_Stream1_PID_ctrl(struct flexcop_device *fc,
 		u16 pid, int onoff)
-- 
2.18.4

