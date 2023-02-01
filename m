Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9D336686BB3
	for <lists+linux-media@lfdr.de>; Wed,  1 Feb 2023 17:29:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232372AbjBAQ3W (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Feb 2023 11:29:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231894AbjBAQ3H (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Feb 2023 11:29:07 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6EE6E79626
        for <linux-media@vger.kernel.org>; Wed,  1 Feb 2023 08:29:03 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 1400DB821D8
        for <linux-media@vger.kernel.org>; Wed,  1 Feb 2023 16:29:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 049A9C433A1;
        Wed,  1 Feb 2023 16:28:59 +0000 (UTC)
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Andy Walls <awalls@md.metrocast.net>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCHv2 6/8] cx18: missing CAP_AUDIO for vbi stream
Date:   Wed,  1 Feb 2023 17:28:48 +0100
Message-Id: <20230201162850.886563-7-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230201162850.886563-1-hverkuil-cisco@xs4all.nl>
References: <20230201162850.886563-1-hverkuil-cisco@xs4all.nl>
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

The v4l2-compliance test complained about this. You can change the
input connector for the vbi stream, but that means that you can have to
be able to do the same for the audio input.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/pci/cx18/cx18-streams.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/pci/cx18/cx18-streams.c b/drivers/media/pci/cx18/cx18-streams.c
index ce2be7f106b3..597472754c4c 100644
--- a/drivers/media/pci/cx18/cx18-streams.c
+++ b/drivers/media/pci/cx18/cx18-streams.c
@@ -79,7 +79,7 @@ static struct {
 		VFL_TYPE_VBI, 0,
 		DMA_FROM_DEVICE,
 		V4L2_CAP_VBI_CAPTURE | V4L2_CAP_SLICED_VBI_CAPTURE |
-		V4L2_CAP_READWRITE | V4L2_CAP_TUNER
+		V4L2_CAP_READWRITE | V4L2_CAP_AUDIO | V4L2_CAP_TUNER
 	},
 	{	/* CX18_ENC_STREAM_TYPE_PCM */
 		"encoder PCM audio",
-- 
2.39.0

