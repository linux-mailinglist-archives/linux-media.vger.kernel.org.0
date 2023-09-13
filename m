Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F31C079E59D
	for <lists+linux-media@lfdr.de>; Wed, 13 Sep 2023 13:01:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239876AbjIMLBd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 Sep 2023 07:01:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239875AbjIMLBc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 Sep 2023 07:01:32 -0400
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A8BD19AF
        for <linux-media@vger.kernel.org>; Wed, 13 Sep 2023 04:01:28 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (82-181-192-243.bb.dnainternet.fi [82.181.192.243])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4RlyDv6zWrz49Q2P
        for <linux-media@vger.kernel.org>; Wed, 13 Sep 2023 14:01:19 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
        t=1694602880;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type;
        bh=X6cSiKidVlMaVkkaqInxL/0aaJl9CGH6gP1iuXjFkM4=;
        b=ETtY/49c+bLDtHmyEziVmoey5FQb19Dn0/hxrav4B1ZcSekl3kbrclr6pXlBcpNPbmYJwN
        UmhWWn//2+hs4MUBZVfeRfQWbhgjTAH+g+t5Gn93PEpf8JgCTrPZXrmBXmknjTaFecAOyj
        AYfKaSO0OW2BPemUAZlAON2lANGQZkdutaOMwco8fNxbyMx20/IbBFgoOFAjrtbJANl9xw
        t9AUXDtFdZBFYFlzBE+QpxQzJyUQnL955UP2X2tYncgSb7yt3x/m42RKDxZbpKQ15r5QHU
        aoYTQ+xtMRC4EhHsm65l6vs1k70tZEhVZnCE8Tmf+R/8VH5103CQ8IO4xeVGwQ==
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1694602880; a=rsa-sha256;
        cv=none;
        b=gGBMKI3dKyBVyYvVY9i+0QVrzg5pdC3BM4QaiT8typIlyHLtnBgsC1IQqJJ0v+s+mRt+/+
        c80C1GAaWKd9gE/Y4B/25iaIIlChxjAeCx6ty3u6fYMLKmWSc5SmlD7kwio9ugat6m5tSr
        sX5PStWEHOxtccf9rViCTwsJ+SIlvSUnnPYKTykb/aU6duBMU4nFsri3vHynfNDHhcnO8N
        WtHH63evfPAgn5Gg6snIV/eHBRPH1VRpl+YRKZPTjMNn5T66rWCa68lDdAE7YmNOyL9tLc
        U4r+8ayoq+yH0cXOMfJwxJ702YaSUpkuqA1A68FdRAejGyZWSfJ8EVeD55FBQg==
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=lahtoruutu; t=1694602880;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type;
        bh=X6cSiKidVlMaVkkaqInxL/0aaJl9CGH6gP1iuXjFkM4=;
        b=DUTuINT1N+4XSJGMSVQ9u+FHQ+VKe616Xr/r2tQKdhuCkClDjv9qa+/I71RHvZAW8X6smW
        G/KLge3XeB9tW18hNuTM+NcrPtyP2IFz3bPZG7d0ePX4+OoccJJe5Ohe75/aoAbob65/Vs
        3oKKqMuPXFvPJuHWUpzwvs+XQAjBCtuL5LTXWGXtctqDGo40p1qO7lvmp5A726kGMAxzFM
        klM7ZPX4Gn4K6ek6VGa5JVUlRYGFIT0lS3IHo0j56HY/5xQez4JZMrNY/UEYtOsCfiFOF1
        Zoisr3Yeocktq2Rum7e+q93NOlZYGkaHm/qIxRJL9OFU6QAaYqENrA/4g1SFrA==
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 5116B634C93
        for <linux-media@vger.kernel.org>; Wed, 13 Sep 2023 14:01:19 +0300 (EEST)
Date:   Wed, 13 Sep 2023 11:01:19 +0000
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     linux-media@vger.kernel.org
Subject: [GIT FIXES FOR 6.6] V4L2 fixes
Message-ID: <ZQGWf54Xi2sXlWhB@valkosipuli.retiisi.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

Here are fixes for imx219, max9286 and rdacm21 drivers.

Please pull.


The following changes since commit 0bb80ecc33a8fb5a682236443c1e740d5c917d1d:

  Linux 6.6-rc1 (2023-09-10 16:28:41 -0700)

are available in the Git repository at:

  git://linuxtv.org/sailus/media_tree.git tags/fixes-6.6-1-signed

for you to fetch changes up to a6a10fd65841ee675e7bc1b1ad1f6010af1b4750:

  media: i2c: rdacm21: Remove an incorrect fwnode_handle_put() call (2023-09-13 13:20:46 +0300)

----------------------------------------------------------------
fixes-6.1-1-signed

----------------------------------------------------------------
Christophe JAILLET (2):
      media: i2c: max9286: Remove an incorrect fwnode_handle_put() call
      media: i2c: rdacm21: Remove an incorrect fwnode_handle_put() call

Laurent Pinchart (3):
      media: i2c: imx219: Fix a typo referring to a wrong variable
      media: i2c: imx219: Fix crop rectangle setting when changing format
      media: i2c: imx219: Perform a full mode set unconditionally

 drivers/media/i2c/imx219.c  | 13 +++++++------
 drivers/media/i2c/max9286.c |  1 -
 drivers/media/i2c/rdacm21.c |  1 -
 3 files changed, 7 insertions(+), 8 deletions(-)

-- 
Sakari Ailus
