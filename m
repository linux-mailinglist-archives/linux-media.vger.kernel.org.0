Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB2AB4407E4
	for <lists+linux-media@lfdr.de>; Sat, 30 Oct 2021 09:41:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231428AbhJ3HoH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 30 Oct 2021 03:44:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230365AbhJ3HoH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 30 Oct 2021 03:44:07 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7001AC061570;
        Sat, 30 Oct 2021 00:41:36 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id ee16so33326867edb.10;
        Sat, 30 Oct 2021 00:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=MfpE+mQXNVqiAaOXucU731jRfGzTPqiu0EQhTOmfNww=;
        b=LyPA99chM1u0f54Po7q563FWtx4nIRT28rU9XDbLFhzD+bQK9XxTbd7Qwwfr62T2C8
         xAb+GuDYj176BGlDyvlF74BULaTdrmdHuPzPHgqp4yaqzAxe/cmlTutqUQMh3RFBjzBI
         lbPib9UVWanY5jTCg5tPA6dfM5g6PDshlwe45VCsjPZa6Z+Avxjs0wYZfxiDpIK3aHrf
         z7NO4Z/+82C/Duh8/UN902yC3UUDhyuo1l1l78Sfj8yJT0iJ0qKNdq/bmZZ6zKuBJeRA
         K99AzZCxeGRnwIXgq7DxWkREjqyMeMnnbgteaZhEKupkVdQiC+Koqzzre94b0IwEO5W8
         b1Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to;
        bh=MfpE+mQXNVqiAaOXucU731jRfGzTPqiu0EQhTOmfNww=;
        b=gMOdXUZSNW72c9yQjHhartjIcvCqylZHbWm+UfmSk+Frvb97l3S7chnRIZq1v8kvJ8
         if744QXhpHpxwz0z7Q7cj/8y/ScW7C4OY4hjmH+UTLKE9PAZuQ7XXhYjPnf4E6nmvEE1
         HxIHxYN70s1SZ39vcf5T1mlFq51Iaard6+c2FrbBeJ7N0lqg+/9DIdpwsD6V/mTrLp/5
         so6D2xaHvhMAW+DqKD3HhHGSiE+0H54SmiFIjikwfw0HU0L8Opi+dcwTteIdqvMT9ytd
         G2fb4bvmNrbjhMGL0bWW9OA6TO/hrWk/s1jNKquQiz69Zgyh0pLE+K1DmdW9hOofZUcU
         ShnA==
X-Gm-Message-State: AOAM532URlaUUz8CupOHxdyAtSV+adQz7ikruvrUWcEPxS6LZkxe2WRt
        JQKSCfX4Tl5rp3IWJgUoukrvKuJbfPklmQ==
X-Google-Smtp-Source: ABdhPJyhWzSn3b7EHqItRiNwCOe880jo8zlJpSGXwzJC15Yx2bIwY2XkTmzsYxidt/QklAUStGv0Rw==
X-Received: by 2002:a17:906:6a08:: with SMTP id qw8mr2002536ejc.200.1635579695289;
        Sat, 30 Oct 2021 00:41:35 -0700 (PDT)
Received: from eldamar (80-218-24-251.dclient.hispeed.ch. [80.218.24.251])
        by smtp.gmail.com with ESMTPSA id h7sm4830492edt.37.2021.10.30.00.41.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Oct 2021 00:41:34 -0700 (PDT)
Sender: Salvatore Bonaccorso <salvatore.bonaccorso@gmail.com>
Date:   Sat, 30 Oct 2021 09:41:34 +0200
From:   Salvatore Bonaccorso <carnil@debian.org>
To:     Sean Young <sean@mess.org>
Cc:     =?iso-8859-1?Q?Joaqu=EDn_Alberto_Calder=F3n?= Pozo 
        <kini_calderon@hotmail.com>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "christophe.jaillet@wanadoo.fr" <christophe.jaillet@wanadoo.fr>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: linux-image-5.10.0-8-amd64: Hauppauge WinTV-HVR1110 DVB-T/Hybrid
 bug 125 ms polling on ir-kbd-i2c.ko bad DEFAULT_POLLING_INTERVAL
Message-ID: <YXz3Lpqq/x3WGQTQ@eldamar.lan>
References: <CH2PR04MB6679933D6BEE6C51BE6BEF9889D89@CH2PR04MB6679.namprd04.prod.outlook.com>
 <20210913072649.GB2393@gofer.mess.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210913072649.GB2393@gofer.mess.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sean,

