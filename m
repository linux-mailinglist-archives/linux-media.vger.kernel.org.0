Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EFC877C535D
	for <lists+linux-media@lfdr.de>; Wed, 11 Oct 2023 14:14:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234943AbjJKMO4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Oct 2023 08:14:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234944AbjJKMOv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Oct 2023 08:14:51 -0400
Received: from meesny.iki.fi (meesny.iki.fi [IPv6:2001:67c:2b0:1c1::201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D359649EF
        for <linux-media@vger.kernel.org>; Wed, 11 Oct 2023 05:13:37 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (185-9-11-240.cust.suomicom.net [185.9.11.240])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by meesny.iki.fi (Postfix) with ESMTPSA id 4S5BWH1f0TzyTl
        for <linux-media@vger.kernel.org>; Wed, 11 Oct 2023 15:13:28 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
        t=1697026411;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type;
        bh=r2sQY8Kv3huOAbNb6huX6brBXpAZxX9mbmv0VGuqnt4=;
        b=CZmSGXfeMxtmm0Hz78aM/rHk5j8P+pvKr5QBDUQPufVRGlM+PEeZ+xTpqapIobI+9quwT2
        hom7hKKEj3ZI7DybkRaf2QUwt79ALGT5Z0H/+HBS0MNEA5TIJ91ZD3A+nl5BQmVoqd6aja
        mcPm+NAg7iJrU51MLDLUzD2xFc4VeUE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=meesny; t=1697026411;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type;
        bh=r2sQY8Kv3huOAbNb6huX6brBXpAZxX9mbmv0VGuqnt4=;
        b=I7fGpNatPWg7dQeyZKDh08obOOEmgyr5sKDvCjOBUZ1XcqxQ3L9Tw1QMQdzFUWoDRl2w0W
        qU3SMhZyDcF23DShrp3JyFwDMF8R4L+CxwUY9Uak5hHTJJuISJVgf8xgCYwDAfZT43WfTF
        MXDYLfATA1QX5EJqa8QpLoKmheGLI8s=
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1697026411; a=rsa-sha256; cv=none;
        b=YPp/kzb76E+uv+NPt+RsGExXbdP/HwNbm05xUDCoJu+LbTSza9RKbqsC3yjE+srpNGMv7r
        7nDF5hW5goeItwImsDT5PARAoMvn4GpnoP7t5HARArXjz4xl+OCMEhxPa0k7UPPBkKom8X
        hkGZyphrJrPYaDw3bnf2sOBGC8XrMlc=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 3B5C2634CA9
        for <linux-media@vger.kernel.org>; Wed, 11 Oct 2023 15:13:28 +0300 (EEST)
Date:   Wed, 11 Oct 2023 12:13:28 +0000
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     linux-media@vger.kernel.org
Subject: [GIT FIXES FOR 6.6] Ipu-bridge and xilinx-vipp fixes
Message-ID: <ZSaRaJfl5ZE3mqgy@valkosipuli.retiisi.eu>
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


The following changes since commit 1146bec0ca34375f963f79f5c4e6b49ed5386aaa:

  media: mediatek: vcodec: Fix encoder access NULL pointer (2023-10-05 11:34:29 +0200)

are available in the Git repository at:

  git://linuxtv.org/sailus/media_tree.git tags/fixes-6.6-3-signed

for you to fetch changes up to 9bc4f0ec61c79d760b31bd0e49f15c22e4456f1e:

  media: ipu-bridge: Add missing acpi_dev_put() in ipu_bridge_get_ivsc_acpi_dev() (2023-10-10 16:19:45 +0300)

----------------------------------------------------------------
V4L2 fixes for 6.6

----------------------------------------------------------------
Geert Uytterhoeven (1):
      media: ipu-bridge: Add missing acpi_dev_put() in ipu_bridge_get_ivsc_acpi_dev()

Sakari Ailus (1):
      media: xilinx-vipp: Look for entities also in waiting_list

 drivers/media/pci/intel/ipu-bridge.c        |  4 +++-
 drivers/media/platform/xilinx/xilinx-vipp.c | 17 ++++++++++++-----
 2 files changed, 15 insertions(+), 6 deletions(-)

-- 
Sakari Ailus
