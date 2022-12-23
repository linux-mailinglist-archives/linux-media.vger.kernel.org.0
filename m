Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E2E5E6553EC
	for <lists+linux-media@lfdr.de>; Fri, 23 Dec 2022 20:38:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231373AbiLWTic (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 23 Dec 2022 14:38:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231228AbiLWTia (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 23 Dec 2022 14:38:30 -0500
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75AE91DA76
        for <linux-media@vger.kernel.org>; Fri, 23 Dec 2022 11:38:29 -0800 (PST)
Received: from whitebuilder.lan (192-222-136-102.qc.cable.ebox.net [192.222.136.102])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: nicolas)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 639836602CDF;
        Fri, 23 Dec 2022 19:38:27 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1671824307;
        bh=ReMnwqnWdZXeSRi4RVXJsleHBbiR/n5EHZB1WdNlCXc=;
        h=From:To:Cc:Subject:Date:From;
        b=YIlWWsOSqcejxGjdVcM0lvhYGo0bYZWIIPckOJS9vRMSti17dHLTfEUIgACNX+00M
         Vjr9pVyWA+Cv/ywyMRtE6YWQg5atCWh3w5GRRr81SnsJGbvWe+LUrFO6FKqdZIor+4
         H8HG36OicnHFIurKxsdREnXJEpGI0ap7WS+cYu6Dwo3Oiccfytg4lxZ38NN4d+b2jZ
         SRiQ/9lxkc9MLVNWKzEtKwZ9hv3g6/1uiOR3WRQJGz6QRSLnHpZLFlP0g3K9/TzTHo
         jhC66WWdAzH/jfkvAFh3PDsxaniQnB003RV8adzrLTjzz8jOpD3omFLOCZhaIGma8l
         KvOyfR7zs6d3g==
From:   Nicolas Dufresne <nicolas.dufresne@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     kernel@collabora.com,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>
Subject: [PATCH v1 0/4] media: rkvdec: Fix H.264 error resilience
Date:   Fri, 23 Dec 2022 14:38:02 -0500
Message-Id: <20221223193807.914935-1-nicolas.dufresne@collabora.com>
X-Mailer: git-send-email 2.38.1
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

This patch serie changes the decoding mode from "exit on error"
to "keep decoding". Using this mode and re-enabling error detection
allow getting error resilience without loosing the ability to report
errors to userland. This have showed great results, but might be a
little more risky since this is not the mode that the reference code
uses and the documentation is very brief. With this in place,
userspace can chose to skip or display corrupted frames depending
on its application requirement. Previsouly, applicaiton would have
had no choice but to present the corrupted frames.

Changes since V1:
	- Removed merged patch
	- Changed usage of pr_debug into v4l2_dbg
	- Fix typos in commit messages and comments

Nicolas Dufresne (5):
  media: rkvdec: Disable H.264 error detection
  media: rkvdec: Add an ops to check for decode errors
  media: rkvdec: Fix RKVDEC_ERR_PKT_NUM macro
  media: rkvdec: Re-enable H.264 error detection
  rkvdec: Improve error handling

 drivers/staging/media/rkvdec/rkvdec-h264.c | 23 +++++++++++++--
 drivers/staging/media/rkvdec/rkvdec-regs.h |  2 +-
 drivers/staging/media/rkvdec/rkvdec.c      | 34 ++++++++++++++++++----
 drivers/staging/media/rkvdec/rkvdec.h      |  2 ++
 4 files changed, 51 insertions(+), 10 deletions(-)

-- 
2.38.1

