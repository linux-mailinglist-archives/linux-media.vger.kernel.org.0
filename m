Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 55824636589
	for <lists+linux-media@lfdr.de>; Wed, 23 Nov 2022 17:15:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239001AbiKWQPw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Nov 2022 11:15:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238560AbiKWQPv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Nov 2022 11:15:51 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B11674AA1
        for <linux-media@vger.kernel.org>; Wed, 23 Nov 2022 08:14:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1669220094;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=zQXnfy7WFXMoouvcbXo54Kcfjw5WZr9LzzLKcbq+LS8=;
        b=TEqCczQPRchF8le5LdRiWjZmTcsq+i3WwwJsMBTs5Ga00plM+kktfTLQ2nYFHjRl+fc2Hq
        Ts1bOzuKPSOqE1r4+P6n7onaZKg6nuY1CR6eEyInPFgoWrwDYCMW6mIDrVuncGesHazf9r
        EnbHAjhXGsFJwFh9QThH/ENkSe63KKs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-191-j5wt_MoRM0O72Rr-9UVGaw-1; Wed, 23 Nov 2022 11:14:51 -0500
X-MC-Unique: j5wt_MoRM0O72Rr-9UVGaw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 36C2F101A56C;
        Wed, 23 Nov 2022 16:14:51 +0000 (UTC)
Received: from x1.localdomain (unknown [10.39.192.103])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 6EAF0C15BB1;
        Wed, 23 Nov 2022 16:14:50 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-media@vger.kernel.org
Subject: [PATCH] MAINTAINERS: Add Hans de Goede as staging/atomisp maintainer
Date:   Wed, 23 Nov 2022 17:14:47 +0100
Message-Id: <20221123161447.15834-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add myself as maintainer for the drivers/staging/media/atomisp code.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 74aca8ff946f..869e270e7bfa 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19553,6 +19553,7 @@ S:	Supported
 F:	Documentation/process/stable-kernel-rules.rst
 
 STAGING - ATOMISP DRIVER
+M:	Hans de Goede <hdegoede@redhat.com>
 M:	Mauro Carvalho Chehab <mchehab@kernel.org>
 R:	Sakari Ailus <sakari.ailus@linux.intel.com>
 L:	linux-media@vger.kernel.org
-- 
2.37.3

