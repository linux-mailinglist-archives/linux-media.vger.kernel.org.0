Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7CF9B7E5AF8
	for <lists+linux-media@lfdr.de>; Wed,  8 Nov 2023 17:17:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229989AbjKHQRY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Nov 2023 11:17:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229720AbjKHQRX (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Nov 2023 11:17:23 -0500
Received: from gofer.mess.org (gofer.mess.org [IPv6:2a02:8011:d000:212::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE7E21733
        for <linux-media@vger.kernel.org>; Wed,  8 Nov 2023 08:17:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
        t=1699460239; bh=faVqNoxnNTUx8UHA3r0to74ei8YCNKKxwUhDVxyiz4I=;
        h=Date:From:To:Subject:From;
        b=J3hxFFneDutgw38mK1tupkajwf+9jZgcdrzurweSN7B124M2+yZWN4o6wf7yKzHv1
         YXPOHJVbZLNqA959ev9wjqSnAuIg6gKkaFwQXnn06qHYnXOM5A0rA9F8RDlNIVB0Zt
         ZJ4vgRvmHAGeYgURKEKArVwLgAbDqeu2W++7ducaS/g3xry+fPoMZRq96YPAYesvbs
         Pq2BFMxqY2LzAi+xQ9h/iy4T+uNcD85WYKyMoPSWohk/ejKeI3FagFHzW9z0jjvMvI
         RGSIwlw2MSnXouNCq7FBNUYQF3lWgV5BWlNPduvwNleXcMxRlL7H3CWVMKFqf7YLDf
         bYSOdeEpeeWLg==
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 39C871000CE; Wed,  8 Nov 2023 16:17:19 +0000 (GMT)
Date:   Wed, 8 Nov 2023 16:17:19 +0000
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL FOR v6.8] rc fixes
Message-ID: <ZUu0j4cGpFRPlB-C@gofer.mess.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit 3e238417254bfdcc23fe207780b59cbb08656762:

  media: nuvoton: VIDEO_NPCM_VCD_ECE should depend on ARCH_NPCM (2023-10-27 11:44:19 +0200)

are available in the Git repository at:

  git://linuxtv.org/syoung/media_tree.git tags/v6.8a

for you to fetch changes up to 490b33ac01109d2081a0ea188d64c5ea6e7b2ea4:

  media: meson-ir-tx: Drop usage of platform_driver_probe() (2023-11-08 15:55:02 +0000)

----------------------------------------------------------------
v6.8a

----------------------------------------------------------------
Rob Herring (1):
      media: ir-hix5hd2: Use device_get_match_data()

Uwe Kleine-König (3):
      media: meson-ir-tx: Convert to use devm_rc_register_device()
      media: meson-ir-tx: Simplify and improve using dev_err_probe()
      media: meson-ir-tx: Drop usage of platform_driver_probe()

 drivers/media/rc/ir-hix5hd2.c  | 10 +++++-----
 drivers/media/rc/meson-ir-tx.c | 34 ++++++++++------------------------
 2 files changed, 15 insertions(+), 29 deletions(-)
