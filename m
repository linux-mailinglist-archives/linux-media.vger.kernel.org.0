Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A02F74A7276
	for <lists+linux-media@lfdr.de>; Wed,  2 Feb 2022 15:00:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344581AbiBBOAZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Feb 2022 09:00:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232239AbiBBOAY (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Feb 2022 09:00:24 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D7AEC06173B
        for <linux-media@vger.kernel.org>; Wed,  2 Feb 2022 06:00:24 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id u14so40815068lfo.11
        for <linux-media@vger.kernel.org>; Wed, 02 Feb 2022 06:00:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=RfWPagEh50UG5AQsw4YG/NPcNcgAiuaDDHKAvh28Pfo=;
        b=gWuBXj+qXx0RfDEcvw60W9ulUvSlUlHE8bFwjkCfpL4a47/GFof5cDKoPsXVQOVdfv
         EoO/yOcOEOxWxZ+MjVdX7iyZPFgVwM02RaYqc2bEldH7dNpAk8Gz7W8FP+iIox80alGi
         ki+u1RmCp17bDsTFYcmQTQih55MQLrYSwxFrcA4IxoD4E9dIIAwpfYriXo1sCRgdWBYN
         Xaaq1tg/2s9jh+qpLM4o79OewjUhdEwvIJoUI42zNqiwAcbE0jU17Q/h7u1dRGdK/dUc
         1zc/YOEkzjGJLcIWNOwDw5RydsIi2qQrrtwGpClnqtKYbpzyMK8KHPOjxihh0nCbMYXH
         ue4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=RfWPagEh50UG5AQsw4YG/NPcNcgAiuaDDHKAvh28Pfo=;
        b=fHW/k/c/3TwhRgj35X89Nv+sx6eKha5+WC7sWxOoWexTQfxJA8nfgz6w58tnzvfJ5L
         13ruqoE1Y9At64Ud+71nYa1NxPFl0oJFHKrcHndaM9/QsWKMmPyjI27W5n6dEbznGXnA
         AA4MkD8R8fju0BB5tbkjp9m6kKa+UqKUfzoHO9utNiepepxTIfzJYfjUWMd58eEVAYgA
         quoTWAynOjRQwTluEWkVveS801m2uEPMpe4YTZAJrdvip34mnCTLpCWSImt43+YG0sIY
         //UxCK9+a0XXPCCK6MCoqo6naUDqp0C35x/UHeCHcJPvkE1B6wKKXAe7e0fnyNOigzZV
         Agcw==
X-Gm-Message-State: AOAM5322YaaRmRFQBCEDtoduag0ALfs6C5dM3X+TWYfcTHfLb7vw1JT3
        0M2WKbJhoyY7LFSnTovY/gfjH4z4EkBwQxtHj35NZw==
X-Google-Smtp-Source: ABdhPJyStv54EPifbmyjjo5mPhJzT0KvmzQ4l/aBbOIzs2lV1jYzKtxILnikfpnxSP/qWf4MckalpLs8F3T1He52QnI=
X-Received: by 2002:a05:6512:2342:: with SMTP id p2mr23187896lfu.382.1643810422358;
 Wed, 02 Feb 2022 06:00:22 -0800 (PST)
MIME-Version: 1.0
References: <20220202091134.3565514-1-lucas.demarchi@intel.com>
 <514cdee2-655e-7e52-d6a5-a7176ee603cc@amd.com> <20220202093814.i5z2nmlunrwm2n6c@ldmartin-desk2>
In-Reply-To: <20220202093814.i5z2nmlunrwm2n6c@ldmartin-desk2>
From:   Sumit Semwal <sumit.semwal@linaro.org>
Date:   Wed, 2 Feb 2022 19:30:10 +0530
Message-ID: <CAO_48GGeZqzAMEBfspWAR5N1RWh0QAdQFSxgyhrPQHiE3ooJsA@mail.gmail.com>
Subject: Re: [PATCH v2] dma-buf-map: Rename to iosys-map
To:     Lucas De Marchi <lucas.demarchi@intel.com>
Cc:     =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        intel-gfx@lists.freedesktop.org, srinivas.kandagatla@linaro.org,
        gregkh@linuxfoundation.org, daniel.vetter@ffwll.ch,
        airlied@linux.ie, lyude@redhat.com, tzimmermann@suse.de,
        linux-media@vger.kernel.org, nouveau@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Lucas,

On Wed, 2 Feb 2022 at 15:08, Lucas De Marchi <lucas.demarchi@intel.com> wro=
te:
>
> On Wed, Feb 02, 2022 at 10:25:28AM +0100, Christian K=C3=B6nig wrote:
> >Am 02.02.22 um 10:11 schrieb Lucas De Marchi:
> >>[SNIP]
> >>diff --git a/MAINTAINERS b/MAINTAINERS
> >>index d03ad8da1f36..112676f11792 100644
> >>--- a/MAINTAINERS
> >>+++ b/MAINTAINERS
> >>@@ -5675,7 +5675,6 @@ T:      git git://anongit.freedesktop.org/drm/drm=
-misc
> >>  F:  Documentation/driver-api/dma-buf.rst
> >>  F:  drivers/dma-buf/
> >>  F:  include/linux/*fence.h
> >
> >Oh, that is not correct to begin with.
>
> right, include/linux/dma-fence*
>
> >
> >>-F:   include/linux/dma-buf*
> >
> >That here should probably be changed to point directly to
> >include/linux/dma-buf.h, but that can come later on.
>
> thanks for catching that. I will change it on next version and add your
> (and any additional) ack.
>
> Lucas De Marchi
>
> >
> >Feel free to add an Acked-by: Christian K=C3=B6nig
> ><christian.koenig@amd.com> to the patch.
> >
> >If nobody objects I'm going to push it drm-misc-next and provide a
> >follow up to cleanup the MAINTAINERS file a bit more.
Thank you for the patch; apologies for not being able to respond
earlier (was out due to covid, just getting back slowly).

With Christian's suggestions, looks good to me as well - feel free to add a=
n
Acked-by: Sumit Semwal <sumit.semwal@linaro.org> to the same.

> >
> >Regards,
> >Christian.
Best,
Sumit.

> >
> >>  F:  include/linux/dma-resv.h
> >>  K:  \bdma_(?:buf|fence|resv)\b
> >>@@ -9976,6 +9975,13 @@ F:     include/linux/iova.h
> >>  F:  include/linux/of_iommu.h
> >>  F:  include/uapi/linux/iommu.h
> >>+IOSYS-MAP HELPERS
> >>+M:   Thomas Zimmermann <tzimmermann@suse.de>
> >>+L:   dri-devel@lists.freedesktop.org
> >>+S:   Maintained
> >>+T:   git git://anongit.freedesktop.org/drm/drm-misc
> >>+F:   include/linux/iosys-map.h
> >>+
> >
