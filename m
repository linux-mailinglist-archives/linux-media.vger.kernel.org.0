Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D6C3D59F38E
	for <lists+linux-media@lfdr.de>; Wed, 24 Aug 2022 08:20:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233207AbiHXGUx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Aug 2022 02:20:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234965AbiHXGUv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Aug 2022 02:20:51 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4DE8A45073
        for <linux-media@vger.kernel.org>; Tue, 23 Aug 2022 23:20:49 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C1D8661263
        for <linux-media@vger.kernel.org>; Wed, 24 Aug 2022 06:20:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9CFDC433D6;
        Wed, 24 Aug 2022 06:20:47 +0000 (UTC)
Message-ID: <5f75da7d-9f11-8467-f983-1e9062c17019@xs4all.nl>
Date:   Wed, 24 Aug 2022 08:20:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
To:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Cc:     Mats Randgaard <matrandg@cisco.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH] MAINTAINERS: change tc358743 maintainer
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Move maintainer from Mats to Hans.

Add bindings file to the list of maintained files while we're at it.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
diff --git a/MAINTAINERS b/MAINTAINERS
index 8a5012ba6ff9..e514c688e470 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20560,11 +20560,12 @@ F:	include/linux/toshiba.h
 F:	include/uapi/linux/toshiba.h
 
 TOSHIBA TC358743 DRIVER
-M:	Mats Randgaard <matrandg@cisco.com>
+M:	Hans Verkuil <hverkuil-cisco@xs4all.nl>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	drivers/media/i2c/tc358743*
 F:	include/media/i2c/tc358743.h
+F:	Documentation/devicetree/bindings/media/i2c/tc358743.txt
 
 TOSHIBA WMI HOTKEYS DRIVER
 M:	Azael Avalos <coproscefalo@gmail.com>
