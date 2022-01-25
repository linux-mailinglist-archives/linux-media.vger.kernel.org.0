Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 576B549B22C
	for <lists+linux-media@lfdr.de>; Tue, 25 Jan 2022 11:46:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348962AbiAYKmg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Jan 2022 05:42:36 -0500
Received: from sin.source.kernel.org ([145.40.73.55]:39306 "EHLO
        sin.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348065AbiAYKkK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Jan 2022 05:40:10 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id B54A5CE179E
        for <linux-media@vger.kernel.org>; Tue, 25 Jan 2022 10:40:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 963FAC340E8;
        Tue, 25 Jan 2022 10:40:04 +0000 (UTC)
Message-ID: <d749408a-ceeb-3f23-079f-949ab5eeb61b@xs4all.nl>
Date:   Tue, 25 Jan 2022 11:40:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Jammy Huang <jammy_huang@aspeedtech.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.18] aspeed fixes
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit 7dc5fc6d3bd6779c4859d888221f47e986cb45b5:

  media: mtk-cir: simplify code (2022-01-24 01:38:32 +0100)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.18f

for you to fetch changes up to f32c439a8b0f86eceafef8073e65b732c4207ab0:

  media: aspeed: Correct values for detected timing (2022-01-25 11:31:48 +0100)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Jammy Huang (6):
      media: aspeed: use v4l2_info/v4l2_warn/v4l2_dbg for log
      media: aspeed: add more debug log messages
      media: aspeed: Fix no complete irq for non-64-aligned width
      media: aspeed: Correct value for h-total-pixels
      media: aspeed: Use FIELD_GET to improve readability
      media: aspeed: Correct values for detected timing

 drivers/media/platform/aspeed-video.c | 219 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++--------------------
 1 file changed, 165 insertions(+), 54 deletions(-)
