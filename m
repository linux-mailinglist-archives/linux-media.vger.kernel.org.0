Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DFA7E54EF00
	for <lists+linux-media@lfdr.de>; Fri, 17 Jun 2022 03:58:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1379270AbiFQB6K (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Jun 2022 21:58:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1379248AbiFQB6J (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Jun 2022 21:58:09 -0400
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D26E456B08
        for <linux-media@vger.kernel.org>; Thu, 16 Jun 2022 18:58:07 -0700 (PDT)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-30c2f3431b4so26632247b3.21
        for <linux-media@vger.kernel.org>; Thu, 16 Jun 2022 18:58:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=U18uyu4RUAL9AXJGMB8BF3lMIlpFC5/xMg5AtVR23HI=;
        b=qAnucf7PR2NRyM1UBIvxE9hpWhp2ZGV9Xj0PTI2iM1eTQffxqC399QRDtClU+/gfsS
         EqHq9BsgU2dC5j5w9U/k+fG6QUNlT9pqN21R43fAjqighOw0Tx5Z3mvBWUfDaCg9vfSr
         +7tbbNjlKPTqcBagAlQofdSrAS4ZVmM7NOJvZMFZSfbNWuJhgIkRrctcMJjDjDNcyDZF
         OnywoJECrrFesjTPWr7W8CmCAb4c1lCXhD09Ra3AMABWX6DzLG5M5P0XzUtWkMz7ncjk
         fkgipwlojwS5iEqjYN+i1aRi2HDwhfprQ1ZrocJ+x0V6KxC9x+cHqFhRSOHDIh6pl67+
         EPQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=U18uyu4RUAL9AXJGMB8BF3lMIlpFC5/xMg5AtVR23HI=;
        b=K5pQ7nwr1JllhEylD8PoEI2G2LiDUfhUYGiNx+24qVUT/XScFJ6u1+34V2InoG2KOS
         a1CiS99/BZH73+h/OH9UuYIvybbWx97R7JUHB1YPpcRwBXdNxIUBPPlmN91/JAfnCx2s
         bVqEt11bwfXl8keFMTM4ywgOVdVYA93rxdmicUiAlF2Wpe1uF3n8tOhC8+8EymF5pxda
         xTI0bkgFron3RipM8TfueF5irE9KT8DagSDyZs8cNpm1MHL3Eczn/G+jmVMI5VEVfxvh
         hQkEhZtkd4tEOdlwyaVf+V7dhP/AefJ7mPB82pzJ8go8jM6Ne8ZDxBrfvecHVkFFPJU+
         JU0g==
X-Gm-Message-State: AJIora80RuxcSQlkZN+4AgX5o5rHxwTgQwwQy1PbaujM2rEV1OAVwsY6
        giqWuh2etc7CjUjA7jQnWz2z2t4Z3uc=
X-Google-Smtp-Source: AGRyM1vEnEDBWMdC21vXMciBxzo7ffNwCmVOrO9pT+z1qe3XmhluKL5IaSb5T7lUx/VBqpB0aNla8r+FmNI=
X-Received: from yunkec1.tok.corp.google.com ([2401:fa00:8f:203:3ebf:f2c5:a2ea:6521])
 (user=yunkec job=sendgmr) by 2002:a81:1c87:0:b0:314:3613:2138 with SMTP id
 c129-20020a811c87000000b0031436132138mr9086933ywc.263.1655431087058; Thu, 16
 Jun 2022 18:58:07 -0700 (PDT)
Date:   Fri, 17 Jun 2022 10:57:45 +0900
In-Reply-To: <20220617015745.3950197-1-yunkec@google.com>
Message-Id: <20220617015745.3950197-3-yunkec@google.com>
Mime-Version: 1.0
References: <20220617015745.3950197-1-yunkec@google.com>
X-Mailer: git-send-email 2.37.0.rc0.104.g0611611a94-goog
Subject: [PATCH v2 2/2] media: vimc: documentation for lens
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
 Documentation/admin-guide/media/vimc.dot | 4 ++++
 Documentation/admin-guide/media/vimc.rst | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/Documentation/admin-guide/media/vimc.dot b/Documentation/admin-guide/media/vimc.dot
index 57863a13fa39..5a6e231c3d21 100644
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
 	n00000005:port1 -> n00000017:port0
 	n00000008 [label="{{<port0> 0} | Debayer B\n/dev/v4l-subdev3 | {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
diff --git a/Documentation/admin-guide/media/vimc.rst b/Documentation/admin-guide/media/vimc.rst
index 0b07f05dde25..3ec2198ce68d 100644
--- a/Documentation/admin-guide/media/vimc.rst
+++ b/Documentation/admin-guide/media/vimc.rst
@@ -53,6 +53,10 @@ vimc-sensor:
 
 	* 1 Pad source
 
+vimc-lens:
+	Ancillary lens for a sensor. Supports auto focus control. Linked to
+	a vimc-sensor using an ancillary link.
+
 vimc-debayer:
 	Transforms images in bayer format into a non-bayer format.
 	Exposes:
-- 
2.37.0.rc0.104.g0611611a94-goog

