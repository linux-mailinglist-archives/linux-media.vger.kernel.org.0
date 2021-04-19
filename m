Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2699364CFA
	for <lists+linux-media@lfdr.de>; Mon, 19 Apr 2021 23:22:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240387AbhDSVWz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Apr 2021 17:22:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229734AbhDSVWz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Apr 2021 17:22:55 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C5FFC06174A
        for <linux-media@vger.kernel.org>; Mon, 19 Apr 2021 14:22:24 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id y4so18066401lfl.10
        for <linux-media@vger.kernel.org>; Mon, 19 Apr 2021 14:22:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=WmaOGhyUbG713F95ri5jWwMnBhMblEyAHXBVkDc/tu4=;
        b=XXSnNYUuQD/Dwp0XisKwmMeF3aM2bgvP0RXAq7x/vul8a+5iGb8asGRJciLOTA4Zwg
         azZEjn0XJIaxH340p/VXl4jJ+R+OpGpr5hdITxd5toPqHIDq0wGd0Yu2GglWiZiwex1u
         miPq6Yrjtol/RuZalsXTgGwgrYVSayE1TyjWly2d+DjU0L83FPFdV+/fTrL9DxotiETR
         0H+U5ya9nors6DfH4W3QiLJ8n25+G+BUbGf8ObH31wt5vCuwcMboMsxKWH4vJ7XFh19P
         KPW3I1eIy29YpgcZev7OIO2Rtyt76TLYstucmnkhwnCGPPeE3mfiB02hVwBgB3JL6Ujf
         lnPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=WmaOGhyUbG713F95ri5jWwMnBhMblEyAHXBVkDc/tu4=;
        b=GiZLhOwpSIqLI8Gb3AkRXvSVVbDPULaAXyd7C5F7H73jEd5D1r9xmaVfHj6EjI/yhF
         q+BPvh4fdF9s390dmMRdMjFt/4dLNJjHf7Lk+LvY+H6mpSaHnATo0WBC0EnbKSCxJD1D
         QFZUQHw9ab9YypbJqPgyYs2H9OJFCHfEk9VTYPWKtJgrYhugJNbDApBZ2QhsFFyXYdFM
         U9EwOmx0/f5nptBKIjMdtZD3seJpucq4xshr/PjQtV+Ces8PmwM4DL/wOkABpav8bZFI
         h/SNLUazj08hynk+MUDFEQpksnmXo9tk1vRKaV05jBvlTcLfwr+h9HJ7rEEdC+7KSu5d
         dyhA==
X-Gm-Message-State: AOAM530iwvEOOM8JoelrtaBC03XiwPe2GS7ylq4iezebwbw9738yX4uO
        XORQv9Z7oSV8DB3IYf0OPLB/1g==
X-Google-Smtp-Source: ABdhPJyNLXKrNxP0caVJhzF/53nJ17L7AmzTMko7JUMB/Nqoxnb2nZWWNItE0Y30BDyo+yeFyar09w==
X-Received: by 2002:a05:6512:3b0d:: with SMTP id f13mr13146353lfv.164.1618867342257;
        Mon, 19 Apr 2021 14:22:22 -0700 (PDT)
Received: from localhost (h-209-203.A463.priv.bahnhof.se. [155.4.209.203])
        by smtp.gmail.com with ESMTPSA id c7sm600149lfv.31.2021.04.19.14.22.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Apr 2021 14:22:21 -0700 (PDT)
Date:   Mon, 19 Apr 2021 23:22:21 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org
Subject: Re: [PATCH] configure.ac: Resolve GIT_SHA even if repository is a
 submodule
Message-ID: <YH30jV7Tyfe/89xA@oden.dyn.berto.se>
References: <20210419182832.577010-1-niklas.soderlund@ragnatech.se>
 <dd9a9dde-2c39-1472-a71b-f6039993fce2@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <dd9a9dde-2c39-1472-a71b-f6039993fce2@xs4all.nl>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On 2021-04-19 23:10:37 +0200, Hans Verkuil wrote:
> On 19/04/2021 20:28, Niklas Söderlund wrote:
> > If the v4l-utils repository is a git submodule the $(top_srcdir)/.git is
> > a file and not a directory. Update the shell check to allow the test to
> > pass in both cases.
> > 
> > Signed-off-by: Niklas Söderlund <niklas.soderlund@ragnatech.se>
> > ---
> >  configure.ac | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/configure.ac b/configure.ac
> > index f144a50d034fbda0..4ac4195cd6e4747e 100644
> > --- a/configure.ac
> > +++ b/configure.ac
> > @@ -588,7 +588,7 @@ fi
> >  CPPFLAGS="-I\$(top_srcdir)/lib/include -Wall -Wpointer-arith -D_GNU_SOURCE $CPPFLAGS"
> >  
> >  # Obtain git SHA of HEAD
> > -AC_SUBST(GIT_SHA, ["-DGIT_SHA=\$(shell if test -d \$(top_srcdir)/.git ; then git -C \$(top_srcdir) rev-parse --short=12 HEAD ; fi)"])
> > +AC_SUBST(GIT_SHA, ["-DGIT_SHA=\$(shell if test -e \$(top_srcdir)/.git ; then git -C \$(top_srcdir) rev-parse --short=12 HEAD ; fi)"])
> >  
> >  # Obtain git commit count of HEAD
> >  AC_SUBST(GIT_COMMIT_CNT, ["-DGIT_COMMIT_CNT=\$(shell if test -d \$(top_srcdir)/.git ; then printf '-'; git -C \$(top_srcdir) rev-list --count HEAD ; fi)"])
> 
> Isn't the same change needed here and in GIT_COMMIT_DATE as well?

Wops, you are correct. I noticed the problem in an older branch where 
version.h was generated in different utilities and this is a bad 
conflict fix of that.

Do you want me to resend?

> 
> Regards,
> 
> 	Hans
> 
> > 
> 

-- 
Regards,
Niklas Söderlund
