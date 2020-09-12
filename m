Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B69C26799B
	for <lists+linux-media@lfdr.de>; Sat, 12 Sep 2020 12:45:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725852AbgILKpU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 12 Sep 2020 06:45:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725825AbgILKpP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 12 Sep 2020 06:45:15 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E69AC061573
        for <linux-media@vger.kernel.org>; Sat, 12 Sep 2020 03:45:15 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id j7so2129069plk.11
        for <linux-media@vger.kernel.org>; Sat, 12 Sep 2020 03:45:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=es-iitr-ac-in.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=lkuXqN8dqWKzdrjlBRBC+QDQOX5NBg+pLH7DeRXH8eE=;
        b=rbGEY2ml6P4YmGCLMJkrk6jnaTnFY6ENY1hS8ELAelyi4jjkcVGdGY1unjljjcjp8W
         RdNiNM7R5dchauITFfVkov/s8SL6PxR3+QbTlOtHknwKrhUk8EXZcH+7zBOJ212yKcMC
         QSO2Bxq+ZGk24oTOcc09hp37BKg3aS5LmL+DnfSn7llKWsu/TEs7kna+x6AwSA8IILkd
         M/9tbmf4fIKs29C9TY7SsXeGMQcSKXmWpdR4pecl1RQVO4gzJs/gqQwhyir7tck3HOBE
         Msfmr80cnUvEG5oQSlcDSS/0EJNUEn++2iVEV1WiMCHKOZUt1CFhrvk3RtnlYx5vGdAd
         wD2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=lkuXqN8dqWKzdrjlBRBC+QDQOX5NBg+pLH7DeRXH8eE=;
        b=uXBtP76Hi+bsI/e0Ggvl/9+l34w1rxZVUtgjQyMDk84elaZ1EbSQJi5uqSbf0if6ST
         xTiEPkr4u/rXWU/9ISjtTCbOJ9CnnabjbeJlGS4ZpdfbHhH6WeBmW9XCKOfE3AWTcdBY
         hFISeOIk9JAbRLzklJp3PomfXLaKv//ByFEgMwZd0eTTOJ0PW8NgFSY7h5o+qPcINu70
         SHdu8kJjoKfGFkAVlaVrXYPSk2KCU/caAlWIhkG8kHxIn2VyjHEgjCqtA4zuK0sBc6MU
         YKHmPxxoaRuR8Kqlp2niFtx9DW1GX5C667Rwd3K+3V2NBvTCradCmj0A66ckcQG0G5zY
         PxwQ==
X-Gm-Message-State: AOAM532ewXVRc/kcM/qy8ncbv3E5Doy3QZrhO0Bq/FK4AJw6Xx7mknLR
        obZB5FVK8tS1cCvo2d5XEmCakw==
X-Google-Smtp-Source: ABdhPJxOJuuvw8phqgsbxxKfx/6Ima835whbu8/ZuD7ibDaZTIcuCuCerlcQ+Caq1Oon6gnZQ1gNJQ==
X-Received: by 2002:a17:90a:6701:: with SMTP id n1mr6179958pjj.87.1599907514399;
        Sat, 12 Sep 2020 03:45:14 -0700 (PDT)
Received: from kaaira-HP-Pavilion-Notebook ([2405:201:6801:484c:954a:305:9758:cc93])
        by smtp.gmail.com with ESMTPSA id c127sm4803357pfa.165.2020.09.12.03.45.11
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 12 Sep 2020 03:45:13 -0700 (PDT)
Date:   Sat, 12 Sep 2020 16:15:08 +0530
From:   Kaaira Gupta <kgupta@es.iitr.ac.in>
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Helen Koike <helen.koike@collabora.com>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 9/9] media: vimc: Run multiple captures on same thread
Message-ID: <20200912104508.GF5022@kaaira-HP-Pavilion-Notebook>
References: <20200819180442.11630-1-kgupta@es.iitr.ac.in>
 <20200819180442.11630-10-kgupta@es.iitr.ac.in>
 <58df4c43-ab07-0001-f725-9098f18a8e6f@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <58df4c43-ab07-0001-f725-9098f18a8e6f@ideasonboard.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Sep 02, 2020 at 11:46:50AM +0100, Kieran Bingham wrote:
> Hi Kaaira,
> 
> On 19/08/2020 19:04, Kaaira Gupta wrote:
> > If multiple captures try to enable stream, start their stream but do not
> > initialise the pipeline again. Also, don't start the thread separately.
> > Starting their streams will update the use count and their frames would
> > be processed by the already running thread.
> > 
> > Signed-off-by: Kaaira Gupta <kgupta@es.iitr.ac.in>
> > ---
> >  drivers/media/test-drivers/vimc/vimc-streamer.c | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/media/test-drivers/vimc/vimc-streamer.c b/drivers/media/test-drivers/vimc/vimc-streamer.c
> > index fade37bee26d..880c31759cc0 100644
> > --- a/drivers/media/test-drivers/vimc/vimc-streamer.c
> > +++ b/drivers/media/test-drivers/vimc/vimc-streamer.c
> > @@ -275,13 +275,14 @@ int vimc_streamer_s_stream(struct vimc_stream *stream,
> >  		return ret;
> >  
> >  	if (enable) {
> > -		if (stream->kthread)
> > -			return 0;
> >  
> >  		ret = vimc_streamer_stream_start(ved);
> >  		if (ret)
> >  			goto out;
> >  
> > +		if (stream->kthread)
> > +			goto out;
> > +
> 
> This goto out makes it look like it's an error path. So that probably
> warrants a comment along the lines of 'don't reinitialise the pipeline
> if it has already started'. ?
> 
> I wonder if it's better to handle the pipeline_init during _stream_start
> 'only' in the code path where it's the first stream ?

stream_start needs to be called for both (or all) the captures, while
init must be called just once...so I think keeping it here inside
s_stream and calling it just once will be okay too as that wouldn't need
refcounts..but yes I think I should keep them symmetrical for better
readability of code. What do you think is a better method?

> 
> Then similarly, the pipeline_terminate would happen on stream_stop
> 'only' when it's the last stream.
> 
> Or I guess that is handled by the refcount ... Hrm it would be nice to
> be able to make/keep it symmetrical somehow.
> 
> 
> >  		ret = vimc_streamer_pipeline_init(stream, ved);
> >  		if (ret)
> >  			goto out;
> > 
> 
> -- 
> Regards
> --
> Kieran
