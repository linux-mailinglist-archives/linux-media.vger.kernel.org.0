Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4976E7D616D
	for <lists+linux-media@lfdr.de>; Wed, 25 Oct 2023 08:07:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231254AbjJYGHb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Oct 2023 02:07:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229583AbjJYGHa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Oct 2023 02:07:30 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E3699D
        for <linux-media@vger.kernel.org>; Tue, 24 Oct 2023 23:07:27 -0700 (PDT)
Received: from umang.jain (unknown [103.251.226.9])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5BCBA669;
        Wed, 25 Oct 2023 08:07:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1698214032;
        bh=6N7Z7hgd1/Qg61kV5UAnFtn2rr4bYNmxCxexbxy7XdM=;
        h=From:To:Cc:Subject:Date:From;
        b=cwMIhnm84IHVNFWeqWKz+cu8OGXMCEeq0sDy8OBzZulgqtVJyt74a9tkB0S3vzTzM
         9vD7PS1A2BhigtH5HUPKSEVRr+ijlFif8hS9y0p/VCL8pJfC6lmY7vvpGNcC3e/eWg
         fZtWOLB+S/rnydDeIvNaD2qV9J5c6xc6aHPwyztY=
From:   Umang Jain <umang.jain@ideasonboard.com>
To:     linux-staging@lists.linux.dev,
        linux-rpi-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Cc:     Stefan Wahren <stefan.wahren@i2se.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dan Carpenter <error27@gmail.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        "Ricardo B . Marliere" <ricardo@marliere.net>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Umang Jain <umang.jain@ideasonboard.com>
Subject: [PATCH 0/1] staging: vc04_services: Use %p4cc to print fourcc
Date:   Wed, 25 Oct 2023 02:07:16 -0400
Message-ID: <20231025060717.71895-1-umang.jain@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following patch drop VCHIQ_FOURCC_AS_4CHARS macro in favour of %p4cc
format modifier to print FourCC codes in the logs.

*Before this patch*
`mailbox: vchiq_core_msg debug: Sent Msg DATA(5) to AUDS s:1 d:62 len:20`

*After this patch*
bcm2835_vchiq 3f00b840.mailbox: vchiq_core_msg debug: Sent Msg DATA(5) to SDUA little-endian (0x41554453) s:1 d:62 len:20

The inversion of AUDS to SDUA as per usage of %p4cc
Does it hamper readability ? Feedback is appreciated.

As documented in the commit message, the 'entity' char array length is
increased to hold more characters for the log output. Not doing so,
causes kernel stack corruption at runtime.

Based on top of:
- [PATCH v2 0/8] staging: vc04: Drop custom logging based on printk

Umang Jain (1):
  staging: vc04_services: Use %p4cc format modifier to print FourCC
    codes

 .../interface/vchiq_arm/vchiq_arm.c           | 20 +++++-----
 .../interface/vchiq_arm/vchiq_core.c          | 40 +++++++++----------
 .../interface/vchiq_arm/vchiq_core.h          |  6 ---
 .../interface/vchiq_arm/vchiq_dev.c           |  7 ++--
 4 files changed, 33 insertions(+), 40 deletions(-)

-- 
2.41.0

