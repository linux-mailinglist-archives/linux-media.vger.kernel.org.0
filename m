Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 33394690027
	for <lists+linux-media@lfdr.de>; Thu,  9 Feb 2023 07:05:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229655AbjBIGFC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 Feb 2023 01:05:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229526AbjBIGFA (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 9 Feb 2023 01:05:00 -0500
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 847D93E627
        for <linux-media@vger.kernel.org>; Wed,  8 Feb 2023 22:04:59 -0800 (PST)
Received: from localhost.localdomain (node-1w7jr9st5p2etziuntaazujnj.ipv6.telus.net [IPv6:2001:569:beb1:1500:c96f:992f:7c34:9ff])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: dbrouwer)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 1A09766020B6;
        Thu,  9 Feb 2023 06:04:56 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1675922697;
        bh=Hr4cLM5+czA/iHR/nOT8pAavDqL5mVMuLheBY/nlfGo=;
        h=From:To:Cc:Subject:Date:From;
        b=DbWbs7RZwi4NHX0aYLGGTfW10wlRpsyWXlKl0RcocdnzzcXQ7IVLgDEPRYbVPmROG
         FQzPAg1TvG7FS7grEo8jLzXfhRjZ5dyqU4m4qDBENZXVA31fTXKFdDX7SGStU1Z+C6
         6tPILQ6NFfK/6gzHdEa3UwR2YefedIpxXj3i3cHRD8VKookG7ALzTPpadGleB7W6wC
         pnoKILc+VYLt+xickVvZlvcOdrzb3yVOTg0culynl20H1SuHMByT/RCjEdH2m5iy1K
         nkRVk9cWHDaZ9rRRvlPc+WaRlvJOllF1bl4xxp2woslmuTNceHRoXytrAAK9bi2MJK
         dhVmw6chJEpXw==
From:   Deborah Brouwer <deborah.brouwer@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     Deborah Brouwer <deborah.brouwer@collabora.com>
Subject: [PATCH 0/5] v4l2-tracer: misc fixes
Date:   Wed,  8 Feb 2023 22:06:20 -0800
Message-Id: <cover.1675920064.git.deborah.brouwer@collabora.com>
X-Mailer: git-send-email 2.39.0
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

Hi,
This is a series of small fixes for errors that I noticed
while adding tracing for INPUT and OUTPUT ioctls.

Deborah Brouwer (5):
  v4l2-tracer: add signal handling
  v4l2-tracer: remove trailing comma from JSON trace
  v4l2-tracer: refactor autogeneration script
  v4l2-tracer: add exact matching for 'type' and 'field'
  v4l2-tracer: add INPUT and OUTPUT ioctls

 utils/v4l2-tracer/libv4l2tracer.cpp  |   6 +
 utils/v4l2-tracer/retrace.cpp        |  84 +++++++++
 utils/v4l2-tracer/trace.cpp          |  18 ++
 utils/v4l2-tracer/v4l2-tracer-gen.pl | 273 +++++++++++++++------------
 utils/v4l2-tracer/v4l2-tracer.cpp    |  34 ++--
 5 files changed, 287 insertions(+), 128 deletions(-)

-- 
2.39.0

