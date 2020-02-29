Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4E81517481F
	for <lists+linux-media@lfdr.de>; Sat, 29 Feb 2020 17:40:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727193AbgB2Qkk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 29 Feb 2020 11:40:40 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:36845 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727124AbgB2Qkk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 29 Feb 2020 11:40:40 -0500
Received: by mail-wm1-f68.google.com with SMTP id g83so4467233wme.1
        for <linux-media@vger.kernel.org>; Sat, 29 Feb 2020 08:40:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=LxR7X3dDtcq+5W+FtPVqnuhLYnxLerXbFaqGoz4O5DU=;
        b=AYwe7pcIDKXlE6v2WwL9ERNqawlYCuSexQgu2BwaabpPJHn7Md2KfDapqR3XFnuL2s
         bx2i2qjqlvcuC2lkNb2fFaWUClDC0WrSjVfZXaFVHBslZhRxKsyYhy25KoFNV02V8X1y
         nUvWAgbvde2g4LgXhKq0L+LqKMb5C+s+GOWH0H+Hya+xW8X6L5G3IjIZ+ZLHZvJ69UPN
         +YXOy43rE27HTElQvnyMu5oL6mKh1e31F2GzZxz2BqrQ3/XmVHe+E1/pk1umAirxOt48
         r9uVKaW2RIIZjHdtYHw0HYu4HaVJopd0TQ6qXk4EU7AftjjVZxXWBkQ1HhsoIj34atxE
         GfiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=LxR7X3dDtcq+5W+FtPVqnuhLYnxLerXbFaqGoz4O5DU=;
        b=Zzt8vZZn2ZJn2zEFJDjsnNeVlcJv/KjsLFlAVFlkT7IH6nyLMU9WGC/X54OF9ICsb1
         D4c+PHEmx93lETEKmPXlVTlrk20Il8bIxo0fzqzqqdUdSr+uOcYL5c/drC6jrzIrbfsq
         /jXwinbtVjztkSeMc2P2FvRdfOaG93XtuLmxhno5CntI6TBvMSTxtDKFcqVjPlf8a9nX
         jngXrW4TM8NW+AwLZ4LsAUtWxY7OZb/vmexmMwoNcN1ja87sglk+DzpriJAFB95OCZFh
         AHji9ttCIHR6P+ZNpmNoZzPEDEvBYKIZzaUP0EZSh2kt+UQgIOgZGDdup+I/oI6xgJnG
         gcGA==
X-Gm-Message-State: APjAAAWqO9S5TlAnjEnK9ULwyXrzLUWrYx4TIryosB8aGKUVoeiZrzfe
        WE51PZp8gcAjtZWUmIDio2sYFIPyP84BPQ==
X-Google-Smtp-Source: APXvYqzY0vNYktgxiNEbjh2hdAMjvswtfIHbX11vAppYZ52GUChksbH9jIHd9eN5E8HVSk1gDkeg0w==
X-Received: by 2002:a1c:4043:: with SMTP id n64mr4416122wma.169.1582994437850;
        Sat, 29 Feb 2020 08:40:37 -0800 (PST)
Received: from localhost (229.3.136.88.rev.sfr.net. [88.136.3.229])
        by smtp.gmail.com with ESMTPSA id x21sm6545553wmi.30.2020.02.29.08.40.36
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 29 Feb 2020 08:40:36 -0800 (PST)
From:   Kevin Hilman <khilman@baylibre.com>
To:     Mohammad Rasim <mohammad.rasim96@gmail.com>,
        linux-media@vger.kernel.org, Sean Young <sean@mess.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-amlogic@lists.infradead.org
Cc:     Mohammad Rasim <mohammad.rasim96@gmail.com>
Subject: Re: [PATCH v5 0/3] add videostrong kii pro keymap
In-Reply-To: <20200214085802.28742-1-mohammad.rasim96@gmail.com>
References: <20200214085802.28742-1-mohammad.rasim96@gmail.com>
Date:   Sat, 29 Feb 2020 17:40:35 +0100
Message-ID: <7h36atbb3w.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mohammad,

Mohammad Rasim <mohammad.rasim96@gmail.com> writes:

> Videostrong kii pro comes with a NEC remote control, this adds support
> for this remote and also select it from the device dts

With the bindings reviewed/ack'd I'll queue the DT patch (PATCH 3/3) via
the amlogic tree, but the binding and driver patches need to go via the
media subsystem.

Thanks for the patches,

Kevin

> Changes since v1:
> - fix styling issues
>
> Changes since v2:
> - use KEY_VENDOR for mouse key
> - use KEY_PVR instead of KEY_RECORD
> - use KEY_APPSELECT for the launcher
> - use KEY_TV for the tv app key
>
> Changes since v3:
> - add a patch to use the keymap by the device's dts
>
> Changes since v4:
> - add a patch to update the rc bindings
>
> Mohammad Rasim (3):
>   media: rc: add keymap for Videostrong KII Pro
>   dt-bindings: media: add new kii pro key map
>   arm64: dts: amlogic: add rc-videostrong-kii-pro keymap
>
>  .../devicetree/bindings/media/rc.yaml         |  1 +
>  .../boot/dts/amlogic/meson-gxbb-kii-pro.dts   |  4 +
>  drivers/media/rc/keymaps/Makefile             |  1 +
>  .../media/rc/keymaps/rc-videostrong-kii-pro.c | 83 +++++++++++++++++++
>  include/media/rc-map.h                        |  1 +
>  5 files changed, 90 insertions(+)
>  create mode 100644 drivers/media/rc/keymaps/rc-videostrong-kii-pro.c
>
> --
> 2.25.0
