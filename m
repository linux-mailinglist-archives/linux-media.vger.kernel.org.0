Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9CCF86F3C5E
	for <lists+linux-media@lfdr.de>; Tue,  2 May 2023 05:27:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231799AbjEBD14 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 May 2023 23:27:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230202AbjEBD1y (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 1 May 2023 23:27:54 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01B00358B
        for <linux-media@vger.kernel.org>; Mon,  1 May 2023 20:27:52 -0700 (PDT)
Received: from localhost.localdomain (node-1w7jr9st5p2etziuntaazujnj.ipv6.telus.net [IPv6:2001:569:beb1:1500:c96f:992f:7c34:9ff])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: dbrouwer)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 2DDE8660321C;
        Tue,  2 May 2023 04:27:49 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1682998071;
        bh=TO9YkEUgTZHoIy3KDfVjxbb0b7QTgZ2v+TZ9hOHz4Cg=;
        h=From:To:Cc:Subject:Date:From;
        b=HjaPfRzpHdMS8mzXExkDYukHfhXqTmShu2rclDhvEv0LnYtVjUDHQFocH7ec5JV4b
         Up7ewuFRcgkwlWa7xj+RAwUKqFUmX3lVNCBU+PdwjNR6J5mGFSHv+y8M/l2+m5lAvo
         mFssPcjhMHhgHIwg6sbxeF8q95j8bX7Y/VZQmLIOSV0Y9EICp4HiXVdp5U35InAB3k
         doPw5n7POaR2l/4r2ygUe7QK49CbLCdOWagi+knJYp4+lnUyR13PGTuhC+idbyFfVv
         wRu8D8sEAJ54yK3PDloFLV2xhiNkfsFJg55FG6t02GK/bowCh0wEAbDihVmDV8kTew
         A4HypiO5FrNcw==
From:   Deborah Brouwer <deborah.brouwer@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, Deborah Brouwer <deborah.brouwer@collabora.com>
Subject: [PATCH v2 00/13] bttv: convert to vb2
Date:   Mon,  1 May 2023 20:27:18 -0700
Message-Id: <cover.1682995256.git.deborah.brouwer@collabora.com>
X-Mailer: git-send-email 2.39.1
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

This series converts the bttv driver to vb2.

Compliance test results are the same as in v1:
https://lore.kernel.org/linux-media/cover.1682379348.git.deborah.brouwer@collabora.com/

Changes since v1:
- revised commit messages in patches 04/13 and 05/13
to clearly explain treatment of format/width/height and
certain vbi fields

- In patch "media: bttv: refactor bttv_set_dma()": drop superfluous
parentheses and rename the argument 'override' as 'start_capture'
to be more descriptive of its function.

- In patch "media: bttv: convert to vb2":
  - use BT848_CAP_CTL_* when calling bttv_set_dma()
  - fix compiler warning that vb2_queue may be uninitialized
  - fix vbi sequence counter to avoid incrementing it twice
if both video and vbi are streaming

Deborah Brouwer (13):
  media: bttv: use video_drvdata to get bttv
  media: bttv: replace BUG with WARN_ON
  media: bttv: radio use v4l2_fh instead of bttv_fh
  media: bttv: copy vid fmt/width/height from fh
  media: bttv: copy vbi_fmt from bttv_fh
  media: bttv: move do_crop flag out of bttv_fh
  media: bttv: remove format field from bttv_buffer
  media: bttv: remove tvnorm field from bttv_buffer
  media: bttv: remove crop info from bttv_buffer
  media: bttv: move vbi_skip/vbi_count out of buffer
  media: bttv: refactor bttv_set_dma()
  media: bttv: use audio defaults for winfast2000
  media: bttv: convert to vb2

 drivers/media/pci/bt8xx/Kconfig           |   2 +-
 drivers/media/pci/bt8xx/bttv-audio-hook.c |  10 +-
 drivers/media/pci/bt8xx/bttv-driver.c     | 994 +++++++---------------
 drivers/media/pci/bt8xx/bttv-risc.c       | 414 +++++----
 drivers/media/pci/bt8xx/bttv-vbi.c        | 267 +++---
 drivers/media/pci/bt8xx/bttvp.h           |  78 +-
 6 files changed, 683 insertions(+), 1082 deletions(-)

-- 
2.39.2

