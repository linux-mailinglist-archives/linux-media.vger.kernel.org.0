Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 62A1C2C419
	for <lists+linux-media@lfdr.de>; Tue, 28 May 2019 12:17:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726562AbfE1KRD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 May 2019 06:17:03 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:40020 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726476AbfE1KRD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 May 2019 06:17:03 -0400
Received: by mail-lf1-f66.google.com with SMTP id h13so14119223lfc.7
        for <linux-media@vger.kernel.org>; Tue, 28 May 2019 03:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=omzYkgWz22q89sKu1iLsbZyCOdqyQheSz4RqyHrLMFc=;
        b=p8fD8VwvSW3OdflENE16cTmUBmEcFgPsh+D3UCs5vCYq4VWrIb7YSj5zvjX70YB63z
         F7WK4jzwaVXumiHF4vdKsku46bYkSHEbhtCPipyHpVAsXj9M/SNffG5e8WZy/F7lO5r5
         DE+3zlpeD71/E4OQjpuCppHJrm7uuD8AZQxJQIm+jjJRUetWfFkUkEjKlS4dTYV+OkNp
         sKEuQUt3C4SG/DDcI5N9QNSPh1ApgZEdXNqulHv6XhRUmAZ2U2qRrZDPZm/9/qj6IDl6
         IrRqfnlIb2Rb6rGts7d7kZPd6tn003l5L2qeIXdoxr3OZJYCrq2a6yEOC6tFjKuUGUXY
         hF7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=omzYkgWz22q89sKu1iLsbZyCOdqyQheSz4RqyHrLMFc=;
        b=bs4md0BXAYehzXmb1/jVD3BiX1Sza1z9XekRBBqTzgJwL9bOiBMq35UueAQABXwlVl
         ZGIkxeqziJSlFvQCNZ6FM4I16+QoTKXkx+jg4YBHS6nhatkxDBzGvSq3ehBGcVYLhMSL
         YZCJ1WGuQEOHKIlXuml+m5gC12sL434aQH6pVWetVyHQAqpTdaZt1q+pOCb/Ap35tnxU
         ci5T9rHctxSatlp6WbuRAV1FfMlLWiF2Br4tXKMeEeUgRHy/VYwZlgqsvBcfPinVMOMi
         h0DLtqKeimsyMTYJ+rB+c3NBTST+H7Uu3SofvIx98/1dTG7Du+2qPCxUvPsQf/z0AnX8
         fIpw==
X-Gm-Message-State: APjAAAWos+CvcadQgVHLepeA/RoFGjH4WojuAmE2RJfDd9MVv/C2V3qp
        Qg6ZBry5fJx94wFFpJ+4BHWxHyj2WNsq4h6Pfc7jcA==
X-Google-Smtp-Source: APXvYqzamdaZXpeZl61uUP6hfueaTlLGJ89yX6kdCpWeIWmbcsT+OGn6sLsetdzaTpiI1Xod4K0QX7oKadskvsU6DaA=
X-Received: by 2002:a19:488e:: with SMTP id v136mr3600054lfa.192.1559038620930;
 Tue, 28 May 2019 03:17:00 -0700 (PDT)
MIME-Version: 1.0
References: <CA+G9fYuC8dgKs04HmyCaKeQ_xwqKBxnh=zsOFjQK+3Fq7AZRyw@mail.gmail.com>
 <5de0df37-f0d0-f54c-2eef-a7533cbe7a25@xs4all.nl> <CA+G9fYtbb82EPY9gG63+U2FTVswt7f3FjHdaHMA2kibxgVvZcw@mail.gmail.com>
In-Reply-To: <CA+G9fYtbb82EPY9gG63+U2FTVswt7f3FjHdaHMA2kibxgVvZcw@mail.gmail.com>
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Tue, 28 May 2019 15:46:49 +0530
Message-ID: <CA+G9fYu-guJaWDrEp5=KeJsje6Teo-V=_AhFStf0gnLk-QNfzA@mail.gmail.com>
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

On Mon, 20 May 2019 at 19:26, Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
>
> Hi Hans,
>
> On Mon, 13 May 2019 at 19:08, Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
> >
> > On 5/13/19 3:32 PM, Naresh Kamboju wrote:
> > > Do you see test VIDIOC_G/S_PARM: FAIL on stable 4.14, 4.9 and 4.4
> > > kernel branches ?
> >
> > Probably related to commit 8a7c5594c0202 (media: v4l2-ioctl: clear fields in s_parm).
>
> I have cherry-picked on stable rc 4.9 branch and tested and test got
> PASS on x86_64.

I have cherry-picked for stable -rc 4.14 and 4.9 and test got PASS.

do you want to queue this for stable rc 4.14 and 4.9 ?

I have tested for 4.4 with patch applied but failed with below error.

test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
 warn: ../../../v4l-utils-1.16.0/utils/v4l2-compliance/v4l2-test-formats.cpp(1237):
S_PARM is supported but doesn't report V4L2_CAP_TIMEPERFRAME
 fail: ../../../v4l-utils-1.16.0/utils/v4l2-compliance/v4l2-test-formats.cpp(1139):
node->has_frmintervals && !cap->capability
test VIDIOC_G/S_PARM: FAIL

4.4 - failed log
https://lkft.validation.linaro.org/scheduler/job/746548#L1678

ref:
4.14 pass log,
https://lkft.validation.linaro.org/scheduler/job/739126#L1843

4.9 pass log,
https://lkft.validation.linaro.org/scheduler/job/736243#L1744

- Naresh
