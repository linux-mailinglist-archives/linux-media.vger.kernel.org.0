Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 82AAA17E6C
	for <lists+linux-media@lfdr.de>; Wed,  8 May 2019 18:46:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728179AbfEHQqz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 May 2019 12:46:55 -0400
Received: from mail-lj1-f169.google.com ([209.85.208.169]:35653 "EHLO
        mail-lj1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728130AbfEHQqz (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 May 2019 12:46:55 -0400
Received: by mail-lj1-f169.google.com with SMTP id m20so8857990lji.2
        for <linux-media@vger.kernel.org>; Wed, 08 May 2019 09:46:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=Hby2rIW2cPAkJDo63diV7Kv2S/Ktkq/B3JE3am39zPE=;
        b=eK7jXOqOdf8TyDw+v21oUKyXwPKrqfzsBXlsl4MciwHiv9LVfs3fY8ooEn2Hlo0oDC
         ejFAL87s1zausn6xlu+I1k5ajdsiJomvmuaSepVyM2m+3WTtQAoTwnQ8t7gaqG3PBTKK
         uuTb+hjbyYUU+jBK90nFDDGVVKsNinW8owDzUIkXf+CW3ueQPijEXEusfMwVk+JTujTI
         YakJGzTLpDrLnVcTXB/JhEtbjvwmho2cdVkD5zeBpM5ia0XLZ+ABtp3ljYLFqssnP/HW
         Ozn3IYp51Ta5IThGljoNAGkqE1MnzzKIy5X/3Xr+hD/cZ6PHPuS56kkV3d4x5wB6Ao7V
         1h/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=Hby2rIW2cPAkJDo63diV7Kv2S/Ktkq/B3JE3am39zPE=;
        b=Zr/b3xrkJVjk4tSKy0ks0dmVLY0yH73nCwTsmbpLs01D2bl0VPeMeMCdbaEkVAymvI
         xUnPeS/W9WOjp/FTis2psCUZfjtdK6ZLB6Bp/yKbHUyEt8lsmC02qZhWaQBuAn9HU8iy
         JjmLDVHUb+jOCFre9XTm737Ro17EcW6AJcCIzAZHA88e0dA6b1NmFsWYQtV3nCpmO4r7
         NxxbesqVCCpZ6dS52hpQHxYz4+94uJYbkz+C2iGjn3mwsBHb3GK3gHqx/Q4oDnW7KKNP
         9cfcve0clDxzV/ddkz+eI8LWYFmzUdPVJrQXbWwwU2KH9BJvlOVS9NNKMnpiUtkrvJV2
         owMg==
X-Gm-Message-State: APjAAAXGZXHXOn+ACJlmJv1lej4AKNEKWayITbN6aM9i37WLVxiK9Ptp
        MNrWOdg3EMlvO+0H/BRepQxkno7Id7VMMzEl84E=
X-Google-Smtp-Source: APXvYqypsYwRjMPN8MVUFQ5cjK6nBGGE4Y9338y45j+PkzE9e4DSzyM+RFQRbhNuUdXjuMQE5in+SbiASQ91bZCtgh0=
X-Received: by 2002:a2e:8654:: with SMTP id i20mr10721256ljj.26.1557334013662;
 Wed, 08 May 2019 09:46:53 -0700 (PDT)
MIME-Version: 1.0
From:   "Wolf ." <wolfwings@gmail.com>
Date:   Wed, 8 May 2019 11:46:42 -0500
Message-ID: <CAG+9BZXyhdWjeG5w7qfGp1VK66AWZ4-b_x96vvBzZive8QwnNg@mail.gmail.com>
Subject: RTL28XXU Driver fails to initialize w/ R820T if CONFIG_MODULES enabled
To:     crope@iki.fi, mchehab@kernel.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Tested with/on Linux 5.0.x using GCC 7.4.x compiler series

If modules are enabled (which in turn enables CONFIG_MEDIA_ATTACH) the
dvb_attach codepath fails regardless of module load or compiling in
any or all components with this message:

DVB: Unable to find symbol r820t_attach()

Disabling CONFIG_MODULES (which in turn disables CONFIG_MEDIA_ATTACH
and turns dvb_attach into a no-op that blindly calls the function
requested) does work.

I'm unsure if this is a flaw in the dvb_attach macro or the driver's
usage of this macro, so I'm sending this to both the relevant
maintainers.

- Wolf
