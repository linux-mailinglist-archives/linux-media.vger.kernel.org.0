Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BBA5B52625B
	for <lists+linux-media@lfdr.de>; Fri, 13 May 2022 14:53:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1380456AbiEMMxP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 May 2022 08:53:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244014AbiEMMxN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 May 2022 08:53:13 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E6025E168
        for <linux-media@vger.kernel.org>; Fri, 13 May 2022 05:53:11 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 2D9A961FBC
        for <linux-media@vger.kernel.org>; Fri, 13 May 2022 12:53:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B04DC34115;
        Fri, 13 May 2022 12:53:09 +0000 (UTC)
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Johan Fjeldtvedt <johfjeld@cisco.com>
Subject: [PATCH 0/2] Introduce HDMI Video Guard Band test pattern
Date:   Fri, 13 May 2022 14:53:05 +0200
Message-Id: <20220513125307.3494442-1-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

These patches add support for a specific test pattern to test HDMI
receivers.

Four pixels of the RGB color 0xab55ab are inserted at the left hand side of
the image. This is only done for 3 or 4 byte RGB pixel formats. The HDMI
TMDS encoding of this pixel value equals the Video Guard Band value as
defined by HDMI (see section 5.2.2.1 in the HDMI 1.3 Specification) that
preceeds the first actual pixel of a video line. If an HDMI receiver
doesn't handle this correctly, then it might keep skipping these Video
Guard Band patterns and end up with a shorter video line. So this is a
nice pattern to test with.

And yes, this does cause one receiver we tested with to lose sync :-)

Regards,

	Hans

Hans Verkuil (2):
  media: v4l2-tpg: add HDMI Video Guard Band test pattern
  media: vivid: add HDMI Video Guard Band control

 drivers/media/common/v4l2-tpg/v4l2-tpg-core.c | 38 +++++++++++++++++++
 .../media/test-drivers/vivid/vivid-ctrls.c    | 14 +++++++
 include/media/tpg/v4l2-tpg.h                  | 16 ++++++++
 3 files changed, 68 insertions(+)

-- 
2.34.1

