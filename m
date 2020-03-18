Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6D46E189FE7
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2020 16:46:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726911AbgCRPqa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Mar 2020 11:46:30 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:33813 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726866AbgCRPqa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Mar 2020 11:46:30 -0400
Received: by mail-ot1-f65.google.com with SMTP id j16so25973160otl.1
        for <linux-media@vger.kernel.org>; Wed, 18 Mar 2020 08:46:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=id6fBYRzTbPVezHvRzigBUZtyyZNpNKX7bIyeQ3xLJM=;
        b=ZqY5AWHXrV9Z2i8Ua3vsaXc3to2MTtBlwtEXOAVw9RupFkSH1bX6L0cTqQDlwqErWb
         eomul9v2lD950rkiS2a3jZwWiAsWjYXZrR8M08zA59FVXYUq2pYVkUxqdViqpwow6hhW
         FoMJAtslfTAk3nhnW2Vn9bjp2QrldSTw0/1RUEf+XHEPlzHVg8d2h67gK9F5UPDdogwi
         F3cRlXyOuE51QSLJaSnfl8ECEjYS9ZWxtkwcx/YH/PTOxO/A1sk9G67aTh5bQqmoJa5V
         1enPYeqqN2ThSayKVcx8K7gywVPMjaaRznUF+j7FWO5+TRBcx8VpnA4b0TZLaBDDXVe4
         UfUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=id6fBYRzTbPVezHvRzigBUZtyyZNpNKX7bIyeQ3xLJM=;
        b=InV1kPaspIFFGGrp9ed8AsScIt8qYmjFfzuZi4WYlCmoyfawkYY7QzXwr3+XFtSgWF
         BMFeAaCjer+F48Qi+JAPy3qwG/CUHgkm5CbwhYriOKwVFyYfZILLYub6XC0q0lMnqY6a
         lwNNZSkinaGU+kGoSa2YouaC1bfH+hsIffNqI6XmEBOV2VG8y+QP2cS5NkKONqYcwjIx
         4m7tooyd0Zyq2lC6v5GO7/GwRUO303kZ0QaiNyO0Xs0z8VkoO+QJmOrJ1nzLDMhaNzgm
         tjSx74TzFoefQhOLD+JTtd/15S/bmc0rW9GEKlb6756rbbPCKpjxlau8C+ha8PLzUCJg
         QrOw==
X-Gm-Message-State: ANhLgQ2CqcTiUq+thP0NoeyJiweI84oEU0UOqgGcrUBdY/esUTOTVyDj
        REcIbWMMmIEOmP/vG3UclHQ7cFXbZQCU6JFA7neRaw==
X-Google-Smtp-Source: ADFU+vvX20CIlM83oLPc+apgYzRAvWB4Y3fF6uDgiS0UN5JGeqEbtOLb0rxc9QNhm7ohNQlk5lyNBFi0+55SbHMyakg=
X-Received: by 2002:a05:6830:193:: with SMTP id q19mr4286283ota.164.1584546389617;
 Wed, 18 Mar 2020 08:46:29 -0700 (PDT)
MIME-Version: 1.0
References: <20200317205643.1028398-1-daniel.vetter@ffwll.ch>
In-Reply-To: <20200317205643.1028398-1-daniel.vetter@ffwll.ch>
From:   Sumit Semwal <sumit.semwal@linaro.org>
Date:   Wed, 18 Mar 2020 21:16:17 +0530
Message-ID: <CAO_48GH1YkA4mvjyQ=88VRrDPc4Kh8fiFsm-MOaNFfWhhaxfbw@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Better regex for dma_buf|fence|resv
To:     Daniel Vetter <daniel.vetter@ffwll.ch>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>,
        DRI mailing list <dri-devel@lists.freedesktop.org>,
        Linaro MM SIG <linaro-mm-sig@lists.linaro.org>,
        Joe Perches <joe@perches.com>, Sam Ravnborg <sam@ravnborg.org>,
        Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Daniel,

Thanks for the patch.

On Wed, 18 Mar 2020 at 02:26, Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
>
> We're getting some random other stuff that we're not really interested
> in, so match only word boundaries. Also avoid the capture group while
> at it.
>
> Suggested by Joe Perches.
>
> Cc: linux-media@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: linaro-mm-sig@lists.linaro.org
> Cc: Joe Perches <joe@perches.com>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>

Acked-by: Sumit Semwal <sumit.semwal@linaro.org>
> ---
> v2: No single quotes in MAINTAINERS (Joe)
> v3: Fix typo in commit message (Sam)
> ---
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 3005be638c2c..ed6088a01bfe 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -5025,7 +5025,7 @@ F:        include/linux/dma-buf*
>  F:     include/linux/reservation.h
>  F:     include/linux/*fence.h
>  F:     Documentation/driver-api/dma-buf.rst
> -K:     dma_(buf|fence|resv)
> +K:     \bdma_(?:buf|fence|resv)\b
>  T:     git git://anongit.freedesktop.org/drm/drm-misc
>
>  DMA-BUF HEAPS FRAMEWORK
> --
> 2.25.1
>
