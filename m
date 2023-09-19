Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8A5837A6499
	for <lists+linux-media@lfdr.de>; Tue, 19 Sep 2023 15:16:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232000AbjISNQf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 Sep 2023 09:16:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229648AbjISNQe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 Sep 2023 09:16:34 -0400
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com [IPv6:2607:f8b0:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97136EC
        for <linux-media@vger.kernel.org>; Tue, 19 Sep 2023 06:16:28 -0700 (PDT)
Received: by mail-ot1-x32d.google.com with SMTP id 46e09a7af769-6c228c9a98dso3384238a34.1
        for <linux-media@vger.kernel.org>; Tue, 19 Sep 2023 06:16:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1695129388; x=1695734188; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=u/FfNQBAdXLxlEt+X4meeY/e/SunDLocWKSMLQ9/cYg=;
        b=DVJIHCmcCZ54X/Hx4mCqIf+2jTBfmBsUZ+w3y2ewLN+cWe5lMjVXuaAbAcLtEFiaWe
         22arSPhncAKKC2hNTjdXRIH0axBhWSd+k7PYDNso9/FOFqlCQ+HeyPaKRtZuPiOFnuVC
         mNRgf+SCfZA+toDsjda+kuD4CXz/dBU6qSx/dTP9Znz2hh9D+GuKNJZ7xz12XD93AEVm
         D7AF7KzyP3DueVJz79/rQKWAdlPXiDQi+08rKdjEFgnabzx0iLRBRMZ+MnYbcQKBniQN
         Fwe2W61+r6o2Mw1OBXtYFqvD86Wfo8JNrvZKvHwmnouBrj+aTx9h1nF0TlTALYArhqoJ
         DyEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695129388; x=1695734188;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u/FfNQBAdXLxlEt+X4meeY/e/SunDLocWKSMLQ9/cYg=;
        b=w3e6lW+wqY2MQkWS7CnovFbc+3I8EuQ1iON57BvWMcnSv88r0nXix+P+SsYA+Voyj8
         GHI4Qkc2ZfQ7nhFh8hsnRfIgngMaSF/QwOpJXkBTuJwoPG3D8bLPol2Gd4FqXTIG+2kg
         idQtcR3O30ACsJWhdBgLgNn7Q+BziMDFp0v38xKal0nkQcm4212rELQ7S36zamdizIMX
         rraC0YpJMXWaJFtezOIIi8/bbTg3vClca9PVaHKXYjl9YzScC9+lM3GcVqMlLbCGRIyf
         fbhzB0yL7dZ9US131RX61RA2bhOwtBwWuX1yoKMipIHpqW/tu2GiBMEpujkkpFPfGy/n
         5TyA==
X-Gm-Message-State: AOJu0YxSNp/XUxXZxtesTDLbeVAQcu7Tg43HmKXIt4fzUvzTBF941PbL
        RtekCTapva3qvVAm8Tx7gC00CbKXjZytabqSU22DMw==
X-Google-Smtp-Source: AGHT+IFP2ijDSYgWXaTtksJr2ipT1zmBXMhFmPQYf9cSP2q/y3e+ys/ccW7sFc0UFvCconUnwdKexJa6j2G5U9vfAaA=
X-Received: by 2002:a05:6358:429f:b0:13a:cb52:4837 with SMTP id
 s31-20020a056358429f00b0013acb524837mr12220500rwc.31.1695129387909; Tue, 19
 Sep 2023 06:16:27 -0700 (PDT)
MIME-Version: 1.0
References: <20230919111540.2344757-1-sakari.ailus@linux.intel.com> <20230919111540.2344757-2-sakari.ailus@linux.intel.com>
In-Reply-To: <20230919111540.2344757-2-sakari.ailus@linux.intel.com>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Tue, 19 Sep 2023 14:16:11 +0100
Message-ID: <CAPY8ntCVWUoK6vcbRB8Pw_0_pV8tP7dXWZY=OMaBeaMMFjVVqg@mail.gmail.com>
Subject: Re: [PATCH 1/4] media: ov9282: Orphan the driver
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org,
        "Alessandrelli, Daniele" <daniele.alessandrelli@intel.com>,
        "Murphy, Paul J" <paul.j.murphy@intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari

On Tue, 19 Sept 2023 at 12:17, Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
>
> The current maintainers won't be looking after this driver anymore. Mark
> it orphan.

Seeing as a fair number of Pi users are using OV9281 (same sensor but
different CRA), I'm prepared to step up as maintainer for this one.
Do you want me to create a patch to update MAINTAINERS, or are you
happy to create one and me R-b or Ack it?

  Dave

> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  MAINTAINERS | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 980b141856e1..9705557b39d4 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -15862,10 +15862,8 @@ F:     Documentation/devicetree/bindings/media/i2c/ovti,ov8858.yaml
>  F:     drivers/media/i2c/ov8858.c
>
>  OMNIVISION OV9282 SENSOR DRIVER
> -M:     Paul J. Murphy <paul.j.murphy@intel.com>
> -M:     Daniele Alessandrelli <daniele.alessandrelli@intel.com>
>  L:     linux-media@vger.kernel.org
> -S:     Maintained
> +S:     Orphan
>  T:     git git://linuxtv.org/media_tree.git
>  F:     Documentation/devicetree/bindings/media/i2c/ovti,ov9282.yaml
>  F:     drivers/media/i2c/ov9282.c
> --
> 2.39.2
>
