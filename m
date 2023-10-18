Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 218397CD753
	for <lists+linux-media@lfdr.de>; Wed, 18 Oct 2023 10:59:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229529AbjJRI7x (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Oct 2023 04:59:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229753AbjJRI7V (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Oct 2023 04:59:21 -0400
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF77AEA
        for <linux-media@vger.kernel.org>; Wed, 18 Oct 2023 01:59:19 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (185-9-10-242.cust.suomicom.net [185.9.10.242])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by meesny.iki.fi (Postfix) with ESMTPSA id 4S9Psw55M5zyYm
        for <linux-media@vger.kernel.org>; Wed, 18 Oct 2023 11:59:12 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
        t=1697619556;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type;
        bh=mJuWNu1pItZ/YjCSxqSFAI2j3tkUguUoelhch15m58E=;
        b=Fr2yT4L+An3m17JH3AuZ854TWzME2X3qoBc1DM8pdn+j3dqljFr6c69HPaME48Cb12RT2I
        svwg+Lu8xHgGYcA1oKS2RxH+yPb1QACKBVBLwzaAFuIpZw0OK1ukcaSDlYXVewrF5vMo8o
        edv0oCfyM76fHR1TzQ2LTW/1dMxX48A=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=meesny; t=1697619556;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type;
        bh=mJuWNu1pItZ/YjCSxqSFAI2j3tkUguUoelhch15m58E=;
        b=oniW2em539kP2TGTZbaByeYEYAOOBzXH88SVvnF4QlO80ufyU4kLZ1wPJgPmK/LMCY3i69
        ekWjKgLPzGca3597pkk+Lr47tsqd1RKAlA7IpDAH9+E72d2QYi2oXkOR/ZR6h/WO8GhSTr
        Zt77gBgFgdmZxBulzYqQw21tOiHZmsw=
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1697619556; a=rsa-sha256; cv=none;
        b=q3rcxgsIHTzKeflBcZA6OS0VyVUb4IMe7Tk9idzMGguLV1MW+WTnpS/C4inW0VgLOPEW9J
        Bj0ekO/5epILqBre8aXNnJT4b8VA9g3ZKiChv//aMjPm3QfHet768sSeYzLoAOD++nNjRr
        VDzr8AjR/cI1oNYdTcITyOaNd5Tgi50=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 38F11634CBD
        for <linux-media@vger.kernel.org>; Wed, 18 Oct 2023 11:59:11 +0300 (EEST)
Date:   Wed, 18 Oct 2023 08:59:11 +0000
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL FOR 6.7] Cadence CSI2RX fixes
Message-ID: <ZS+eXz1eNTixlBIO@valkosipuli.retiisi.eu>
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

Here are a few fixes for the Cadence CSI2RX driver recently merged.

Please pull.


The following changes since commit 94e27fbeca27d8c772fc2bc807730aaee5886055:

  media: cec: meson: always include meson sub-directory in Makefile (2023-10-13 11:33:22 +0200)

are available in the Git repository at:

  git://linuxtv.org/sailus/media_tree.git tags/for-6.7-4-signed

for you to fetch changes up to 26400386ca8a8f8cf5ed59142a9bdd0181d17c69:

  media: platform: cadence: select MIPI_DPHY dependency (2023-10-17 11:07:52 +0300)

----------------------------------------------------------------
Cadence CSI2RX fixes for 6.7

----------------------------------------------------------------
Jai Luthra (2):
      media: MAINTAINERS: Fix path for J721E CSI2RX bindings
      media: platform: cadence: select MIPI_DPHY dependency

 MAINTAINERS                            | 2 +-
 drivers/media/platform/cadence/Kconfig | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

-- 
Sakari Ailus
