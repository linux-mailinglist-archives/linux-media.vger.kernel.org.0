Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BA5FC55D91C
	for <lists+linux-media@lfdr.de>; Tue, 28 Jun 2022 15:20:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241681AbiF1AyN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 Jun 2022 20:54:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240230AbiF1AyN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Jun 2022 20:54:13 -0400
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A03B61D0D8
        for <linux-media@vger.kernel.org>; Mon, 27 Jun 2022 17:54:12 -0700 (PDT)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-3178a95ec78so90617367b3.4
        for <linux-media@vger.kernel.org>; Mon, 27 Jun 2022 17:54:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=N6v6hvJXGvZe/Kt+JRvjGrtiFAwl4ZGvLB+BNaErPxc=;
        b=Oz3XkmgBvclpIBSyTIotgKYzJIQjkPKBSYdhtd6nnmJ3uz9SHDqBrhbhlZJBTEvAZ4
         PVw6elMtFSAKQmqH7MxEkcDiu2YLm3ohlcskUcoPDOjRVnGbVdCP+TYqDaTeOfMju0ml
         smrN4C4FsYXx6BUSXPnfNYt6u8YZs0/HFUxq8TgUTX4Xq+l1RVsmXVFQB3xvOhdFs7gz
         RI23z7DEc4+ETWMSfA7cXl4gYFJ1CNhIBdZCRM7z+SfO3os+mIGdiGJR86/Wd7ddVroA
         96cIJPK5jDUdMVYWz5TiGoH0mZmLIRuPOG/z7FrMJml6IIZNuD5IDllIMauGoNwpctsA
         UVDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=N6v6hvJXGvZe/Kt+JRvjGrtiFAwl4ZGvLB+BNaErPxc=;
        b=1ySDCL+hGaWwHAkv82mNP/xs+h5EQyhHgQOcFvGk9mmiJWzif8aik0TZCMEHdqRfHM
         dEWrNQOGbJaY7oqxUFEowMdTTbuopcQUawYms2+KKx7iDNVn88qTwaW2v6ZXupjdz+71
         33djIs3d9PT21wERlF67IzgU59oaMx7P1B7lmW8zKMofrQToPm/ub9oVlpSH81yRWIE+
         qKtSpqrMYzOcnsvjpn+OKKd376qXGYYxLbxcnSFGzV/IOnaN7wMXSHTAiujToLsDNM79
         QIl62z3xe3Iq8X42aGluX3PRmgW2Q6c9wfw386HufKf2ScOPNfotsgcDAC8l460VbCUU
         /1eg==
X-Gm-Message-State: AJIora/z6NjMmPzD65HUOIwAmGkSQnKJaaLWGWeSD3dd5iuvrzr7WoLZ
        s3F3OCKc0lz2xY9tQ0QDiBwB0zkQK78=
X-Google-Smtp-Source: AGRyM1vam7NFUqkuWNsq87U8jpNnfWkxCtr3IOx5RAi5FrCI0QMsB8zlEdq8k48/YJ0LSl7kbLULqB05hhc=
X-Received: from yunkec1.tok.corp.google.com ([2401:fa00:8f:203:9c62:6600:c258:f14])
 (user=yunkec job=sendgmr) by 2002:a0d:ea87:0:b0:317:8993:9f06 with SMTP id
 t129-20020a0dea87000000b0031789939f06mr17916566ywe.152.1656377651742; Mon, 27
 Jun 2022 17:54:11 -0700 (PDT)
Date:   Tue, 28 Jun 2022 09:53:53 +0900
In-Reply-To: <20220628005353.1719403-1-yunkec@google.com>
Message-Id: <20220628005353.1719403-3-yunkec@google.com>
Mime-Version: 1.0
References: <20220628005353.1719403-1-yunkec@google.com>
X-Mailer: git-send-email 2.37.0.rc0.161.g10f37bed90-goog
Subject: [PATCH v3 2/2] media: vimc: documentation for lens
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

