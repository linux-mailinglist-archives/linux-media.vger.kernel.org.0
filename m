Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BA3A27A088D
	for <lists+linux-media@lfdr.de>; Thu, 14 Sep 2023 17:07:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240666AbjINPHe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Sep 2023 11:07:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240554AbjINPHd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Sep 2023 11:07:33 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 420C41AE
        for <linux-media@vger.kernel.org>; Thu, 14 Sep 2023 08:07:29 -0700 (PDT)
Received: from whitebuilder.lan (unknown [IPv6:2606:6d00:15:bae9::c73])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: nicolas)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 826276607346;
        Thu, 14 Sep 2023 16:07:27 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1694704047;
        bh=SV8Sx53IxBW0CwF3BJ1F+r9ZodB94xs9hU6KwvFvy4w=;
        h=From:To:Cc:Subject:Date:From;
        b=HLO/XZKP3HnCb8MC+jKK/FF3R6c/hKkPT67nMGEpN2k2SGJMvwjiEjzEN2Z0hf890
         Mc2bOF20FRLFAA08uE9C8ZIT7VmFRdmgjbNDusfk9A2ghie5JpdTAT2M7hHlh3NHAS
         b9epz9YUgG1rCA0uvywRqknCUprRVvkbXiVjn5Ki8OCyM3gMMNaFeWSwbX7tmnd4Za
         6L/eHsSlzABsAjl3lmSuod2S9TwB0bedGM06v61+qDfGuZBDe4waNexMjFbvCf9BM/
         bmHaSvBdNbvQY6/I5saRkB0aWHMu48r4Og6fB1J2hisammDtEROQ7hiDpXIdP9kalC
         REVspZ1enjijg==
From:   Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc:     kernel@collabora.com,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        linux-media@vger.kernel.org
Subject: [PATCH v2 0/5] Document MT2110T/R with other improvements
Date:   Thu, 14 Sep 2023 11:06:46 -0400
Message-Id: <20230914150651.3114134-1-nicolas.dufresne@collabora.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Changes in v2:
  - (patch 3, 5) Improved wording as per review comments
  - (patch 3) Document both little and big endian form of NV12
  - (patch 3, 5) Document bytes from upper bits to lower bits
  - (patch 4) Properly placed the lower bits parrition first
  - (patch 4) Added partion sizes in the diagram
  - (patch 4) Reworded to reduce confusion
  - (patch 3, 5) Fixed header-rows/stub-columns

Nicolas Dufresne (5):
  docs: uapi: media: Properly locate NV12MT diagram
  docs: uapi: media: Move NV12_10BE_8L128 to NV15 section
  docs: uapi: media: Add common documentation of tiled NV15
  docs: uapi: media: Add a layout diagram for MT2110T
  docs: uapi: media: Document Mediatek 10bit tiled formats

 .../userspace-api/media/v4l/mt2110t.svg       | 315 +++++++++++++++++
 .../media/v4l/pixfmt-reserved.rst             |  13 -
 .../media/v4l/pixfmt-yuv-planar.rst           | 317 ++++++++++++++++--
 3 files changed, 598 insertions(+), 47 deletions(-)
 create mode 100644 Documentation/userspace-api/media/v4l/mt2110t.svg

-- 
2.40.1

