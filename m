Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A418455061
	for <lists+linux-media@lfdr.de>; Wed, 17 Nov 2021 23:24:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241134AbhKQW1s (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Nov 2021 17:27:48 -0500
Received: from mail.kernel.org ([198.145.29.99]:39504 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231985AbhKQW1r (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Nov 2021 17:27:47 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4636E613AC;
        Wed, 17 Nov 2021 22:24:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637187888;
        bh=Q+KEmuQT8gFLMsVZlcLv0RXAotQG9DNePeryWAiTisI=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=AroQHy2p8b1E9ZMSk3/OElw90PYM9oZSn12o0lA8/awN+ISe+0qcck4ex1mHerkIn
         GYmQ7SXSa70M2CTKqk88Yiq54dKaUX8v2FJlOFU8hlezF/eQ2oaPO1dvED4NgGpmP4
         nACYKNqZXiPTxe4J4QkU1BlwwmsXu+Y4xgrbHRRzYFVrlexyCoyQCTyJHFbBLoQ70h
         w1ACzNKuzp9v6f2DuHMwwlqDK8TtYcm+teMPO3UdcUxSb9IyWBJf2r6tr+tvJnTeIV
         G1cLo1fpyGBh+8i54/efOLMZyMx2GFkEC2QzJBTMxQmMZ9KyqwaerPr5FeLy9RxWE5
         fPv6iYxSR6fjQ==
Date:   Wed, 17 Nov 2021 22:24:43 +0000
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Tsuchiya Yuto <kitakar@gmail.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org,
        Nable <nable.maininbox@googlemail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Fabio Aiuto <fabioaiuto83@gmail.com>,
        "andrey.i.trufanov" <andrey.i.trufanov@gmail.com>,
        Patrik Gfeller <patrik.gfeller@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH 04/17] media: atomisp: pci: do not use err var when
 checking port validity for ISP2400
Message-ID: <20211117222443.3d050caa@sal.lan>
In-Reply-To: <20211111183812.0f33fdaa@sal.lan>
References: <20211017161958.44351-1-kitakar@gmail.com>
        <20211017161958.44351-5-kitakar@gmail.com>
        <20211026092637.196447aa@sal.lan>
        <1a295721fd1f1e512cd54a659a250aef162bfb6f.camel@gmail.com>
        <20211028123944.66c212c1@sal.lan>
        <af7cdf9de020171567c2e75b713deb2ed073e4e3.camel@gmail.com>
        <20211101141058.36ea2c8e@sal.lan>
        <ab48bd8c69273e8b18ff652f3615b2698a777092.camel@gmail.com>
        <20211111183812.0f33fdaa@sal.lan>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi 
Em Thu, 11 Nov 2021 18:38:12 +0000
Mauro Carvalho Chehab <mchehab@kernel.org> escreveu:

> > The `ifdef ISP2401` was the result of merging two different version of
> > driver, added on the initial commit of upstreamed atomisp. And for the
> > `ifdef ISP2401`, I confirmed I can remove (almost [1]) all of them against
> > the initial commit of atomisp [2][3]
> > 
> > [1] here are the three exceptions:
> >     ("NOTE: ifdef ISP2400/ISP2401 usage in aero-atomisp")
> >     https://github.com/kitakar5525/linux-kernel/commit/1a8488cdd31ad38a3805824700b29d1e5213d3f2
> > 
> > [2] ("atomisp: pci: css2400: remove ISP2401 ifdefs")
> >     https://github.com/kitakar5525/linux-kernel/commit/dd6723fc5b9fe040e33b227b509a7e004243edce
> > [3] ("atomisp: pci: remove ISP2401 ifdefs for main pci driver")
> >     https://github.com/kitakar5525/linux-kernel/commit/1734341f84a96945af7635f6fff061db910f746f  
> 
> Ok, if there are more if/ifdef ISP2401 that, if reverted will keep the
> driver running with the firmware we're using, I'm all for it. Just send
> the patches ;-)

I went ahead and solved several INPUT_SYSTEM related ifdefs on a way
that it is compatible with Intel Aero firmware for the sh_css* files.
Except if I made any mistake, the ifdefs that are related to the
input system were already addressed.

I didn't notice any changes when running camorama on the PREVIEW
node. 

Please test. Feel free to submit fixup patches if needed.

Regards,
Mauro
