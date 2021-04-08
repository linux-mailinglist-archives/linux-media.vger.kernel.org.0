Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C07F358F3B
	for <lists+linux-media@lfdr.de>; Thu,  8 Apr 2021 23:34:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232628AbhDHVew (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Apr 2021 17:34:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232613AbhDHVev (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 8 Apr 2021 17:34:51 -0400
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1BA8C061760;
        Thu,  8 Apr 2021 14:34:38 -0700 (PDT)
Received: by mail-pf1-x434.google.com with SMTP id g15so2825786pfq.3;
        Thu, 08 Apr 2021 14:34:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=y+PxuwGIyeW4oHOMlrWipwVHOGtXMFa2LYI1MnFtX9o=;
        b=WxuXKRi4dHO7pKQVkIYyAvEfHjXzr3pp4HATc7/w4DeUuWLqUdWBZKKgMkw5Vm0pcg
         28HhB7Bf6c7hL5ZAP+l1ZW05K04AihtUvwEL/6n0EpVEvJwz1E3DKK0bpgutRpGmA5BY
         wXlegv2YFKRRbD9Nia67d+OIsxlRxuQGOc6mBhZ5Z13dCcj39XoeDleJYegPNyJs+lnM
         tySi6K/HWk2bTQRGU0zbJ/GY8A460fD0ItohJJuAgWViQ7CCGXIL8WgJxD8lYRMpwiLj
         KaGFUxyiU6lFMr0C7AAxHyK8PaoUSqdiGbjYcnMOIpSj3QpTgWRv6n/rJCpJTL9Ps4Ot
         57yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=y+PxuwGIyeW4oHOMlrWipwVHOGtXMFa2LYI1MnFtX9o=;
        b=L0Fs6WNtOY/TIiL7sNvf+IvmaXftyld8uHwzpIRursS+UnnNkuKUN2m78hpgfID48+
         6OdPn+ezCp2rrHjWXE/MgZ/1UmnTFsdcVOu+CskxOfwF+BQiUzYrwNItcSBu3aroHBkB
         CcyOvHQlAd7X3Fq7PdjAqCEOFz0I8Q2izTzYpbS+QSc41z2ETLO1PL91UsaUlEoHVGO/
         LkE+Q9r/GijcS6wY7ZJ1TeLqCSOE/USTKphGIO5mP6epFxBNf/btAnCReg1yKFPfo1K9
         y9LU/IgiQ7Eq3OA0rjFcssZchAPVBtrH7z6cIaU/Dhp6+D61VXGiKIf57QEQZdabLu3j
         ev+Q==
X-Gm-Message-State: AOAM532dMCRTs+C9oddRMZAkaEwEBRFblIYYI+9DGO5dPqiop34J5uwO
        MYm3/RiYDlADVDa0Z8EfnVs=
X-Google-Smtp-Source: ABdhPJwTOn0uwIGyTr2hiRJaUCVTKq9GHe/PDtVbG9trLtvquHldDi6409zVui1dxSvQ8GPr7Xo2zQ==
X-Received: by 2002:a63:c446:: with SMTP id m6mr9586932pgg.71.1617917678281;
        Thu, 08 Apr 2021 14:34:38 -0700 (PDT)
Received: from kali ([152.57.243.224])
        by smtp.gmail.com with ESMTPSA id s2sm305833pjs.49.2021.04.08.14.34.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 14:34:37 -0700 (PDT)
Date:   Fri, 9 Apr 2021 03:04:27 +0530
From:   Mitali Borkar <mitaliborkar810@gmail.com>
To:     Julia Lawall <julia.lawall@inria.fr>
Cc:     clabbe@baylibre.com, mchehab@kernel.org,
        gregkh@linuxfoundation.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
        outreachy-kernel@googlegroups.com, mitali_s@me.iitr.ac.in
Subject: Re: [Outreachy kernel] [PATCH 1/2] media: zoran: add spaces around
 '<<'
Message-ID: <YG9242K4F5xjaOq8@kali>
References: <cover.1617912177.git.mitaliborkar810@gmail.com>
 <8e8ac690d97478f7cbb9b91d46ef7a95e4444e5f.1617912177.git.mitaliborkar810@gmail.com>
 <alpine.DEB.2.22.394.2104082315560.21785@hadrien>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2104082315560.21785@hadrien>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Apr 08, 2021 at 11:16:41PM +0200, Julia Lawall wrote:
> 
> 
> On Fri, 9 Apr 2021, Mitali Borkar wrote:
> 
> > Added spaces around '<<' operator to improve readability and meet linux
> > kernel coding style.
> > Reported by checkpatch
> >
> > Signed-off-by: Mitali Borkar <mitaliborkar810@gmail.com>
> > ---
> >  drivers/staging/media/zoran/zr36057.h | 14 +++++++-------
> >  1 file changed, 7 insertions(+), 7 deletions(-)
> >
> > diff --git a/drivers/staging/media/zoran/zr36057.h b/drivers/staging/media/zoran/zr36057.h
> > index 71b651add35a..a2a75fd9f535 100644
> > --- a/drivers/staging/media/zoran/zr36057.h
> > +++ b/drivers/staging/media/zoran/zr36057.h
> > @@ -30,13 +30,13 @@
> >  #define ZR36057_VFESPFR_HOR_DCM          14
> >  #define ZR36057_VFESPFR_VER_DCM          8
> >  #define ZR36057_VFESPFR_DISP_MODE        6
> > -#define ZR36057_VFESPFR_YUV422          (0<<3)
> > -#define ZR36057_VFESPFR_RGB888          (1<<3)
> > -#define ZR36057_VFESPFR_RGB565          (2<<3)
> > -#define ZR36057_VFESPFR_RGB555          (3<<3)
> > -#define ZR36057_VFESPFR_ERR_DIF          (1<<2)
> > -#define ZR36057_VFESPFR_PACK24          (1<<1)
> > -#define ZR36057_VFESPFR_LITTLE_ENDIAN    (1<<0)
> > +#define ZR36057_VFESPFR_YUV422          (0 << 3)
> > +#define ZR36057_VFESPFR_RGB888          (1 << 3)
> > +#define ZR36057_VFESPFR_RGB565          (2 << 3)
> > +#define ZR36057_VFESPFR_RGB555          (3 << 3)
> > +#define ZR36057_VFESPFR_ERR_DIF          (1 << 2)
> > +#define ZR36057_VFESPFR_PACK24          (1 << 1)
> > +#define ZR36057_VFESPFR_LITTLE_ENDIAN    (1 << 0)
> 
> Are these all aligned in the actual file?
>
No Ma'am, they were not aligned in the actual file.

> julia
> 
> >  #define ZR36057_VDTR            0x00c	/* Video Display "Top" Register */
> >
> > --
> > 2.30.2
> >
> > --
> > You received this message because you are subscribed to the Google Groups "outreachy-kernel" group.
> > To unsubscribe from this group and stop receiving emails from it, send an email to outreachy-kernel+unsubscribe@googlegroups.com.
> > To view this discussion on the web visit https://groups.google.com/d/msgid/outreachy-kernel/8e8ac690d97478f7cbb9b91d46ef7a95e4444e5f.1617912177.git.mitaliborkar810%40gmail.com.
> >