On Mon, Sep 13, 2021 at 08:26:49AM +0100, Sean Young wrote:
> On Sun, Sep 12, 2021 at 10:15:31PM +0000, Joaquín Alberto Calderón Pozo wrote:
> > Mantainers of the ir-kbd-i2c, althought I sent it to the debian bug report team, I consider to sent you also this patch (if it's the right way) to solve this bug.
> > 
> > Thanks
> > 
> > Package: src:linux
> > X-Debbugs-Cc: kini_calderon@hotmail.com
> > Version: 5.10.46-4
> > Severity: important
> > Tags: patch
> > 
> > Although I have a very old pci (not express) Hauppauge WinTV-HVR1110 DVB-T/Hybrid TV card with a remote control, I am still using it because has fully support and functionallity and it's hardware capable of play DVB-T HD streams.
> > 
> > It has a very strange behaviour:
> > 
> > -One is it has a slow response when I push a key, has a delay, and sometimes even no key response, nothing happens, as if never push a key.
> > -Other is when you hold a key, it start to begin the repeat key (characters like numerical) appears in the test app (kwrite) then, has a pause, stops to write characters, and begin the sequence again, writes some sequence, then stops... and so on. Even I noticed the repeat speed is a bit slow, compared to a keyboard key hold on.
> > 
> > So... I began to investigates the causes and after two weeks of research, searchs on the web, I found the module affected and a solution.
> > 
> > The module affected is ir-kbd-i2c.ko, this remote (rc5 protocol) uses this module as uinput (devinput) device, in resume as like an attatched keyboard. Resulting investigation in get noticed that this remote with rc5 protocol has 8hz of time frame when receiving the air gap code (rc5 procotol timing).
> > 
> > Investigating the sources files in the kernel sources for try and fall, re-compiling the modules, get me to get noticed that the polling ir remote interval is 100ms which is 5hz, forcing this value to 125ms, re-compiling the module causes the remote to work normally as expecte, the response is like a real keyboard and the repeat sequence not only as speedy as a normal keyboard, but also hasn't got a pause in repetition. In resume, the problem is solved.
> > 
> > Here is the patch:
> > 
> > --- ir-kbd-i2c.original.c       2021-09-08 23:45:23.723210301 +0200
> > +++ ir-kbd-i2c.hauppauge.patched.c      2021-09-10 03:55:28.003529072 +0200
> > @@ -742,7 +742,7 @@
> >                 return -ENOMEM;
> > 
> >         ir->c = client;
> > -       ir->polling_interval = DEFAULT_POLLING_INTERVAL;
> > +       ir->polling_interval = 125;
> >         i2c_set_clientdata(client, ir);
> > 
> >         switch(addr) {
> > 
> > I am a experienced user, but not an experienced developer, also in editing/submitting bugs, I don't know if this is the right way to solve this, If the rest of brand remotes are affected for my solution, but for me, solved my problem in this particular case.
> > 
> > I don't know where the value DEFAULT_POLLING_INTERVAL is get stablished or a way when detect a Hauppauge WinTV-HVR1110 DVB-T/Hybrid TV card to stablish 125ms instead of 100ms. As I said, I'm not an expert but experienced user.
> 
> This change looks right to me, but it needs some changes:
> 
>  - The change needs to be made Hauppauge/Zilog specific by adding a line
>    under the "case 0x71:" line below which sets the polling interval to 125.
>  - The patch should be against current media kernel, not 5.10
>  - Follow https://www.kernel.org/doc/html/latest/process/submitting-patches.html
>  - Add "Cc: stable@vger.kernel.org" and the patch will trickle down into 
>    5.10.
> 
> Thanks
> 
> Sean
> 
> > 
> > I don't know if this is the right package to post this bug. Thanks.
> > 
> 
> > --- ir-kbd-i2c.original.c	2021-09-08 23:45:23.723210301 +0200
> > +++ ir-kbd-i2c.hauppauge.patched.c	2021-09-10 03:55:28.003529072 +0200
> > @@ -742,7 +742,7 @@
> >  		return -ENOMEM;
> >  
> >  	ir->c = client;
> > -	ir->polling_interval = DEFAULT_POLLING_INTERVAL;
> > +	ir->polling_interval = 125;
> >  	i2c_set_clientdata(client, ir);
> >  
> >  	switch(addr) {

My understanding is that Joaquín would need some help to get the patch
submission as he is unexperienced to make it a proper patch for
inclusion in mainline, would you have enough time to bring this into
shape for him? I'm not familiar in this area to propose a proper
commit message myself. Joaquín confirmed though in
https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=994050#32 that the
proposed changes seems to solve his issue.

Regards,
Salvatore
