Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7B22E7CCDB6
	for <lists+linux-media@lfdr.de>; Tue, 17 Oct 2023 22:16:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235204AbjJQUQx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 Oct 2023 16:16:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235205AbjJQUQl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 Oct 2023 16:16:41 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CDC449E3
        for <linux-media@vger.kernel.org>; Tue, 17 Oct 2023 13:05:56 -0700 (PDT)
Received: from umang.jainideasonboard.com (unknown [103.251.226.39])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7281B291;
        Tue, 17 Oct 2023 22:05:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1697573118;
        bh=fSTwgeBv4Z3p87X/FYECfDVA2ALKAroeIFkV1pa1/fk=;
        h=From:To:Cc:Subject:Date:From;
        b=lKXbdFFyAt5QbanJcsYoeihxc4u3NgUBVpdleZF1zaqsDrRLUj08VufyD7kEf3gTP
         Is2ssPPEPHQc2XYrbyl0aSr89/aNii3rUKWo5MC4cYxiHyaqaycGNwYeF3wr6KuTtO
         9Y6DpW829fNGjuweNoFecp1MJf08YQ+ridGMkZ/s=
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
Subject: [PATCH 0/3] vc04_services: Tweak module autoloading support
Date:   Wed, 18 Oct 2023 01:35:08 +0530
Message-Id: <20231017200511.678223-1-umang.jain@ideasonboard.com>
X-Mailer: git-send-email 2.40.1
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

Umang Jain (3):
  staging: vc04_services: Support module autoloading using
    MODULE_DEVICE_TABLE
  staging: vc04_services: bcm2835-audio: Drop MODULE_ALIAS
  staging: vc04_services: bcm2835-camera: Drop MODULE_ALIAS

 drivers/staging/vc04_services/bcm2835-audio/bcm2835.c    | 7 ++++++-
 .../vc04_services/bcm2835-camera/bcm2835-camera.c        | 7 ++++++-
 .../vc04_services/interface/vchiq_arm/vchiq_bus.c        | 2 +-
 .../vc04_services/interface/vchiq_arm/vchiq_bus.h        | 3 +++
 include/linux/mod_devicetable.h                          | 4 ++++
 scripts/mod/devicetable-offsets.c                        | 3 +++
 scripts/mod/file2alias.c                                 | 9 +++++++++
 7 files changed, 32 insertions(+), 3 deletions(-)

-- 
2.40.1

