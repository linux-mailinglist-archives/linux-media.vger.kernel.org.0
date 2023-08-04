Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D0180770904
	for <lists+linux-media@lfdr.de>; Fri,  4 Aug 2023 21:28:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230194AbjHDT2C (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Aug 2023 15:28:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230200AbjHDT14 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 4 Aug 2023 15:27:56 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86D0B1BF
        for <linux-media@vger.kernel.org>; Fri,  4 Aug 2023 12:27:55 -0700 (PDT)
Received: from whitebuilder.lan (unknown [IPv6:2606:6d00:15:bae9::c73])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: nicolas)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 93FC666071BC;
        Fri,  4 Aug 2023 20:27:53 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1691177274;
        bh=BvhgTc/IEFkM1qW64TuwcGNRezTTo4jBZYzvrKRAFP4=;
        h=From:To:Cc:Subject:Date:From;
        b=cpY3p6odiEL4rn0QVzCiIueVn3yFVKVG3YvM99em5E8PDc5rU/IjkO8trKBy5cJDB
         Xi8mDr5enQ2pyz0TNBSMyTu1iItMNtoj5XJnxhHE5hLS3ADBpPcYWw2doFSiBWo9Hm
         L9+D/bsPUwoe1aOk1Nr3US/RI5TkxdBsF7Fz6DuaastCDkoagM/JfG30s1555uBoLz
         7Gr+ZMsK63dELHUpGav5SJrhHh+XHWH7oe4kbVhUk5Uu3hLZn2dI6YxwK0AZtTJORw
         i7fbtoplqcBfX7Wnt9RiUuz7RJlGUKd0fHGmHNVTUdGNimUKMfLaeYbe9SyKk8SeO7
         HQH3xv5SARmAw==
From:   Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc:     kernel@collabora.com,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        linux-media@vger.kernel.org
Subject: [PATCH 0/5] Document MT2110T/R with other improvements
Date:   Fri,  4 Aug 2023 15:27:32 -0400
Message-Id: <20230804192737.19016-1-nicolas.dufresne@collabora.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Patch 0 to 8 cleanup a little the tiled format documentation, moving
a diagram to its place and moving all 10 bits packed formats under
the "Tiled NV15" umbrella.

Finally the last patch moves MT2110T and MT2110R from reserved
format into planar format with the appropriate documentation. It
worth mentioning that these two formats have a software
implementation in GStreamer [0] and libyuv [1] and additional
documentation has been produced by Google [1].

[0] https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/3444
[1] https://chromium.googlesource.com/libyuv/libyuv/+/refs/heads/main/source/convert.cc#863
[2] https://tinyurl.com/mtk-10bit-video-format 

Nicolas Dufresne (5):
  docs: uapi: media: Properly locate NV12MT diagram
  docs: uapi: media: Move NV12_10BE_8L128 to NV15 section
  docs: uapi: media: Add common documentation of tiled NV15
  docs: uapi: media: Add a layout diagram for MT2110T
  docs: uapi: media: Document Mediatek 10bit tiled formats

 .../userspace-api/media/v4l/mt2110t.svg       | 268 ++++++++++++++++++
 .../media/v4l/pixfmt-reserved.rst             |  13 -
 .../media/v4l/pixfmt-yuv-planar.rst           | 245 +++++++++++++---
 3 files changed, 481 insertions(+), 45 deletions(-)
 create mode 100644 Documentation/userspace-api/media/v4l/mt2110t.svg

-- 
2.40.1

