Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CDF515BFD5E
	for <lists+linux-media@lfdr.de>; Wed, 21 Sep 2022 13:56:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229715AbiIUL42 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Sep 2022 07:56:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229718AbiIUL4X (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Sep 2022 07:56:23 -0400
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com [IPv6:2607:f8b0:4864:20::835])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEB53895F8
        for <linux-media@vger.kernel.org>; Wed, 21 Sep 2022 04:56:20 -0700 (PDT)
Received: by mail-qt1-x835.google.com with SMTP id w2so3835731qtv.9
        for <linux-media@vger.kernel.org>; Wed, 21 Sep 2022 04:56:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=vDQAo0FftNWAg5dSgRf/ecqLD71uxoc/p0XeSOEV4IM=;
        b=AcVnvpyfFEAhqR1PQRriSSMZhCKzP58O/fTUE0empqiQMLeMu/oDMq9D8EhaNIFt2U
         Xj+KC1xgritpaStDk7y77AecLEE1FGJePjTII1uooSTvzu59JqX574biMaQE75Mke4u8
         RVZXl5a9qvKg++U+IdkoI8rikjKM+5c0dWPxf3+QY/4YsdhjeIvX7q9gsrg6N6Ef7Wi0
         UQzvU4xkDgy+rt1P0+Qh7DTFTyRMy+8LaIO+AupXzjY/QDDlVg5gqipVymCSa+M+mRph
         9EXQ7hDp6HcHoUVzcQeRi1daHscFyblSDV58PAxj/y2v+wF87EO+3YACTYdhhUMww45H
         zLxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=vDQAo0FftNWAg5dSgRf/ecqLD71uxoc/p0XeSOEV4IM=;
        b=c3qKGZT2Mn5LQr/5Dmr7RKLwLccblFRNOX74uMiovMTReT3Xh6b0Pbffo8E5IFuk5N
         yPF8Qy/ox8/LMQ85ZsIi0uMyaj9BY3PNlRZtG/G5LQd7aI16UMgid6rTQuWi0SKB+k2c
         4M2GVmYyWpIcQDpZlUGC0iQBCVDL0QHW3YMyU4/9Z724vY0lLr5LdK+ivg+w1GhYBj6A
         Go/xMx4LAao2/fIKpkxD9MCxCC/S/k/rPSgIsfXwdLVo14aYCLACbmeBQ2usxY5wjPBB
         1d6T0rjKWQOcO/qf4K29A7/RlyaTloD684kk2LAm9tYywW9pZ2HmQHWW+LTtsSuWRErx
         G9zw==
X-Gm-Message-State: ACrzQf3dO3iuAlGxYdlQcpe2zUoL0PLU0LIurPmoap1Yd0v3hUkUASd/
        oEDDchX0gsd0bJkjvD5w358snGZKru/1sNXINQc=
X-Google-Smtp-Source: AMsMyM611GmjQ8AO/aTa+FjSCPYE2HhB5Q3S+E2mP3gYPVMfZndXdEJ4Zm7k2GAu4/T0BTnOoLPHRcaNh7XxjjSJkdw=
X-Received: by 2002:a05:622a:1701:b0:35b:b3bb:7c4e with SMTP id
 h1-20020a05622a170100b0035bb3bb7c4emr22595897qtk.195.1663761379921; Wed, 21
 Sep 2022 04:56:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220911171653.568932-1-hdegoede@redhat.com> <20220911171653.568932-6-hdegoede@redhat.com>
 <Yx8YOj7L9V32qC7D@smile.fi.intel.com> <bc6c2ccc-98ee-c26c-a130-ba868e307eb4@redhat.com>
In-Reply-To: <bc6c2ccc-98ee-c26c-a130-ba868e307eb4@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 21 Sep 2022 14:55:43 +0300
Message-ID: <CAHp75VfX1oJ-_aapjTtpWCoir8iSeDWH9ARkRZdJ1mzoqBCKFA@mail.gmail.com>
Subject: Re: [PATCH 05/17] media: atomisp: Add atomisp_pipe_check() helper
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Andy Shevchenko <andy@kernel.org>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Sep 21, 2022 at 12:05 PM Hans de Goede <hdegoede@redhat.com> wrote:
> On 9/12/22 13:30, Andy Shevchenko wrote:
> > On Sun, Sep 11, 2022 at 07:16:41PM +0200, Hans de Goede wrote:

...

> >> +    case ATOMISP_DEVICE_STREAMING_STOPPING:
> >> +            dev_err(pipe->isp->dev, "IOCTL issued while stopping\n");
> >> +            return -EBUSY;
> >
> > Wouldn't -EAGAIN match better in this case?
>
> The original checks this replaces used -EIO (which seems like a poor
> choice) resp. -EBUSY (in the streamon callback) so I decided to
> keep the -EBUSY here.
>
> Also AFAIK -EAGAIN will make the C-library retry the syscal itself
> in some cases ? (not sure if this applies to ioctls though).
>
> This is not what we want, this scenario can only be hit when an app:
> 1. Uses both the preview and the actual capture /dev/video# nodes
>    at the same time (this is allows)
> 2. Then stops the stream at 1 of them, this transitions the state
>    to STOPPING
> 3. Then does some ioctl other then streamoff on the other /dev/video#
>
> Basically when using more then 1 /dev/video# node then the app must
> stop all of them when stopping things. The driver enforces this
> by rejecting all calls other the streamoff until all /dev/video#
> node streans are off.
>
> This means that simply trying again will result in the same error,
> so -EBUSY seems like the best error for this.

Thanks for the explanation, now it's clear to me.

-- 
With Best Regards,
Andy Shevchenko
