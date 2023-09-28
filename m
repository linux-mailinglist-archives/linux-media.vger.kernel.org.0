Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 905437B1CF4
	for <lists+linux-media@lfdr.de>; Thu, 28 Sep 2023 14:51:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232063AbjI1MvL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 28 Sep 2023 08:51:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231293AbjI1MvL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 28 Sep 2023 08:51:11 -0400
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86C1B180
        for <linux-media@vger.kernel.org>; Thu, 28 Sep 2023 05:51:06 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (82-181-192-243.bb.dnainternet.fi [82.181.192.243])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by meesny.iki.fi (Postfix) with ESMTPSA id 4RxCyb672qzyYH
        for <linux-media@vger.kernel.org>; Thu, 28 Sep 2023 15:51:01 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
        t=1695905464;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type;
        bh=OP1wzksXNlqnVzV7BpMS4bqKQTs1dPv/UgLelppBR2I=;
        b=jsAexNiE6BGiab4rvKZ8NkGWuknrdNOMvfosIVvppFemtwLQWXC38W+5QYG4L7bUtQcIrA
        WxshIS1cFDqFthkiWg0M3AContE68VcUiUoeRSBjW8Mp5cZV5MTjuEZfyWDLFuvngyRAM8
        +VG8rz3SdGn37I7wdVY4fg62kCIZm3Y=
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1695905464; a=rsa-sha256; cv=none;
        b=YXk1fIb9PAlGejp3np1OuQ/MABY9FGTfBbYCEQctWITuFdUzfnLMk08acFg4VDPFfJSVM8
        eurSk9RtOrKsqMLLuE0IMwX1FNFsf5C0u/zGd4JG0WTJdGm4tMAnSKybuikeFylsbMLT4s
        BisI7PkPj/eyqaaFiGJVxyXQVcL6MFg=
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=meesny; t=1695905464;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type;
        bh=OP1wzksXNlqnVzV7BpMS4bqKQTs1dPv/UgLelppBR2I=;
        b=lYuSiQPWU8Zao80zxGA8810W2fsRCECdnM81u/cNDs1oqH4vqRFU8ZtaNiFwpHzqX7r5HK
        LERsah4HdVNVzaEhFmrHdu4cymd70LRb5hG9d17oPxV1M5S0DiAlthaUZQvfk+vp+ktSFq
        aQgr2AJ3gNic3ENgXIZLRR6sbwnYlwg=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 76B28634C93
        for <linux-media@vger.kernel.org>; Thu, 28 Sep 2023 15:51:01 +0300 (EEST)
Date:   Thu, 28 Sep 2023 12:51:01 +0000
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     linux-media@vger.kernel.org
Subject: [GIT FIXES FOR 6.6] Various fixes, including for Kconfig
Message-ID: <ZRV2tQ46b6S26zJI@valkosipuli.retiisi.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro, Hans,

Here are a couple of fixes for 6.6, two of which fix Kconfig dependency
issues that lead to build failures.

Please pull.


The following changes since commit 263cb0cc5abac7c22a6c0dfa7e50e89d8e6c6900:

  media: imx-mipi-csis: Remove an incorrect fwnode_handle_put() call (2023-09-19 09:03:21 +0200)

are available in the Git repository at:

  git://linuxtv.org/sailus/media_tree.git tags/fixes-6.6-2-signed

for you to fetch changes up to 8c721c2a27606946eef3bf0eec9c310cf1b32ec2:

  media: pci: intel: ivsc: select V4L2_FWNODE (2023-09-27 15:01:36 +0300)

----------------------------------------------------------------
V4L2 fixes for 6.6

----------------------------------------------------------------
Arnd Bergmann (1):
      media: pci: intel: ivsc: select V4L2_FWNODE

Christophe JAILLET (1):
      media: pxa_camera: Fix an error handling path in pxa_camera_probe()

Sakari Ailus (1):
      media: ipu-bridge: Fix Kconfig dependencies

 drivers/media/pci/intel/Kconfig           | 20 ++++++++++++++------
 drivers/media/pci/intel/ipu3/Kconfig      | 21 +--------------------
 drivers/media/pci/intel/ivsc/Kconfig      |  2 +-
 drivers/media/platform/intel/pxa_camera.c |  2 +-
 drivers/staging/media/atomisp/Kconfig     |  2 +-
 5 files changed, 18 insertions(+), 29 deletions(-)

-- 
Sakari Ailus
