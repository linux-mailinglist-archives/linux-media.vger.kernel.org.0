Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0A3F0679304
	for <lists+linux-media@lfdr.de>; Tue, 24 Jan 2023 09:25:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232841AbjAXIZe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Jan 2023 03:25:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229753AbjAXIZd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Jan 2023 03:25:33 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B58D6BB
        for <linux-media@vger.kernel.org>; Tue, 24 Jan 2023 00:25:31 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 4EF6561226
        for <linux-media@vger.kernel.org>; Tue, 24 Jan 2023 08:25:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C539C433AE;
        Tue, 24 Jan 2023 08:25:30 +0000 (UTC)
Message-ID: <c427843d-13eb-9fdb-ea11-c90bf68df7c7@xs4all.nl>
Date:   Tue, 24 Jan 2023 09:25:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Content-Language: en-US
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT FIXES FOR v6.2] videobuf2-core regression fix
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

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v6.2c

for you to fetch changes up to 949680ab4ff3f25177a73837d8221dbb391ff56d:

  media: videobuf2: set q->streaming later (2023-01-24 09:21:25 +0100)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Hans Verkuil (1):
      media: videobuf2: set q->streaming later

 drivers/media/common/videobuf2/videobuf2-core.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
