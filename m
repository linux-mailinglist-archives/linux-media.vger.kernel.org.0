Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C710A76B4C5
	for <lists+linux-media@lfdr.de>; Tue,  1 Aug 2023 14:31:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231826AbjHAMbQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Aug 2023 08:31:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231245AbjHAMbP (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 1 Aug 2023 08:31:15 -0400
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05FB61FC7
        for <linux-media@vger.kernel.org>; Tue,  1 Aug 2023 05:31:13 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (82-181-192-243.bb.dnainternet.fi [82.181.192.243])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by meesny.iki.fi (Postfix) with ESMTPSA id 4RFZGQ5bGJzyPp
        for <linux-media@vger.kernel.org>; Tue,  1 Aug 2023 15:31:10 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
        t=1690893070;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type;
        bh=6mq5dFAA0+Y1fPGhDo+NiYYCF/xbZp5B2oUumG7yq8Y=;
        b=XGmDPA3eonDS4n5pYPX4XyJcS8fayZH8p5tFkS5Por8hPDZ3I/HD6/JgkWtKowkpWOgwAN
        eXSJES2tU8+YKK7wQ8+LEJmLySUPtxo0AMPinzhxohSut+wBT4QiLryOK6T7r/s3L99SV7
        DD+n6Ag1ol7vUmAlAPY2bDlbiaKiVms=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=meesny; t=1690893070;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type;
        bh=6mq5dFAA0+Y1fPGhDo+NiYYCF/xbZp5B2oUumG7yq8Y=;
        b=VxycQH4prewuCIcK/BABdRypWyTaJHmUuSxT6a4dvlpD87VyZY4wzjj4StGsAvp8m2o5JY
        HsWFToxfJwe8U4QOvLCQqibi5PWRIs50mUkZ77DTGT90+iwsNXJIxQjliW3I0zLGsUrrYC
        QOWfk8Yi4dIcWGBqn9QrxEBIQO7g7HE=
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1690893070; a=rsa-sha256; cv=none;
        b=UcIeZ6IlTjBL7lqihBaufI0iqyWE3SUDhvR62wIdNoO5c77ErLRyWQFknwYhgS9ycEvjLg
        sHVFDEKNT0DABcDK6lg7jV8CgGPs8NucqJn1Mznvv26CwHSYHvJGGVFyCuYvLL2bfq2Ypa
        mxNpCUjfKx3XJz8cxt9Kg+FkNk/EO44=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 1C6A5634C95
        for <linux-media@vger.kernel.org>; Tue,  1 Aug 2023 15:31:10 +0300 (EEST)
Date:   Tue, 1 Aug 2023 12:31:09 +0000
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL FOR 6.6] Ds90ub9xx driver fixes and improvements
Message-ID: <ZMj7Dbg8iLAznZyi@valkosipuli.retiisi.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

Here's a fix for ds90ub9xx driver introduced by the V4L2 async improvements
patchset. Basically the ds90ub9xx driver was merged after the patch that
converted notifier drivers not do fwnode matching with endpoints was
written and this was missed when the series was merged.

The first patch of the series fixes it. The rest of the set adds new
features.

Please pull.


The following changes since commit 38d6a03d2511bee97455b2ea0314c918537ef1ec:

  media: go7007: Remove redundant if statement (2023-07-28 12:45:55 +0200)

are available in the Git repository at:

  git://linuxtv.org/sailus/media_tree.git tags/ds90ub9xx-6.6-1-signed

for you to fetch changes up to 986bb91315431771994205ba237018de73fa3b1f:

  media: i2c: ds90ub960: Rename RXPORT_MODE_CSI2_ASYNC to RXPORT_MODE_CSI2_NONSYNC (2023-08-01 01:28:54 +0300)

----------------------------------------------------------------
DS90UB9xx driver async fix plus more, for 6.6

----------------------------------------------------------------
Tomi Valkeinen (9):
      media: i2c: ds90ub9x3: Fix sub-device matching
      media: i2c: ds90ub960: Configure CSI-2 continuous clock
      media: i2c: ds90ub953: Use v4l2_fwnode_endpoint_parse()
      media: i2c: ds90ub913: Use v4l2_fwnode_endpoint_parse()
      media: i2c: ds90ub953: Handle V4L2_MBUS_CSI2_NONCONTINUOUS_CLOCK
      media: i2c: ds90ub960: Allow FPD-Link async mode
      media: i2c: ds90ub953: Restructure clkout management
      media: i2c: ds90ub953: Support non-sync mode
      media: i2c: ds90ub960: Rename RXPORT_MODE_CSI2_ASYNC to RXPORT_MODE_CSI2_NONSYNC

 drivers/media/i2c/ds90ub913.c |  47 +++++----
 drivers/media/i2c/ds90ub953.c | 215 ++++++++++++++++++++++++------------------
 drivers/media/i2c/ds90ub960.c |  31 +++---
 3 files changed, 164 insertions(+), 129 deletions(-)

-- 
Kind regards,

Sakari Ailus
