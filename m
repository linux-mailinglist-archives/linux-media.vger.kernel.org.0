Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6B1DB590778
	for <lists+linux-media@lfdr.de>; Thu, 11 Aug 2022 22:38:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235896AbiHKUh5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Aug 2022 16:37:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229591AbiHKUh4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Aug 2022 16:37:56 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B10D95E4C
        for <linux-media@vger.kernel.org>; Thu, 11 Aug 2022 13:37:55 -0700 (PDT)
Received: from localhost.localdomain (node-1w7jr9st5p2etziuntaazujnj.ipv6.telus.net [IPv6:2001:569:beb1:1500:c96f:992f:7c34:9ff])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: dbrouwer)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 7BBBD6601D46;
        Thu, 11 Aug 2022 21:37:52 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1660250273;
        bh=cZYd3bvNbYmQWsQdeziNMNbiOKOGHuQifJjj75Kw95s=;
        h=From:To:Cc:Subject:Date:From;
        b=jrSSLAgYm7Pa+JHdKO4fZD7uAKBM1TtBUtO8Pm4PORSY0/Et0wnhDTlkxSSq9p8sS
         YMthuCOB+IVa5LqXNP/O3wYDR0ezQa20a5QpqsmKFGZFCvP4/gbhWvBj2oeuSsm921
         4rGcUguE/kKtLEeRBw5OO7H8FT7KsvdT600xICT6MoZUbHImAGrPgeqqdapRmJfzWp
         sx2nmosNCULP2rk2len2YdiI9bTfuLnXR+gCHHWEbxGWdaRrZDNpqM/hAZURMjlsRm
         NFD6tUIX0JnhCia5P8G6qwxf7MAT1GfHLANbDmIBP9BUyMwfn/uq5sFy5pvvC6dfkN
         WMX0EHLRQruuQ==
From:   Deborah Brouwer <deborah.brouwer@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     ezequiel@vanguardiasur.com.ar, daniel.almeida@collabora.com,
        Deborah Brouwer <deborah.brouwer@collabora.com>
Subject: [PATCH] media: v4l2-ctrls: Fix typo in VP8 comment
Date:   Thu, 11 Aug 2022 13:37:56 -0700
Message-Id: <20220811203756.124673-1-deborah.brouwer@collabora.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The comment for the VP8 loop filter flags uses the partially wrong name
for the flags. Unlike the other VP8 flag names, the loop filter flag names
don't have "_FLAG" in them. Change the comment so that it matches the
actual flag definitions in the header.

Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
---
 include/uapi/linux/v4l2-controls.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index 5f46bf4a570c..a1363c59902d 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -1730,7 +1730,7 @@ struct v4l2_vp8_segment {
  * @sharpness_level: matches sharpness_level syntax element.
  * @level: matches loop_filter_level syntax element.
  * @padding: padding field. Should be zeroed by applications.
- * @flags: see V4L2_VP8_LF_FLAG_{}.
+ * @flags: see V4L2_VP8_LF_{}.
  *
  * This structure contains loop filter related parameters.
  * See the 'mb_lf_adjustments()' part of the frame header syntax,
-- 
2.37.1

