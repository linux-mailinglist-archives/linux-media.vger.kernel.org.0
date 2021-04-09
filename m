Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E300735A3F6
	for <lists+linux-media@lfdr.de>; Fri,  9 Apr 2021 18:50:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234087AbhDIQuR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Apr 2021 12:50:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231402AbhDIQuQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 9 Apr 2021 12:50:16 -0400
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88D0FC061760;
        Fri,  9 Apr 2021 09:50:03 -0700 (PDT)
Received: by mail-pf1-x42f.google.com with SMTP id s11so4628360pfm.1;
        Fri, 09 Apr 2021 09:50:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=EmjR3bywiH9JkVQf06ZFzqn9YgRCejJkL2Con+KKCbI=;
        b=V8ABkSyfJ2sBz25TVDFwf7r0NU1SGiS4xpHo0k1zcRPlACTuYzm5bSux1xoXXB0PT0
         BlDP29UjYU9zC5iCYd2UCUyS24OQGqdkXgu1vXaaU5brVf5v53gMRgaAk/9S2aKr8Bcs
         /yqr7rtt/rsN9zmkcreV8LpTxyJmvmnc+msoyoXolsUjKq9lSGNgtns7eo30uHOWKR4V
         2s5CRA2TDVfLHM3Bo7sdnyzlNPKg0UgZICdMZhQwqA/MepWMB6t3fGLUWtlZtmz0jqR9
         Kq5IlBDVlzemXdAk3quZuHCO86yFmRhBH4kQf/nzagM4ZjbhDSN/p9WUvAgce9ryk0sg
         rGcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=EmjR3bywiH9JkVQf06ZFzqn9YgRCejJkL2Con+KKCbI=;
        b=RCciFT9OQjxxmDcobRWa/j2MdNNyxqar9NVSdGHjlNZoiVBhgx5qmoD3u6kp2BOdsL
         7DFmUUJc4WvNy0aU0mFwAd4+EwcBXsT8ZjqmRkiu9kTw0edYTZpufsCMNfbF5AIFTUVm
         F6PBV+bcJaj1msD2z0nAvN9x79uM1PeLMEpe+xXQIjKWz/tQb9cJ1sCl2Bevwk3WdZ5D
         nok5lG+lndxKHDeW4DDJP8BKmy/8efuLK5GyBPtpSyTA4eD+YguzLwdBinVbS2YiCu3o
         MnJyxn0D/H9VTUSZm9vnmSWdx9OULb5mFsyVIZMfKsRFX0w3q/5HE+WsWyAngnAaMxBk
         SbBA==
X-Gm-Message-State: AOAM532rBBCEDbuUZJVYfSC5hWInI6692q94vg5NNEdsQoQp970x+2Tt
        zr6LDSgEItetTwPTsesS47S7u1jYEwEpUqv6
X-Google-Smtp-Source: ABdhPJz/kGjQCWC42Pk9J5e1J3e2HDye5UhxDnitPlRcxsr2UmlBHVGOW+4tDW35zoLvMSf7qoi0dQ==
X-Received: by 2002:a63:f258:: with SMTP id d24mr13915247pgk.174.1617987003027;
        Fri, 09 Apr 2021 09:50:03 -0700 (PDT)
Received: from kali ([103.141.87.253])
        by smtp.gmail.com with ESMTPSA id z192sm3108490pgz.94.2021.04.09.09.49.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Apr 2021 09:50:02 -0700 (PDT)
Date:   Fri, 9 Apr 2021 22:19:52 +0530
From:   Mitali Borkar <mitaliborkar810@gmail.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     clabbe@baylibre.com, mchehab@kernel.org,
        gregkh@linuxfoundation.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
        outreachy-kernel@googlegroups.com, mitali_s@me.iitr.ac.in
Subject: Re: [PATCH 1/2] media: zoran: add spaces around '<<'
Message-ID: <YHCFsNZVGfjjyHDi@kali>
References: <cover.1617912177.git.mitaliborkar810@gmail.com>
 <8e8ac690d97478f7cbb9b91d46ef7a95e4444e5f.1617912177.git.mitaliborkar810@gmail.com>
 <f196d8ff-e8bf-360e-ee7b-cd2dcafd9742@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f196d8ff-e8bf-360e-ee7b-cd2dcafd9742@xs4all.nl>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Apr 09, 2021 at 09:23:22AM +0200, Hans Verkuil wrote:
> Hi Mitali,
> 
> On 08/04/2021 22:38, Mitali Borkar wrote:
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
> >  
> >  #define ZR36057_VDTR            0x00c	/* Video Display "Top" Register */
> >  
> > 
> 
> I looked at that header and it is very messy.
> 
> Can you make two new patches? The first aligns every nicely, e.g. this:
> 
> #define ZR36057_VFEHCR          0x000   /* Video Front End, Horizontal Configuration Register */
> #define ZR36057_VFEHCR_HS_POL             BIT(30)
> #define ZR36057_VFEHCR_H_START           10
> #define ZR36057_VFEHCR_H_END            0
> #define ZR36057_VFEHCR_HMASK            0x3ff
> 
> should become:
> 
> /* Video Front End, Horizontal Configuration Register */
> #define ZR36057_VFEHCR			0x000
> #define ZR36057_VFEHCR_HS_POL		BIT(30)
> #define ZR36057_VFEHCR_H_START		10
> #define ZR36057_VFEHCR_H_END		0
> #define ZR36057_VFEHCR_HMASK		0x3ff
> 
> Same for all the other register blocks. Use tabs to do the alignment
> instead of spaces, as is currently the case.
>
> The second patch can replace the (0<<3) etc. to BIT(0).
>
Then I guess only one new patch would be needed for proper alignment, am
i right? I have to rename it as v2 or should send as a completely new
patch?
> That would be a nice cleanup of this rather messy header.
> 
> Thanks!
> 
> 	Hans
