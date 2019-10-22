Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1FA38E0889
	for <lists+linux-media@lfdr.de>; Tue, 22 Oct 2019 18:17:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389363AbfJVQRt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Oct 2019 12:17:49 -0400
Received: from mail.kernel.org ([198.145.29.99]:55740 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388978AbfJVQRs (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Oct 2019 12:17:48 -0400
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8512F21906;
        Tue, 22 Oct 2019 16:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1571761067;
        bh=Gg/K4AWcAIZMUhsjSl+x6is8fvGE9nG7djqvjYD1rN0=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=FYsfHdPH1H18SJQUEaduUxml14PNKkhavCDSweG6QCDb9TlXsb7Agl9nu02nSKkcM
         q7juO5StFsUg3HAtdqL2wqpuH49QpTNz0y9QxwvTdmqGKecqebUaLLlcaHzzyXmXXC
         X5MsEjaTR41kYPyXJ7i1YPagvmmiBzhdqxHKputQ=
Received: by mail-qt1-f173.google.com with SMTP id t20so27583756qtr.10;
        Tue, 22 Oct 2019 09:17:47 -0700 (PDT)
X-Gm-Message-State: APjAAAVGPvpteRmdj0PA9yJshcSWRYRAECebU+3N22xK01hPz6/r4Hq4
        k+muJFtakjewkasBq/fAFSV1FGgYx2lmV4WT8g==
X-Google-Smtp-Source: APXvYqwH0FQlbk2Qa04L/g3dKMJcwcPDR5Z3VqCtTDPrkq+GCUtoxYZ7KMCUXfKG7g9gqSoNyfVwPl9v1l7yqdmzqVU=
X-Received: by 2002:ac8:4508:: with SMTP id q8mr4292602qtn.110.1571761066718;
 Tue, 22 Oct 2019 09:17:46 -0700 (PDT)
MIME-Version: 1.0
References: <b47ec7088aa4b07458519ab151de92df552a9302.1570101510.git.amit.kucheria@linaro.org>
 <20191003115154.6f2jgj3dnqsved2y@gilmour> <CAHLCerNoLyQ-e70=1VMPO_J_amA+-2vtHwfoUabo4dhUWj-H0A@mail.gmail.com>
 <20191007100535.6gp6b3h6ueyeln3b@gilmour> <CAP245DXT=HL+m-LqoC25EBnOaPmF1pUW0fEZp6EZB-MdgOJoWw@mail.gmail.com>
 <20191007104835.v6iqpoolqtajryik@gilmour>
In-Reply-To: <20191007104835.v6iqpoolqtajryik@gilmour>
From:   Rob Herring <robh@kernel.org>
Date:   Tue, 22 Oct 2019 11:17:35 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLVkikYVpjs1m+QqsOK2CfSm9+LfZWXbWEoszeSt3RGaA@mail.gmail.com>
Message-ID: <CAL_JsqLVkikYVpjs1m+QqsOK2CfSm9+LfZWXbWEoszeSt3RGaA@mail.gmail.com>
Subject: Re: [PATCH] media: dt-bindings: media: Fixup Allwinner A10 CSI binding
To:     Maxime Ripard <mripard@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Amit Kucheria <amit.kucheria@linaro.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        lakml <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Oct 7, 2019 at 5:48 AM Maxime Ripard <mripard@kernel.org> wrote:
>
> On Mon, Oct 07, 2019 at 03:45:29PM +0530, Amit Kucheria wrote:
> > On Mon, Oct 7, 2019 at 3:35 PM Maxime Ripard <mripard@kernel.org> wrote:
> > >
> > > On Sat, Oct 05, 2019 at 04:15:57PM +0530, Amit Kucheria wrote:
> > > > On Thu, Oct 3, 2019 at 5:22 PM Maxime Ripard <mripard@kernel.org> wrote:
> > > > >
> > > > > Hi,
> > > > >
> > > > > On Thu, Oct 03, 2019 at 04:52:24PM +0530, Amit Kucheria wrote:
> > > > > > This new binding fails dt_binding_check due to a typo. Fix it up.
> > > > > >
> > > > > > linux.git/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-csi.yaml: $id: path/filename 'arm/allwinner,sun4i-a10-csi.yaml' doesn't match actual filename
> > > > > > linux.git/Documentation/devicetree/bindings/Makefile:12: recipe for target 'Documentation/devicetree/bindings/media/allwinner,sun4i-a10-csi.example.dts' failed
> > > > > > make[2]: *** [Documentation/devicetree/bindings/media/allwinner,sun4i-a10-csi.example.dts] Error 1
> > > > > > make[2]: *** Waiting for unfinished jobs....
> > > > > > linux.git/Makefile:1284: recipe for target 'dt_binding_check' failed
> > > > > > make[1]: *** [dt_binding_check] Error 2
> > > > > >
> > > > > > Fixes: c5e8f4ccd7750 ("media: dt-bindings: media: Add Allwinner A10 CSI binding")
> > > > > > Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
> > > > >
> > > > > Thanks for your patch.
> > > > >
> > > > > It has already been submitted though:
> > > > > https://lore.kernel.org/linux-arm-kernel/1568808060-17516-1-git-send-email-pragnesh.patel@sifive.com/
> > > > >
> > > > > I'm not sure why it hasn't been applied yet though :/
> > > >
> > > > Perhaps a Fixes tag will allow more attention to it?
> > >
> > > I've added a fixes tag and merged it through the sunxi tree.
> > >
> > > Sorry for the time it took, and thanks for sending that fix!
> >
> > Will it get merged for -rc2?
>
> -rc2 was released yesterday, so we're a bit late for that, but it's
>  going to be in next tomorrow.

Is this going to Linus anytime soon? It is affecting anyone submitting
bindings against current -rc's.

Rob
