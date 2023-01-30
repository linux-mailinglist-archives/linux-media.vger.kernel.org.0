Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9C307680D7B
	for <lists+linux-media@lfdr.de>; Mon, 30 Jan 2023 13:18:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236596AbjA3MS4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Jan 2023 07:18:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236542AbjA3MSz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Jan 2023 07:18:55 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 194D118A85
        for <linux-media@vger.kernel.org>; Mon, 30 Jan 2023 04:18:47 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id BA1AAB80F98
        for <linux-media@vger.kernel.org>; Mon, 30 Jan 2023 12:18:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29219C433D2
        for <linux-media@vger.kernel.org>; Mon, 30 Jan 2023 12:18:43 +0000 (UTC)
Message-ID: <758d7cfe-992f-b29d-0a62-8079d638e977@xs4all.nl>
Date:   Mon, 30 Jan 2023 13:18:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Content-Language: en-US
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v6.3] Various fixes
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit 7120d6bfd6d0b26b49958f429701996f2d3e2c2a:

  media: tm6000: remove deprecated driver (2023-01-22 09:57:19 +0100)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v6.3i

for you to fetch changes up to 703ade6ceb2559a0b543ceb321c4daddecd73003:

  saa7134: Use video_unregister_device for radio_dev (2023-01-30 13:03:53 +0100)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Benjamin Roszak (1):
      media: meson: vdec: remove redundant if statement

Brent Pappas (1):
      media: imx: imx-media-fim: Replace macro icap_enabled() with function

Duoming Zhou (1):
      media: usb: siano: Fix use after free bugs caused by do_submit_urb

Tasos Sahanidis (1):
      saa7134: Use video_unregister_device for radio_dev

 drivers/media/pci/saa7134/saa7134-core.c    | 2 +-
 drivers/media/usb/siano/smsusb.c            | 1 +
 drivers/staging/media/imx/imx-media-fim.c   | 5 ++++-
 drivers/staging/media/meson/vdec/esparser.c | 3 +--
 4 files changed, 7 insertions(+), 4 deletions(-)
