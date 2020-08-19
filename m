Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB7A824A424
	for <lists+linux-media@lfdr.de>; Wed, 19 Aug 2020 18:37:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726414AbgHSQhd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 Aug 2020 12:37:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725939AbgHSQhc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 Aug 2020 12:37:32 -0400
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com [IPv6:2607:f8b0:4864:20::d44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADE59C061757;
        Wed, 19 Aug 2020 09:37:31 -0700 (PDT)
Received: by mail-io1-xd44.google.com with SMTP id v6so25253073iow.11;
        Wed, 19 Aug 2020 09:37:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=S0X/vbriFVnWWVZ5CjN02GNpsIqupceWmrYzbhZ7QUo=;
        b=kxXLwp558f4WUskUKC2YtyusCu2kJ76eIdjy8pThlVKpa4Px4X5RZKR8ctMjEWU0iE
         tPNiT87Mcj97vH0O7J0p1yIejp25/GM06hu5c+ts9U1UxNk1vOL03DPDVidKS9oTZAtr
         M2skvcTVA1ufmtbR6/knE1V4Dn7eEWQoueLQLWcqKPH6ZrRLSQU0jki/FHCkvjrJuhlQ
         uwE19BnTWFr7peo0uRnfIBONCXFJCqZQh/CN4L2BbYU+/bfUeF2pal9KSwCbxzd4XRVB
         hUU3L/Ob04dwgM9bimBln9Pjlc63IEGogA6y6/pEj8Nn7rYo/RLk/6MhV1DZ4JhRP5Dj
         kVvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=S0X/vbriFVnWWVZ5CjN02GNpsIqupceWmrYzbhZ7QUo=;
        b=bsfu2+FxdhSpUiRkKPHr/wrUVl4rmJ7TFXD03Fch3OeuWSSBJDiNPPxbPGb79RMzI3
         wpR+BOncyxN42cDgUE1wMDWpRVjKCIPKWv4QzA7rtPNyyHysV5m8X9Wuu9nO+icT+OdI
         srJzK5b1H3E3FV8uYzwXhZWk+MsYxFlcjY8LulD76XlQGtzv2L3LZQYTfJ4Tj6ukCwHD
         sQvKwQcc7fEqJFgwpnAcqGYjd70nxNJ39tEjeyf76GQb2AScY9MiOYcol9SkdfTZ3rZZ
         DU/+R7Kz9J9XsdXB1HuWvUhkwFlPK+ce9LxZzFYI/b7JLTaXoGwu96DrjlyZ37ufM5vJ
         TZxQ==
X-Gm-Message-State: AOAM531L0OYEtr4hHhVI3+87O2nlZJfRL3Shvu6d2bNWh+LWTETPy0Pe
        OeFl4xqglG3CKllS2zMFG76jgPHhFx8Syy9hfVU=
X-Google-Smtp-Source: ABdhPJwQgGfXpfjFcgyzo55Xm2hlisDkSmmnFpbdU3B7UkbHGnYnlb807ccg0oXcXYTBp0E5J6z8mZqNeMZhLZ3tqKs=
X-Received: by 2002:a6b:7d42:: with SMTP id d2mr21173344ioq.17.1597855050836;
 Wed, 19 Aug 2020 09:37:30 -0700 (PDT)
MIME-Version: 1.0
References: <20200816064901.977682-1-ztong0001@gmail.com> <75b8354b-362a-0215-8038-45bd68be7de5@xs4all.nl>
In-Reply-To: <75b8354b-362a-0215-8038-45bd68be7de5@xs4all.nl>
From:   Tong Zhang <ztong0001@gmail.com>
Date:   Wed, 19 Aug 2020 12:37:20 -0400
Message-ID: <CAA5qM4BqzwiRijEkk=0EEGCwgjm1BnN3RbT2=51z0pzCGHqngg@mail.gmail.com>
Subject: Re: [PATCH] media: pvrusb2: fix parsing error
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        mchehab@kernel.org, isely@pobox.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,
Thank you very much for your comments.
The change looks good to me.
 -- However, I'm not quite familiar with the patch submission process
in this situation.
Would you like to go ahead and create an improved version?
Thanks,
- Tong

On Wed, Aug 19, 2020 at 10:38 AM Hans Verkuil <hverkuil@xs4all.nl> wrote:
>
> Hi Tong,
>
> On 16/08/2020 08:49, Tong Zhang wrote:
> > pvr2_std_str_to_id() returns 0 on failure and 1 on success,
> > however the caller is checking failure case using <0
> >
> > Signed-off-by: Tong Zhang <ztong0001@gmail.com>
> > ---
> >  drivers/media/usb/pvrusb2/pvrusb2-hdw.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/media/usb/pvrusb2/pvrusb2-hdw.c b/drivers/media/usb/pvrusb2/pvrusb2-hdw.c
> > index 1cfb7cf64131..db5aa66c1936 100644
> > --- a/drivers/media/usb/pvrusb2/pvrusb2-hdw.c
> > +++ b/drivers/media/usb/pvrusb2/pvrusb2-hdw.c
> > @@ -867,7 +867,8 @@ static int ctrl_std_sym_to_val(struct pvr2_ctrl *cptr,
> >       int ret;
> >       v4l2_std_id id;
> >       ret = pvr2_std_str_to_id(&id,bufPtr,bufSize);
> > -     if (ret < 0) return ret;
> > +     if (ret == 0)
> > +             return ret;
>
> But now you return 0 instead of an error when pvr2_std_str_to_id failed.
>
> Just do this:
>
>         if (!pvr2_std_str_to_id(&id,bufPtr,bufSize))
>                 return -EINVAL;
>
> And you can drop the ret variable as well since that's no longer needed.
>
> Regards,
>
>         Hans
>
> >       if (mskp) *mskp = id;
> >       if (valp) *valp = id;
> >       return 0;
> >
>
