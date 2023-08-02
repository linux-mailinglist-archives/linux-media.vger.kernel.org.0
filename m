Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7E1E576C9F5
	for <lists+linux-media@lfdr.de>; Wed,  2 Aug 2023 11:57:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232676AbjHBJ5a (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Aug 2023 05:57:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231224AbjHBJ52 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Aug 2023 05:57:28 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D2D5B2
        for <linux-media@vger.kernel.org>; Wed,  2 Aug 2023 02:56:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1690970200;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=omkQoqcMIkusw+NeC5qeXAGvbLPFbDsg8hQQSjoptuM=;
        b=Zq8zv84iiTapeuJ4lYyeawVJAhXYPQsRzV6YEfc+I5YRX0W6vt58OyT0xS9HqxjtB9TugZ
        JBspG8VejhgJ7sqj5UQ9Oehn9PKUgBR0irNxiXrf4fHTXmZToedSQCbdbt3dYDJH1OsNbk
        EU4x6fkaW7YIdRaSW1O7MgxRSvFvcGo=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-558-NlA7ZGvzPL237yviiOq83A-1; Wed, 02 Aug 2023 05:56:37 -0400
X-MC-Unique: NlA7ZGvzPL237yviiOq83A-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 35C50381AE44;
        Wed,  2 Aug 2023 09:56:37 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.67.24.18])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 4E542401E54;
        Wed,  2 Aug 2023 09:56:34 +0000 (UTC)
From:   Kate Hsuan <hpa@redhat.com>
To:     Hans de Goede <hdegoede@redhat.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Cc:     Kate Hsuan <hpa@redhat.com>
Subject: [PATCH 02/12] media: atomisp: binary: Removed #ifdef ISP2401 to make driver generic
Date:   Wed,  2 Aug 2023 17:55:56 +0800
Message-ID: <20230802095606.1298152-3-hpa@redhat.com>
In-Reply-To: <20230802095606.1298152-1-hpa@redhat.com>
References: <20230802095606.1298152-1-hpa@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Removed #ifdef ISP2401 to make the driver generic. The driver flow is
determined in runtime.

Signed-off-by: Kate Hsuan <hpa@redhat.com>
---
 .../media/atomisp/pci/runtime/binary/src/binary.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c b/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c
index 768da86b8c2c..0f3729e55e14 100644
--- a/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c
+++ b/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c
@@ -604,13 +604,14 @@ binary_in_frame_padded_width(int in_frame_width,
 	int rval;
 	int nr_of_left_paddings;	/* number of paddings pixels on the left of an image line */
 
-#if defined(ISP2401)
-	/* the output image line of Input System 2401 does not have the left paddings  */
-	nr_of_left_paddings = 0;
-#else
-	/* in other cases, the left padding pixels are always 128 */
-	nr_of_left_paddings = 2 * ISP_VEC_NELEMS;
-#endif
+	if (IS_ISP2401) {
+		/* the output image line of Input System 2401 does not have the left paddings  */
+		nr_of_left_paddings = 0;
+	} else {
+		/* in other cases, the left padding pixels are always 128 */
+		nr_of_left_paddings = 2 * ISP_VEC_NELEMS;
+	}
+
 	if (need_scaling) {
 		/* In SDV use-case, we need to match left-padding of
 		 * primary and the video binary. */
-- 
2.41.0

