Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6D8B77E4668
	for <lists+linux-media@lfdr.de>; Tue,  7 Nov 2023 17:55:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234910AbjKGQzj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Nov 2023 11:55:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234562AbjKGQzi (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 Nov 2023 11:55:38 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D49995
        for <linux-media@vger.kernel.org>; Tue,  7 Nov 2023 08:55:35 -0800 (PST)
Received: from umang.jain (unknown [103.251.226.96])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id BA6C6552;
        Tue,  7 Nov 2023 17:55:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1699376111;
        bh=fZdOsLuOsy4l3gpxjmBOY1RfLY8nQistmx8GqH4SDdM=;
        h=From:To:Cc:Subject:Date:From;
        b=QHb/qcPZp5UgTZdUC69scZdyVDuUyyjlZEcYsji+2vqOyOvumb1oI2/kwje+DCtbh
         hytaUzumG67USOAslUpSCUMIZllz7oKX0D2IwrbZwUSGIVJvtnDeUfkNUMKtsgqyL0
         b4id0MGBTcFxoX6zkj9WaO8d52/scDNpYGeUOt2Y=
From:   Umang Jain <umang.jain@ideasonboard.com>
To:     linux-staging@lists.linux.dev,
        linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Cc:     Stefan Wahren <stefan.wahren@i2se.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dan Carpenter <error27@gmail.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Phil Elwell <phil@raspberrypi.com>,
        "Ricardo B . Marliere" <ricardo@marliere.net>,
        Umang Jain <umang.jain@ideasonboard.com>
Subject: [PATCH 0/2] staging: vc04_services: Use %p to log pointer
Date:   Tue,  7 Nov 2023 11:55:21 -0500
Message-ID: <20231107165523.638555-1-umang.jain@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

%lx is used to print the unmodified pointer address for debugging.
%p will print the hashed pointer address to avoid leaking information
about kernel memory layout to userspace. But when `no_hash_pointers`
is passed as kernel parameter, unmodified pointer address will be
printed.

Hence, drop %lx in favour of %p. For debugging purposes, one can
easily depend on `no_hash_pointers`.

This also solves the following smatch warnings:
service_callback() warn: argument 7 to %lx specifier is cast from pointer
service_callback() warn: argument 11 to %lx specifier is cast from pointer
service_callback() warn: argument 12 to %lx specifier is cast from pointer
service_callback() warn: argument 13 to %lx specifier is cast from pointer
vchiq_release() warn: argument 7 to %lx specifier is cast from pointer

Umang Jain (2):
  staging: vc04_services: Use %p to log pointer address
  staging: vc04_services: Use %p to log pointer address

 .../staging/vc04_services/interface/vchiq_arm/vchiq_arm.c  | 7 +++----
 .../staging/vc04_services/interface/vchiq_arm/vchiq_dev.c  | 4 ++--
 2 files changed, 5 insertions(+), 6 deletions(-)

-- 
2.41.0

