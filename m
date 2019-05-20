Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ECA56238F7
	for <lists+linux-media@lfdr.de>; Mon, 20 May 2019 15:56:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730740AbfETN4s (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 May 2019 09:56:48 -0400
Received: from mail-lj1-f179.google.com ([209.85.208.179]:46074 "EHLO
        mail-lj1-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730228AbfETN4r (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 May 2019 09:56:47 -0400
Received: by mail-lj1-f179.google.com with SMTP id r76so12515970lja.12
        for <linux-media@vger.kernel.org>; Mon, 20 May 2019 06:56:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=h8FyerFcC8rxtoPBlcw4IeblJtG6XuunC6x9HaI2Vo4=;
        b=lZ4XWFAVApokp7FGmIea8ZO7d/lO54NT7Mk6geukFClNbjbB9OsRjDbSqBA1B6ZERq
         fej8pGOFNRK9PTvs6BsC6chSjlCvMApLP6HX9nqIdQhKHpF6VZrPuo1k8jd33QhiMQe0
         yB9y0T4cmEn+tw1Z2wVdqCcmbZ7+0pcPT/izzIMiOcKI+S9oz6FIojBkygnOr/37yY2a
         hxSBpDibrpTU0b/1xqh4yZFqfSgUB5P80XdHHY7XVIuaJNWESGE65pHhM/77kItMsYuO
         uo+DYI1YSBG84BlwsVDBN1TkplClG5pgXJlI/1vRgq8Mq7r0xJvDvnp/+yl4Gntzxpar
         6STg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=h8FyerFcC8rxtoPBlcw4IeblJtG6XuunC6x9HaI2Vo4=;
        b=GbxDK3JOS1Qa6CkCZe5ki1Qef8WQhSKmM5tbXTWBIcNEA4gF9+woreUKOuKTxsgPVp
         ADt+IpFXQY6aYvhhvXkn6V+CVnrdQDZ3D8mGQE4Ei4XsrwZC50fypZhqdoXTe1uel3EJ
         usLW3ZIcYoazX3l2J5/iF++XzsB15VoGdFxOQfMgFIgs8v4BRMY7IwMLVrWhRcTbVZE3
         mdE5Ynuoz7wpsGsF9DE8yOc7hgT5wwMD6bzoVTpIQHnLsz5NsLIgZtmZzrp52aTUoc2q
         5sWpz5iHBn/1KyXtgOfFm4t++CShS/QYJjCtXnfJWaDeSWt/WA14TW6sUCqt58iq6ax0
         q8Kg==
X-Gm-Message-State: APjAAAU50oh3jW/lkazg3BaZio/ZD5InWCnC9+34CsD2m84GO2t2awVQ
        5iQnoby4ZXyO1zdDv+/7yCOW6QRgfAV4mqinYRi96Q==
X-Google-Smtp-Source: APXvYqw37JWr2ZHF3WkgKza90V0bWwsnMPl8Ui4YFzyw4nbDcjCtd10JcYxvYpIBOJ0fdTyE45QWI6ryVDU3xxTN8Xc=
X-Received: by 2002:a2e:7411:: with SMTP id p17mr21387151ljc.24.1558360605783;
 Mon, 20 May 2019 06:56:45 -0700 (PDT)
MIME-Version: 1.0
References: <CA+G9fYuC8dgKs04HmyCaKeQ_xwqKBxnh=zsOFjQK+3Fq7AZRyw@mail.gmail.com>
 <5de0df37-f0d0-f54c-2eef-a7533cbe7a25@xs4all.nl>
In-Reply-To: <5de0df37-f0d0-f54c-2eef-a7533cbe7a25@xs4all.nl>
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Mon, 20 May 2019 19:26:34 +0530
Message-ID: <CA+G9fYtbb82EPY9gG63+U2FTVswt7f3FjHdaHMA2kibxgVvZcw@mail.gmail.com>
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

On Mon, 13 May 2019 at 19:08, Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>
> On 5/13/19 3:32 PM, Naresh Kamboju wrote:
> > Do you see test VIDIOC_G/S_PARM: FAIL on stable 4.14, 4.9 and 4.4
> > kernel branches ?
>
> Probably related to commit 8a7c5594c0202 (media: v4l2-ioctl: clear fields in s_parm).

I have cherry-picked on stable rc 4.9 branch and tested and test got
PASS on x86_64.

Test output:
----------------
test VIDIOC_G/S_PARM: OK
https://lkft.validation.linaro.org/scheduler/job/736243#L1744

log:
----
git  cherry-pick  8a7c5594c0202
warning: inexact rename detection was skipped due to too many files.
warning: you may want to set your merge.renamelimit variable to at
least 9371 and retry the command.
[linux-4.9.y 7b9dab8fe870] media: v4l2-ioctl: clear fields in s_parm
 Author: Hans Verkuil <hans.verkuil@cisco.com>
 Date: Sat May 12 10:44:02 2018 -0400
 1 file changed, 16 insertions(+), 1 deletion(-)

Thank you.
Naresh Kamboju
