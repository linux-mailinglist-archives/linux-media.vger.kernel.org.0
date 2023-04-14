Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3889D6E2692
	for <lists+linux-media@lfdr.de>; Fri, 14 Apr 2023 17:13:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230392AbjDNPNg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 14 Apr 2023 11:13:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230298AbjDNPNd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 14 Apr 2023 11:13:33 -0400
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1B2A93CE
        for <linux-media@vger.kernel.org>; Fri, 14 Apr 2023 08:13:27 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (dkzcv-3yyyyyyyyyyyyyt-3.rev.dnainternet.fi [IPv6:2001:14ba:4505:1fdc::1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by meesny.iki.fi (Postfix) with ESMTPSA id 4Pyg1v56P0zyVx
        for <linux-media@vger.kernel.org>; Fri, 14 Apr 2023 18:13:23 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
        t=1681485203;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type;
        bh=e0eqMNH7Eue2cQD85ZRoMH/luANKq2boSRIwMoRm8so=;
        b=LUdZc90+1z7bs3Uv6UHMyhmg8U0VEVdL1H+B5KL8801hzauGdnqOGndLdDIehlOJddBC4u
        suMf/Bqj4IaEpEJm8AC7Xi8wJz8aE5HyxgCjSaY0ECMO4VRCthaMjpgpYrQapGySsek2LA
        w4Ecn7PyrZIlaCfNQyNZwEfA6ZriJLA=
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1681485203; a=rsa-sha256; cv=none;
        b=dpevJYQyPS+Kd3vBWfAwtHjuMRD86M2XeUL9iWkIGxoPlN5uFtS6Vw+sLdsbDFYdJGFJ1j
        4wArVt8zj0O99fRDwk9AndjLZKJOEnRW/1GsobdxCEcu2eI9mgBbv4FWhASRWsvG5rbfmw
        WX7HFMSFLRzqqC/PA0h/8O+vNgQQ1d4=
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=meesny; t=1681485203;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type;
        bh=e0eqMNH7Eue2cQD85ZRoMH/luANKq2boSRIwMoRm8so=;
        b=IKgd5eRWpzTzKj24Tbi45yP+NRCShjeIPDJiXy0jHGWlxioPVbALPt8OjVxaykWoZiYDut
        +w3ziUnYfyPPnT2zJM7gHfTw75tYiRP/fVzSf+XF9e3u0w7BXTnow6VJfpl047cNkaCUda
        itPMxGkfpjzNKdX3JvWzpUKrqH1YvOw=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id B3EC1634C91
        for <linux-media@vger.kernel.org>; Fri, 14 Apr 2023 18:10:06 +0300 (EEST)
Date:   Fri, 14 Apr 2023 18:10:06 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL FOR 6.4] Client capability sub-device IOCTL
Message-ID: <ZDlszuIGxU/yvpN6@valkosipuli.retiisi.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

Here's a PR with just one patch: the client capability sub-device IOCTL.
This will be needed to signal which applications are aware of streams, to
address an age-old issue with reserved fields.

Please pull.


The following changes since commit f100ce3bbd6aa0093075b20b9dbd006686f6aedf:

  media: verisilicon: Fix crash when probing encoder (2023-04-13 12:58:55 +0200)

are available in the Git repository at:

  git://linuxtv.org/sailus/media_tree.git tags/for-6.4-3-signed

for you to fetch changes up to 9f06f58966d42d3b7a2935fcf511c8ee485546d2:

  media: v4l2-subdev: Add new ioctl for client capabilities (2023-04-14 16:41:42 +0300)

----------------------------------------------------------------
Client capability subdev IOCTL for 6.4

----------------------------------------------------------------
Tomi Valkeinen (1):
      media: v4l2-subdev: Add new ioctl for client capabilities

 .../userspace-api/media/v4l/user-func.rst          |  1 +
 .../media/v4l/vidioc-subdev-g-client-cap.rst       | 83 ++++++++++++++++++++++
 drivers/media/v4l2-core/v4l2-subdev.c              | 63 ++++++++++++++++
 include/media/v4l2-subdev.h                        |  1 +
 include/uapi/linux/v4l2-subdev.h                   | 21 ++++++
 5 files changed, 169 insertions(+)
 create mode 100644 Documentation/userspace-api/media/v4l/vidioc-subdev-g-client-cap.rst


-- 
Kind regards,

Sakari Ailus
