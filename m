Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 08C545BD8BE
	for <lists+linux-media@lfdr.de>; Tue, 20 Sep 2022 02:22:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229723AbiITAV5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Sep 2022 20:21:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229657AbiITAVu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Sep 2022 20:21:50 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3D0152822
        for <linux-media@vger.kernel.org>; Mon, 19 Sep 2022 17:21:46 -0700 (PDT)
Received: from localhost.localdomain (node-1w7jr9st5p2etziuntaazujnj.ipv6.telus.net [IPv6:2001:569:beb1:1500:c96f:992f:7c34:9ff])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: dbrouwer)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 5FDCF6601DE8;
        Tue, 20 Sep 2022 01:21:43 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1663633304;
        bh=51N1vaSOhDPNrgGDdOXh9oiozNFYpkPziPMKW7TPFPY=;
        h=From:To:Cc:Subject:Date:From;
        b=lmEUAlfJUfYeDyk1o62mtG1lic4dz8UOpDRlpZfwW5XinKlp0pfwJiN/Vn09zithQ
         V/SyVngLv4490v7UxB+2qMBwwO+Mdipr9CulBagJoVdyWt3ucomtUWM0tFXS+e/WEg
         sCg2hbHaUKk8tgOLBh56WOL4RBl+FLg0PJz6NtwGcqS01Ztm2HYCN7KnlMRs3lTEtJ
         iedBpz5K66oIE+qocg1JAUpPTh+c6FR0ZkwMDSqcpolBP8ucz2dgdwrA6nelTQVHv/
         KIDFP/QYGmlM1ZC1zJ9xrwH74EJX8fmL1ibE9HP+5faYIvJjtSdd9PoAEMF+sUN91g
         Wkliz+urgcTmw==
From:   Deborah Brouwer <deborah.brouwer@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     dafna@fastmail.com, hverkuil-cisco@xs4all.nl,
        Deborah Brouwer <deborah.brouwer@collabora.com>
Subject: [PATCH] v4l2-info: add flag V4L2_PIX_FMT_FLAG_SET_CSC
Date:   Mon, 19 Sep 2022 17:21:59 -0700
Message-Id: <20220920002159.17734-1-deborah.brouwer@collabora.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add a string value for V4L2_PIX_FMT_FLAG_SET_CSC in pixflags2s().

Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
---
This flag was originally added in:

b38c73ca1c213 ("media: v4l2: add support for colorspace
               conversion API (CSC) for video capture")

 utils/common/v4l2-info.cpp | 1 +
 1 file changed, 1 insertion(+)

diff --git a/utils/common/v4l2-info.cpp b/utils/common/v4l2-info.cpp
index c4dbb14e..a7964ad0 100644
--- a/utils/common/v4l2-info.cpp
+++ b/utils/common/v4l2-info.cpp
@@ -347,6 +347,7 @@ std::string quantization2s(int val)
 
 static constexpr flag_def pixflags_def[] = {
 	{ V4L2_PIX_FMT_FLAG_PREMUL_ALPHA,  "premultiplied-alpha" },
+	{ V4L2_PIX_FMT_FLAG_SET_CSC,  "set-csc" },
 	{ 0, nullptr }
 };
 
-- 
2.37.3

