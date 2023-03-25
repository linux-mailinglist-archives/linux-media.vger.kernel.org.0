Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2BFCC6C90CF
	for <lists+linux-media@lfdr.de>; Sat, 25 Mar 2023 21:56:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229650AbjCYU4H (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 25 Mar 2023 16:56:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229446AbjCYU4F (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 25 Mar 2023 16:56:05 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 315EEA5CB;
        Sat, 25 Mar 2023 13:56:05 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 94B6F8BE;
        Sat, 25 Mar 2023 21:56:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1679777763;
        bh=8Ltqtewi2anpPoTZHd3yDIcuyfasUrBBCU/+n2ERLro=;
        h=From:To:Cc:Subject:Date:From;
        b=EL+XSRS7UYHqOnv87CC8Gr+JJKqm6+32syZ/Gm7Lg99bSAzizWLRCce9kSH+IHF2k
         vTFhM3sbF+jRxGslIEqeel236EvluCGUXW5U6bTkj6K6wpjEX8mSArpVxifoU1hG8u
         PRbwrgKD6Pfo8q/By1b7dvOjwyB30wFfl7Y1uH/w=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH v2 0/2] media: i2c: adv7604: Fix handling of video adjustments
Date:   Sat, 25 Mar 2023 22:56:08 +0200
Message-Id: <20230325205610.22583-1-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

This small series fixes two issues with video adjustments (brightness,
contrast, saturation and hue) in the adv7604 driver. Patch 1/2 makes
those controls effective (they currently have no effect), and patch 2/2
fixes the range of the hue control.

I have successfully tested the series with an ADV7612, and Hans with the
ADV7604. The ADV7604 and ADV7611 documentation of the hue control
differs from the ADV7612, but I believe that's because earlier
documentation was incorrect.

In patch 2/2 I've decided to represent the hue value as an unsigned
8-bit integer, mapping to the [0°, 360°[ range. Using a signed value
would map to the [-180°, 180°[ range instead, without making any other
difference (and without requiring any modification to the patch other
than changing the range). I don't have a strong preference between the
two options, and I'm pretty sure we can freely pick one without any fear
of an impact on existing userspace applications as patch 1/2 shows that
the hue control has currently no effect.

Compared to v1, this version fixes a typo in the commit message of patch
2/2.

Laurent Pinchart (2):
  media: i2c: adv7604: Enable video adjustment
  media: i2c: adv7604: Fix range of hue control

 drivers/media/i2c/adv7604.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

-- 
Regards,

Laurent Pinchart

