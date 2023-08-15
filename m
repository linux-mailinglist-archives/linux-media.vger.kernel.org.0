Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 985A877C8B1
	for <lists+linux-media@lfdr.de>; Tue, 15 Aug 2023 09:42:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235313AbjHOHlz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Aug 2023 03:41:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233691AbjHOHlq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Aug 2023 03:41:46 -0400
Received: from meesny.iki.fi (meesny.iki.fi [IPv6:2001:67c:2b0:1c1::201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51EC010F9
        for <linux-media@vger.kernel.org>; Tue, 15 Aug 2023 00:41:45 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (82-181-192-243.bb.dnainternet.fi [82.181.192.243])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by meesny.iki.fi (Postfix) with ESMTPSA id 4RQ39y0JjmzyTh
        for <linux-media@vger.kernel.org>; Tue, 15 Aug 2023 10:41:40 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
        t=1692085302;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type;
        bh=b+3nVLLRudd3M33lNpuI3CgiW6PRXWAaZzbF3lAVudY=;
        b=Lk6COui/Fi0xud/ATDjvkSbFBKIG8Aq3qeiQIAzlStxmwpivZAe7GRiFcDKuNeLePiBWMY
        eTiwwL09VsokqBeE9EtC2Lew7PLKu4Mt6FRxoXHgrn0ozI/j9evLRE+PkxEdOBf6zfQTXD
        MS7antficJob7vu6iVFxDKOymnGiNMc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=meesny; t=1692085302;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type;
        bh=b+3nVLLRudd3M33lNpuI3CgiW6PRXWAaZzbF3lAVudY=;
        b=F74in0xJkAETJSFte5PcqmxEniwF977tX4JeVQmNhfhBqoikH2A2l2GEjUXyNixzZ4p1Xu
        3zsWnfFjz0zH99ZCvTuX5v0gs7oMvAwUIdZruSUqW+sx8aB8CuLMf4pU9fLfuEWplECnTc
        cn9TES5ctoliF4Etrrc4xcsozj7fmtk=
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1692085302; a=rsa-sha256; cv=none;
        b=iOFXgay2MZU7dqGK1/PejOw6bk0hoRWLJTCauT5hYzbEv1ii5oV/9DvpKGLJO3cjxnwop6
        IFnzoOokpocO+N52VYWt9I0f4/Lx/PqGwZ5gg0D7wlcpvvJkef9aZfXadigdhi7toR4+ke
        CIndUiVPveETZRVC6xkIwSiu79Dkg7Y=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 8ED38634C95
        for <linux-media@vger.kernel.org>; Tue, 15 Aug 2023 10:41:39 +0300 (EEST)
Date:   Tue, 15 Aug 2023 07:41:39 +0000
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL FOR 6.6] V4L2 fixes
Message-ID: <ZNssM3RD0j9eMVZn@valkosipuli.retiisi.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

Here's a number of miscellaneous fixes for 6.6. In particular, ipu3-imgu,
imx219, ov5640 and ov13b10 drivers have functional fixes.

Please pull.


The following changes since commit b7ec3212a73abc987e8f33aa42988e6c39c38c92:

  media: bttv: convert to vb2 (2023-08-14 20:27:59 +0200)

are available in the Git repository at:

  git://linuxtv.org/sailus/media_tree.git tags/for-6.6-3.1-signed

for you to fetch changes up to 1c21b0662547f6548056d0350bbd12570512106d:

  media: i2c: imx219: Fix crop rectangle setting when changing format (2023-08-15 10:37:52 +0300)

----------------------------------------------------------------
V4L2 fixes for 6.6

----------------------------------------------------------------
Dan Carpenter (1):
      media: ov13b10: Fix some error checking in probe

Guoniu.zhou (1):
      media: ov5640: fix vblank unchange issue when work at dvp mode

Jean-Michel Hautbois (1):
      media: staging: ipu3-imgu: Initialise height_per_slice in the stripes

Laurent Pinchart (2):
      media: i2c: imx219: Fix a typo referring to a wrong variable
      media: i2c: imx219: Fix crop rectangle setting when changing format

Mikhail Rudenko (1):
      MAINTAINERS: fix file path for Omnvision OV4689

Sakari Ailus (1):
      media: ivsc: Improve Kconfig help text

Tommaso Merciai (1):
      media: dt-bindings: ov5693: fix maintainer email address

 .../devicetree/bindings/media/i2c/ovti,ov5693.yaml |  2 +-
 MAINTAINERS                                        |  2 +-
 drivers/media/i2c/imx219.c                         | 13 ++++---
 drivers/media/i2c/ov13b10.c                        |  2 +-
 drivers/media/i2c/ov5640.c                         | 19 +++++++---
 drivers/media/pci/intel/ivsc/Kconfig               | 12 ++++--
 drivers/staging/media/ipu3/ipu3-css-params.c       | 44 +++++++++++-----------
 7 files changed, 55 insertions(+), 39 deletions(-)

-- 
Kind regards,

Sakari Ailus
