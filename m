Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5A6247C541E
	for <lists+linux-media@lfdr.de>; Wed, 11 Oct 2023 14:38:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232201AbjJKMiB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Oct 2023 08:38:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232306AbjJKMh6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Oct 2023 08:37:58 -0400
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADF1A93
        for <linux-media@vger.kernel.org>; Wed, 11 Oct 2023 05:37:56 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (185-9-11-240.cust.suomicom.net [185.9.11.240])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4S5C3Q5cltz49Q1p
        for <linux-media@vger.kernel.org>; Wed, 11 Oct 2023 15:37:50 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
        t=1697027874;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type;
        bh=q2DqbEnbpMP3gwC+iDiBOXrjG1DveNBhViHJF7OfnSE=;
        b=hPmY8AJDYJhP2RDE2aBH9VKkAVBQkiWoJ4r3pvbc8mRl/Qs2H57uudv2Gxb48Yacy5h8Gr
        85fWF1vcIYPvieU1Oct6RxyDiK8OS8TqQcPjS26lhdWvD59PU+jZ3pzdcw2CKpn9j+uB/O
        1x3FsrqyWkFt4V5vqGOWgR5JFZU+wknhFfOUsc4KTqq+RZbdICdEkUiXnvBOu360AKp3PV
        29eDINrZwT65BrrYGNFE7ONKlcaAPUNT/K/NPirE/wfH1CKNjN9cWcg6tZVqEPf1g1UEIZ
        DCGXDZ2Y4uJHBDOfPMxQ/NqvT4V9aTDg7NDkJLGIi10VO2QUcqwvOWdgUbco0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=lahtoruutu; t=1697027874;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type;
        bh=q2DqbEnbpMP3gwC+iDiBOXrjG1DveNBhViHJF7OfnSE=;
        b=Kh51+xdCwn9i9aqui9z517kiQbxcpPh/B2jxY2cD2ONK/RaaFHnhmHhpH3dupZATtFZW2u
        XPpczs+houu49AeiJGR1F9fiR0Q0A17iA7OI7PnpJ7rO1I8Tf4rWcGd53hT/Lsqhxrj9cp
        hxyLKntaR75fTRaXja3ZenipfOU+NP41hwFK2f8ii9cEP3gd97PQnpwirdAYPXq9L+X41v
        rX+GJGbysZGULUEttT2x1+0WeTMTAYtD5WbxgFQA5NmKjDs6QJZAVEtXm0r5z00EZWrSji
        6759PBHI9o+ua1iTwXg2mOJ8OgTQQai4EqdYjnLWFzwc0jNg2ggWdJ9qJKV68A==
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1697027874; a=rsa-sha256;
        cv=none;
        b=UCJp2uFQqBpB7IhMedJHah7UCZF7FllYdY279cdwXPZq1SIByrdrn4suM268Cn2cHy9Nim
        4dcXe3pb+R6/l5avsAmCzHEGLEW8aRM0T8PMBJczTZaQQgVncOqWn6IUpQo8+jkjMB5eqG
        I/33UFvb6EywMNcArzWzm41fbqagJQCl8iN49AG9UV/DsTkVMK1Sl40D2e+lgsBA68VGLe
        c+GIT07wsuAfCLrN2FqQonUmJODJTqI4AMNxYNkHDX5LpD2lqLz6Y6z3kkvG/yKYjRbTqS
        rh24MvmMtPIj3f+7qsHK/giYKhLxXbdEy2hpN/TXNeLRtP929zcgFvrLuEG5rQ==
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id AD577634CA9
        for <linux-media@vger.kernel.org>; Wed, 11 Oct 2023 15:37:50 +0300 (EEST)
Date:   Wed, 11 Oct 2023 12:37:50 +0000
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     linux-media@vger.kernel.org
Subject: [GIT FIXES v2 FOR 6.6] Ipu-bridge and xilinx-vipp fixes
Message-ID: <ZSaXHvPEvahtaw/N@valkosipuli.retiisi.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro, Hans,

Here are a few patches to address issues in patches merged for 6.6.

Please pull.


since v1:

- Include Ondrej's ov8856 fix.


The following changes since commit 1146bec0ca34375f963f79f5c4e6b49ed5386aaa:

  media: mediatek: vcodec: Fix encoder access NULL pointer (2023-10-05 11:34:29 +0200)

are available in the Git repository at:

  git://linuxtv.org/sailus/media_tree.git tags/fixes-6.6-3.1-signed

for you to fetch changes up to 1bc2cf4bef1215aa28519807dc1bcf1dce28dad8:

  media: i2c: ov8858: Don't set fwnode in the driver (2023-10-11 15:34:45 +0300)

----------------------------------------------------------------
V4L2 fixes fro 6.6

----------------------------------------------------------------
Geert Uytterhoeven (1):
      media: ipu-bridge: Add missing acpi_dev_put() in ipu_bridge_get_ivsc_acpi_dev()

Ondrej Jirman (1):
      media: i2c: ov8858: Don't set fwnode in the driver

Sakari Ailus (1):
      media: xilinx-vipp: Look for entities also in waiting_list

 drivers/media/i2c/ov8858.c                  | 10 ++--------
 drivers/media/pci/intel/ipu-bridge.c        |  4 +++-
 drivers/media/platform/xilinx/xilinx-vipp.c | 17 ++++++++++++-----
 3 files changed, 17 insertions(+), 14 deletions(-)

-- 
Sakari Ailus
