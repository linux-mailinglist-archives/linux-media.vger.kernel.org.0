Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C69BE6D18B5
	for <lists+linux-media@lfdr.de>; Fri, 31 Mar 2023 09:36:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230358AbjCaHgs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 31 Mar 2023 03:36:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229529AbjCaHgo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 31 Mar 2023 03:36:44 -0400
Received: from meesny.iki.fi (meesny.iki.fi [IPv6:2001:67c:2b0:1c1::201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CAA31199B
        for <linux-media@vger.kernel.org>; Fri, 31 Mar 2023 00:36:43 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (82-181-192-243.bb.dnainternet.fi [82.181.192.243])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by meesny.iki.fi (Postfix) with ESMTPSA id 4PnsYP0bckzyRB
        for <linux-media@vger.kernel.org>; Fri, 31 Mar 2023 10:36:39 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
        t=1680248201;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type;
        bh=KkxBJic83uV+nKCuETqbEkWXGA+Qr1jtIJC30ET9Lgc=;
        b=BDGQEfQ6OiP0JKKAaWasCDD8m4dxRqyoL4RI1cJ1qVL9EOWDnlXv4OHT8SRZcj/HSJTjZj
        M3B+qqnSu9CxVhytRyhoZ7yqqGgdnEDuUCTY2kVSzt31Lz8YL69ag2pulemWnmvVk9x/J6
        SwuCWF0gsWerzXGcexdmMEpCk9U3KI4=
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1680248201; a=rsa-sha256; cv=none;
        b=OLyfeAyNu0UY7Otg9NAEcDn02mDDmQl3l/dQByJWX8DdTdCM3D3NLhwnpBueKs5N14hQXE
        Ptdcyd2zDwiwvFVkXahAL3hhFPWoad9CsF+qxPSDui0DhvXnNef4MxxItA++B/wc9GUPsZ
        Vdo/7z1AeHcLhZJFrOGKJnIbSLRPbjw=
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=meesny; t=1680248201;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type;
        bh=KkxBJic83uV+nKCuETqbEkWXGA+Qr1jtIJC30ET9Lgc=;
        b=VmKY00Ihc1rR4KmLKM4b5aUy9hYpqfoYBEqUOTcUu7jjZbQX5INQqZy0MazdmlDANPL9u4
        s/rHuxcf7t0wuSAw9Y5kbDQPeU8E6RO9I41zW/HMBBAT7lPANFU/biW5oovtho9Uasnv/J
        A8dKUUq9NoLT/Ed8yNq/gjKiBEb5rNY=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id AA365634C99
        for <linux-media@vger.kernel.org>; Fri, 31 Mar 2023 10:34:24 +0300 (EEST)
Date:   Fri, 31 Mar 2023 10:34:24 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     linux-media@vger.kernel.org
Subject: [GIT FIXES FOR 6.3] Fix ov5670 probe crash on ACPI
Message-ID: <ZCaNAGCFLG7p78yd@valkosipuli.retiisi.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

Here's a small but important fix for the ov5670 driver.

Please pull.


The following changes since commit 55f1ecb1199000932cf82e357841cc7498ac904f:

  media: v4l: subdev: Make link validation safer (2023-03-18 08:48:15 +0100)

are available in the Git repository at:

  git://linuxtv.org/sailus/media_tree.git tags/fixes-6.3-3

for you to fetch changes up to cb688e9463d6e77325980373ac306e282d59eee4:

  media: ov5670: Fix probe on ACPI (2023-03-30 16:22:13 +0300)

----------------------------------------------------------------
Fix ov5670 probe on ACPI

----------------------------------------------------------------
Sakari Ailus (1):
      media: ov5670: Fix probe on ACPI

 drivers/media/i2c/ov5670.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
Kind regards,

Sakari Ailus
