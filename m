Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7035D6B9FE8
	for <lists+linux-media@lfdr.de>; Tue, 14 Mar 2023 20:40:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229925AbjCNTk5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Mar 2023 15:40:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229464AbjCNTk4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Mar 2023 15:40:56 -0400
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E3F216AF8
        for <linux-media@vger.kernel.org>; Tue, 14 Mar 2023 12:40:54 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (82-181-192-243.bb.dnainternet.fi [82.181.192.243])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by meesny.iki.fi (Postfix) with ESMTPSA id 4PbkQr38kvzyV4
        for <linux-media@vger.kernel.org>; Tue, 14 Mar 2023 21:40:51 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
        t=1678822852;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type;
        bh=CeRYJbnpi8jNo9tuJq6bK3bRXJe+fz3lw7VrZ7FDBY8=;
        b=hFcnzu2uYRKYp656+dE/1ENtMTJdOYZ+NKvbcraWXNLC5nMoByalkGHqNkMNUxyx8q/Od/
        r0YcGki/xZ4ya91dsXt6KK+zlrSe6jjP2oOlKyGeV34vRPYLxwAnUFjjYjynAI3Y5wzz1/
        xfdnuqR4TPWoU9EXgoWLdvrx4iHooO0=
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1678822852; a=rsa-sha256; cv=none;
        b=OxjZCtc9ecI8jS2R3itII2T1FUlLhv/5ueOUKlkOXAyw9SZpIm4zDPYY0LP+BUurbRkaa8
        l7mwtVGQx85jCjUvbfU9d9ODQXjZbMXBAtfbggLFZraFJBLXdaA00Dj08kE6wusj7OuZua
        CdilPEXC+pbsGUTesddoJpNHp/bhDIo=
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=meesny; t=1678822852;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type;
        bh=CeRYJbnpi8jNo9tuJq6bK3bRXJe+fz3lw7VrZ7FDBY8=;
        b=iVwfmJYkLJIyfjNn60F9LBBY5v42rd3sXyZxJTLewapqtug56x3yQVEdFYNxDNeQiy8uT2
        XNXQiEuXDUhsx+OUd/5GdGYH/dVv6V1feGeFX4/d/HRO6KbjrhQxCNgzmEyiHzIcFKl2PV
        xoY5a0BLr0OBuiaUE/ZKyQtaQSuJfO4=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id A80F4634C91;
        Tue, 14 Mar 2023 21:39:48 +0200 (EET)
Date:   Tue, 14 Mar 2023 21:39:48 +0200
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     linux-media@vger.kernel.org
Cc:     tomi.valkeinen@ideasonboard.com
Subject: [GIT FIXES FOR 6.3] Streams patches fixes, imx290 compile fix
Message-ID: <ZBDNhGsYueHPospK@valkosipuli.retiisi.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

Here are three patches to address a few issues found in Tomi's streams
patches as well as a compile warning for for imx290.

Please pull.


The following changes since commit fe15c26ee26efa11741a7b632e9f23b01aca4cc6:

  Linux 6.3-rc1 (2023-03-05 14:52:03 -0800)

are available in the Git repository at:

  git://linuxtv.org/sailus/media_tree.git tags/fixes-6.3-2

for you to fetch changes up to e48bbea72646740a0ae84c087350963f0362c17c:

  media: v4l: subdev: Make link validation safer (2023-03-13 10:30:17 +0200)

----------------------------------------------------------------
Camera sensor + V4L2 fixes for 6.3

----------------------------------------------------------------
Arnd Bergmann (1):
      media: i2c: imx290: fix conditional function definitions

Sakari Ailus (1):
      media: v4l: subdev: Make link validation safer

Tomi Valkeinen (1):
      media: subdev: Fix validation state lockdep issue

 drivers/media/i2c/imx290.c            |  6 +--
 drivers/media/v4l2-core/v4l2-subdev.c | 92 +++++++++++++++++++++++------------
 2 files changed, 65 insertions(+), 33 deletions(-)

-- 
Kind regards,

Sakari Ailus
