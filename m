Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2FFCC39674F
	for <lists+linux-media@lfdr.de>; Mon, 31 May 2021 19:43:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233893AbhEaRo7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 31 May 2021 13:44:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37399 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233717AbhEaRos (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 31 May 2021 13:44:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1622482987;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=K8nNOkX4zuqczQHURLREmFQOVbuEo/yfo6wOnioYIqU=;
        b=eETE4ALrwPEaFOjNbh/tFB/DJGaZgevP0g7dAnSQJi28cgdMmANSoLtuxvZbrCv6SLmMlJ
        NLaj22NLM4QJV8P8I3Ukpeum4KZp83NNegul5PE1T5uiurONDn1a4Q8f/bBa5ug/zoagMo
        qvTkL07zEm0W5TxSuJ317bwH9MNuUgo=
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
 [209.85.210.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-591-12BQdWA2PDKOJKrf-IJXXA-1; Mon, 31 May 2021 13:43:06 -0400
X-MC-Unique: 12BQdWA2PDKOJKrf-IJXXA-1
Received: by mail-ot1-f72.google.com with SMTP id u12-20020a9d4d8c0000b02902dcb6679ca2so7198531otk.20
        for <linux-media@vger.kernel.org>; Mon, 31 May 2021 10:43:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=K8nNOkX4zuqczQHURLREmFQOVbuEo/yfo6wOnioYIqU=;
        b=llrYkeGKGIfn+0wOPmhI3PCTPpXiHqXefHx5idg33BRnE7iQ3ophf6xtj+Jj9Ka1Qg
         i6kcDgoVMtKWe58QLZ7I0T2NYlz5n6RIAZoDOE1WLlb0igaOHbolN2EVr+oTv1MitwJw
         7EorhBWgaA8sUFX3539FwBloiv3kd3fYuBEJ/A5sL0mJXqGqmlIykDxer+gWjF5DSqsn
         f2jDPYJT021Qwsq5DF8aoCGe194RVZDP7R2Thok4x4YuONJq/VcedP/35QFrhSxUUmpV
         TiHPFlLh4Rf8OWk5VVKgAop4E8CPJsLVwnfG0Mt6QJHR4cNu0bnlVsvHpDBepK/p/IoR
         gchQ==
X-Gm-Message-State: AOAM5334nxnPZYZzbJj3hiHJO3p+xgtO8z+kI4AifXL/Lhj9AEHH5kf1
        vSc/VjPATQOgkNd01by6fIvwkrRsoKP6lukiPeZk+1QuIrmPO7fAvOvjw3yTS7jQ+mAKgf6lRvf
        P33kVktZYJ8sSn1UomO1UZl0=
X-Received: by 2002:a05:6830:1d64:: with SMTP id l4mr17260144oti.95.1622482985552;
        Mon, 31 May 2021 10:43:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJylhACZOWlRSSP56Xe+/shqCqK0nGlc+aQdIrngGYo9DVADhn8bqhxQrwJTGkiF1rvA1tn1sA==
X-Received: by 2002:a05:6830:1d64:: with SMTP id l4mr17260135oti.95.1622482985395;
        Mon, 31 May 2021 10:43:05 -0700 (PDT)
Received: from localhost.localdomain.com (075-142-250-213.res.spectrum.com. [75.142.250.213])
        by smtp.gmail.com with ESMTPSA id i4sm2943902oih.13.2021.05.31.10.43.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 May 2021 10:43:05 -0700 (PDT)
From:   trix@redhat.com
To:     rmfrfs@gmail.com, laurent.pinchart@ideasonboard.com,
        slongerbeam@gmail.com, p.zabel@pengutronix.de, mchehab@kernel.org,
        gregkh@linuxfoundation.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-imx@nxp.com
Cc:     linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Tom Rix <trix@redhat.com>
Subject: [PATCH] media: imx: imx7_mipi_csis: convert some switch cases to the default
Date:   Mon, 31 May 2021 10:43:00 -0700
Message-Id: <20210531174300.2594109-1-trix@redhat.com>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Tom Rix <trix@redhat.com>

Static analysis reports this false positive
imx7-mipi-csis.c:1027:2: warning: 4th function call argument is
  an uninitialized value

The variable 'align' is falsely reported as uninitialized.
Even though all the cases are covered in the
	switch (csis_fmt->width % 8) {

Because there is no default case, it is reported as uninialized.

Improve the switch by converting the most numerous set of cases
to the default and silence the false positive.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/staging/media/imx/imx7-mipi-csis.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/imx/imx7-mipi-csis.c b/drivers/staging/media/imx/imx7-mipi-csis.c
index d573f3475d28..330f283030ec 100644
--- a/drivers/staging/media/imx/imx7-mipi-csis.c
+++ b/drivers/staging/media/imx/imx7-mipi-csis.c
@@ -1016,10 +1016,8 @@ static int mipi_csis_set_fmt(struct v4l2_subdev *sd,
 	case 6:
 		align = 2;
 		break;
-	case 1:
-	case 3:
-	case 5:
-	case 7:
+	default:
+		/* 1, 3, 5, 7 */
 		align = 3;
 		break;
 	}
-- 
2.26.3

