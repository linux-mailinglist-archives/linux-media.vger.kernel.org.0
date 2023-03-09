Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C1ADF6B1909
	for <lists+linux-media@lfdr.de>; Thu,  9 Mar 2023 03:07:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229940AbjCICG7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Mar 2023 21:06:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229651AbjCICG6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Mar 2023 21:06:58 -0500
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB27DA4B03
        for <linux-media@vger.kernel.org>; Wed,  8 Mar 2023 18:06:56 -0800 (PST)
Received: by mail-pj1-x1034.google.com with SMTP id h11-20020a17090a2ecb00b00237c740335cso717165pjs.3
        for <linux-media@vger.kernel.org>; Wed, 08 Mar 2023 18:06:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=theori.io; s=google; t=1678327616;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VhutpasvYkcHdH4vmIl+wqMSXUXCJa4PFPh0Tls1YH4=;
        b=PuWOXx4BKf4WDJdh2v/A/ijmhqN69VdVPaqrDnt7RFnFKMFzBgyLYlGgZc2vTokjMO
         kHAGMSNDsG/wsZLM6vO8zN/E7HSV2ErxiH/vu/Ymb4mo+buegsN6ny3qSdhgModrgSim
         rqT2t4jaur1lSpBqoN2u4euhUrK/SU3UxKyzo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678327616;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VhutpasvYkcHdH4vmIl+wqMSXUXCJa4PFPh0Tls1YH4=;
        b=Xvfkl6JHN33WMgK9mdSoofZ7c45NckDc+kMvJ3wv7E23x4pRbbMJO4qVU1vn/GZiht
         imQvlbLcZ47bCKs4G2AZRmcj8v5w2lulQehnj/3LMe0zKSW8hnpQJ8+KYz0wmQ/aYgPT
         1w7JCsRk9Ez8UfAVnraiX/c+bGJMhthIDxKz7Dg0HUesd1d6HpvW6FpWIQFIm6Xgrh+e
         X4PFhQrI3zgGmOvdknwGXClcxre9EEoKjE1I1K0iH301176gS0JAYnfnNEB3RMaMk/dA
         pklNt9qMHirqj82p4w8ZZxHGa1sMxww9bo/mJkFs3LtBNM/MdokDBQ8eue9qCvxgXpwd
         ImmQ==
X-Gm-Message-State: AO0yUKXQgTQFoCWd3KQ1pz/IYdAtIpb9RtiKAzFEBLuVOHpU4CKEa+6/
        E7EV9c9uC9UkosQxwCihHwzMgw==
X-Google-Smtp-Source: AK7set+Np1nBsXJn3CUjNIdE8kDjVwBpAaVfzAgn9OdY++RR7gFBCvoLW3u9TUL3MWRJ18do8dvMyw==
X-Received: by 2002:a17:902:c10a:b0:19e:7b09:bd4d with SMTP id 10-20020a170902c10a00b0019e7b09bd4dmr17976366pli.47.1678327616364;
        Wed, 08 Mar 2023 18:06:56 -0800 (PST)
Received: from ubuntu ([121.133.63.188])
        by smtp.gmail.com with ESMTPSA id kw12-20020a170902f90c00b0019edcc30d9bsm3528392plb.155.2023.03.08.18.06.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Mar 2023 18:06:55 -0800 (PST)
Date:   Wed, 8 Mar 2023 18:06:50 -0800
From:   Hyunwoo Kim <v4bel@theori.io>
To:     mchehab@kernel.org
Cc:     cai.huoqing@linux.dev, kernel@tuxforce.de,
        linux-media@vger.kernel.org, linux-usb@vger.kernel.org,
        tiwai@suse.de, lee@kernel.org, imv4bel@gmail.com, v4bel@theori.io
Subject: Re: [PATCH v3 0/4] Fix multiple race condition vulnerabilities in
 dvb-core and device driver
Message-ID: <20230309020650.GA47209@ubuntu>
References: <20221117045925.14297-1-imv4bel@gmail.com>
 <20230307134131.3a005bdb@coco.lan>
 <CADUEyCz=xuYjNQohgOi86vm4P4YyfO86AbM0cWdFrs1Y_6276g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CADUEyCz=xuYjNQohgOi86vm4P4YyfO86AbM0cWdFrs1Y_6276g@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Mar 07, 2023 at 09:57:13PM +0900, Hyunwoo Kim wrote:
> ttusb_dec is a comment for patch #4 in the series.
> And as102 is the #1 patch.
> 
> 
> Regards,
> Hyunwoo Kim

I was using the wrong email client and the mailing list didn't get sent, sorry.

Resend the mail for the mailing list.

> 
> 
> 2023년 3월 7일 (화) 오후 9:41, Mauro Carvalho Chehab <mchehab@kernel.org>님이 작성:
> 
> > Em Wed, 16 Nov 2022 20:59:21 -0800
> > Hyunwoo Kim <imv4bel@gmail.com> escreveu:
> >
> > > Dear,
> > >
> > > This patch set is a security patch for various race condition
> > vulnerabilities that occur
> > > in 'dvb-core' and 'ttusb_dec', a dvb-based device driver.
> > >
> > >
> > > # 1. media: dvb-core: Fix use-after-free due to race condition occurring
> > in dvb_frontend
> > > This is a security patch for a race condition that occurs in the
> > dvb_frontend system of dvb-core.
> > >
> > > The race condition that occurs here will occur with _any_ device driver
> > using dvb_frontend.
> > >
> > > The race conditions that occur in dvb_frontend are as follows
> > > (Description is based on drivers/media/usb/as102/as102_drv.c using
> > dvb_frontend):
> > > ```
> > >                 cpu0                                                cpu1
> > >        1. open()
> > >           dvb_frontend_open()
> > >           dvb_frontend_get()    // kref : 3
> > >
> > >
> > >                                                              2.
> > as102_usb_disconnect()
> > >
> >  as102_dvb_unregister()
> > >
> >  dvb_unregister_frontend()
> > >
> >  dvb_frontend_put()    // kref : 2
> > >
> >  dvb_frontend_detach()
> > >
> >  dvb_frontend_put()    // kref : 1
> > >        3. close()
> > >           __fput()
> > >           dvb_frontend_release()
> > >           dvb_frontend_put()    // kref : 0
> > >           dvb_frontend_free()
> > >           __dvb_frontend_free()
> > >           dvb_free_device()
> > >           kfree (dvbdev->fops);
> > >           ...
> > >           fops_put(file->f_op);    // UAF!!
> >
> > Hmm... you're mentioning ttusb_dec at the comment, but here you're showing
> > the race for as102, which is a different driver.
> >
> > I'm confused.
> >
> >
> > Thanks,
> > Mauro
> >
