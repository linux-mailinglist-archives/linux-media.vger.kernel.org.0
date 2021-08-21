Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E9623F3AD8
	for <lists+linux-media@lfdr.de>; Sat, 21 Aug 2021 15:59:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231167AbhHUN7s (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 21 Aug 2021 09:59:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230167AbhHUN7q (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 21 Aug 2021 09:59:46 -0400
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com [IPv6:2607:f8b0:4864:20::b35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C3D1C061575;
        Sat, 21 Aug 2021 06:59:07 -0700 (PDT)
Received: by mail-yb1-xb35.google.com with SMTP id p4so24465907yba.3;
        Sat, 21 Aug 2021 06:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0XteRi3XzBqghOEZ5aq+q2tRiDkRnrgjY6e5r4R/fzA=;
        b=fkkeI/XAbuTYQSDi6nIE5kLL/ITXbHgzzrTT/plbGGjiLqzNWAC0njyRghhqVFCpVR
         Yj01o40GURVWHWZeNAuIWj0mr6Dn5cI5A5+dnkIfiwUyWXru9ZpmcNhGjKfXN2Zcyb8c
         jlx4oAB/zoS0HbRE5t9g3zmxmEwrNfRabPVjOI1kup1vLm/TO273lVEWRQLZ3V1zxPs/
         LFW3JzHekSaEHLudoY/fJwcIbk6xvG1lAdUSJV/2lWm63sVRMu1693tFLEpsxbcrB0Y6
         qVhX9/+KPEIuPaH16BZ6rT8xljnLuM3jP5Ui8++hN4ejR+Fq3Ti/s61U3Wj4/wOZosyC
         ZYJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0XteRi3XzBqghOEZ5aq+q2tRiDkRnrgjY6e5r4R/fzA=;
        b=kFqOcIyQkB5X3cuxmNvLrciatEW8CEeJGt0D540u/2gwLI5GCEIPF+RXgsy7CJ+MVx
         /ytZLzLDxeqXCO69CHm7klI18vegKZNboaukgccFacVRBNVq5S4PQJyObQGyIvj4yvLE
         nrMMXViV1sTKCvsAYLhuw6JKE8FneaNPsqAyeiu+Vhc2T4qDGV856eVPTpf+nyqfdS3P
         BLozUq9x1noSmViNOidMQxWCxMf603GUvPpgHeN4RzVhXpQykKD1t9jU/ExvLl4oYcDw
         Vw5noz475oaPUfdTiU5qIi+25BrzRJloBnkJR5YRLe/M1Z7crkZISj7yQRF6owYHzh+/
         fcTA==
X-Gm-Message-State: AOAM531JrTNLzryppbJjpldnA1So3vJuznZ48+gyTLeYbRS/WDtAoy8k
        tu9A8eNh5bu3cJ+xALWSsggZ7SG9p57dbkVD+vrX22UQZDMgnlQD
X-Google-Smtp-Source: ABdhPJxzm79gRN73mW6p8qqJLw7WCxAyPq9LvVo5cZ8owOVvOHy+/mGDq3DN+03rbo78ymm31h241yqdi1xta1hN+eI=
X-Received: by 2002:a25:c9c6:: with SMTP id z189mr28211215ybf.497.1629554344734;
 Sat, 21 Aug 2021 06:59:04 -0700 (PDT)
MIME-Version: 1.0
References: <4e3e0d40-df4a-94f8-7c2d-85010b0873c4@web.de> <20210819133128.45ef4353@coco.lan>
In-Reply-To: <20210819133128.45ef4353@coco.lan>
From:   Manu Abraham <abraham.manu@gmail.com>
Date:   Sat, 21 Aug 2021 19:28:54 +0530
Message-ID: <CAHFNz9+2rQ+kGDM1m5mkZ9CjNjWqMsZxWQ8=i2=6UtKh0vQUrA@mail.gmail.com>
Subject: Re: [Regression 5.14] media: dvb userspace api
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Soeren Moch <smoch@web.de>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Dearest Mauro,

I am not trying to annoy you or anyone else with my response here, but:


On Thu, Aug 19, 2021 at 5:01 PM Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:
>
> Em Wed, 11 Aug 2021 14:15:02 +0200
> Soeren Moch <smoch@web.de> escreveu:
>
> > Commit 819fbd3d8ef36c09576c2a0ffea503f5c46e9177 ("media: dvb header
> > files: move some headers to staging") moved audio, video, and osd parts
> > of the media DVB API to staging and out of kernel headers. But this is
> > part of the media userspace API, removing this causes regressions.
>
> There's no regression: a legacy driver (av7110) for a device that stopped
> being manufactured 15 years ago and that doesn't work anymore with current
> Digital TV transmissions was removed, together with the API that it was
> implemented inside such driver's code.


Please do not exaggerate..
(I can write more precise technical details in here, but that will not solve the
real issue at hand.)

You have only your own viewpoint, refuse to listen to anyone else. Wonder
why all the DVB developers left development ? It's all about you, yourself
and you. Linus doesn't care about anything else, you have been very lucky!

You need serious introspection about yourself. Take a deep breath, think for
yourself, why I stopped submitting code. Forget myself, think about the list
of developers who were around, but not now.

People need to have fun with what they are doing, but you make it, everything
about yourself. It's all about maintaining connections, rather than destroying
them. At least during these uncertain times, please stop the narrow thinking.

If you find my view offending, just ignore it, no need to give another thousand
mile long essay; I am on my way ..

Friendly Regards,
MA
