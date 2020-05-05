Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 604BF1C63A6
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2020 00:07:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728076AbgEEWHx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 May 2020 18:07:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727089AbgEEWHx (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 May 2020 18:07:53 -0400
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com [IPv6:2607:f8b0:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07BF7C061A0F
        for <linux-media@vger.kernel.org>; Tue,  5 May 2020 15:07:52 -0700 (PDT)
Received: by mail-ot1-x342.google.com with SMTP id 72so322859otu.1
        for <linux-media@vger.kernel.org>; Tue, 05 May 2020 15:07:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AfIT/WuF8BARson1K1tCL52p8V5Iip+hlQvnXv5u3Yk=;
        b=ocluBERiLLhWkfsgbcJtFVfcDygJ4FO7zBiROaUf12GsfG8USMlP4yxucUP/ofDXrA
         t3zHVzOHlzXRWbCLCjIwNXlf5q75gjvCTbIcFCa967fFh/vThTraJlEeNI8oEfBBl5dG
         7tEP3HKL2AAJ8wGO89q/cLaFvTNiWVM6ikoUwFVLP+YotjQl6rvXeKGafI4S36D2KMtJ
         mYSap747Hrjp29x3fPzJ7w71HuikutT0QHpTYZOHVyOPj9VQafJOVFHIJ2dmI3ULUTcK
         Owszpe2EyKS6UpKFhd/yycsxWD2P7zEO7baL9IJYgE6+yxN44RUBh7pL7Q4yAqoufmSU
         fB2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AfIT/WuF8BARson1K1tCL52p8V5Iip+hlQvnXv5u3Yk=;
        b=EyJii+beA45K6tN/M1zRXYJ16UuOmfbKLg9faaxcxPIgLCy82HpSmNNXworq00zrJ6
         nzaC6ttguu357O8Zg6bAm+9fWXCWnOGI92EuBhNaT7XDG5GmGtfQG9q6+zZa9Y7HH0iB
         i+Xbhlo6q2Vr8puWQTy8sO+2gr8rIqEvc3o7qGVj3Ty3U2Yd+1/bPqomRP+L9mFMygma
         tYAby9ewzXvYMBGICQQAH9D9zlAwh2PaIJI6eBDuw3jvnPZOWlk1fGEraeYk3X+2JsUr
         G5qJaTEAO60nSVoMO3ozN72jGV/gcXKKVaS78S+xKBiX2sAERCUsLr2pCJ1Y0fRk2Hz1
         XSGw==
X-Gm-Message-State: AGi0PubtFOGiT0bBAhY3OjZaQhcOGaSrS0/zjPfsuh2pttLV8gUYhOha
        uR6zdcnL4B4VEeDWIlxE3eev+ROw6ef12Hyp4EM=
X-Google-Smtp-Source: APiQypKDqeJiRkwvXSSPrenhxwo+iy9lqsousad8DkNaOI4h0hP91g4vbVM1J8K76+yeZNc0uct5BN508V3RLzPCCFA=
X-Received: by 2002:a05:6830:2421:: with SMTP id k1mr3721032ots.279.1588716471077;
 Tue, 05 May 2020 15:07:51 -0700 (PDT)
MIME-Version: 1.0
References: <20200429040627.27859-1-rosenp@gmail.com> <20200429040627.27859-7-rosenp@gmail.com>
 <792154c5-ee89-f467-cd4d-29a4aad7de5e@xs4all.nl>
In-Reply-To: <792154c5-ee89-f467-cd4d-29a4aad7de5e@xs4all.nl>
From:   Rosen Penev <rosenp@gmail.com>
Date:   Tue, 5 May 2020 15:07:39 -0700
Message-ID: <CAKxU2N85cRGybMKWq9KOW=1vmnY7ipEcGbDDSce-HmmoMz36+w@mail.gmail.com>
Subject: Re: [PATCH 7/7] utils: switch C to C++ headers
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, May 5, 2020 at 1:55 AM Hans Verkuil <hverkuil@xs4all.nl> wrote:
>
> On 29/04/2020 06:06, Rosen Penev wrote:
> > Recently, I changed exit() to the std variant, which caused build
> > failures on older platforms. Switch all headers to the C++ variants
> > to avoid this.
> >
> > These C headers are deprecated by C++14.
>
> What failures exactly? And on what platforms?
Maybe all.

std::exit needs cstdlib.

Build failure was privately reported to me for Ubuntu 18.04.
>
> This patch changes a lot of files, and I'd like to have a bit more
> information before applying this.
>
> I'll commit patches 5 and 6 of this series, but please repost the
> others with better commit logs that help me understand the reason
> for the change.
>
> Regards,
>
>         Hans
>
> >
> > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > ---
> >  utils/cec-compliance/cec-compliance.cpp          | 10 +++++-----
> >  utils/cec-compliance/cec-test-adapter.cpp        | 10 +++++-----
> >  utils/cec-compliance/cec-test-audio.cpp          | 10 +++++-----
> >  utils/cec-compliance/cec-test-fuzzing.cpp        | 10 +++++-----
> >  utils/cec-compliance/cec-test-power.cpp          | 10 +++++-----
> >  utils/cec-compliance/cec-test.cpp                |  8 ++++----
> >  utils/cec-ctl/cec-ctl.cpp                        | 10 +++++-----
> >  utils/cec-ctl/cec-pin.cpp                        | 12 ++++++------
> >  utils/cec-follower/cec-follower.cpp              |  8 ++++----
> >  utils/cec-follower/cec-processing.cpp            | 10 +++++-----
> >  utils/cec-follower/cec-tuner.cpp                 |  2 +-
> >  utils/common/media-info.cpp                      | 10 +++++-----
> >  utils/common/v4l2-info.cpp                       | 10 +++++-----
> >  utils/libcecutil/cec-info.cpp                    |  2 +-
> >  utils/libcecutil/cec-log.cpp                     |  8 ++++----
> >  utils/libcecutil/cec-parse.cpp                   | 10 +++++-----
> >  utils/rds-ctl/rds-ctl.cpp                        | 14 +++++++-------
> >  utils/v4l2-compliance/v4l2-compliance.cpp        | 12 ++++++------
> >  utils/v4l2-compliance/v4l2-test-buffers.cpp      | 10 +++++-----
> >  utils/v4l2-compliance/v4l2-test-codecs.cpp       | 12 ++++++------
> >  utils/v4l2-compliance/v4l2-test-colors.cpp       | 12 ++++++------
> >  utils/v4l2-compliance/v4l2-test-controls.cpp     | 10 +++++-----
> >  utils/v4l2-compliance/v4l2-test-debug.cpp        | 12 ++++++------
> >  utils/v4l2-compliance/v4l2-test-formats.cpp      | 12 ++++++------
> >  utils/v4l2-compliance/v4l2-test-input-output.cpp | 10 +++++-----
> >  utils/v4l2-compliance/v4l2-test-io-config.cpp    | 10 +++++-----
> >  utils/v4l2-compliance/v4l2-test-media.cpp        | 12 ++++++------
> >  utils/v4l2-compliance/v4l2-test-subdevs.cpp      | 12 ++++++------
> >  utils/v4l2-ctl/v4l2-ctl-common.cpp               | 10 +++++-----
> >  utils/v4l2-ctl/v4l2-ctl-edid.cpp                 |  8 ++++----
> >  utils/v4l2-ctl/v4l2-ctl-io.cpp                   | 12 ++++++------
> >  utils/v4l2-ctl/v4l2-ctl-meta.cpp                 | 12 ++++++------
> >  utils/v4l2-ctl/v4l2-ctl-misc.cpp                 | 12 ++++++------
> >  utils/v4l2-ctl/v4l2-ctl-modes.cpp                |  4 ++--
> >  utils/v4l2-ctl/v4l2-ctl-overlay.cpp              | 12 ++++++------
> >  utils/v4l2-ctl/v4l2-ctl-sdr.cpp                  | 12 ++++++------
> >  utils/v4l2-ctl/v4l2-ctl-selection.cpp            | 12 ++++++------
> >  utils/v4l2-ctl/v4l2-ctl-stds.cpp                 | 12 ++++++------
> >  utils/v4l2-ctl/v4l2-ctl-streaming.cpp            | 10 +++++-----
> >  utils/v4l2-ctl/v4l2-ctl-subdev.cpp               | 12 ++++++------
> >  utils/v4l2-ctl/v4l2-ctl-tuner.cpp                | 10 +++++-----
> >  utils/v4l2-ctl/v4l2-ctl-vbi.cpp                  | 10 +++++-----
> >  utils/v4l2-ctl/v4l2-ctl-vidcap.cpp               | 12 ++++++------
> >  utils/v4l2-ctl/v4l2-ctl-vidout.cpp               | 12 ++++++------
> >  utils/v4l2-ctl/v4l2-ctl.cpp                      | 12 ++++++------
> >  utils/v4l2-dbg/v4l2-dbg.cpp                      | 10 +++++-----
> >  46 files changed, 236 insertions(+), 236 deletions(-)
>
