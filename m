Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 216E255F31F
	for <lists+linux-media@lfdr.de>; Wed, 29 Jun 2022 04:07:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230205AbiF2CG5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Jun 2022 22:06:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229623AbiF2CG4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Jun 2022 22:06:56 -0400
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 262E8313B9
        for <linux-media@vger.kernel.org>; Tue, 28 Jun 2022 19:06:56 -0700 (PDT)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-3177608c4a5so117823527b3.14
        for <linux-media@vger.kernel.org>; Tue, 28 Jun 2022 19:06:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=XeYzuFrl9tDoQyQHJwCTmLqFH6Zi8k8j4MajsnILx/c=;
        b=JUeJheM1FAAFrtcDsq5ydKW/hmJjRjxn2lrVAXzpHmXnyLPEk0+0U1bSAGyia4lvB/
         63TI1XRZHI6tbbxvZfTYpFQbPIJFGwy7eubnManFYHT0HZEszX492mEGTLWDFnWPJ3mX
         8hax4A80H7uSU4/pXxZ7zvYIOvh901getHeKUV8LTKTm3CVVAaoRmYYju2OdpGqdjQG/
         1Lpf5vc8rUA5UvzFZ/moDwZ4S1FYJihouQ/5/g9/RVIsKBWD9Zlj9ONHYzfACf7K4f2p
         8huwylxaYjftgYgsqidvgrH9L3oD9Fgk4dLq61sXxTKbntZbDEgqweU30wRQLwnyJiok
         7RTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=XeYzuFrl9tDoQyQHJwCTmLqFH6Zi8k8j4MajsnILx/c=;
        b=gqY0vzLkfWpSk7zfb9ZAst3C7YxY/TKysKvXbBVOho4/vh5IenHru4BdoXFpjiQu81
         8IFVVALh6MEkwVQZSTMVf486M+7U0ik04yg2rfpWtwbZ4zFl3Uc3JNoKW0NXICxCnwPw
         NVAOr43DkY6zocxgk410SDnNzAtRfHtjVMM8dtdyjjiYC8k1D4CX6nDvkRZ/XRGFO2Sv
         XnAFjtKlZSi6m3Kwyv46D6mklHX8gx1FTN9oEvg73WlMK8SVC+ZhXflR3g23z3bgMDv8
         +RJFt2mqlzg4QO3GvZ/tNmcmLcIfUJcN6R3Hgd9qN6R/5N2sMPiWrKvrXKeq5D2ZKFV8
         73Ug==
X-Gm-Message-State: AJIora+7X72lErOBrHtgN09QUaPoTXlHEON2ALZ/rGDIsFjc3YesCAYx
        CJyV52FVA1G+YkEhsV/TxjPOC+LX0O4=
X-Google-Smtp-Source: AGRyM1uBklqtX1fUmt5WTE7eKfKghrhKv0N8hwu53ENb4xEaKUXyBWdYey9s5aSNLE6uOiHxQDnUu61mFf8=
X-Received: from yunkec1.tok.corp.google.com ([2401:fa00:8f:203:983d:14d6:e059:135f])
 (user=yunkec job=sendgmr) by 2002:a81:1843:0:b0:317:8618:f24f with SMTP id
 64-20020a811843000000b003178618f24fmr1423991ywy.410.1656468415384; Tue, 28
 Jun 2022 19:06:55 -0700 (PDT)
Date:   Wed, 29 Jun 2022 11:06:30 +0900
In-Reply-To: <20220629020630.2865785-1-yunkec@google.com>
Message-Id: <20220629020630.2865785-3-yunkec@google.com>
Mime-Version: 1.0
References: <20220629020630.2865785-1-yunkec@google.com>
X-Mailer: git-send-email 2.37.0.rc0.161.g10f37bed90-goog
Subject: [RESEND PATCH v3 2/2] media: vimc: documentation for lens
From:   Yunke Cao <yunkec@google.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Tomasz Figa <tfiga@chromium.org>, linux-media@vger.kernel.org,
        Yunke Cao <yunkec@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add documentation for vimc-lens.
Add a lens into the vimc topology graph.

Reviewed-by: Shuah Khan <skhan@linuxfoundation.org>
Signed-off-by: Yunke Cao <yunkec@google.com>
---
 Documentation/admin-guide/media/vimc.dot |  4 ++++
 Documentation/admin-guide/media/vimc.rst | 19 +++++++++++++++++++
 2 files changed, 23 insertions(+)

diff --git a/Documentation/admin-guide/media/vimc.dot b/Documentation/admin-guide/media/vimc.dot
index 8e829c164626..92a5bb631235 100644
--- a/Documentation/admin-guide/media/vimc.dot
+++ b/Documentation/admin-guide/media/vimc.dot
@@ -5,9 +5,13 @@ digraph board {
 	n00000001 [label="{{} | Sensor A\n/dev/v4l-subdev0 | {<port0> 0}}", shape=Mrecord, style=filled, fillcolor=green]
 	n00000001:port0 -> n00000005:port0 [style=bold]
 	n00000001:port0 -> n0000000b [style=bold]
+	n00000001 -> n00000002
+	n00000002 [label="{{} | Lens A\n/dev/v4l-subdev5 | {<port0>}}", shape=Mrecord, style=filled, fillcolor=green]
 	n00000003 [label="{{} | Sensor B\n/dev/v4l-subdev1 | {<port0> 0}}", shape=Mrecord, style=filled, fillcolor=green]
 	n00000003:port0 -> n00000008:port0 [style=bold]
 	n00000003:port0 -> n0000000f [style=bold]
+	n00000003 -> n00000004
+	n00000004 [label="{{} | Lens B\n/dev/v4l-subdev6 | {<port0>}}", shape=Mrecord, style=filled, fillcolor=green]
 	n00000005 [label="{{<port0> 0} | Debayer A\n/dev/v4l-subdev2 | {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
 	n00000005:port1 -> n00000015:port0
 	n00000008 [label="{{<port0> 0} | Debayer B\n/dev/v4l-subdev3 | {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
diff --git a/Documentation/admin-guide/media/vimc.rst b/Documentation/admin-guide/media/vimc.rst
index 0b07f05dde25..3b4d2b36b4f3 100644
--- a/Documentation/admin-guide/media/vimc.rst
+++ b/Documentation/admin-guide/media/vimc.rst
@@ -53,6 +53,25 @@ vimc-sensor:
 
 	* 1 Pad source
 
+vimc-lens:
+	Ancillary lens for a sensor. Supports auto focus control. Linked to
+	a vimc-sensor using an ancillary link. The lens supports FOCUS_ABSOLUTE
+	control.
+
+.. code-block:: bash
+
+	media-ctl -p
+	...
+	- entity 28: Lens A (0 pad, 0 link)
+			type V4L2 subdev subtype Lens flags 0
+			device node name /dev/v4l-subdev6
+	- entity 29: Lens B (0 pad, 0 link)
+			type V4L2 subdev subtype Lens flags 0
+			device node name /dev/v4l-subdev7
+	v4l2-ctl -d /dev/v4l-subdev7 -C focus_absolute
+	focus_absolute: 0
+
+
 vimc-debayer:
 	Transforms images in bayer format into a non-bayer format.
 	Exposes:
-- 
2.37.0.rc0.161.g10f37bed90-goog

