Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2DCCC4F8056
	for <lists+linux-media@lfdr.de>; Thu,  7 Apr 2022 15:18:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343623AbiDGNT5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 Apr 2022 09:19:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343630AbiDGNTy (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 7 Apr 2022 09:19:54 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 1577B25DA97
        for <linux-media@vger.kernel.org>; Thu,  7 Apr 2022 06:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1649337473;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=8Xg006do2juJkqTWAxGfwqxVTFvDtf8Ouv8ifluSAu0=;
        b=GXz3RdQi6O2Rf4KRNuP0qwtKUKoqvW0o0w30DH9tttGzfko1zVn8V1XlpJxrUWAFrJoKZE
        7TuYpK/Lx4BUAfRgpr2m7J73qYBhUw89SuQIVd/x9ZWhKWKYX9Hjm+1tIZFB/Yb+NRXOB1
        9DlFJoqw7f6Apvn3svF0wDDNemUEXpE=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-14-Ti2SOTSCNneybkWIZKMfgA-1; Thu, 07 Apr 2022 09:17:51 -0400
X-MC-Unique: Ti2SOTSCNneybkWIZKMfgA-1
Received: by mail-lj1-f200.google.com with SMTP id a24-20020a2e7f18000000b0024b1ff3b41dso2136586ljd.14
        for <linux-media@vger.kernel.org>; Thu, 07 Apr 2022 06:17:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8Xg006do2juJkqTWAxGfwqxVTFvDtf8Ouv8ifluSAu0=;
        b=GMt/0Yk7C2Xa4iRfWGQmmPJYEl+8z3KNhTjby8DyevZq8+t6XYpU0iOQ/JuKwCNIm9
         EMdNc1gTr5nszdMGlZHrNnP8V0FkTRi6JGZgUX4dw4VrwQnrBFv4etnMpvhocW5jHQoL
         R+4NX9GThSgPaup39ZzbUuoLMQ4DUuXwx81/A8qk73SGyHSNb+kOgjiH7+j0bbrhvoZy
         60fSxGrB2GZTenANU4BlGtuErd6SSLMMBfdnNuAiL59Oak/as9MHj6tDlr+qmven8Nvm
         CzScZrhquIVKj02NpO0DqYjxayhzq1TBdmHDWn3eskGdHZwSN8LqAD7SSl8FmV40YJSQ
         POPw==
X-Gm-Message-State: AOAM531/pg8Pruznnk8tZCcekhbwWa1tTTTXOyHoofa8Rja53kNP8m/p
        iuDesbiODttX1xx8iYOVXRMfLa+QrM9gsYwkiyqEihsjpIQapDeDkEu89/cGBA8jxwPGng5Xgp7
        T47ZzJFcJOqUrGfpIfop/4aAKXz2x0VGuH+k6xPA=
X-Received: by 2002:a2e:9ad7:0:b0:24b:fa3:6a8d with SMTP id p23-20020a2e9ad7000000b0024b0fa36a8dmr8750731ljj.363.1649337470353;
        Thu, 07 Apr 2022 06:17:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzOH3NMQzvLRuhgYGmMuiioeRpPbM3obm6q7/YkChssQxnH4v5W6zhC8c8fZS+DA2TNFh36USctJCoGkt+xtXA=
X-Received: by 2002:a2e:9ad7:0:b0:24b:fa3:6a8d with SMTP id
 p23-20020a2e9ad7000000b0024b0fa36a8dmr8750702ljj.363.1649337469936; Thu, 07
 Apr 2022 06:17:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220407105724.308930-1-hpa@redhat.com> <20220407115133.GL3293@kadam>
In-Reply-To: <20220407115133.GL3293@kadam>
From:   Kate Hsuan <hpa@redhat.com>
Date:   Thu, 7 Apr 2022 21:17:38 +0800
Message-ID: <CAEth8oG_GAuammtSqKzyj+Vq6ZsQJJOEeFhgxYhxXHViDYvkow@mail.gmail.com>
Subject: Re: [PATCH v2] staging: media: ipu3: Fix AWB x_start position when
 rightmost stripe is used
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, Hans De Goede <hdegoede@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dan,

On Thu, Apr 7, 2022 at 7:52 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> On Thu, Apr 07, 2022 at 06:57:24PM +0800, Kate Hsuan wrote:
> > A not calibrated x_start setting would result in an incorrect AWB location
> > configuration on a sensor when only the rightmost stripe is used. x_start
> > should be calibrated by subtracting the stripe offset to set the coordinate
> > to the correct position on the second stripe.
> >

>
> I wish the commit description said more about what the bug looks like to
> the user.  This is the front facing camera, right?  Is part of the video
> blank or what's the deal?

This is IPU3 image processor. I tried to fix the configuration issues
on stripe 1 coordinate settings.

>
> > Signed-off-by: Kate Hsuan <hpa@redhat.com>
> > ---
> > Correct the patch. The correction should be awb, not awb_fr.
>
> I tried to review the original patch and it was impossible.  I saw
> you're from an @redhat.com email address so I decided it must be right.
>
> I kind of get that you need to be a domain expert to review these
> patches but this function is such a mess...

Sorry for the misunderstanding in my comments.
Since I made some mistakes on my v1 patch, so I had corrected this
part and quickly sent the v2 patch. You are welcome to pinpoint the
errors for my v2 patch. I could fix them.

Thank you.

>
> regards,
> dan carpenter
>


-- 
BR,
Kate

