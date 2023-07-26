Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 39ABF763055
	for <lists+linux-media@lfdr.de>; Wed, 26 Jul 2023 10:47:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231266AbjGZIrC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 Jul 2023 04:47:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233404AbjGZIqa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 Jul 2023 04:46:30 -0400
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com [IPv6:2607:f8b0:4864:20::72f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54D1E4ECF
        for <linux-media@vger.kernel.org>; Wed, 26 Jul 2023 01:39:06 -0700 (PDT)
Received: by mail-qk1-x72f.google.com with SMTP id af79cd13be357-76754b9eac0so570431685a.0
        for <linux-media@vger.kernel.org>; Wed, 26 Jul 2023 01:39:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1690360745; x=1690965545;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZFMVJEruV9LE4C75mlWS0Nb+yQQsemXUAAUYYCpPIuI=;
        b=eBXMDVT6evOO2pppqWYbWCWXwA4N1cERSU739wWRDIcTzbGfiHvDZOuk1Sf/l15bRL
         07abWUJuw7cI7EvhlcvD6k1eJm8CF0EWUWBGKuC1Ph8I6leyTIG+cVNzK61YQrwcHF2U
         AUGjpd5MDgGuwUa0JvAMjxSky5DniEsrXlKwg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690360745; x=1690965545;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZFMVJEruV9LE4C75mlWS0Nb+yQQsemXUAAUYYCpPIuI=;
        b=M4auPiWCgV5puUw+PBk4yK/A7CyGC/Ji19MR7VyFaonyR0p7bXtkFo3p0ChrfAJCWT
         SMgFyugOdrFak0u45P83DtnXI5J7LI2VmYVXHu/zl0pkikDHtHXPdwLebW6CR6mFMydu
         TGgsfKwQ6x1wjPiW+zDpBVoY3kS5B7t+5y/Bji2nkiJYijlNEPNbapYjMVPsuQMAnci+
         FcDNjZhxu58tqGO6H7MLrporVpXN3hwUh8vBADsH/AQaeQZNrqoD4m44LrjslQXPqyun
         01yoWQZR/9wZks95rLBuNykG6dlMRiqwj/8ZNELGXI27QBwgRkiLiDFPfdnuS7Pq8lPI
         wq/A==
X-Gm-Message-State: ABy/qLY8ZOz5Wdkj9VEG5yOpnHHONbQlnmcgeJPZV1qxmzYFoS6noqWq
        IzTG0QS2GEdRKrpfg0/l1x8rrAY2+USsqb92TuJQKQ==
X-Google-Smtp-Source: APBJJlECRj91mKrBLGO4VGDc9LmK8YFH140lQ7DIuhcAaQxyaZspLvYyZbC4/G3fefCsM84p+ywuFg==
X-Received: by 2002:a05:620a:4412:b0:767:2bbc:fcc7 with SMTP id v18-20020a05620a441200b007672bbcfcc7mr1607819qkp.14.1690360745363;
        Wed, 26 Jul 2023 01:39:05 -0700 (PDT)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com. [209.85.219.46])
        by smtp.gmail.com with ESMTPSA id w11-20020ae9e50b000000b00767721aebc0sm4261560qkf.32.2023.07.26.01.38.56
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Jul 2023 01:39:00 -0700 (PDT)
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-63d30554eefso898136d6.3
        for <linux-media@vger.kernel.org>; Wed, 26 Jul 2023 01:38:56 -0700 (PDT)
X-Received: by 2002:a05:6214:16cc:b0:62f:f2f0:2af3 with SMTP id
 d12-20020a05621416cc00b0062ff2f02af3mr1247360qvz.41.1690360732250; Wed, 26
 Jul 2023 01:38:52 -0700 (PDT)
MIME-Version: 1.0
References: <20230717-uvc-oob-v2-1-c7745a8d5847@chromium.org>
 <20230725213451.GU31069@pendragon.ideasonboard.com> <CANiDSCttkqows7PZS823Jpk-CqK9Gz2rujF_R4SPDi=wcPJ2LA@mail.gmail.com>
 <20230726080753.GX31069@pendragon.ideasonboard.com> <952fb983-d1e0-2c4b-a7e8-81c33473c727@leemhuis.info>
In-Reply-To: <952fb983-d1e0-2c4b-a7e8-81c33473c727@leemhuis.info>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Wed, 26 Jul 2023 10:38:40 +0200
X-Gmail-Original-Message-ID: <CANiDSCvVag+sW5JDTKAPuML_-+6xHWgF+NeKoBKSd5MMr1Yiag@mail.gmail.com>
Message-ID: <CANiDSCvVag+sW5JDTKAPuML_-+6xHWgF+NeKoBKSd5MMr1Yiag@mail.gmail.com>
Subject: Re: [PATCH v2] media: uvcvideo: Fix OOB read
To:     Thorsten Leemhuis <linux@leemhuis.info>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        stable@kernel.org, Zubin Mithra <zsm@chromium.org>,
        =?UTF-8?Q?Kai_Wasserb=C3=A4ch?= <kai@dev.carbon-project.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Thorsten

On Wed, 26 Jul 2023 at 10:33, Thorsten Leemhuis <linux@leemhuis.info> wrote:
>
> On 26.07.23 10:07, Laurent Pinchart wrote:
> > (CC'ing Kai and Thorsten who have added the check to checkpatch)
> >
> > On Wed, Jul 26, 2023 at 08:24:50AM +0200, Ricardo Ribalda wrote:
> >> On Tue, 25 Jul 2023 at 23:34, Laurent Pinchart wrote:
> >>> On Thu, Jul 20, 2023 at 05:46:54PM +0000, Ricardo Ribalda wrote:
> >>>> If the index provided by the user is bigger than the mask size, we might do an
> >>>> out of bound read.
> >>>>
> >>>> CC: stable@kernel.org
> >>>> Fixes: 40140eda661e ("media: uvcvideo: Implement mask for V4L2_CTRL_TYPE_MENU")
> >>>> Reported-by: Zubin Mithra <zsm@chromium.org>
> >>>
> >>> checkpatch now requests a Reported-by tag to be immediately followed by
> >>> a Closes
>
> Not that it matters, the changes I performed only required a Link: tag,
> which is how things should have been done for many years already. It
> later became Closes: due to patches from Matthieu. But whatever. :-D
>

I prefer to leave the Reported-by and remove the Closes, that way we
credit the reporter (assuming they approved to be referred).

But if that is not possible, just remove the reported-by. A private
link is pretty much noise on the tree.

Thanks!

> >>> tag that contains the URL to the report. Could you please
> >>> provide that ?
> >> I saw that, but the URL is kind of private:
> >> Closes: http://issuetracker.google.com/issues/289975230
> > Ah :-S I wonder if we should drop the Reported-by tag then ?
>
> That's what I do, unless the reporter granted his permission. To quote
> Documentation/process/5.Posting.rst : ```Be careful in the addition of
> tags to your patches, as only Cc: is appropriate for addition without
> the explicit permission of the person named; using Reported-by: is fine
> most of the time as well, but ask for permission if the bug was reported
> in private.```
>
> I heard of on instance where a GDPR complaint was filed due to a
> Reported-by: tag. So maybe that part should be even revisited reg. the
> Cc: aspect. :-/
>
> Ciao, Thorsten



-- 
Ricardo Ribalda
