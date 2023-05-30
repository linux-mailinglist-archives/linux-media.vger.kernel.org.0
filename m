Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BB13B7159B4
	for <lists+linux-media@lfdr.de>; Tue, 30 May 2023 11:17:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229687AbjE3JR0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 May 2023 05:17:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229446AbjE3JRZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 May 2023 05:17:25 -0400
Received: from meesny.iki.fi (meesny.iki.fi [IPv6:2001:67c:2b0:1c1::201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF3C9EA
        for <linux-media@vger.kernel.org>; Tue, 30 May 2023 02:17:23 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (82-181-192-243.bb.dnainternet.fi [82.181.192.243])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by meesny.iki.fi (Postfix) with ESMTPSA id 4QVmxs22Q6zyTW
        for <linux-media@vger.kernel.org>; Tue, 30 May 2023 12:17:21 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
        t=1685438241;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type;
        bh=qtLCvLwneLpT9obAHWduCp1qBt6RWGi2sDdGIYovKRI=;
        b=TTwokuqjrgP6FQXsbcoY7tKmd/f6ZQ7I+mMVI/Ovu0g71cJKaGO5aRCywVIWT/xymsFpzo
        u+GOsHseNJXUOBtNI0vq+Z5wGApMCKpdlSizN3v76P9PiQJxmEv5Q8wfVXq2b2zUXvFqDX
        6LKLQhF9XTzvGtPZZkG7QRboQ2M4br4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=meesny; t=1685438241;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type;
        bh=qtLCvLwneLpT9obAHWduCp1qBt6RWGi2sDdGIYovKRI=;
        b=NJUaPV+5GBu0Zaw+Ml91hc1AKlVfXo96wlodSoLUBhA42RAq8v3Rx/tI2C0v2pcbcoT5cZ
        orZrXedLCwZXpbeGTeptIS9lQMEICgWVJxHBOZEx2IVGvrtCn70oLQUJvQv/EUaRuptuLX
        hGDnqKpN22cOdaPgtCpxo6ZCvxQxdgs=
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1685438241; a=rsa-sha256; cv=none;
        b=Vj5VkOSF29vG1Y8LJiACLAv3hx+kNgnH8M7vxvarTRfvqWdJeFKv47nAte9+0IumD8WuyE
        owwQBytY6deLPmm7XCsdDVH4TrEv5cxwqHzhRe2IdtzWbSbbYgpLog/3Y0bdOLZrMmn8ta
        yWlJS4d22wLgwnpeOHsii8u9p8XUs9k=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 8822C634C91
        for <linux-media@vger.kernel.org>; Tue, 30 May 2023 12:17:20 +0300 (EEST)
Date:   Tue, 30 May 2023 12:17:20 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     linux-media@vger.kernel.org
Subject: [GIT FIXES FOR 6.4] V4L2 fixes for 6.4
Message-ID: <ZHW/IN2KTMwtWaFA@valkosipuli.retiisi.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

Here are a few fixes for the 6.4 kernel, including the updated
documentation fix.

I'm including the rest as what were previously merged ended up to the
media stage (master) tree. These should go to the fixes branch instead.

Please pull.


The following changes since commit a05e9aabd9dc27fc8888678391e3bf78624f8253:

  media: staging: media: atomisp: init high & low vars (2023-05-26 10:52:50 +0100)

are available in the Git repository at:

  git://linuxtv.org/sailus/media_tree.git tags/fixes-6.4-2.2-signed

for you to fetch changes up to 66944d5daa07400dc7ff787b02cc38a1059a0318:

  media: v4l2-subdev: Fix missing kerneldoc for client_caps (2023-05-30 11:59:08 +0300)

----------------------------------------------------------------
V4L2 fixes for 6.4

----------------------------------------------------------------
Hans Verkuil (1):
      staging: media: imx: initialize hs_settle to avoid warning

Tomi Valkeinen (1):
      media: v4l2-subdev: Fix missing kerneldoc for client_caps

Vaishnav Achath (1):
      media: v4l2-mc: Drop subdev check in v4l2_create_fwnode_links_to_pad()

 drivers/media/v4l2-core/v4l2-mc.c            | 3 +--
 drivers/staging/media/imx/imx8mq-mipi-csi2.c | 2 +-
 include/media/v4l2-subdev.h                  | 1 +
 3 files changed, 3 insertions(+), 3 deletions(-)

-- 
Kind regards,

Sakari Ailus
