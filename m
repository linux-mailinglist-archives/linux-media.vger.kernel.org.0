Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 41F006DE60D
	for <lists+linux-media@lfdr.de>; Tue, 11 Apr 2023 22:55:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229901AbjDKUza (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 11 Apr 2023 16:55:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229477AbjDKUz3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 11 Apr 2023 16:55:29 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54CB91984
        for <linux-media@vger.kernel.org>; Tue, 11 Apr 2023 13:55:27 -0700 (PDT)
Received: from localhost.localdomain (unknown [IPv6:2001:569:beb1:1500:c96f:992f:7c34:9ff])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: dbrouwer)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id BF9DB66031F9;
        Tue, 11 Apr 2023 21:55:24 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1681246525;
        bh=0M2NEwWyzxhV0OqfImi2MOc8HG5s3BNVJrKpvkWzfPU=;
        h=From:To:Cc:Subject:Date:From;
        b=NLPuu7iq3YTm3B52ZHz1iVnGshbu9yTUKa7NzW0x2E4CBz+D2vLPqMbSMSPqADJcy
         O90rt9mQGr2nWlzWOcyYJWIoi2/PnPih+1hn6OEMzB8phzjh3Mbsvc2MVSCHeqTT5p
         sqAlPiy5tjY9D/1FFaWaQOzTMCTFowdYQV83TsN9Qu5mZaTq6B1luMfWmpe5uKOGtM
         7bJZkXJ2jxYL1zeNlJi3iB91z+ug0GXYK8b7BZf2eAhy0bYSx7/N8/vQ4alplcGh+N
         GXR8ADIJnAfMsgouAfMHn3Z2CViPrqBbylwL3g6+iTVwDKVGe+MohbO2Zto33DOXdy
         Fd+nWRf6qM8yQ==
From:   Deborah Brouwer <deborah.brouwer@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, Deborah Brouwer <deborah.brouwer@collabora.com>
Subject: [PATCH v2 0/2] v4l2-tracer: debug messages
Date:   Tue, 11 Apr 2023 13:54:56 -0700
Message-Id: <cover.1681245372.git.deborah.brouwer@collabora.com>
X-Mailer: git-send-email 2.39.1
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

Changes since v1:
- split into two patches
- first patch moves debug option-checking out
  of main code and into debug functions
- second patch introduces and applies the macro
  for printing file, function and line number

Deborah Brouwer (2):
  v4l2-tracer: print only if debugging option is set
  v4l2-tracer: add macros to print debug info

 utils/v4l2-tracer/libv4l2tracer.cpp      |  35 ++----
 utils/v4l2-tracer/retrace-helper.cpp     |  41 +++----
 utils/v4l2-tracer/retrace.cpp            | 129 ++++++++---------------
 utils/v4l2-tracer/trace-helper.cpp       |  52 +++------
 utils/v4l2-tracer/trace.cpp              |  15 +--
 utils/v4l2-tracer/v4l2-tracer-common.cpp |   6 +-
 utils/v4l2-tracer/v4l2-tracer-common.h   |  16 +++
 utils/v4l2-tracer/v4l2-tracer.cpp        |  45 +++-----
 8 files changed, 121 insertions(+), 218 deletions(-)

-- 
2.39.1

