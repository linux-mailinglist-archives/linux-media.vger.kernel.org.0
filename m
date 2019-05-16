Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D609E20935
	for <lists+linux-media@lfdr.de>; Thu, 16 May 2019 16:10:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727722AbfEPOKO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 May 2019 10:10:14 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:37042 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727590AbfEPOKO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 May 2019 10:10:14 -0400
Received: by mail-lj1-f194.google.com with SMTP id h19so3254626ljj.4
        for <linux-media@vger.kernel.org>; Thu, 16 May 2019 07:10:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mFiHB0JnWzaNluTTUtWvJbRgr+p3RJ44LiyzUaxVXTw=;
        b=cK2GLY8YQ0Bq/xAKlSetszCMvf/KRY/LpFGXEQuvtlTQ9GxR66sz89fJpDuD/7XaMr
         5GU5ODwBJHoDinbs0POt4xQjG0W9u0TXMyPaA0LXqNml1nJPKddpfvTR9Awu1zgyNQj4
         Pi7CVwZE3OIlIsOe976TkaA4s+05SkOfQP4Gelc+/fIF6557bz8XeV1YdYtT29J3DqLY
         rXUWo6X/b9H0nKeo9XA8I+WYuHcLYqEhg1CqvZtwsV37gnROVeo+OErwLjcXIL4N9ejV
         YqyUpBslqj7vr2yEoQr/wNj6FdfN3oAKUnED/RcgVUUIYwK3S3yKNAO4mN7xITczGr/L
         hp6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mFiHB0JnWzaNluTTUtWvJbRgr+p3RJ44LiyzUaxVXTw=;
        b=t9UV6VVTlywyJyqGUwk0IIsd5bO5Dc8oU7z1cLO1LLyCbQbVSqS8kzDq9n7R82CvWV
         Qk/9ynbOHKKTvf2Vid2tX9ja62R7UwfmEmKm0HAia+NLONoI+QIFH3YNxGIMSyKhMlUY
         f52p5sAKESC2pNKscR7bUXfyPXwSvdbsXmdgs6LakMT6i56fyvRxhniM5PN2m3EgZqyd
         42JYmsvaLawdBWalN5l1ix0+9bapFKvBvkMz30v8oK/NlHzqyEhwZ+IGHRZ4/jDz+39W
         tiQwPCUK/dI8zQCnj3yb2cEjKYnUHrbQ8jT34EJe3ALtT9eqz/wS72kTDVzwrirDstBA
         Ir9Q==
X-Gm-Message-State: APjAAAUXZxL+mhrU4S7cwPL1YkBV4yqA0PfEHOs/Y1CH6sCoAcFCp+Lw
        CHfBGjHR+TKPR7cP+0GPPqpXULbNi0Px6KTk9BbpkQ==
X-Google-Smtp-Source: APXvYqzbqhv7h1KEK6uOJf+9M7gmK9y1jNCux7oAshoRwUNxXe9xBjt+85je2qOZfn5RZUw3una3C3k5YnoksDinIG4=
X-Received: by 2002:a2e:7510:: with SMTP id q16mr24734323ljc.160.1558015811786;
 Thu, 16 May 2019 07:10:11 -0700 (PDT)
MIME-Version: 1.0
References: <20190416083852.126786-1-darekm@google.com> <dcb189af-f67f-ede3-b4fb-de1da7b53ccb@xs4all.nl>
 <CALFZZQEoiikyXmHJyEgEJTRNryTN8ScNK4P3bDCp-9v9GtvU8g@mail.gmail.com> <b78864b4-e470-99b2-5505-890d178b72f8@xs4all.nl>
In-Reply-To: <b78864b4-e470-99b2-5505-890d178b72f8@xs4all.nl>
From:   Dariusz Marcinkiewicz <darekm@google.com>
Date:   Thu, 16 May 2019 16:10:00 +0200
Message-ID: <CALFZZQF9qJbDsG1nzdjTxaG=89Pu0k=pxg3TChMQcf+hDxaeuw@mail.gmail.com>
Subject: Re: [RFC PATCH v2] media: cec: expose HDMI connector to CEC dev mapping
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org, hans.verkuil@cisco.com,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans.

From: Hans Verkuil <hverkuil@xs4all.nl>
Date: Thu, May 9, 2019 at 11:31 AM
To: Dariusz Marcinkiewicz
Cc: <linux-media@vger.kernel.org>, <hans.verkuil@cisco.com>,
<linux-kernel@vger.kernel.org>

> On 5/9/19 9:52 AM, Dariusz Marcinkiewicz wrote:
> > Hi Hans.
> >
> > On Wed, Apr 24, 2019 at 2:09 PM Hans Verkuil <hverkuil@xs4all.nl> wrote:
> >>
> >> Hi Dariusz,
> >>
> >> This is getting close, so I think for the next version you can drop
> >> the RFC tag.
> >>
> >> Some comments:
> >>
> > ...
> >>> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c
> >>> @@ -261,7 +261,7 @@ static int dw_hdmi_cec_probe(struct platform_device *pdev)
> >>>       cec->adap = cec_allocate_adapter(&dw_hdmi_cec_ops, cec, "dw_hdmi",
> >>>                                        CEC_CAP_LOG_ADDRS | CEC_CAP_TRANSMIT |
> >>>                                        CEC_CAP_RC | CEC_CAP_PASSTHROUGH,
> >>> -                                      CEC_MAX_LOG_ADDRS);
> >>> +                                      CEC_MAX_LOG_ADDRS, NULL);
> >>
> >> Hmm, the connector information is actually available through cec->hdmi.
> >>
> >> I think it would make sense to create a helper function that fills in
> >> struct cec_connector_info based on a struct drm_connector pointer.
> >> And add a function to drivers/gpu/drm/bridge/synopsys/dw-hdmi.c that
> >> dw-hdmi-cec.c can call that does the same.
> >
> > Looking at the code here, is the connector info guaranteed to be
> > available at the time cec_allocate_adapter is called here?
> > drm_connector won't be initialized until dw_hdmi_bridge_attach is
> > called, which happens after the cec platform device is created.
>
> Good point. The creation of the cec platform device should probably
> be moved to dw_hdmi_bridge_attach.
>
> > ...
> >>>       priv->adap = cec_allocate_adapter(&tda9950_cec_ops, priv, "tda9950",
> >>>                                         CEC_CAP_DEFAULTS,
> >>> -                                       CEC_MAX_LOG_ADDRS);
> >>> +                                       CEC_MAX_LOG_ADDRS,
> >>> +                                       NULL);
> >>
> >> Here too the drm_connector can be found via struct tda9950_glue.
> >> So it is easy to provide proper connector information.
> >
> > The same concern as with the comment before.
>
> Same solution: this has to be moved.
>
> I have hardware to test patches for both drivers. It might take 2-3 weeks
> before I can test as I don't always has access to the hardware, but at
> least I can verify that moving this code won't break anything.
>
> It's best to first move the code in separate patches before applying the
> "expose HDMI connector to CEC dev mapping" patch on top of them.
>

I've submitted another revision of the changes, with those 2 patches
added on top. Hope that is ok.

Please take a look. It would be great if you could give those 2
patches a go on an actual hardware.

Thank you and best regards.
