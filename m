Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0DF093408BF
	for <lists+linux-media@lfdr.de>; Thu, 18 Mar 2021 16:26:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231724AbhCRPZf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 Mar 2021 11:25:35 -0400
Received: from mail.kernel.org ([198.145.29.99]:50808 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231273AbhCRPZP (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 Mar 2021 11:25:15 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9B31A64F18;
        Thu, 18 Mar 2021 15:25:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1616081114;
        bh=HihjKqEhrP5P6vFacJJGrARtlnGZ5gZZpZuOqSLI2cc=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=F1WFzYnIxraLYCZAL4TXgElqsggT38r/au8/dUeEuu5fDMg1to/BT4HAuIzPZQY80
         FQEdBJVYYGtpzDSmKbyVV2tB3Z0zj8tdUG4x/Qpt2sCQkN1t+SrR51fyHk6UtcfChC
         yxv8f61dbvFoYCCKzlwv8yaFP6fhrMfbBz2xSilwXLed4nzulasAGfAo/gzwsmD+ws
         6XsoQgSY09QzHH8+9ZrtDO596sgKK3nM/gBj+tQbidHIz+oVAeV9bamVJgQZzQjR5X
         qPw73SvE91nOSmuhqC/6mmEn6sgNRLpHDopAO7osdypdiJxegdJ9vpYd+lMnxBS5nk
         dmhQ/0pQuBocQ==
Received: by mail-oo1-f47.google.com with SMTP id h3-20020a4ae8c30000b02901b68b39e2d3so1516124ooe.9;
        Thu, 18 Mar 2021 08:25:14 -0700 (PDT)
X-Gm-Message-State: AOAM532qyK8S3n+x4kdSFybpLagywVFQATlz6EtAoMVjVhpnC+fe4ln/
        3Ey9atFjZMFa+qvNTsP4uWgVPUdu0Fzk/iOQ8ss=
X-Google-Smtp-Source: ABdhPJwcb2nDKd3G289OksixUXQJZCdc7vKxZQiqIS1B6im73rTIZx9+cdiBpQC+E9Z84DONyIyCGCP46GgwlfXkSjo=
X-Received: by 2002:a4a:8ed2:: with SMTP id c18mr8093461ool.66.1616081113899;
 Thu, 18 Mar 2021 08:25:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210318134334.2933141-1-arnd@kernel.org> <YFNrF5ebp9QUvKQh@pendragon.ideasonboard.com>
In-Reply-To: <YFNrF5ebp9QUvKQh@pendragon.ideasonboard.com>
From:   Arnd Bergmann <arnd@kernel.org>
Date:   Thu, 18 Mar 2021 16:24:57 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2VQaz4rLqSeEVu4V-RJ6W3nimo=6PbVymEWAKkEQCDOg@mail.gmail.com>
Message-ID: <CAK8P3a2VQaz4rLqSeEVu4V-RJ6W3nimo=6PbVymEWAKkEQCDOg@mail.gmail.com>
Subject: Re: [PATCH 1/2] media: v4l2-core: ignore native time32 ioctls on 64-bit
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Dmitry Vyukov <dvyukov@google.com>,
        syzbot <syzbot+142888ffec98ab194028@syzkaller.appspotmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Mar 18, 2021 at 4:00 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Thu, Mar 18, 2021 at 02:43:18PM +0100, Arnd Bergmann wrote:
>
> v4l2_event vs. v4l2_event32 vs. v4l2_event_time32 vs.
> v4l2_event32_time32 is a bit confusing. Do I understand correctly that
> the code below runs for the non-compat path, thus native userspace
> (32-bit on 32-bit machines, 64-bit on 64-bit machines), and handles the
> case of a native userspace using a 32-bit time ? If so it indeed doesn't
> make sense for 64-bit machines.

Yes, that's correct. The way the structures are defined, we have
all four combinations of native/compat pointer and time64/time32
timestamps, but the combination of native pointer with time32
stamps only makes sense for 32-bit users.

> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Thanks,

        Arnd
