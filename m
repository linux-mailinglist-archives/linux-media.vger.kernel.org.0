Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 596977A82A5
	for <lists+linux-media@lfdr.de>; Wed, 20 Sep 2023 15:04:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234825AbjITNEx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 Sep 2023 09:04:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236450AbjITNEo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 Sep 2023 09:04:44 -0400
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com [IPv6:2607:f8b0:4864:20::1135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23206DC
        for <linux-media@vger.kernel.org>; Wed, 20 Sep 2023 06:04:38 -0700 (PDT)
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-59e8d963adbso38728867b3.0
        for <linux-media@vger.kernel.org>; Wed, 20 Sep 2023 06:04:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1695215077; x=1695819877; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=evG1Zzu5MHbT0QaEmhnQ2LvfVCn6j0mpc9St01PR1M0=;
        b=FugDn6EpiadTO38dqNq1R7qXEcJ65y9jHHfjMPb7YCuVI/O4fiJmJI2eLa22Ornc6E
         6yI1XRvDosjZR6r6j8Fdo13xf+moqa/1+GN/50Atp79WHRC8XjcCD0w0Di4AiSiSSu4Q
         fuLkT0rG5fLf3Lf6W5X+GeShFw9le9l2oNKSjXDiLeLC14JOWq/V8XkqJWaD9LUPQEMH
         DZqii9mXnHNFUC10w/wunmENkrTzkKEvaTztwuA8d77Aqv+Yc7gyey0VlcqEThUKoGN0
         cdWYDLq2tqkkIKSZeTHeaxLSifI/8eUkCsWXNYYf+8eGqnIf5HQ8OEjvEqDe8JLV/sIj
         ChHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695215077; x=1695819877;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=evG1Zzu5MHbT0QaEmhnQ2LvfVCn6j0mpc9St01PR1M0=;
        b=MG4d8NqMblRNtQinAP58zIAAt3WhD2Dvl+feeRBKWhht6hgGTuc8RjxfBfCvlxtJwj
         /hJUFTqnyiXQtxDRVstpayilO6/sXi1pHzd13m45GcrC5xYr9HA9RXhEXKkjTZ4dkuqK
         T3bDpjBMB4R9O08cVbCTC30hD5EvIY2FK7nkpOGiPgbuMfWj2sPWy7YuDLzecwyYJ5MI
         3gwrWyb0GKnAjuxUiDmiUAVASUekvT9he1Onok3rDqnAmAe/4SALLfaMqI2y1dMESd7X
         ffhS5oRDPUV70UDHIWgpUzxV3gw47zHaqZXfIi9k0PyVbEIYUzvrNIUvYTz46cqErUh8
         Lyhg==
X-Gm-Message-State: AOJu0YynF+Pewy2UwLb8NE49uMlAfrJbGIxD1pv7/ZZQTJ96Gyc8FMN/
        647f95h0na9HNNRw0v1I5XcJswh4oAY/QVCrTnvaRA==
X-Google-Smtp-Source: AGHT+IEWvyN7a5pRgzMoHIv726ndFxUvG88cuztx87dBjGmGmWCzMiRDZGycUpW2kARQBKQbTCxAjs4s/g2JV+hO1MM=
X-Received: by 2002:a0d:dd4f:0:b0:55a:3ce9:dc3d with SMTP id
 g76-20020a0ddd4f000000b0055a3ce9dc3dmr2399026ywe.13.1695215075843; Wed, 20
 Sep 2023 06:04:35 -0700 (PDT)
MIME-Version: 1.0
References: <20230919111540.2344757-2-sakari.ailus@linux.intel.com> <20230920122831.2386821-1-sakari.ailus@linux.intel.com>
In-Reply-To: <20230920122831.2386821-1-sakari.ailus@linux.intel.com>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Wed, 20 Sep 2023 14:04:20 +0100
Message-ID: <CAPY8ntBpAPZgLd7FC01wtXeq0JDS6bwnzdPfZzhGetTNe57yrg@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] media: ov9282: Assign maintenance to Dave
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org,
        "Alessandrelli, Daniele" <daniele.alessandrelli@intel.com>,
        "Murphy, Paul J" <paul.j.murphy@intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 20 Sept 2023 at 13:30, Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
>
> The current maintainers won't be looking after this driver anymore. Dave
> offered to take over the driver, assign maintenance to him.
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Acked-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  MAINTAINERS | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 980b141856e1..d03a1428080f 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -15862,8 +15862,7 @@ F:      Documentation/devicetree/bindings/media/i2c/ovti,ov8858.yaml
>  F:     drivers/media/i2c/ov8858.c
>
>  OMNIVISION OV9282 SENSOR DRIVER
> -M:     Paul J. Murphy <paul.j.murphy@intel.com>
> -M:     Daniele Alessandrelli <daniele.alessandrelli@intel.com>
> +M:     Dave Stevenson <dave.stevenson@raspberrypi.com>
>  L:     linux-media@vger.kernel.org
>  S:     Maintained
>  T:     git git://linuxtv.org/media_tree.git
> --
> 2.39.2
>
