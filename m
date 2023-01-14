Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F159466AD9B
	for <lists+linux-media@lfdr.de>; Sat, 14 Jan 2023 21:20:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229472AbjANUTr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 14 Jan 2023 15:19:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230257AbjANUTp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 14 Jan 2023 15:19:45 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48FFA7EEA
        for <linux-media@vger.kernel.org>; Sat, 14 Jan 2023 12:19:44 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B90DC4D4
        for <linux-media@vger.kernel.org>; Sat, 14 Jan 2023 21:19:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1673727583;
        bh=RAXihct109RVEQyxj1LPaaQoYd+tATKXb/DJyDlOMKc=;
        h=Date:From:To:Subject:From;
        b=kAnr4Y0YVbw8jBYuDS69JSXmmih5yNm+NmhHg0t68Z8GwvhdTi8kf6uYv2EzLe/kR
         UTqI04NNXzGr0FO8C7qrx+qOIpJxkwSgoeqaC4Y5g6u/YH8HH0EioDn4GpCwrruQtx
         JtHgnOXGPmUOYV7aPpVp0+nbtSAsTaArpYNH9FO8=
Date:   Sat, 14 Jan 2023 22:19:42 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL FOR v6.3] max9286 changes
Message-ID: <Y8MOXqieU16D/SyE@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

The following changes since commit 1b929c02afd37871d5afb9d498426f83432e71c2:

  Linux 6.2-rc1 (2022-12-25 13:41:39 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux.git tags/media-gmsl-next-20230114

for you to fetch changes up to 80f19527cd068d0b5c8a33e98cd3cd910f44f4e0:

  media: i2c: max9286: Print power-up GMSL link configuration (2023-01-14 22:17:31 +0200)

----------------------------------------------------------------
max9286 changes

----------------------------------------------------------------
Laurent Pinchart (11):
      dt-bindings: media: i2c: max9286: Add support for per-port supplies
      dt-bindings: media: i2c: max9286: Add property to select I2C speed
      dt-bindings: media: i2c: max9286: Add property to select bus width
      media: i2c: max9286: Support manual framesync operation
      media: i2c: max9286: Rename MAX9286_DATATYPE_RAW11 to RAW12
      media: i2c: max9286: Support 12-bit raw bayer formats
      media: i2c: max9286: Define macros for all bits of register 0x15
      media: i2c: max9286: Configure remote I2C speed from device tree
      media: i2c: max9286: Configure bus width from device tree
      media: i2c: max9286: Select HS as data enable signal
      media: i2c: max9286: Print power-up GMSL link configuration

Thomas Nizan (1):
      media: i2c: max9286: Add support for port regulators

 .../bindings/media/i2c/maxim,max9286.yaml          |  51 ++-
 drivers/media/i2c/max9286.c                        | 462 +++++++++++++++++----
 2 files changed, 427 insertions(+), 86 deletions(-)

-- 
Regards,

Laurent Pinchart
