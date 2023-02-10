Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 97130692A9A
	for <lists+linux-media@lfdr.de>; Fri, 10 Feb 2023 23:56:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229563AbjBJW41 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 Feb 2023 17:56:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229520AbjBJW40 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 Feb 2023 17:56:26 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB7AD26586;
        Fri, 10 Feb 2023 14:56:25 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 55668886;
        Fri, 10 Feb 2023 23:56:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1676069784;
        bh=HlMIBUjC0BU9Jb7s8XXv15LvZLpgq8Ao2/R1GtyHTyc=;
        h=From:To:Cc:Subject:Date:From;
        b=Spbqt+F0Fb7K4oY7iRoLM6lvzR6BJlMHqyC4NIdtpCnbrYP9/hFQ5aGqnydXw9xGI
         OF2Rz8Df1Mm5++YNouLe21f3fs6PstMuvq65VnOJMqfZc/r3kwKVPGz5bqnU9kj+0A
         vULxcvY/MiirfH8W2rzCXEV286EWaW4iwG5hi3S0=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 0/2] media: i2c: adv7604: Fix handling of video adjustments
Date:   Sat, 11 Feb 2023 00:56:20 +0200
Message-Id: <20230210225622.24411-1-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

This small series fixes two issues with video adjustments (brightness,
contrast, saturation and hue) in the adv7604 driver. Patch 1/2 makes
those controls effective (they currently have no effect), and patch 2/2
fixes the range of the hue control.

I have successfully tested the series with an ADV7612. The ADV7604 and
ADV7611 documentation of the hue control differs from the ADV7612, but I
believe that's because earlier documentation was incorrect. It could
still be useful to test the series with an ADV7604 or ADV7611.

In patch 2/2 I've decided to represent the hue value as an unsigned
8-bit integer, mapping to the [0°, 360°[ range. Using a signed value
would map to the [-180°, 180°[ range instead, without making any other
difference (and without requiring any modification to the patch other
than changing the range). I don't have a strong preference between the
two options, and I'm pretty sure we can freely pick one without any fear
of an impact on existing userspace applications as patch 1/2 shows that
the hue control has currently no effect.

Laurent Pinchart (2):
  media: i2c: adv7604: Enable video adjustment
  media: i2c: adv7604: Fix range of hue control

 drivers/media/i2c/adv7604.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

-- 
Regards,

Laurent Pinchart

