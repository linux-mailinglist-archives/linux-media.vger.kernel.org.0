Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3A79E65D142
	for <lists+linux-media@lfdr.de>; Wed,  4 Jan 2023 12:19:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234505AbjADLTw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Jan 2023 06:19:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230423AbjADLTu (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 4 Jan 2023 06:19:50 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF8981A3A0
        for <linux-media@vger.kernel.org>; Wed,  4 Jan 2023 03:19:49 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 29D696C7;
        Wed,  4 Jan 2023 12:19:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1672831188;
        bh=6NCvRsXn32N/RZsTrQlL34uX2mUVD04Wdi7lQ8raFwg=;
        h=From:To:Cc:Subject:Date:From;
        b=b1TRexhp+3+plFw9LJvjbD7yHTgcmDFn/tcXX4hJGWorzFU5qyruZZp07v/tB/WGc
         +t4LoPGBs9wiiV9r9/OYZPgLNJBbUL6KHSjiknJ662iOxn44aIOSwKi6KdPPl/+V5N
         QeUZZ/diVNAPTME5BSTEHX3PJnoHNyTdqPVV4HNI=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Ricardo Ribalda <ribalda@chromium.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH v2 0/2] media: uvcvideo: Drop format descriptions
Date:   Wed,  4 Jan 2023 13:19:42 +0200
Message-Id: <20230104111944.962-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.38.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

This small patch series is a new version of the previous single patch
"[PATCH] media: uvcvideo: Remove format descriptions". In addition to
fixing a bug in 1/2, the newly added patch 2/2 takes it a step forward
with a further simplification.

I could squash 2/2 with 1/2 if desired, but I've decided to keep it
separate at least for now in case there would be a preference for
keeping the format name string for DV formats.

Laurent Pinchart (2):
  media: uvcvideo: Remove format descriptions
  media: uvcvideo: Drop custom format names for DV formats

 drivers/media/usb/uvc/uvc_driver.c | 19 +++----------------
 drivers/media/usb/uvc/uvc_v4l2.c   |  2 --
 drivers/media/usb/uvc/uvcvideo.h   |  2 --
 3 files changed, 3 insertions(+), 20 deletions(-)


base-commit: fb1316b0ff3fc3cd98637040ee17ab7be753aac7
-- 
Regards,

Laurent Pinchart

