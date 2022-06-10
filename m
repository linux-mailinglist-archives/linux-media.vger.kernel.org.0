Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EEC925466DE
	for <lists+linux-media@lfdr.de>; Fri, 10 Jun 2022 14:52:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244835AbiFJMwc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 Jun 2022 08:52:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234166AbiFJMwb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 Jun 2022 08:52:31 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8FB229361
        for <linux-media@vger.kernel.org>; Fri, 10 Jun 2022 05:52:27 -0700 (PDT)
Received: from whitebuilder.lan (192-222-136-102.qc.cable.ebox.net [192.222.136.102])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: nicolas)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 6077C6601723;
        Fri, 10 Jun 2022 13:52:25 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1654865545;
        bh=WMyIg7gisNtkD0sb5pNXdznK+SK0HIpv0lIkFvXUJOo=;
        h=From:To:Cc:Subject:Date:From;
        b=UbynGtkURBdM5q9n+q9wujZXhL+162anA83Ymtfydsv+zR5ndBXzdWqV6MN0VLXHB
         UOVOWWOLDsb3Y9CY43/7LOCZjATI7oKHYiaY/qaUjwBMdjYLWnn7IUq3BomycDxnyS
         JF2hea7mdbPvqyJ37euIRnXtrvxWpiXND6Ik6aZvX/6sVP/sMu/EaBAZJObMoI8FdW
         ZP6O5FlGM8QtgeK1BhAdr1iDBvQmIaog/BxgtwxAdBQm9EnZmlwBPJnIx3p5wLTRmH
         1IDF0tDNrUcnO49VWYvTj0PT/5Q/Z5JTlcOp6T4yc7hRHuSJKRtUCW0w1mV8/NOSTF
         SZ8MZq+GSc29g==
From:   Nicolas Dufresne <nicolas.dufresne@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        kernel@collabora.com
Subject: [PATCH v1 0/5] media: rkvdec: Fix H.264 error resilience
Date:   Fri, 10 Jun 2022 08:52:10 -0400
Message-Id: <20220610125215.240539-1-nicolas.dufresne@collabora.com>
X-Mailer: git-send-email 2.36.1
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

Cc: kernel@collabora.com,
    linux-media@vger.kernel.org 

We found that when RKVDEC H.264 decoder encounter a stream error
(corruption, or error in the bitstream) the decoder keeps reporting
errors in the following (good) frames unless there is some pause
before starting a new decoder operation. As a side effect, the
decoder is not resilient to errors and this leads to a much worst
experience then needed.

First patch of this series implement a conservative fix for this,
which consist of simply disabling error detection. This method is
very resilient to errors, but will completely hide any decoding
errors. This mode have been running for years in ChromeOS
downstream driver, thus we believe this is that safe approach
and the one to backport into stable.

The other patches changes the decoding mode from "exit on error"
to "keep decoding". Using this mode and re-enabling error detection
allow getting error resilience without loosing the ability to report
errors to userland. This have showed great results, but might be a
little more risky since this is not the mode that the reference code
uses and the documentation is very brief.

Nicolas Dufresne (5):
  media: rkvdec: Disable H.264 error detection
  media: rkvdec: Add an ops to check for decode errors
  media: rkvdec: Fix RKVDEC_ERR_PKT_NUM macro
  media: rkvdec: Re-enable H.264 error detection
  media: rkvdec: Improve error handling

 drivers/staging/media/rkvdec/rkvdec-h264.c | 19 ++++++++++++-
 drivers/staging/media/rkvdec/rkvdec-regs.h |  2 +-
 drivers/staging/media/rkvdec/rkvdec.c      | 32 ++++++++++++++++++----
 drivers/staging/media/rkvdec/rkvdec.h      |  2 ++
 4 files changed, 47 insertions(+), 8 deletions(-)

-- 
2.36.1

