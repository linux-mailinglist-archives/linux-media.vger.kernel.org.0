Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D98535A88A
	for <lists+linux-media@lfdr.de>; Sat, 10 Apr 2021 00:03:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234654AbhDIWD0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Apr 2021 18:03:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234079AbhDIWDZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 9 Apr 2021 18:03:25 -0400
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B8A2C061762;
        Fri,  9 Apr 2021 15:03:12 -0700 (PDT)
Received: by mail-pf1-x42b.google.com with SMTP id m11so5109679pfc.11;
        Fri, 09 Apr 2021 15:03:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=R+gAfsPgzIf+Vl+2Q04sIKqvI+NoEh91IwRV5HMRlM0=;
        b=g3RNUqs8G26UV5PlGVkTztahx/7bKGHr+sYgfG4imRFlBMgoDJI9C7pwQ2CTn8wz5r
         v0XuNcMwKtLD5c1BOZLiqTqt5g2r+Un4sRSoR0NfZVz4Ew7xk2HygOR/UWH7iI3yhSl/
         maNigIJiklSniZqpDgmMrQZteFPltUPVXVAwKaAreYzW6lpEXo/4EuVOySxoYq8yPRAU
         JU4CfadOdglrryEyoR9kxPF8vUy2XqUATEIxzjmotR7ZTPTzmJr+3yn3uSPlbk0SqX64
         lTUQh0wrdC4GEUfIagzehhSwzO2jA+2TTZBpnv2rWu9UWCfPgkUkY+kvnaMM4GXNorC0
         3YCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=R+gAfsPgzIf+Vl+2Q04sIKqvI+NoEh91IwRV5HMRlM0=;
        b=G0DuWdDPElXE4CD+Ehy067NFWTpKH1SV7qLShYg283D+pjq62zjQ5S1Ww4MEPob/7u
         rjtChFZMRwLYDWZuzdIF675u7On1lfilqp9BHiO1BRpsEjnQWsrToVoHcGJ7+/r7v1LP
         Dx/nqygObJ71cTa87rJfesSnEFReQpNQynFgPvx5UK9WkikZCR7d9TDTgY1WQWho1dxH
         KapcR1rBbHX0g0MUmIAKxsozyzx07JPWf1mmQ9X8r6DzjBzBd4DrPPYIP3W2Jl5hzZHs
         mNCi4K+/qo4oINfYYpB6wbw3Kybamz6FOs/VOecq8QE534X6pA37q1kY8TjeuWBSJ/Zq
         0cXQ==
X-Gm-Message-State: AOAM532tdKrFo7PSV4Lzj/aIeonQX1KfDBulXraZ/6pm3/OFp4KsuiTS
        UnTfCP11XvJiYuw1nNldMEJPPLx95V4N+gDE
X-Google-Smtp-Source: ABdhPJw96bm87v9sMiU6oXKtctDcc+9dIDthQ0Sd1Ac5EwRMOpcMlKkwUf6ufEEl02/Ql7N1Z8XUbQ==
X-Received: by 2002:aa7:818e:0:b029:215:2466:3994 with SMTP id g14-20020aa7818e0000b029021524663994mr14788264pfi.48.1618005791570;
        Fri, 09 Apr 2021 15:03:11 -0700 (PDT)
Received: from kali ([103.141.87.253])
        by smtp.gmail.com with ESMTPSA id e190sm3147248pfe.3.2021.04.09.15.03.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Apr 2021 15:03:11 -0700 (PDT)
Date:   Sat, 10 Apr 2021 03:33:05 +0530
From:   Mitali Borkar <mitaliborkar810@gmail.com>
To:     Julia Lawall <julia.lawall@inria.fr>
Cc:     clabbe@baylibre.com, mchehab@kernel.org,
        gregkh@linuxfoundation.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
        outreachy-kernel@googlegroups.com, mitali_s@me.iitr.ac.in
Subject: Re: [Outreachy kernel] [PATCH v2 1/2] media: zoran: add spaces
 around '<<'
Message-ID: <YHDPGVo1mTYtPigo@kali>
References: <YHCgksbiLv0pFF2F@kali>
 <alpine.DEB.2.22.394.2104092239170.23056@hadrien>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2104092239170.23056@hadrien>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Apr 09, 2021 at 10:40:25PM +0200, Julia Lawall wrote:
> 
> 
> On Sat, 10 Apr 2021, Mitali Borkar wrote:
> 
> > No changes required in this patch.
> > In v1:- Added spaces around '<<' operator to improve readability and meet linux kernel coding
> > style
> 
> The text above would go in the git history.  "No changes required in this
> patch." doesn't make sense in that context.  If you want to say something
> that relates to the history of the submitted patches, then that should be
> under the ---.  The text there will disappear when the patch is applied.
>
Ok Ma'am, I will rectify this mistake and send patch v3 with correct
patch body.

> julia
> 
> 
> >
> > Signed-off-by: Mitali Borkar <mitaliborkar810@gmail.com>
> > ---
> >
> > Changes from v1:- No changes required in this patch. Below is the git
> > diff of v1.
> >
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
> >
> >  #define ZR36057_VDTR            0x00c	/* Video Display "Top" Register */
> >
> > --
> > 2.30.2
> >
> > --
> > You received this message because you are subscribed to the Google Groups "outreachy-kernel" group.
> > To unsubscribe from this group and stop receiving emails from it, send an email to outreachy-kernel+unsubscribe@googlegroups.com.
> > To view this discussion on the web visit https://groups.google.com/d/msgid/outreachy-kernel/YHCgksbiLv0pFF2F%40kali.
> >
