Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1DBA54407F8
	for <lists+linux-media@lfdr.de>; Sat, 30 Oct 2021 10:07:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231732AbhJ3IJj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 30 Oct 2021 04:09:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231693AbhJ3IJj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 30 Oct 2021 04:09:39 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40E46C061570;
        Sat, 30 Oct 2021 01:07:09 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id g8so46766781edb.2;
        Sat, 30 Oct 2021 01:07:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=SPF2iTqNQ47jl+38IdpqMTtVV7waJyN5hBA4x+MNlrE=;
        b=ludYEpet+Ep1tV4g4S8HbbHftD0LZ5wRIQNOYNM9dyhgjfU6ZtijGlJmCu4EyXMKWQ
         C034Vw16PLjUFBRLVaB3WZC0f1+e1z3lCT2HA39f9siG/w5gYTHhEchxTJbyi59vm1Li
         ijZY9cDkaK92gnNApFmWVSTZaarKBzlwoF6rr1d6iY7sfC/3Dof6b/bcXXHwk8fhVamr
         hCCdDBu4gigf+Ger7iouJ2CGESQYerYsmMEoVRGve2GWu1TzSDGnXmursV2KE53zQr4f
         X0HohI6J0OUXt5HQBexpSXRVVh6f4p8pDI+TZzI1BAqX/63zZ65pLI1eRQZsqtoTU+gX
         sE3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to;
        bh=SPF2iTqNQ47jl+38IdpqMTtVV7waJyN5hBA4x+MNlrE=;
        b=bU0FdmZj+ZGO90nU9v997S9O9rUCPvFJKzcTaw8Zq3YJ6S9EosoUpOl5ZtcpeyefdF
         kXdj5Hem+YN9xmwDXaD0Oy8sxudYhwdP2357UTBmKm+BuNK/VLdf+qU+i6vX5nAmaEjJ
         44tEoXq4Nkkt6UmXNJAahfEK/VvNtb24+yjBL5k/2NXrQ+el9O6nU0+DSXvOI+ePtfk6
         1l1TQ6pOQ/pGbe7GrIAkipDuDJEHpBBCusnwbfb9II7bMgAqO/iPFi4ZWI65dJJNSzkL
         MCcXm6u+MmDffBGGiHz80HAxsT8lDW07SSUJR9iVzYOkZ07PQUAowWQIgvY4h2emM6Qd
         +qBQ==
X-Gm-Message-State: AOAM5325A+IpJJdxgIUYnjyyQd8nRpfsReidyPq59sTqEd7TNQOf1kGl
        4VnFB7vb665cI84s7D7JZGnrTxrAPDWHkQ==
X-Google-Smtp-Source: ABdhPJwaGdR1vkpUho3wzBr4mnx408BizNqXIG69PctxVd1vbNAY5dsTulGTgh2qyYijXW5kjrZCiw==
X-Received: by 2002:aa7:cf91:: with SMTP id z17mr768628edx.193.1635581227841;
        Sat, 30 Oct 2021 01:07:07 -0700 (PDT)
Received: from eldamar (80-218-24-251.dclient.hispeed.ch. [80.218.24.251])
        by smtp.gmail.com with ESMTPSA id w18sm5216112edc.4.2021.10.30.01.07.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Oct 2021 01:07:07 -0700 (PDT)
Sender: Salvatore Bonaccorso <salvatore.bonaccorso@gmail.com>
Date:   Sat, 30 Oct 2021 10:07:06 +0200
From:   Salvatore Bonaccorso <carnil@debian.org>
To:     Sean Young <sean@mess.org>
Cc:     Salvatore Bonaccorso <carnil@debian.org>,
        =?iso-8859-1?Q?Joaqu=EDn_Alberto_Calder=F3n?= Pozo 
        <kini_calderon@hotmail.com>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "christophe.jaillet@wanadoo.fr" <christophe.jaillet@wanadoo.fr>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: linux-image-5.10.0-8-amd64: Hauppauge WinTV-HVR1110 DVB-T/Hybrid
 bug 125 ms polling on ir-kbd-i2c.ko bad DEFAULT_POLLING_INTERVAL
Message-ID: <YXz9Kp5bKMWsyYOZ@eldamar.lan>
References: <CH2PR04MB6679933D6BEE6C51BE6BEF9889D89@CH2PR04MB6679.namprd04.prod.outlook.com>
 <20210913072649.GB2393@gofer.mess.org>
 <YXz3Lpqq/x3WGQTQ@eldamar.lan>
 <20211030075055.GA11395@gofer.mess.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211030075055.GA11395@gofer.mess.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sean,

On Sat, Oct 30, 2021 at 08:50:55AM +0100, Sean Young wrote:
> On Sat, Oct 30, 2021 at 09:41:34AM +0200, Salvatore Bonaccorso wrote:
> > On Mon, Sep 13, 2021 at 08:26:49AM +0100, Sean Young wrote:
> > > On Sun, Sep 12, 2021 at 10:15:31PM +0000, Joaquín Alberto Calderón Pozo wrote:
> > > > --- ir-kbd-i2c.original.c	2021-09-08 23:45:23.723210301 +0200
> > > > +++ ir-kbd-i2c.hauppauge.patched.c	2021-09-10 03:55:28.003529072 +0200
> > > > @@ -742,7 +742,7 @@
> > > >  		return -ENOMEM;
> > > >  
> > > >  	ir->c = client;
> > > > -	ir->polling_interval = DEFAULT_POLLING_INTERVAL;
> > > > +	ir->polling_interval = 125;
> > > >  	i2c_set_clientdata(client, ir);
> > > >  
> > > >  	switch(addr) {
> > 
> > My understanding is that Joaquín would need some help to get the patch
> > submission as he is unexperienced to make it a proper patch for
> > inclusion in mainline, would you have enough time to bring this into
> > shape for him? I'm not familiar in this area to propose a proper
> > commit message myself. Joaquín confirmed though in
> > https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=994050#32 that the
> > proposed changes seems to solve his issue.
> 
> The change is in media_stage:
> 
> https://git.linuxtv.org/media_stage.git/commit/?id=c73ba202a851c0b611ef2c25e568fadeff5e667f
> 
> This should be merged into Linus' tree during the v5.16 merge window, and
> then make it into the stable trees from there.

Perfect, many thanks! Going to drop then my draft commit message I was
trying to write.

Regards,
Salvatore
