Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 30A9A56A1DB
	for <lists+linux-media@lfdr.de>; Thu,  7 Jul 2022 14:21:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235454AbiGGMU4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 Jul 2022 08:20:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235407AbiGGMUz (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 7 Jul 2022 08:20:55 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D08526AFB
        for <linux-media@vger.kernel.org>; Thu,  7 Jul 2022 05:20:54 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id d2so32154675ejy.1
        for <linux-media@vger.kernel.org>; Thu, 07 Jul 2022 05:20:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ShLfLdsme4xFA24UQ8JXNdzsDqRc/xidqc4gyoOz62s=;
        b=CKkTWoSik6anpl870eZubHf1FwetJ4Q/UNPHTV0L5yFHyMuxsyiZjU7EGCWkxtlypG
         Khh6CjNXejDNWI9WsuedBNjPDMhwR5tzMmadbpLaYR7cpKH/KaaB65su9keTnEX0/60P
         NmMfwjJrbzpoPyp0CtqZ4hZP0VsaIiTIfpj3Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ShLfLdsme4xFA24UQ8JXNdzsDqRc/xidqc4gyoOz62s=;
        b=Ag2AqxqiiiL+C2nyOLPLrjJb96O1nzuGNn/0rpv23H6n7kbvX2kotCduN0+MuqENpj
         cdM/W1U51nFBlCf2sKYhPg3WxQ2EM3oaX0ToGGjcpPUl32t053uXkBXE9bm5fXfppMrW
         VlQBWX+NjnJsPbYEACM6B05DO3mkreB45S4EhUwlQGSA6ni63t2tHk4/Lk606ud7vy/r
         RybQBEss582K279n3QrEZSzr2ZgsOHBjy31Bflg//lCAmUEEsNrrjCbb95vttT1kgKD8
         tUdxhyZrMqTrU/ZBjrU/+VleSZw6P5dvrHMJbpn9rv4WZEQkRQ8diRq6X39DtRVefyT4
         7eOA==
X-Gm-Message-State: AJIora8+HCXcJ83yZdhFzezHaRFUX/gDPzANXKHguqIJK/u77W/EOGZF
        lhFb7um/kF/jxXgVW6bdISD7cXM7dgQqTQ==
X-Google-Smtp-Source: AGRyM1togo6wLA1+ckTx2TKmQGlxpF6xGjsvDDSTiepaezMx2qfCe3thw+fdcSdbSzJVQSQm/jQuvg==
X-Received: by 2002:a17:906:3f51:b0:712:3945:8c0d with SMTP id f17-20020a1709063f5100b0071239458c0dmr44339738ejj.302.1657196453165;
        Thu, 07 Jul 2022 05:20:53 -0700 (PDT)
Received: from carbon.gago.life (78-83-68-78.spectrumnet.bg. [78.83.68.78])
        by smtp.gmail.com with ESMTPSA id q16-20020a056402249000b00438a13508c4sm16588116eda.51.2022.07.07.05.20.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Jul 2022 05:20:52 -0700 (PDT)
Date:   Thu, 7 Jul 2022 15:20:52 +0300
From:   Petko Manolov <petko.manolov@konsulko.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        linux-media@vger.kernel.org, jacopo@jmondi.org
Subject: Re: Re: Re: hooking Sony 47MPixel sensor to NXP imx8m-mini MIPI CSI2
Message-ID: <YsbPpBMnONcidTuN@carbon.gago.life>
References: <YrwFf7Jw2/yDlcDq@carbon.lan>
 <12352558.O9o76ZdvQC@steina-w>
 <YsRVAV8a48CwpaSY@p310.k.g>
 <2450654.irdbgypaU6@steina-w>
 <YsWJBEPhp9WhiYe1@p310.k.g>
 <YsWTXnTpeM+mCImc@pendragon.ideasonboard.com>
 <YsXh/arQZXnaeGAi@carbon.gago.life>
 <YsXrnJ+sTPztWR2A@carbon.gago.life>
 <YsYDNaPl5nP5RQ/F@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YsYDNaPl5nP5RQ/F@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 22-07-07 00:48:37, Laurent Pinchart wrote:
> On Wed, Jul 06, 2022 at 11:07:56PM +0300, Petko Manolov wrote:
> > On 22-07-06 22:26:54, Petko Manolov wrote:
> > > 
> > > VID_MEM_LIMIT is only 64MB while the image is ~90MB, but it looks like
> > > four of those are required.  I increased the CMA to 640MB, defined
> > > VID_MEM_LIMIT to 512MB and got something that look like it's working.  I
> > > am yet to convert the
> > 
> > Forgot to mention - with debug disabled vb2_core_reqbufs() would trip on
> > line 829 WARN_ON() and dump its guts.  With debug 'on' this doesn't happen.
> > 
> > Not sure if this is the intended behavior, just mentioning it here.
> 
> I don't think that's intended, it would be nice to figure out why.

It's in my todo list.  Once i get over the most urgent problems, i'm planning to
take a look at it.


		Petko
