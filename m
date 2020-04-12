Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (unknown [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2A31C1A5FCD
	for <lists+linux-media@lfdr.de>; Sun, 12 Apr 2020 20:30:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727576AbgDLSaI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 12 Apr 2020 14:30:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.18]:43938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727562AbgDLSaH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 12 Apr 2020 14:30:07 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EA78C0A3BF2;
        Sun, 12 Apr 2020 11:20:22 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id 198so4990415lfo.7;
        Sun, 12 Apr 2020 11:20:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tY4gV3mbBh6YlZ2Mos/NaX4/rY14UmtFD7+t3Jb3dMw=;
        b=ROGEJ/CaGdsXBF+PbMesBFoHnpYqw7ZVM6SOtq5GVNwVH7JNVbYjZLzv1ohpJM5FKi
         9yji4QogiO9wbeUziw3EMOSYGKDXOyQSuxnXSkto+8bG4DRbKQ9+kRMivEUZnc8Q41vj
         GW+0MfxC5jUQX0SOEmjR7I9I57AVGTbYZEERr17C44weIY/7oc6XSfrJZYiHq+qPxkgm
         MY0XEfA7eiuPrSoRWtWrIJHVaAACeP/rdLUMOSzIsppr8S9ACK4KdOp5t00VwhaYAxvG
         vLWCdoJOe0/vqTEvmyYBmkEN0O2qtTmQ3g5EYShAMySr+h1z6SNs7YkoiBOoqp+VLysR
         wCPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=tY4gV3mbBh6YlZ2Mos/NaX4/rY14UmtFD7+t3Jb3dMw=;
        b=bsrFWwtYiZEPWhv2M/LC9J0Ue+Pg4+T4DdgKT5PBbEJoinbqM/wElgjlmMWb63bvYO
         GTnkqKCy/XAjKgRbBySXpk4Vm4+50UsTP8k4qvwZ8d53qf1U7RvJXVMrofHjDTumEJ9I
         P5k1vaun5EaSufRUAdrwzREvFHIkCuqbqOuPclnAVC6CoRrkzJFxWyL+XwDKAz83Ybi6
         48kbqEggdJD2GsB6cTUmhfiYr1zMxRrOsp01cB5yX5Nld5UvGJp53Th3rFtQP00YkKqr
         VwkZj+ljOCbjT8EkNVtel9beCnq/cNSC5ZQ0ePvzqdLzOGA2uXvWKwQfb4Yl8zxkNluP
         7Q2g==
X-Gm-Message-State: AGi0PuZcz0KGTkIeH8eMyxSb99zbbYs9wtVyNyzh8+bavR2M1u7blexB
        Y0FTzLZv/o2+pMHXi4RjpeP0j8w3ni8=
X-Google-Smtp-Source: APiQypIxqPYcw7sG0yOL2g9KSN6dtoshvVOHq2rXNtGX+hzY3j3+hLYI18RMgDenrT3GLFgvbP7kjQ==
X-Received: by 2002:a05:6512:1c5:: with SMTP id f5mr8183363lfp.138.1586715620757;
        Sun, 12 Apr 2020 11:20:20 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
        by smtp.gmail.com with ESMTPSA id m13sm6434394lfk.12.2020.04.12.11.20.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Apr 2020 11:20:20 -0700 (PDT)
From:   Sam Ravnborg <sam@ravnborg.org>
To:     devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>,
        dri-devel@lists.freedesktop.org
Cc:     Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Boris Brezillon <bbrezillon@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH v1 0/4] dt-bindings: DT Schema variants of atmel lcdc, hlcdc
Date:   Sun, 12 Apr 2020 20:20:08 +0200
Message-Id: <20200412182012.27515-1-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following four patches update the bindings for Atmel
LCDC, HLCDC display controllers to DT Schema.

The bindings were re-written in DT Schema format,
and examples adjusted/updated to fit.

This patch-set introduces a new endpoint property in video-interfaces
used to tell if red and blue wiring is reversed.
Red and blue wires are reversed as the LCDC IP natively supports BGR
whereas most SW expects RGB. With the wires reversed the SW thinks
the IP supports RGB.
See more details in the changelog of the patch.

The Atmel lcdc binding deprecate a lot of properties in other
to update it to an up-to-date binding. There are no users of the
updated binding, thats something I work on.

Note a big difference between LCDC and HLCDC.
LCDC has all in one binding (interrupts, pwm, display controller).
HLCDC has individual sub-nodes for the PWM and the display contoller.

When posting an update on the old atmel,lcdc.txt file the feedback
was back then that we did not want the split like done for hlcdc.
And it makes for a simpler binding in this way - so feedback looks right.

Despite that Microchip has purchased Atmel, the atmel name is kept.
Also the files are placed in a directory named atmel/.

Feedback welcome!

	Sam

Sam Ravnborg (4):
      dt-bindings: display: convert atmel-hlcdc to DT Schema
      dt-bindings: display: convert atmel lcdc to DT Schema
      dt-bindings: media: add wiring property to video-interfaces
      dt-bindings: display: add port support to atmel lcdc

 .../devicetree/bindings/display/atmel,lcdc.txt     |  88 --------
 .../devicetree/bindings/display/atmel/hlcdc-dc.txt |  75 -------
 .../bindings/display/atmel/hlcdc-dc.yaml           | 102 +++++++++
 .../devicetree/bindings/display/atmel/lcdc.yaml    | 229 +++++++++++++++++++++
 .../devicetree/bindings/media/video-interfaces.txt |   3 +
 .../devicetree/bindings/mfd/atmel-hlcdc.txt        |  55 -----
 .../devicetree/bindings/mfd/atmel-hlcdc.yaml       |  78 +++++++
 .../devicetree/bindings/pwm/atmel-hlcdc-pwm.txt    |  29 ---
 .../devicetree/bindings/pwm/atmel-hlcdc-pwm.yaml   |  39 ++++
 9 files changed, 451 insertions(+), 247 deletions(-)


