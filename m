Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4E985545965
	for <lists+linux-media@lfdr.de>; Fri, 10 Jun 2022 03:01:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240244AbiFJBBb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 Jun 2022 21:01:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231230AbiFJBBa (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 9 Jun 2022 21:01:30 -0400
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49D382A26E
        for <linux-media@vger.kernel.org>; Thu,  9 Jun 2022 18:01:29 -0700 (PDT)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-30026cf9af8so217007777b3.3
        for <linux-media@vger.kernel.org>; Thu, 09 Jun 2022 18:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=irZt1FuqBE8zqIeEpXgL19XF6F7BuQLiQ8b9fY1LbeY=;
        b=R7gvbYsjVIrVbtfes+QY6/PC5chNlU7y05d2MmL/v+p0HI5w4sfY0iHebegHChxRbF
         Qd4I0W3wKLYLz4NimsM1IyXXxq9BOnCCE2fnDS7dyiD7LVRt3pSse/6T+hUefTeWe4xk
         NHqhIFUii6bpxfprgqNKxBxUR/ko4zYcHER1HaY+Gg3XExa24hSzQ0UEY2mfHrEqfVSZ
         x0XCSj7ZlhNBcWBNsoZN2hRvLrVM/GPpwZo5zS+KhFUo18WkUd8xM1Fk13zO+Twlaft3
         gZavUf5Fggbc1SaosV2nrUWf0CVuHgLcFdlFydRfdDL4XMpn0XEBtFIAhknFSeqirzL3
         Mm8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=irZt1FuqBE8zqIeEpXgL19XF6F7BuQLiQ8b9fY1LbeY=;
        b=YYakudDpqzDNUgQ19MM6OkL7cEJgRmG4loheCQ5ZdlGI+8KWEIJ49jMrzGgN9UgfFN
         dvIR4XV84YQXO1xAbdu4VChSbOkT4djxAGXMmQywKEBtIOZwRtv0VlFI8RqxQLvWcO3Z
         dtL4qzKaAF+GeDBzEvktJ5zr09Hwd1cjjucH3A4HJyzq7KHdemJPUm5bxZoRwvUoQHru
         +VhP9N9noVHmwrnShzGvt2667tD1MYxLoyldH1fOq+27JOmX0svyG/FCUxoDid0l5C9e
         gHMU/HxSoU8bioD9kq5dG8VsC0i56er67IQaliQuHm3yLvpsOhbBTKPVp7PAzFuRThOt
         +r6g==
X-Gm-Message-State: AOAM532AvypjJRsq0zlSxiWCFyBQKcu2Cy1O2MnnDQ+URVVg1ZmuGm7p
        h+vZLPd+icLH+kFxsalZN2jMUj8eFKU=
X-Google-Smtp-Source: ABdhPJzJ5NU+1v1mIlkIkKlp7Hybb/SbyOPyPaOgm9iYxe5G00piRaPUhMKXXpUwbTH+kUJfLx6BPGxVre8=
X-Received: from yunkec1.tok.corp.google.com ([2401:fa00:8f:203:5900:89c0:d4c3:d2e])
 (user=yunkec job=sendgmr) by 2002:a25:5457:0:b0:660:2de1:7fab with SMTP id
 i84-20020a255457000000b006602de17fabmr42753293ybb.278.1654822888954; Thu, 09
 Jun 2022 18:01:28 -0700 (PDT)
Date:   Fri, 10 Jun 2022 10:01:11 +0900
In-Reply-To: <20220610010111.3418214-1-yunkec@google.com>
Message-Id: <20220610010111.3418214-3-yunkec@google.com>
Mime-Version: 1.0
References: <20220610010111.3418214-1-yunkec@google.com>
X-Mailer: git-send-email 2.36.1.476.g0c4daa206d-goog
Subject: [PATCH v1 2/2 RESEND] media: vimc: documentation for lens
From:   Yunke Cao <yunkec@google.com>
To:     Shuah Khan <skhan@linuxfoundation.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Tomasz Figa <tfiga@chromium.org>, linux-media@vger.kernel.org,
        Yunke Cao <yunkec@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
        USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Signed-off-by: Yunke Cao <yunkec@google.com>
---
 Documentation/admin-guide/media/vimc.dot | 4 ++++
 Documentation/admin-guide/media/vimc.rst | 3 +++
 2 files changed, 7 insertions(+)

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
index 0b07f05dde25..1723eb5ec56a 100644
--- a/Documentation/admin-guide/media/vimc.rst
+++ b/Documentation/admin-guide/media/vimc.rst
@@ -53,6 +53,9 @@ vimc-sensor:
 
 	* 1 Pad source
 
+vimc-lens:
+	Ancillary lens for a sensor.
+
 vimc-debayer:
 	Transforms images in bayer format into a non-bayer format.
 	Exposes:
-- 
2.36.1.476.g0c4daa206d-goog

