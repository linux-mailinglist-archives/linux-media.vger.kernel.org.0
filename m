Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E0F3130781B
	for <lists+linux-media@lfdr.de>; Thu, 28 Jan 2021 15:33:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231756AbhA1OcY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 28 Jan 2021 09:32:24 -0500
Received: from mail-40133.protonmail.ch ([185.70.40.133]:59988 "EHLO
        mail-40133.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231403AbhA1OcR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 28 Jan 2021 09:32:17 -0500
Date:   Thu, 28 Jan 2021 14:31:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
        s=protonmail3; t=1611844291;
        bh=QsiNncsO1rJnX9cE9CyiN9lVlCZ9brT9ldCySW20O6Q=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=XA8RL1VkTrE1PN+d6/gKlX0zGb8Z4HLb1MnhaESmKYmH3P7WgF2p5QzpYzYxdt0Xy
         ZbMRRGXyQ2j2owRMaG4/xkJD4PipBEoMQnLan1pVjP3I+WMRsVrhyITtLsmAotrqpZ
         6zEwh22/asudG9Ma8319YFRh78slVmubr/G8vUHqwNhhkYiqKZuRI3Lj9ShWpAzHVB
         AoA7VWM+JbJeQGfRiQvxkyuXDDr7vPOzu1ThjnGGYFXuhFTFsu3SljHI0fsNZPYoRy
         zpQqPhHLl1TMFloCKpy9g449EoxWrVBJ8mfVgM400XV2hhsh1aTkOx6jezcbTOQ55l
         FgExs73SpSU2Q==
To:     Sumit Semwal <sumit.semwal@linaro.org>
From:   Simon Ser <contact@emersion.fr>
Cc:     Christian Koenig <christian.koenig@amd.com>,
        Android Kernel Team <kernel-team@android.com>,
        kernel test robot <lkp@intel.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        LKML <linux-kernel@vger.kernel.org>,
        DRI mailing list <dri-devel@lists.freedesktop.org>,
        Linaro MM SIG <linaro-mm-sig@lists.linaro.org>,
        hyesoo.yu@samsung.com, Hridya Valsaraju <hridya@google.com>,
        Suren Baghdasaryan <surenb@google.com>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>
Reply-To: Simon Ser <contact@emersion.fr>
Subject: Re: [Linaro-mm-sig] [PATCH v3] dmabuf: Add the capability to expose DMA-BUF stats in sysfs
Message-ID: <Fu3J-fHQvkd_umZraMnhxQhFJR_JCDmgUssMBA4GJgRwo4UpIPKvVSh51Os9FQkABkhSL6tmEAV4vwBZa7hFWFTgujmjaBmrgqJJ75KM8ZU=@emersion.fr>
In-Reply-To: <CAO_48GGsOTLdqAQMO9vrLtWAKG6spByMC-GXwDv_f3ENvpemfA@mail.gmail.com>
References: <20210126204240.418297-1-hridya@google.com> <YBFXPbePURupbe+y@kroah.com> <CAO_48GHrpi9XxPhP2evwH_ZJmbVSWqxCvsYg6S2Syh-mrWBHzA@mail.gmail.com> <c0684400-c1e2-0ebd-ad09-cb7b24db5764@gmail.com> <CAO_48GGsOTLdqAQMO9vrLtWAKG6spByMC-GXwDv_f3ENvpemfA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
        autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
        mailout.protonmail.ch
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thursday, January 28th, 2021 at 1:03 PM, Sumit Semwal <sumit.semwal@lina=
ro.org> wrote:

> Since he didn't comment over Hridya's last clarification about the
> tracepoints to track total GPU memory allocations being orthogonal to
> this series, I assumed he agreed with it.

IIRC he's away this week. (I don't remember when he comes back.)

> Daniel, do you still have objections around adding this patch in?

(Adding him explicitly in CC)
