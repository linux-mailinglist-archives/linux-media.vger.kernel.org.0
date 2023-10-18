Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1374A7CD398
	for <lists+linux-media@lfdr.de>; Wed, 18 Oct 2023 07:42:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229585AbjJRFm1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Oct 2023 01:42:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229575AbjJRFm0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Oct 2023 01:42:26 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EA4BBA
        for <linux-media@vger.kernel.org>; Tue, 17 Oct 2023 22:42:25 -0700 (PDT)
Received: from umang.jainideasonboard.com (unknown [103.251.226.39])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1FC74741;
        Wed, 18 Oct 2023 07:42:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1697607736;
        bh=/EyFN8/bdjJajsbpQvuQvWRlcHT4qLY5CfmEYT+KqDE=;
        h=From:To:Cc:Subject:Date:From;
        b=NebgRnPZGBTnECnRTLYVfNLbS28w9JH0QDAeQ+uCctDWy6lCeGq8sUr80a7S+/2K0
         cqoTO4og0RKPfFqj2L1TMQat12P3BTPzNJi38v7dNAuNYO4DAOFPfIIRAXpdpCU0ne
         vr/0q5U9rTydxgnKggvLi0CNcP24+xmmfqGd/Mo4=
From:   Umang Jain <umang.jain@ideasonboard.com>
To:     linux-staging@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        linux-rpi-kernel@lists.infradead.org, linux-media@vger.kernel.org
Cc:     Stefan Wahren <stefan.wahren@i2se.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dan Carpenter <error27@gmail.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Umang Jain <umang.jain@ideasonboard.com>
Subject: [PATCH v2 0/3] vc04_services: Tweak module autoloading support
Date:   Wed, 18 Oct 2023 11:12:11 +0530
Message-Id: <20231018054214.824296-1-umang.jain@ideasonboard.com>
X-Mailer: git-send-email 2.40.1
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

As explained by Greg KH in [1], we should not be using MODULE_ALIAS
to auto load modules within VC04. Drop that, in favour of
MODULE_DEVICE_TABLE. This series addresses the suggestion.

Patch 1/3 adds vchiq_bus_device_id and supporting entries in 
script/mod/file2alias.c

Patch 2/3 drops MODULE_ALIAS from bcm2835-audio in favour
of MODULE_DEVICE_TABLE.

Patch 3/3 drops MODULE_ALIAS from bcm2835-camera in favour
of MODULE_DEVICE_TABLE.

[1]:  https://lore.kernel.org/linux-media/2023100955-stunt-equate-c6fa@gregkh/

--
Changes in v2: 
- NULL terminate device_id_table arrays (in 2/3 and 3/3)

Umang Jain (3):
  staging: vc04_services: Support module autoloading using
    MODULE_DEVICE_TABLE
  staging: vc04_services: bcm2835-audio: Drop MODULE_ALIAS
  staging: vc04_services: bcm2835-camera: Drop MODULE_ALIAS

 drivers/staging/vc04_services/bcm2835-audio/bcm2835.c    | 8 +++++++-
 .../vc04_services/bcm2835-camera/bcm2835-camera.c        | 8 +++++++-
 .../vc04_services/interface/vchiq_arm/vchiq_bus.c        | 2 +-
 .../vc04_services/interface/vchiq_arm/vchiq_bus.h        | 3 +++
 include/linux/mod_devicetable.h                          | 4 ++++
 scripts/mod/devicetable-offsets.c                        | 3 +++
 scripts/mod/file2alias.c                                 | 9 +++++++++
 7 files changed, 34 insertions(+), 3 deletions(-)


base-commit: a2fc3e8215313c8e4e42d4b2062830aaf1ef49c0
-- 
2.40.1

