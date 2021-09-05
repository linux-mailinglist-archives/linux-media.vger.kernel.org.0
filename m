Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 866C4401158
	for <lists+linux-media@lfdr.de>; Sun,  5 Sep 2021 21:19:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238205AbhIETNd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 5 Sep 2021 15:13:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229880AbhIETNd (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 5 Sep 2021 15:13:33 -0400
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DAA85C061575;
        Sun,  5 Sep 2021 12:12:29 -0700 (PDT)
Received: by mail-pf1-x42c.google.com with SMTP id n34so554875pfv.7;
        Sun, 05 Sep 2021 12:12:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oClDNOQT+GLawQeS0dfRl/HargK9SobeC6dDUiHWklU=;
        b=UIwichcWFdQy45M0knSwKSVbXz1XtLJOaq0orKwSxLZc1eXBfVqk8m9/5k/7NsamGQ
         OKGJgZFhfl6G7vSR4WD14WuQAiuMDHQDLNlh7SFkHnAzIBV5Fm5okJ/Ffgrh8YjmetYY
         3RBMjP4QUNnSVz/RV693X8qImG0dvFHSKPycz9RqPI16a8w2fxiN91ntZXx6nQbEYftA
         J4Tx8gychIgD0QswBZI+H0OFnPayVOeQIAf95/FcQQ78V5957nkcmdAVJyfqTzFPcV4M
         oajXKqAegeafuv0XBpaa69ncrxZeS9qtOXZxLGrwmKcqyozJQdYuOK3CG8BqG9V85Etm
         7Wwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oClDNOQT+GLawQeS0dfRl/HargK9SobeC6dDUiHWklU=;
        b=ruTeo39Y5dt7XQke6bNUZO0iz9RP/L6HzRSh25A1yfUhNIr1AIxjLBQ1vGGY+6FYId
         t/BuzS7muX2wGFENv1JAbsqKLpnnIyGrvlysnrUUv56EsSOA+uPRTNfm8qXW9dqoerwG
         0rLK0fz1Gxu2ISuf4S7T+nHZGkMFgf+c6FbaTNqNb6X8rnUDcusrXLrQYrDIIzNDyzXy
         6rnZRM7QTZtZH9Iy2hnTfxiF3d4DOzxh58Z3Y865eeVa44l36ePVhuEkPCpeQeLd/CJ7
         Ggyf/bm/RyuV5lrtAIT3rOgUhqbnhxsd7KCywn4qaQ3mgR9n7FTv1+VcMGfL6vucNWjA
         ildA==
X-Gm-Message-State: AOAM531xq/nuk0BqjRyQYN/Le12//Yjs908Gff3aSxF6Lr7jFuV0zOZw
        MLsD5OYBiYawVVJ//Mf4qXw=
X-Google-Smtp-Source: ABdhPJxRx62rob+PMFUIZGbCbl8wa8C9Sq228UrqAbu/HArueR/qJv3KRPszg+/q6h3KYjHYcHKolQ==
X-Received: by 2002:aa7:9056:0:b0:412:444e:f601 with SMTP id n22-20020aa79056000000b00412444ef601mr8621568pfo.84.1630869149398;
        Sun, 05 Sep 2021 12:12:29 -0700 (PDT)
Received: from tong-desktop.local (99-105-211-126.lightspeed.sntcca.sbcglobal.net. [99.105.211.126])
        by smtp.googlemail.com with ESMTPSA id h4sm4492638pjs.2.2021.09.05.12.12.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Sep 2021 12:12:29 -0700 (PDT)
From:   Tong Zhang <ztong0001@gmail.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Pavel Skripkin <paskripkin@gmail.com>,
        Tong Zhang <ztong0001@gmail.com>, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v1] media: atomisp: fix compilation error
Date:   Sun,  5 Sep 2021 12:12:21 -0700
Message-Id: <20210905191222.612949-1-ztong0001@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

I am getting the following compilation error on ubuntu 20.04 with gcc 9.3.0.

drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c: In function ‘input_system_configure_channel_sensor’:
drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c:1649:1: error: control reaches end of non-void function [-Werror=return-type]
 1649 | }
      | ^
cc1: some warnings being treated as errors
make[4]: *** [scripts/Makefile.build:277: drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.o] Error 1

I made some minor changes to the switch-case to keep gcc happy.

Signed-off-by: Tong Zhang <ztong0001@gmail.com>
---
 .../media/atomisp/pci/hive_isp_css_common/host/input_system.c  | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c
index 8e085dda0c18..58eb74edc953 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c
@@ -1644,8 +1644,9 @@ static input_system_err_t input_system_configure_channel_sensor(
 	case INPUT_SYSTEM_XMEM_CAPTURE:
 	case INPUT_SYSTEM_XMEM_ACQUIRE:
 	default:
-		return INPUT_SYSTEM_ERR_PARAMETER_NOT_SUPPORTED;
+		break;
 	}
+	return INPUT_SYSTEM_ERR_PARAMETER_NOT_SUPPORTED;
 }
 
 // Test flags and set structure.
-- 
2.25.1

