Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B53BB408553
	for <lists+linux-media@lfdr.de>; Mon, 13 Sep 2021 09:26:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237618AbhIMH2G (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Sep 2021 03:28:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237561AbhIMH2G (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Sep 2021 03:28:06 -0400
Received: from gofer.mess.org (gofer.mess.org [IPv6:2a02:8011:d000:212::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB449C061574;
        Mon, 13 Sep 2021 00:26:50 -0700 (PDT)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 31A49C6050; Mon, 13 Sep 2021 08:26:49 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mess.org; s=2020;
        t=1631518009; bh=qS2vbOcvUK+v/bTcb/OiamyjIe5gw+PCQXTQRWWRAo0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=VpAx3H7NmEOsBiTVBzp91UvXgVzpEHGMrlCGx4wG9KZR2juVXyZHxaWoXiLNPfcgL
         xkt2qHm+7qQmMVyKGD1mA5gKN6xZehIWik4IGk5cCiW9Kj7ZvZaUriLxPu698cEHTy
         BGekNkFVue1KS7V0/hfiW6PG05+YiKcCt9/SYR7+XIXXv2YP67csQ6pwc0d95Fnink
         LtXUugTPV4c0Edy3QN9MNtMToOJXIp9IWHnX7tTVMzOTxf3pyQsq6GLWYjpzdAuCn4
         QkCYSH5YqiE1ZHdtjvZZLr4dvQSIWEbJemBOHTZQmtRWawGXbG33BDHTYg23UJkhga
         esAfHTmhct9yw==
Date:   Mon, 13 Sep 2021 08:26:49 +0100
From:   Sean Young <sean@mess.org>
To:     =?iso-8859-1?Q?Joaqu=EDn_Alberto_Calder=F3n?= Pozo 
        <kini_calderon@hotmail.com>
Cc:     "mchehab@kernel.org" <mchehab@kernel.org>,
        "christophe.jaillet@wanadoo.fr" <christophe.jaillet@wanadoo.fr>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: linux-image-5.10.0-8-amd64: Hauppauge WinTV-HVR1110 DVB-T/Hybrid
 bug 125 ms polling on ir-kbd-i2c.ko bad DEFAULT_POLLING_INTERVAL
Message-ID: <20210913072649.GB2393@gofer.mess.org>
References: <CH2PR04MB6679933D6BEE6C51BE6BEF9889D89@CH2PR04MB6679.namprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CH2PR04MB6679933D6BEE6C51BE6BEF9889D89@CH2PR04MB6679.namprd04.prod.outlook.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sun, Sep 12, 2021 at 10:15:31PM +0000, Joaquín Alberto Calderón Pozo wrote:
> Mantainers of the ir-kbd-i2c, althought I sent it to the debian bug report team, I consider to sent you also this patch (if it's the right way) to solve this bug.
> 
> Thanks
> 
> Package: src:linux
> X-Debbugs-Cc: kini_calderon@hotmail.com
> Version: 5.10.46-4
> Severity: important
> Tags: patch
> 
> Although I have a very old pci (not express) Hauppauge WinTV-HVR1110 DVB-T/Hybrid TV card with a remote control, I am still using it because has fully support and functionallity and it's hardware capable of play DVB-T HD streams.
> 
> It has a very strange behaviour:
> 
> -One is it has a slow response when I push a key, has a delay, and sometimes even no key response, nothing happens, as if never push a key.
> -Other is when you hold a key, it start to begin the repeat key (characters like numerical) appears in the test app (kwrite) then, has a pause, stops to write characters, and begin the sequence again, writes some sequence, then stops... and so on. Even I noticed the repeat speed is a bit slow, compared to a keyboard key hold on.
> 
> So... I began to investigates the causes and after two weeks of research, searchs on the web, I found the module affected and a solution.
> 
> The module affected is ir-kbd-i2c.ko, this remote (rc5 protocol) uses this module as uinput (devinput) device, in resume as like an attatched keyboard. Resulting investigation in get noticed that this remote with rc5 protocol has 8hz of time frame when receiving the air gap code (rc5 procotol timing).
> 
> Investigating the sources files in the kernel sources for try and fall, re-compiling the modules, get me to get noticed that the polling ir remote interval is 100ms which is 5hz, forcing this value to 125ms, re-compiling the module causes the remote to work normally as expecte, the response is like a real keyboard and the repeat sequence not only as speedy as a normal keyboard, but also hasn't got a pause in repetition. In resume, the problem is solved.
> 
> Here is the patch:
> 
> --- ir-kbd-i2c.original.c       2021-09-08 23:45:23.723210301 +0200
> +++ ir-kbd-i2c.hauppauge.patched.c      2021-09-10 03:55:28.003529072 +0200
> @@ -742,7 +742,7 @@
>                 return -ENOMEM;
> 
>         ir->c = client;
> -       ir->polling_interval = DEFAULT_POLLING_INTERVAL;
> +       ir->polling_interval = 125;
>         i2c_set_clientdata(client, ir);
> 
>         switch(addr) {
> 
> I am a experienced user, but not an experienced developer, also in editing/submitting bugs, I don't know if this is the right way to solve this, If the rest of brand remotes are affected for my solution, but for me, solved my problem in this particular case.
> 
> I don't know where the value DEFAULT_POLLING_INTERVAL is get stablished or a way when detect a Hauppauge WinTV-HVR1110 DVB-T/Hybrid TV card to stablish 125ms instead of 100ms. As I said, I'm not an expert but experienced user.

This change looks right to me, but it needs some changes:

 - The change needs to be made Hauppauge/Zilog specific by adding a line
   under the "case 0x71:" line below which sets the polling interval to 125.
 - The patch should be against current media kernel, not 5.10
 - Follow https://www.kernel.org/doc/html/latest/process/submitting-patches.html
 - Add "Cc: stable@vger.kernel.org" and the patch will trickle down into 
   5.10.

Thanks

Sean

> 
> I don't know if this is the right package to post this bug. Thanks.
> 

> --- ir-kbd-i2c.original.c	2021-09-08 23:45:23.723210301 +0200
> +++ ir-kbd-i2c.hauppauge.patched.c	2021-09-10 03:55:28.003529072 +0200
> @@ -742,7 +742,7 @@
>  		return -ENOMEM;
>  
>  	ir->c = client;
> -	ir->polling_interval = DEFAULT_POLLING_INTERVAL;
> +	ir->polling_interval = 125;
>  	i2c_set_clientdata(client, ir);
>  
>  	switch(addr) {

