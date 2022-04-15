Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3DE9C50209C
	for <lists+linux-media@lfdr.de>; Fri, 15 Apr 2022 04:39:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347875AbiDOClk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Apr 2022 22:41:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234772AbiDOClk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Apr 2022 22:41:40 -0400
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 760BC53708
        for <linux-media@vger.kernel.org>; Thu, 14 Apr 2022 19:39:13 -0700 (PDT)
Received: by mail-yb1-xb4a.google.com with SMTP id j129-20020a252387000000b00641e1faafecso4258655ybj.3
        for <linux-media@vger.kernel.org>; Thu, 14 Apr 2022 19:39:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=9N63EFYg2fR57Ovvq8ocjdycUS3S0Pw2WWy4j11FaY0=;
        b=q3XYWldOeZ95PSjdB6xybo9K3OvsxxSS72JeF6Hs6WXFKfuX1NEfGyPE8iKzclsfNM
         kbp6SZT5VdHJW9XLYxzquDnSCMZILm7yWoJQUWJ4v2zwro/1Iqz+LWrMGZA6//wlFB20
         2om3dm9zSF2jPkAH3o8nolNExhLYT1h7ypmdV9GRN1ymyS/QLD6tpRFYwnhnjwANc9rG
         9yvnJSh9ied7bj29oZ8z4TWONW8ZmlMXaZJTLROvq9haix2R/9kWbdQbOcFIECezPix6
         xFsiDtRuDucqD0cmcmFAIknOabIH0HMMbUT0lcaxU93d/S77m8YxbVPS0t45orVM3eeh
         EHOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=9N63EFYg2fR57Ovvq8ocjdycUS3S0Pw2WWy4j11FaY0=;
        b=GOroVhwnp2Z2PAVxVul2dHSXy1ysEA98YHs1tfgv0OqqxwqKzQ3tjzDxPJU40Le8cj
         T0wzPx04nyy6KRHlPm9zCzumc+sXmeTIOJa5VLoQx26Uqo6EEoaKTwL6sOy3tGyEu+LI
         /Bc1D6y3KiZATxpKg15hVJnf5HMajqSXLS5yWGwR9/hbgZkg/qG5914s6LLi29cVjKQE
         snGQmzj97Ekjob7FFO5M35vPtnTN7Gk1cpswxdgRO7v0xkZb0n+hFf0qrgxN7pEQiNzg
         OrnwJe4zpBOHclI5oh+U/oBZGoSUrJ1js+VBGqTYnk0E3gVUC2v453Y8Od7Ek57ZJD8u
         +F8A==
X-Gm-Message-State: AOAM531Nvx1huCVt1TMFdlH2nsbDjBOLyBQiFjNrys+0eiIvBXRfTrMl
        SpKFdu2BOzz5XDFkTleyDycQBLjbkb4=
X-Google-Smtp-Source: ABdhPJwiba96H5+Rkl9g56GXWYdKTOgX+zgq4bf8UhqbUoYa0Ppuj1tNvNKZeuAI6d/XriTHezBvHC6BaNo=
X-Received: from yunkec1.tok.corp.google.com ([2401:fa00:8f:203:755d:d23c:8c6c:9154])
 (user=yunkec job=sendgmr) by 2002:a25:4156:0:b0:641:3eaf:e260 with SMTP id
 o83-20020a254156000000b006413eafe260mr4099940yba.304.1649990352719; Thu, 14
 Apr 2022 19:39:12 -0700 (PDT)
Date:   Fri, 15 Apr 2022 11:38:55 +0900
In-Reply-To: <20220415023855.2568366-1-yunkec@google.com>
Message-Id: <20220415023855.2568366-3-yunkec@google.com>
Mime-Version: 1.0
References: <20220415023855.2568366-1-yunkec@google.com>
X-Mailer: git-send-email 2.36.0.rc0.470.gd361397f0d-goog
Subject: [PATCH v1 2/2] media: vimc: documentation for lens
From:   Yunke Cao <yunkec@google.com>
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Daniel Scally <djrscally@gmail.com>,
        linux-media@vger.kernel.org, Yunke Cao <yunkec@google.com>
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

Signed-off-by: Yunke Cao <yunkec@google.com>
---
 Documentation/admin-guide/media/vimc.dot | 4 ++++
 Documentation/admin-guide/media/vimc.rst | 3 +++
 2 files changed, 7 insertions(+)

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
2.36.0.rc0.470.gd361397f0d-goog

