Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 57C7B5F9FEA
	for <lists+linux-media@lfdr.de>; Mon, 10 Oct 2022 16:10:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229890AbiJJOKB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 10 Oct 2022 10:10:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229884AbiJJOJj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 10 Oct 2022 10:09:39 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9C6573328
        for <linux-media@vger.kernel.org>; Mon, 10 Oct 2022 07:09:19 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id bs14so480591ljb.9
        for <linux-media@vger.kernel.org>; Mon, 10 Oct 2022 07:09:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20210112.gappssmtp.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=65svBKVQV53GmFHS4F7EK83uPWn+SDHTMndTIq44wzQ=;
        b=gDF4Na0aQ20E/4yjB7q7GCX1u/bNKTT6p4bxjBlMRESYXEe04P2SFKzsFS4m5gEhwd
         EZlKmr+/gANOLcHCIfQuk9opRsXqAjN4Llg1hMMLBGMWWUYaFbjCokgY7m6KSg/Myita
         DsYwd7Nl3k0gwhVT5KQ7FM5fib28YCV4RmctaJ68NJmlg5u3jar5oGuUupc8mF/fnj+y
         MCSmmJcDt8Cbd6IFrI13TTSCFqk5pvY0GvDS8ZpoU1DaKHM/r45QJVh+VdkSNnU0uSqG
         krriUZ0k8yN1UVBz9q+++19eddMB7U1bt0LdKecSGr76SKjqL2kI1ljin/tHkApMt33g
         Bv2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=65svBKVQV53GmFHS4F7EK83uPWn+SDHTMndTIq44wzQ=;
        b=h2/5x2fJcvhLrqUmzXvsAK+38vNTdUhEp8S+HYLyRDSAEcpaTIsI1z+UeqRlt85lVv
         VE6Go01vA8sk4PZ4FU8SueLI4xTUyQ9knOeVKG2WNXU0PEPqgr/sshJLgy8cZdfPTkY9
         Jnze2skWSOxgMwR1nRRbsxs5ubQKBZA9vQfaUPKo4ea4vRDGXgddqwCdbf+06xNVKHIv
         Mp5Zt/gfgwj/QuaGkwfzltUw96wLVzWUxv8jULEkmiJoVFOEfiwq+E3kQN327L1YC0wn
         /hvT1zdcU+VWlal3Hwd3kAd9vm5lgd2JUgZnUGlV7QCAHy5wTf0FFeX1vH+pmbZSi5np
         er/w==
X-Gm-Message-State: ACrzQf11M8AaczFSSH25poYDbalfc+fwNaDS2TjUdVO9hGXBsCnoWj8B
        u3wU1n4Xbaoum0s4zoQEOu14NQ==
X-Google-Smtp-Source: AMsMyM7W5TN5ElhwHBQoq3bDZBkBXUvfe8YveRWfc5onmmxUclqTfq0KbECNDDUTydFVZmYCzHSYtw==
X-Received: by 2002:a2e:a48b:0:b0:26e:916f:cb1d with SMTP id h11-20020a2ea48b000000b0026e916fcb1dmr4122749lji.371.1665410930909;
        Mon, 10 Oct 2022 07:08:50 -0700 (PDT)
Received: from localhost (h-46-59-89-207.A463.priv.bahnhof.se. [46.59.89.207])
        by smtp.gmail.com with ESMTPSA id v18-20020a2ea452000000b0026ab2a04055sm1720211ljn.130.2022.10.10.07.08.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Oct 2022 07:08:50 -0700 (PDT)
Date:   Mon, 10 Oct 2022 16:08:49 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] media: adv748x: afe: Select input port when initializing
 AFE
Message-ID: <Y0QncbqvmkwCQUV/@oden.dyn.berto.se>
References: <20221009144146.1199437-1-niklas.soderlund+renesas@ragnatech.se>
 <166540999229.3760285.2092310778890819597@Monstersaurus>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <166540999229.3760285.2092310778890819597@Monstersaurus>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Kieran,

On 2022-10-10 14:53:12 +0100, Kieran Bingham wrote:
> Hi Niklas,
> 
> Your other patch for adv748x has the prefix:
> 
> 	media: i2c: adv748x:
> 
> I'm not sure if the i2c: is required though.
> There seems to be a mix of usage in the driver already so I don't think
> it matters too much.

Me neither, so I use both in an random pattern to not discriminate.   
Let me know what you prefer and I will try to use that in the future.  

> 
> Quoting Niklas Söderlund (2022-10-09 15:41:46)
> > When moving the input selection to adv748x_reset() it was missed that
> > during probe the device is reset _before_ the initialization and parsing
> > of DT by the AFE subdevice. This can lead to the wrong input port (in
> > case it's not port 0) being selected until the device is reset for the
> > first time.
> > 
> > Fix this by restoring the call to adv748x_afe_s_input() in the AFE
> > initialization while also keeping it in the adv748x_reset().
> > 
> > Fixes: c30ed81afe89 ("media: adv748x: afe: Select input port when device is reset")
> > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > ---
> >  drivers/media/i2c/adv748x/adv748x-afe.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> > 
> > diff --git a/drivers/media/i2c/adv748x/adv748x-afe.c b/drivers/media/i2c/adv748x/adv748x-afe.c
> > index 02eabe10ab97..00095c7762c2 100644
> > --- a/drivers/media/i2c/adv748x/adv748x-afe.c
> > +++ b/drivers/media/i2c/adv748x/adv748x-afe.c
> > @@ -521,6 +521,10 @@ int adv748x_afe_init(struct adv748x_afe *afe)
> >                 }
> >         }
> >  
> > +       adv748x_afe_s_input(afe, afe->input);
> > +
> > +       adv_dbg(state, "AFE Default input set to %d\n", afe->input);
> 
> That's now two places with this message. But we likely can't put it in
> adv748x_afe_s_input(), as that isn't always setting the default, but the
> current...
> 
> And it's probably not worth an extra function just to dedup a single
> debug line :S
> 
> So - it seems reasonable to me.
> 
> Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> 
> Though does this now mean that a normal boot will show (with debug
> enabled)
> 
> AFE Default input set to 0
> ...
> AFE Default input set to 0
> 
> ?

Yes, but if the default input is not 0 after paring DT it will be,

AFE Default input set to 0
...
AFE Default input set to 2

Where the first one is form the reset and the second one from the probe 
after we have parsed DT. Not sure how much effort we should put in to 
resolving this, I'm happy with anything, keeping both or dropping any or 
both of them.

Let me know what you think. And if you wish me to spin a v2. I do like 
to get his fixed without to much delay as it kills my new automatic test 
setup without an ugly quirk :-)

> --
> Kieran
> 
> 
> 
> 
> > +
> >         /* Entity pads and sinks are 0-indexed to match the pads */
> >         for (i = ADV748X_AFE_SINK_AIN0; i <= ADV748X_AFE_SINK_AIN7; i++)
> >                 afe->pads[i].flags = MEDIA_PAD_FL_SINK;
> > -- 
> > 2.37.3
> >

-- 
Kind Regards,
Niklas Söderlund
