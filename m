Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8E27721207
	for <lists+linux-media@lfdr.de>; Fri, 17 May 2019 04:31:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727195AbfEQCbT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 May 2019 22:31:19 -0400
Received: from mail.kernel.org ([198.145.29.99]:47180 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726339AbfEQCbT (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 May 2019 22:31:19 -0400
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6F528204EC;
        Fri, 17 May 2019 02:31:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1558060278;
        bh=vQ4Wa5ymjGmplDH0Gmjy+pfEetZe0JV1cFhUo2OKzac=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=W2GDsTsB5i6VKxXpSLXv+gLIrVq03gXeks8/fEIr/G/6tC4K13qSyDAGWw3s0JyL0
         Xm7EjeBzKeuafja1y+uK4hQAFb2r3aD50LuzF5JE09skl+MjmkpbiiL7nIimxE4REx
         /48Fmj5dp0emZ5ExE7l9JgxIm30jiKFd+3AR0/CM=
Received: by mail-qt1-f173.google.com with SMTP id t1so6345309qtc.12;
        Thu, 16 May 2019 19:31:18 -0700 (PDT)
X-Gm-Message-State: APjAAAXKfT2gk/E2k3OMyMrp3jOtn20AqxI5IzI/ax6AO3/4gmU9XDDK
        We9I6lFW4GMbgwnmOaQ6RJdaRLoaYKuxD7vKvg==
X-Google-Smtp-Source: APXvYqzZCG1zgE91dD+Dohm989/r1P6FD2SmJTx55dxqzFCPucgqrkncXUcGtRFu+QIrCLoRMb9pT0y+Z7h+h32iFSk=
X-Received: by 2002:a0c:f350:: with SMTP id e16mr43845110qvm.72.1558060277713;
 Thu, 16 May 2019 19:31:17 -0700 (PDT)
MIME-Version: 1.0
References: <20190513172131.15048-1-m.tretter@pengutronix.de> <20190513172131.15048-4-m.tretter@pengutronix.de>
In-Reply-To: <20190513172131.15048-4-m.tretter@pengutronix.de>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Thu, 16 May 2019 21:31:06 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKUu083oeQuZwSckT3a3X=Htv2ru02jewGuMFzp=uamNA@mail.gmail.com>
Message-ID: <CAL_JsqKUu083oeQuZwSckT3a3X=Htv2ru02jewGuMFzp=uamNA@mail.gmail.com>
Subject: Re: [PATCH v6 3/5] media: dt-bindings: media: Add vendor prefix for allegro
To:     Michael Tretter <m.tretter@pengutronix.de>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        devicetree@vger.kernel.org, Sascha Hauer <kernel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Dhaval Shah <dshah@xilinx.com>,
        Hans Verkuil <hverkuil@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, May 13, 2019 at 12:21 PM Michael Tretter
<m.tretter@pengutronix.de> wrote:
>
> Add vendor prefix for Allegro DVT, a provider of H.264/AVC, H.265/HEVC,
> AVS2, VP9 and AV1 compliance test suites and H.264/AVC, H.265/HEVC, and
> VP9 encoder, codec and decoder hardware (RTL) IPs.
>
> Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
> v5 -> v6:
> none
>
> v5:
> - new patch
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
>  1 file changed, 1 insertion(+)

I've converted this file to json-schema as of v5.2-rc1. See commit
8122de54602e. Sorry, but you will have to rework this patch.


Rob
