Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 517617B30E5
	for <lists+linux-media@lfdr.de>; Fri, 29 Sep 2023 12:54:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233014AbjI2Kyy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 29 Sep 2023 06:54:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233003AbjI2Kyx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 29 Sep 2023 06:54:53 -0400
Received: from meesny.iki.fi (meesny.iki.fi [IPv6:2001:67c:2b0:1c1::201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19FC911F
        for <linux-media@vger.kernel.org>; Fri, 29 Sep 2023 03:54:51 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (82-181-192-243.bb.dnainternet.fi [82.181.192.243])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by meesny.iki.fi (Postfix) with ESMTPSA id 4RxnL06blRzyYm
        for <linux-media@vger.kernel.org>; Fri, 29 Sep 2023 13:54:48 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
        t=1695984889;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type;
        bh=MpWXLsK9Os4mS7vUWAZgWVRHkH/WgS9ynNCb3S6JHjM=;
        b=zFvHjybzpiwakqfArJCg6/8CxHOFID1/BJ9QPPfBzMOFUXVwHcD2JBaV91j1v2rZ3GsH4m
        0x71r1gw8oOH1TrRthCaIh7Gk48bCUi3HXTkzFH2EF0NplUxuPcvPfL1k7iAeU3vdSAI4R
        e9HKXiOBTTRAPBt77fLV+1ycvT8HXfc=
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1695984889; a=rsa-sha256; cv=none;
        b=nz8MeTvDB+tUiw5c0OnUsP8EJTUf9PzaPwiz+tcw5LNbwyicIob57VmoS5RThpwJxNJKu+
        FJ/WYuU+zhKZy0mDXmX3tlnAzichSH13P2cA6HhPnnU3v2grgBJe27BMLRTbT7HWWrkiB9
        A5QyTElVwqm+lj7KNutK2Va7QHRtxRk=
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=meesny; t=1695984889;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type;
        bh=MpWXLsK9Os4mS7vUWAZgWVRHkH/WgS9ynNCb3S6JHjM=;
        b=darL9JyJB0fNSp9uRNxKtyorNWKVuqKGJZ4qTLrXfqdxMTX4EcDRjHPsCNXOwCuB/S7/CC
        /c7za7ZnjKXtBFp1XL+RLkDwuo8j3fux1EWDxAnPa3xydxbXpAKNk5ugJ3Jn0ZIWKuNSua
        n00Mxn6RdJHBmUpKJB1qVGcg8oryvX8=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 3C906634C93
        for <linux-media@vger.kernel.org>; Fri, 29 Sep 2023 13:54:48 +0300 (EEST)
Date:   Fri, 29 Sep 2023 10:54:48 +0000
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     linux-media@vger.kernel.org
Subject: [GIT FIXES v2 FOR 6.6] Various fixes, including for Kconfig
Message-ID: <ZRas+EVecmwdH8+b@valkosipuli.retiisi.eu>
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

since v1:

- Fix Fixes: tag in the ivsc patch.

- Add the tegra-video patch.

Please pull.


The following changes since commit 263cb0cc5abac7c22a6c0dfa7e50e89d8e6c6900:

  media: imx-mipi-csis: Remove an incorrect fwnode_handle_put() call (2023-09-19 09:03:21 +0200)

are available in the Git repository at:

  git://linuxtv.org/sailus/media_tree.git tags/fixes-6.6-2.3-signed

for you to fetch changes up to ad85af4f94d7d527fc43e0291b492fd02cc8f0de:

  staging: media: tegra-video: fix infinite recursion regression (2023-09-29 12:17:53 +0300)

----------------------------------------------------------------
V4L2 fixes for 6.6

----------------------------------------------------------------
Arnd Bergmann (1):
      media: pci: intel: ivsc: select V4L2_FWNODE

Christophe JAILLET (1):
      media: pxa_camera: Fix an error handling path in pxa_camera_probe()

Luca Ceresoli (1):
      staging: media: tegra-video: fix infinite recursion regression

Sakari Ailus (1):
      media: ipu-bridge: Fix Kconfig dependencies

 drivers/media/pci/intel/Kconfig           | 20 ++++++++++++++------
 drivers/media/pci/intel/ipu3/Kconfig      | 21 +--------------------
 drivers/media/pci/intel/ivsc/Kconfig      |  2 +-
 drivers/media/platform/intel/pxa_camera.c |  2 +-
 drivers/staging/media/atomisp/Kconfig     |  2 +-
 drivers/staging/media/tegra-video/vi.c    | 16 ++++++++++------
 6 files changed, 28 insertions(+), 35 deletions(-)

-- 
Sakari Ailus
