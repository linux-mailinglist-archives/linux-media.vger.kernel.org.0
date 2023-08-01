Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 010B876B53F
	for <lists+linux-media@lfdr.de>; Tue,  1 Aug 2023 14:55:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231925AbjHAMzh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Aug 2023 08:55:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230026AbjHAMzf (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 1 Aug 2023 08:55:35 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D3EDE6
        for <linux-media@vger.kernel.org>; Tue,  1 Aug 2023 05:55:34 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-3fb4146e8deso62187385e9.0
        for <linux-media@vger.kernel.org>; Tue, 01 Aug 2023 05:55:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690894533; x=1691499333;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mDkOVF5dVkccZSSx3uF9S9mQpuBVPeaNHuRfTVTMyuw=;
        b=NcN067f5r7UOgh2B7Fx9rwvfjtyFPcvE7eUZKkpkMiS8IlqwRSDTuBDBgNpjo+m5AY
         tdKLxPrZbkYzNtB772wmIf8F86y2Fk0VB6sYk66ZBS5lOCg3grMJ6X3Rx0+fQztT+xGk
         LgtJQ+RYCvytpkStP3v6XJ6gZIhQlxZD+rAZP9cHuCwEa1i3SMQGMt/WWVJSAtha28Vx
         P1iXsnUfc28qp7SEbewRosL1S5S1GNDdMSPMCAF+xM9xozZURYfIOMvlFGmSC7EjszGz
         tDgmdJifpVwrzpgFN3Kpp1hpfepzksML6ZiQqbf+QtRB18ByUmL/7NRnhUDCPQFVttb1
         wOTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690894533; x=1691499333;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mDkOVF5dVkccZSSx3uF9S9mQpuBVPeaNHuRfTVTMyuw=;
        b=eLkAN5cYvnyS0FNeSWT6Ug/QYCamYEfvcuRYBNcoYVBazQ8phymXXs2NZXvp1Aj0I3
         bxJwYmKTAFLMbhR1wvrNq1aE55rTYh8/1DB2RExuivFoNrHR2zJQuaIoN8Vp2BP5DwFE
         GZojBB8L9riEKmbES9oieJIYNn9ieDRvtOdjsVD+JWyT/QUVkC0LOF38tP6siBKIk453
         jX0KKH4u4jfTkVDdk8vJQstwX5jJEsO9/1Bvh8LdzlQkFJ12VzQLEQw4mf50M6In+kgw
         UupRtGo6N6UGYj8ZNjJ3eFWmT5vZbv3gc3Uf5SBBrK80ERwKvHzlqK8fQ5Xm643+Focy
         tC5A==
X-Gm-Message-State: ABy/qLZPVY1wBDMf1Z+mkPuEwK+XCz2BwNBRZAGO8oawXBdkCjWc4q3K
        EDQ1Q/46eurzbH32JjzwNNSaRg==
X-Google-Smtp-Source: APBJJlGuxtGGetdaut4uheRF3ll32vx6ed24rJA1ZTPwJSDD6l8me/IrAWVI//zpqmaPfkXykinuxA==
X-Received: by 2002:a1c:ed0c:0:b0:3fb:9ef1:34ef with SMTP id l12-20020a1ced0c000000b003fb9ef134efmr2496596wmh.37.1690894532910;
        Tue, 01 Aug 2023 05:55:32 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id 9-20020a05600c230900b003fbe561f6a3sm16759367wmo.37.2023.08.01.05.55.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Aug 2023 05:55:32 -0700 (PDT)
Date:   Tue, 1 Aug 2023 15:55:29 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Kate Hsuan <hpa@redhat.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        Hans Verkuil <hverkuil@xs4all.nl>
Subject: Re: [PATCH v2 1/2] media: atomisp: Fix smatch warnings caused by
 atomisp custom assert() usage
Message-ID: <65b19c92-fc5b-4767-81c5-0077aa3ec90f@kadam.mountain>
References: <20230730153343.22033-1-hdegoede@redhat.com>
 <CAEth8oFe1QFfbZ=COzT=BLJtoAXAgqVMZtTM6qe4aNvQ0ZNVPw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAEth8oFe1QFfbZ=COzT=BLJtoAXAgqVMZtTM6qe4aNvQ0ZNVPw@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Aug 01, 2023 at 08:32:18PM +0800, Kate Hsuan wrote:
> > diff --git a/drivers/staging/media/atomisp/pci/sh_css_mipi.c b/drivers/staging/media/atomisp/pci/sh_css_mipi.c
> > index b20acaab0595..ced21dedf7ac 100644
> > --- a/drivers/staging/media/atomisp/pci/sh_css_mipi.c
> > +++ b/drivers/staging/media/atomisp/pci/sh_css_mipi.c
> > @@ -351,15 +351,6 @@ allocate_mipi_frames(struct ia_css_pipe *pipe,
> >         ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
> >                             "allocate_mipi_frames(%p) enter:\n", pipe);
> >
> > -       assert(pipe);
> > -       assert(pipe->stream);
> > -       if ((!pipe) || (!pipe->stream)) {
> > -               ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
> > -                                   "allocate_mipi_frames(%p) exit: pipe or stream is null.\n",
> > -                                   pipe);
> > -               return -EINVAL;
> > -       }
> 
> Thank you for working on this.
> 
> The NULL test for pipe could be kept here since the caller only tests
> "stream" but not test "main_pipe" is NULL. (sh_css.c line: 1799)
> 

It dereferences main_pipe on the next line so this check would be too
late.

drivers/staging/media/atomisp/pci/sh_css.c
  1799          main_pipe       = stream->last_pipe;
  1800          pipe_id = main_pipe->mode;

Smatch says that ->last_pipe is known to be non-NULL as well.

$ smdb.py create_host_pipeline
drivers/staging/media/atomisp/pci/sh_css.c |  ia_css_stream_start | create_host_pipeline |        PARAM_VALUE |  0 | stream->last_pipe | 4096-ptr_max

regards,
dan carpenter
