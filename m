Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6C0D42C65F
	for <lists+linux-media@lfdr.de>; Tue, 28 May 2019 14:23:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727103AbfE1MXh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 May 2019 08:23:37 -0400
Received: from mail-lj1-f176.google.com ([209.85.208.176]:44327 "EHLO
        mail-lj1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726894AbfE1MXh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 May 2019 08:23:37 -0400
Received: by mail-lj1-f176.google.com with SMTP id e13so17450139ljl.11
        for <linux-media@vger.kernel.org>; Tue, 28 May 2019 05:23:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ymG/kaexVio8Y+H8Sg1++5yggKsKosn6WTBAawQTRw8=;
        b=sjcsG/R9SOUmrIoO/4C+AklpCd2b8K4HcDXhJzE8GhUx4DK8S8KA8aF6U0hzEXl9qk
         8JvCCBmyrnqG0n7N8lhm9uivH2hDdqb6onYTDzoE+NFwrFgBF9fmv1y5WLyxDfizxwOB
         DZp7KDYA5p0jVXJNWQJhHF7ljiEGm7ljliAJsVZDwv30GPFKWu8ENz9grWGdMF2U3fjp
         x61PSSFKUgz5OXlkzq7IXezVQVyyE9w20yj9FIjnTngHrNBBFuzSljElG8GLH10jR9LI
         iY0NjXK6Xf0PXyIUAvg79HsL98OL3W5l2rjcNA7/riu2RcZ2En4NIcMSSUmgG2UooZkG
         V/cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ymG/kaexVio8Y+H8Sg1++5yggKsKosn6WTBAawQTRw8=;
        b=PgUjM0psDjBCquEZDUYjdLuNwfy/z1CRiyyQSoAX5bim5Y+9x0VgBgINoeYDYSLiWk
         /T8nO547P45f0BMHZAaQwedfV8aquP209azGZcpP4LjAMN65UffGYYGWV5qKqagTi+vh
         DI90/vEN4SLluIqY3Lf690kushE4y8SbY/7b59LsFyRH50JALZ2kDo7gZl9xgdtgD8DA
         c9E0LERJsKAuHxpx6r9az8wspQCRqCPXn/caFcY1z68qd/9XIc1Bq0YahsFiQuTpAoys
         fcbURaZ4oidzIt5Uoazp8Q6bozvMHUhCZvrnpLdZxK9iEB5Gb5n5zlullm8CEVLYNNwf
         Sl4w==
X-Gm-Message-State: APjAAAWJix7Ha4VR9Fs1M+vdVIsg/p268kUgQdusSgG3hRjh0xHtga1O
        tWhcDNklmiWDC3oTqwPW03uw/lO3PKvIXmaqAV3J1w==
X-Google-Smtp-Source: APXvYqyJ02wwCyQ8eiKTSbWS6OLDxuQmUnrfb+73pJjp7xH0SNE6BIax5LQq2o0IHRXQPJKugcdAsM+DTQGnGXhdKLk=
X-Received: by 2002:a2e:86c2:: with SMTP id n2mr32026124ljj.23.1559046214980;
 Tue, 28 May 2019 05:23:34 -0700 (PDT)
MIME-Version: 1.0
References: <CA+G9fYuC8dgKs04HmyCaKeQ_xwqKBxnh=zsOFjQK+3Fq7AZRyw@mail.gmail.com>
 <5de0df37-f0d0-f54c-2eef-a7533cbe7a25@xs4all.nl> <CA+G9fYtbb82EPY9gG63+U2FTVswt7f3FjHdaHMA2kibxgVvZcw@mail.gmail.com>
 <CA+G9fYu-guJaWDrEp5=KeJsje6Teo-V=_AhFStf0gnLk-QNfzA@mail.gmail.com> <29b08b95-ae5b-2989-8f09-93fe702aef29@xs4all.nl>
In-Reply-To: <29b08b95-ae5b-2989-8f09-93fe702aef29@xs4all.nl>
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Tue, 28 May 2019 17:53:23 +0530
Message-ID: <CA+G9fYuLsDQSFMJAjWXAORvQhww6EW8uL9zKYtidO9E6MnxxQA@mail.gmail.com>
Subject: Re: test VIDIOC_G/S_PARM: FAIL on stable 4.14, 4.9 and 4.4
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org,
        open list <linux-kernel@vger.kernel.org>,
        Sami Tolvanen <samitolvanen@google.com>,
        paul.kocialkowski@bootlin.com, ezequiel@collabora.com,
        treding@nvidia.com, niklas.soderlund+renesas@ragnatech.se,
        sakari.ailus@linux.intel.com,
        Hans Verkuil <hans.verkuil@cisco.com>, mchehab@kernel.org,
        lkft-triage@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Tue, 28 May 2019 at 17:27, Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
> >>>> Do you see test VIDIOC_G/S_PARM: FAIL on stable 4.14, 4.9 and 4.4
> >>>> kernel branches ?
> >>>
> >>> Probably related to commit 8a7c5594c0202 (media: v4l2-ioctl: clear fields in s_parm).
> >>
> >> I have cherry-picked on stable rc 4.9 branch and tested and test got
> >> PASS on x86_64.
> >
> > I have cherry-picked for stable -rc 4.14 and 4.9 and test got PASS.
>
> Just to be clear: you cherry-picked commit 8a7c5594c0202 (media: v4l2-ioctl: clear
> fields in s_parm) for both 4.9 and 4.14, right?

Right.

>
> If so, feel free to post that patch to the stable mailinglist for those kernels.
> Make sure you CC me when you do that.

Alright I will do that.

> > do you want to queue this for stable rc 4.14 and 4.9 ?
> >
> > I have tested for 4.4 with patch applied but failed with below error.
> >
> > test VIDIOC_G/S_PARM: FAIL
>
> You probably need commit f63998331935 ([media] vivid: set V4L2_CAP_TIMEPERFRAME)
> and possibly commit 3f122df4a2ba (media: vivid: do not implement VIDIOC_S_PARM for output streams).

Thanks for suggesting few more patches.
I will apply these patches and test.

- Naresh
