Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EFB987251FA
	for <lists+linux-media@lfdr.de>; Wed,  7 Jun 2023 04:12:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240701AbjFGCMP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 6 Jun 2023 22:12:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240679AbjFGCMM (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 6 Jun 2023 22:12:12 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27C9B1990
        for <linux-media@vger.kernel.org>; Tue,  6 Jun 2023 19:12:10 -0700 (PDT)
Received: from db550.. (node-1w7jr9st5p2esmclet71ntnwp.ipv6.telus.net [IPv6:2001:569:beb1:1500:6f9d:3a5c:4d25:e949])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: dbrouwer)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 8D8D36606EF0;
        Wed,  7 Jun 2023 03:12:07 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1686103928;
        bh=FAcHKm6JiQeYynZIrVq+6ci5uSh0fhHo5oMLzLuIhu4=;
        h=From:To:Cc:Subject:Date:From;
        b=kGUiaPodNoyHuFIisKOlQZhJtl9ImG4UpzyWTjsTpFpBLwuID6MFMJ0LLt9YUFZP0
         HPG3MA+e9ZcVG5QYpkt7NQ0K2uD7Gs4NvJCepTO51RT2HEmI0Zo0B77nlttYD03+BK
         7ANu2UsP4H/X61XQzT7GgSvH/+VZeUQo1oUuzOtLfdj965GHlmkm8k4u7knUv/27Jn
         B7pyXP1iI3QsKGaTHbAi64B7tsr9w6IMNRZQq1wYCB9A4G1FIlC/zahjn8SaskHfrq
         dStMzkjJqu/6+wp184Z/GjRocd9+knPx1yYFcjrzBKMQgMbmFpDHRRnpf6YkjpUvY0
         XJ3vODcEUypYQ==
From:   Deborah Brouwer <deborah.brouwer@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil-cisco@xs4all.nl, nicolas.dufresne@collabora.com,
        Deborah Brouwer <deborah.brouwer@collabora.com>
Subject: [PATCH 0/4] v4l2-tracer: add tracing for frames/events
Date:   Tue,  6 Jun 2023 19:11:54 -0700
Message-Id: <cover.1686102391.git.deborah.brouwer@collabora.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,
This series adds some tracing/retracing for
events, enumerating framesizes and frameintervals,
and stringifying selection target values.

Deborah Brouwer (4):
  v4l2-tracer: add VIDIOC_ENUM_FRAMESIZES
  v4l2-tracer: add VIDIOC_ENUM_FRAMEINTERVALS
  v4l2-tracer: stringify target in v4l2_selection
  v4l2-tracer: add event tracing/retracing

 utils/v4l2-tracer/libv4l2tracer.cpp  |   5 ++
 utils/v4l2-tracer/retrace.cpp        | 112 ++++++++++++++++++++++++++-
 utils/v4l2-tracer/trace.cpp          |  13 ++++
 utils/v4l2-tracer/v4l2-tracer-gen.pl |  74 ++++++++++++++++--
 4 files changed, 192 insertions(+), 12 deletions(-)

-- 
2.40.1

