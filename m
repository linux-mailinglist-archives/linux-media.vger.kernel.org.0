Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 108F8601181
	for <lists+linux-media@lfdr.de>; Mon, 17 Oct 2022 16:49:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229815AbiJQOt2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Oct 2022 10:49:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229727AbiJQOtZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Oct 2022 10:49:25 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35C962DDC
        for <linux-media@vger.kernel.org>; Mon, 17 Oct 2022 07:49:21 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 6877CB818FB
        for <linux-media@vger.kernel.org>; Mon, 17 Oct 2022 14:49:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADE1FC433C1
        for <linux-media@vger.kernel.org>; Mon, 17 Oct 2022 14:49:17 +0000 (UTC)
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: [PATCH 0/3] vivid improvements
Date:   Mon, 17 Oct 2022 16:49:13 +0200
Message-Id: <20221017144916.489388-1-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

While testing the framebuffer support for the 'vivid crash fixes' series
I found a few other vivid issues, basically due to bit rot :-)

They are just regular fixes, so no need for these to go to 6.1.

Regards,

	Hans

Hans Verkuil (3):
  vivid: drop GFP_DMA32
  vivid: set num_in/outputs to 0 if not supported
  vivid.rst: loop_video is set on the capture devnode

 Documentation/admin-guide/media/vivid.rst     |  2 +-
 drivers/media/test-drivers/vivid/vivid-core.c | 16 ++++++++++++----
 drivers/media/test-drivers/vivid/vivid-osd.c  |  2 +-
 3 files changed, 14 insertions(+), 6 deletions(-)

-- 
2.35.1

