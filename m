Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8ABE21AD779
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2020 09:34:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729004AbgDQHe3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Apr 2020 03:34:29 -0400
Received: from mail.kernel.org ([198.145.29.99]:39674 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728419AbgDQHe3 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Apr 2020 03:34:29 -0400
Received: from coco.lan (ip5f5ad4d8.dynamic.kabel-deutschland.de [95.90.212.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A3B392054F;
        Fri, 17 Apr 2020 07:34:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1587108868;
        bh=X6tskjtkbbD7eJmw+HYMlmuZZqatAbez8A/OwFmPCxw=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=CCAtm1P4qw2uv0uq82hOsfGayDbjL0JRne/7ux68afyxJNqOhi/sd4pQsTWPWyzUT
         DZT4djebQTcYFbpttIndRig2r2T8WRKpbkQHUe5rs3AwBP0k9EozeJ2kfcOhhHQgUJ
         JMzjQUMdAQE70glUdeLHkOfZCwVYSvgF82pEYP/0=
Date:   Fri, 17 Apr 2020 09:34:24 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: Re: [PATCH 1/3] media: cec: don't select PCI & DMI
Message-ID: <20200417093424.71ae0559@coco.lan>
In-Reply-To: <CAMuHMdV1DdmrtexvMqEn3SBjgyG8eYbbgLsYV-862mKLt08qdw@mail.gmail.com>
References: <6af5797c76c11d8c08ae1f5a73c3711fcf89ab6f.1587107273.git.mchehab+huawei@kernel.org>
        <CAMuHMdV1DdmrtexvMqEn3SBjgyG8eYbbgLsYV-862mKLt08qdw@mail.gmail.com>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Fri, 17 Apr 2020 09:30:51 +0200
Geert Uytterhoeven <geert@linux-m68k.org> escreveu:

> Hi Mauro,
> 
> On Fri, Apr 17, 2020 at 9:08 AM Mauro Carvalho Chehab
> <mchehab+huawei@kernel.org> wrote:
> > While select would be a great idea for most archs, this
> > causes a breakage with s390:
> >
> >         "I don't think that's a good idea, as it suddenly enables selecting all PCI
> >          drivers on platforms that do not have PCI.
> >
> >             WARNING: unmet direct dependencies detected for PCI
> >               Depends on [n]: HAVE_PCI [=n]
> >               Selected by [m]:
> >               - CEC_SECO [=m] && MEDIA_CEC_SUPPORT [=y] && (X86 || IA64 || COMPILE_TEST [=y])
> >
> > Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
> > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>  
> 
> Thanks for your patch!
> 
> Fixes: 4be5e8648b0c287a ("media: move CEC platform drivers to a
> separate directory")
> Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Btw, I almost solved it on a different way, keeping the select and making
it depends on HAVE_PCI.

I ended by opting to do this change in order to try to avoid more
Kconfig noise (and because "select PCI" is not popular those days).

Thanks,
Mauro
