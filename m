Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 83D5038B6B7
	for <lists+linux-media@lfdr.de>; Thu, 20 May 2021 21:07:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236475AbhETTI6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 May 2021 15:08:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232667AbhETTI5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 May 2021 15:08:57 -0400
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com [IPv6:2607:f8b0:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 371E7C061574;
        Thu, 20 May 2021 12:07:36 -0700 (PDT)
Received: by mail-oi1-x231.google.com with SMTP id c196so9205664oib.9;
        Thu, 20 May 2021 12:07:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=tivSZul1r1F6cXTIGetorCc6IvXldYG9DGcrI+56/Vo=;
        b=KwOehk5T3VqGA6Vo0ut4YB3Lvw6MJynXVG9O7X6y6tafaD5A3b+cyRT09CMWB5ErqJ
         ySAG2N+us1IkTFxsPRq7CKazXy7KkUhI/O2f0P9vIQXHZYikaPzqmiwlGLfY+37bLtt1
         kh4/T4dNaZKd42Bi5nLC2gEnVjOWV5G72A6//9A3RCXE9ZpPV9lEN3ULn8uUzb2GSqKw
         1ULAHwJ7UxoGuMqC71u7y/+lEGb98Ml/G0nKzaqJesmr5tJ8rAVwLbw3Ks8heMMOPsTC
         g2DFuRKJNok+bRi+tIuQPft0S5zqYbIpXtUCQs52AcHxPbKh+4I466KGMdDb+DtG4AAs
         YB0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=tivSZul1r1F6cXTIGetorCc6IvXldYG9DGcrI+56/Vo=;
        b=j8X+USPVayNgzp2+qCS2HAY5yBrPJz5nur/xYUM1Cs25i8bLY4LFK1Sbyc/eIq3Tzi
         98udVdDofrnoCoyKNooD35VyhpR/rE8ZQ78BFazhWpctoa6DHCEDLRR5keM1wPjvxAGH
         ebYW9rRDA71AjPCCF7vw2SBQQfc7XX0yUMhhZrRdE/kGKOsPcqSPBw0Kyn5WvePes/jV
         W33CA5Q2finGpVQpiqkRDdMlqHTDq6wrrPlyGNlFlpABZNfUeZuitQvMzrEtUjwIFXwi
         qAmeSdxkxOhXHPfv/q206VAhel6DmpxEgKDs9CocHL+3Qr2iBl4NjeUKn9m32sX7cwXM
         n/mA==
X-Gm-Message-State: AOAM533wGk/x+dbDLkmsBW2EU8lcG2Khl7dlSCEPy5+PWYhflbWHTLH6
        hjlbsI3Erj+bzPo8giHJwoCFQ3lazFrxE057II0=
X-Google-Smtp-Source: ABdhPJzgJB1LgjuwXSwFitmQBsumwTKZiFfIShZ0oIJEvDs0+pTtwXmxx/z6zQxihaCTMwdvsqGQPWV4riB11PMv/LI=
X-Received: by 2002:a05:6808:1592:: with SMTP id t18mr2452836oiw.123.1621537655443;
 Thu, 20 May 2021 12:07:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210520120248.3464013-1-lee.jones@linaro.org>
 <20210520120248.3464013-4-lee.jones@linaro.org> <16b0f3a3-92a8-074c-f926-fba832060a71@amd.com>
In-Reply-To: <16b0f3a3-92a8-074c-f926-fba832060a71@amd.com>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Thu, 20 May 2021 15:07:24 -0400
Message-ID: <CADnq5_O4Uu4yVKLKSoeVFZVyA7XJdMEjdiUdaQm0zHOacLM7iw@mail.gmail.com>
Subject: Re: [PATCH 03/38] drm/radeon/radeon_cs: Fix incorrectly documented
 function 'radeon_cs_parser_fini'
To:     =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc:     Lee Jones <lee.jones@linaro.org>, David Airlie <airlied@linux.ie>,
        LKML <linux-kernel@vger.kernel.org>,
        amd-gfx list <amd-gfx@lists.freedesktop.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>,
        Jerome Glisse <glisse@freedesktop.org>,
        Maling list - DRI developers 
        <dri-devel@lists.freedesktop.org>, Daniel Vetter <daniel@ffwll.ch>,
        Alex Deucher <alexander.deucher@amd.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Applied.  Thanks!

Alex

On Thu, May 20, 2021 at 8:04 AM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Am 20.05.21 um 14:02 schrieb Lee Jones:
> > Fixes the following W=3D1 kernel build warning(s):
> >
> >   drivers/gpu/drm/radeon/radeon_cs.c:417: warning: expecting prototype =
for cs_parser_fini(). Prototype was for radeon_cs_parser_fini() instead
> >
> > Cc: Alex Deucher <alexander.deucher@amd.com>
> > Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> > Cc: David Airlie <airlied@linux.ie>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > Cc: Sumit Semwal <sumit.semwal@linaro.org>
> > Cc: Jerome Glisse <glisse@freedesktop.org>
> > Cc: amd-gfx@lists.freedesktop.org
> > Cc: dri-devel@lists.freedesktop.org
> > Cc: linux-media@vger.kernel.org
> > Cc: linaro-mm-sig@lists.linaro.org
> > Signed-off-by: Lee Jones <lee.jones@linaro.org>
>
> Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
>
> > ---
> >   drivers/gpu/drm/radeon/radeon_cs.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/radeon/radeon_cs.c b/drivers/gpu/drm/radeo=
n/radeon_cs.c
> > index 48162501c1ee6..80a3bee933d6d 100644
> > --- a/drivers/gpu/drm/radeon/radeon_cs.c
> > +++ b/drivers/gpu/drm/radeon/radeon_cs.c
> > @@ -405,7 +405,7 @@ static int cmp_size_smaller_first(void *priv, const=
 struct list_head *a,
> >   }
> >
> >   /**
> > - * cs_parser_fini() - clean parser states
> > + * radeon_cs_parser_fini() - clean parser states
> >    * @parser: parser structure holding parsing context.
> >    * @error:  error number
> >    * @backoff:        indicator to backoff the reservation
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
