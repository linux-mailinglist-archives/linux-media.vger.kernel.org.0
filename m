Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4AC26CCA35
	for <lists+linux-media@lfdr.de>; Sat,  5 Oct 2019 15:54:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726076AbfJENyk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 5 Oct 2019 09:54:40 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:42482 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725963AbfJENyk (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 5 Oct 2019 09:54:40 -0400
Received: by mail-ed1-f65.google.com with SMTP id y91so8446356ede.9
        for <linux-media@vger.kernel.org>; Sat, 05 Oct 2019 06:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=aoMrVjD9pPSSzc4E1xcJGsjpqSl9oo6KPSGXNjksVoY=;
        b=hhPhzet1u1II33zaC91PKONNrVp37nLpbGp81QoC+q4ejgdqZgwvwNgRe+rztAJpwy
         RlEaIzmO108JBikkUqLB9J8BifAQkXccEj8xf5vg8Gktq4P907WTzgqKkYEoZHn6ichI
         PF7xBw3j6QF8S+Te0naKwIsBUEs9fPIT2g5l8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aoMrVjD9pPSSzc4E1xcJGsjpqSl9oo6KPSGXNjksVoY=;
        b=oyE756yHnHHjN2VyL5mUwQazHQdKwjZWLvuiVWqWM7G7SRjrR0VayjLpSY96kqXPuQ
         LDxR0UvJ5PmIuQnFmLK7zBTwvgo/1FD7dF4KivrHnIDb11k1d6rY4p9N6gsK1WRjRHap
         cBJgbPp6mcX5cHPBlBp84klA/oSlh2/y11wAUcYXbnUOeWSWLw1wXC2/hPkg9fjuWapy
         SvV8xWY+VsdAqKK8FyGm5wyD5OhWFvoqAPDmNBupm5xQwWvvMT7ACWMez4qNPJIbW6M/
         j1fUHy+BPUmc0vBVw9JjqSnfaiuk6l7mYla3X0u7xOa3Grpj4DH1Py0P6uMV6mlLKrbV
         J4NQ==
X-Gm-Message-State: APjAAAWg8OWOv11ogYRD4b77SNmmiRNPJBFKwBgnqi/3vkqW3W33/1vU
        /J4LsaFtmjSk/ROexDpH/IFFKp+Tb71XHg==
X-Google-Smtp-Source: APXvYqzwRX5uVgmnvajPd7VE+OtZzUdLwc4dW2RiwpUB6LBqk5FafGu54y86ASbvGWjCKBgg2WU0MA==
X-Received: by 2002:a17:906:c4b:: with SMTP id t11mr16858970ejf.131.1570283678430;
        Sat, 05 Oct 2019 06:54:38 -0700 (PDT)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com. [209.85.221.54])
        by smtp.gmail.com with ESMTPSA id s19sm1042325ejs.78.2019.10.05.06.54.37
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Oct 2019 06:54:37 -0700 (PDT)
Received: by mail-wr1-f54.google.com with SMTP id r5so10225566wrm.12
        for <linux-media@vger.kernel.org>; Sat, 05 Oct 2019 06:54:37 -0700 (PDT)
X-Received: by 2002:adf:f684:: with SMTP id v4mr13287004wrp.155.1570283676902;
 Sat, 05 Oct 2019 06:54:36 -0700 (PDT)
MIME-Version: 1.0
References: <20190905114210.9232-1-p.zabel@pengutronix.de> <20191003211247.GC3927@aptenodytes>
 <CAAFQd5BG5_up_Ov7GU3qcB5NCjWcnP4Da0GKWJTuRzGr-WEa4g@mail.gmail.com> <20191005133920.GB19943@aptenodytes>
In-Reply-To: <20191005133920.GB19943@aptenodytes>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Sat, 5 Oct 2019 22:54:24 +0900
X-Gmail-Original-Message-ID: <CAAFQd5AE8=bzQH+i4EoKYpB8RkprnWEAW0=8xS=fCa7Y4Hsfaw@mail.gmail.com>
Message-ID: <CAAFQd5AE8=bzQH+i4EoKYpB8RkprnWEAW0=8xS=fCa7Y4Hsfaw@mail.gmail.com>
Subject: Re: [PATCH] media: uapi: h264: clarify num_ref_idx_l[01]_(default_)active
 fields
To:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Sasha Hauer <kernel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, Oct 5, 2019 at 10:39 PM Paul Kocialkowski
<paul.kocialkowski@bootlin.com> wrote:
>
> Hi,
>
> On Sat 05 Oct 19, 17:22, Tomasz Figa wrote:
> > On Fri, Oct 4, 2019 at 6:12 AM Paul Kocialkowski
> > <paul.kocialkowski@bootlin.com> wrote:
> > >
> > > Hi,
> > >
> > > On Thu 05 Sep 19, 13:42, Philipp Zabel wrote:
> > > > To explain why num_ref_idx_active_override_flag is not part of the API,
> > > > describe how the num_ref_idx_l[01]_active_minus1 fields and the
> > > > num_ref_idx_l[01]_default_active_minus1 fields are used, depending on
> > > > whether the decoder parses slice headers itself or not.
> > >
> > > Is there any particular reason why this is preferable to exposing the flag?
> > > It feels like having the flag around sticks closer to the bitstream,
> > > so it's more straightforward for everyone.
> > >
> > > In case there's only one set of fields exposed by the hardware (and it doesn't
> > > do slice parsing itself), we could always check the flag in the driver and use
> > > either the default PPS values or the slice-specific values there.
> > >
> > > What do you think?
> >
> > IMHO it would only add further logic to the drivers, because they
> > would need to have a conditional block that selects default or
> > per-slice value based on the flag. The goal was to be able for the
> > driver to just passively write num_ref_idx_l[01]_active_minus1 (or the
> > default one for slice-parsing hardware) to corresponding hardware
> > registers.
>
> Well, the Allwinner block has both set of fields and a field for the flag,
> so in this case I find that it is cleaner to just copy the values and flag
> rather than always setting the flag even when it's the default value used.
>
> More generally, the two sets + flag are closer to bitstream which feels less
> confusing than re-purposing these fields from the slice header to fit the
> result of flag ? per-slice : per-picture.
>
> > We're talking about kernel drivers here and for security reasons any
> > logic should be reduced to the strictly necessary minimum.
>
> I definitely agree that bitstream parsing in the kernel is to be avoided for
> security reasons (among other things), but don't see the harm in considering
> the flags in-driver if needed. We do it for a number of other flags already
> (and strongly need to).

If the fields are well documented, does it really matter? I'd suggest
just keeping it as is, rather than overpolishing things and preventing
the interface from stabilizing.

Best regards,
Tomasz
