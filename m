Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C829430043C
	for <lists+linux-media@lfdr.de>; Fri, 22 Jan 2021 14:33:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727486AbhAVN36 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 22 Jan 2021 08:29:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727455AbhAVN3p (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 22 Jan 2021 08:29:45 -0500
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA3B7C0613D6
        for <linux-media@vger.kernel.org>; Fri, 22 Jan 2021 05:29:04 -0800 (PST)
Received: by mail-wm1-x334.google.com with SMTP id y187so4343273wmd.3
        for <linux-media@vger.kernel.org>; Fri, 22 Jan 2021 05:29:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=owT9ZDTqHXNrbWE+7r0Lrony8G5r+UvHg072nHQs1m8=;
        b=IV9BDspRaepjk9Ex4ccn5wbH1nNpKqXl4rEfsScHxjVPiyJWPnD24oli1MhIZhGOOt
         5OyUyknNAjoE5rPNRt5izFGIdVJCgMqZc3OLBOU6aYT8kKpDFhXbjm2Emct+sNXK+pgT
         wQzpu03L1JLg49FhsdPSUzmkKTAGwjwmB6orEAtgPrjHOtj2j72bePNePfTiPGWuddWz
         sm7lUJYcXiJV5jGKTlz4sFagmBUMxLCyMDik4MHM/lSIMNELIRwj9/kEhrnxYV5sG2OR
         tbq8jumBegYoqpHH34TJ4D0ZgF4joIUPySflSw0vAIsJT6zV3GYbuVlqkznllIuJQNie
         YHhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=owT9ZDTqHXNrbWE+7r0Lrony8G5r+UvHg072nHQs1m8=;
        b=ZYcqpUA3ZleWBQ3Gg1CgkQoiXzBOETb8dLN5mEpuG4AMuf87YkgqXUWz+y+YALpqxU
         8NioHQnSj3HRkg/Hkw7klL//J7lvX8tdhAWNBqXVV+KZAtephrG1u5UqUqd7/bWb7tMM
         odThgigHgdTAPVQytOX5wh/hO5aL6OetK/acLrEPr2SJMmemVm7Yf5z95uf9OGRLxwmv
         rgd4wS//eNIVpugyq0abEXlNREBziYQq2UDeIh8rGUPiBMRfE5IlvqWovGi6YrBJZyff
         K+nmwW1k85i0N5N4z2bZKtF9CPQeXdRkIK8z9j+kKdv2gJcBh86jrRFeyLPlTh7tbYqC
         JIHQ==
X-Gm-Message-State: AOAM533uicVRH1wtqD/Qqcc86xOMaG9T3iwIqOq3+qvQ3gU0zUgY/Mod
        3nMRO/bvMD4nqn3/XRrx/UwYc5Cxw7Kfw+6cYf0zWA==
X-Google-Smtp-Source: ABdhPJz2p5y4L7mSAemntP7ClkJC7I4pddYEtJGeJK0fpUzZ1TeA0drUIpISuCVyOD0oSQ65imTpSrX5n2anLJKUSCw=
X-Received: by 2002:a1c:dc46:: with SMTP id t67mr3858329wmg.183.1611322143536;
 Fri, 22 Jan 2021 05:29:03 -0800 (PST)
MIME-Version: 1.0
References: <20210111142309.193441-1-maxime@cerno.tech> <20210111142309.193441-14-maxime@cerno.tech>
In-Reply-To: <20210111142309.193441-14-maxime@cerno.tech>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Fri, 22 Jan 2021 13:28:48 +0000
Message-ID: <CAPY8ntA1iAj39hzfDLg18bT5ZLA6h738suDubw5hnh=9yhMQsA@mail.gmail.com>
Subject: Re: [PATCH v2 13/15] dt-binding: display: bcm2711-hdmi: Add CEC and
 hotplug interrupts
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     Eric Anholt <eric@anholt.net>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Daniel Vetter <daniel.vetter@intel.com>,
        David Airlie <airlied@linux.ie>,
        linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        LKML <linux-kernel@vger.kernel.org>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        bcm-kernel-feedback-list@broadcom.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Maxime

On Mon, 11 Jan 2021 at 14:23, Maxime Ripard <maxime@cerno.tech> wrote:
>
> The CEC and hotplug interrupts were missing when that binding was
> introduced, let's add them in now that we've figured out how it works.
>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Looks reasonable to me, but I'm not a DT bindings expert

Acked-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  .../bindings/display/brcm,bcm2711-hdmi.yaml   | 20 ++++++++++++++++++-
>  1 file changed, 19 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/display/brcm,bcm2711-hdmi.yaml b/Documentation/devicetree/bindings/display/brcm,bcm2711-hdmi.yaml
> index 7ce06f9f9f8e..6e8ac910bdd8 100644
> --- a/Documentation/devicetree/bindings/display/brcm,bcm2711-hdmi.yaml
> +++ b/Documentation/devicetree/bindings/display/brcm,bcm2711-hdmi.yaml
> @@ -53,6 +53,24 @@ properties:
>        - const: audio
>        - const: cec
>
> +  interrupts:
> +    items:
> +      - description: CEC TX interrupt
> +      - description: CEC RX interrupt
> +      - description: CEC stuck at low interrupt
> +      - description: Wake-up interrupt
> +      - description: Hotplug connected interrupt
> +      - description: Hotplug removed interrupt
> +
> +  interrupt-names:
> +    items:
> +      - const: cec-tx
> +      - const: cec-rx
> +      - const: cec-low
> +      - const: wakeup
> +      - const: hpd-connected
> +      - const: hpd-removed
> +
>    ddc:
>      allOf:
>        - $ref: /schemas/types.yaml#/definitions/phandle
> @@ -90,7 +108,7 @@ required:
>    - resets
>    - ddc
>
> -additionalProperties: false
> +unevaluatedProperties: false
>
>  examples:
>    - |
> --
> 2.29.2
>
