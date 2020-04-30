Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F6A81BF5ED
	for <lists+linux-media@lfdr.de>; Thu, 30 Apr 2020 12:55:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726431AbgD3Kzt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 Apr 2020 06:55:49 -0400
Received: from mail.kernel.org ([198.145.29.99]:60084 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726413AbgD3Kzt (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 Apr 2020 06:55:49 -0400
Received: from coco.lan (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 20C5720784;
        Thu, 30 Apr 2020 10:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588244148;
        bh=iW2c88BqJ5zgrCzh66vrzGEP0KWCmub4ykoRlfPzZFw=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=hgrcmELDi3sp2T2ud51h0N6fCUg8V7QPo5+DTJBG+aX1RnCerKXU5J+UmczoWf5un
         fIXdXk1XvRn+n+3DsT/+aKEjMZQ5/n8Lc2j/DPtLT73MpUCKhT4aLSaphNcktjxDvI
         u8xu/BaLO40g1+XOQZ2cwMLrcW1fXX8LR3PsFD4w=
Date:   Thu, 30 Apr 2020 12:55:44 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Patrik Gfeller <patrik.gfeller@gmail.com>
Cc:     linux-media@vger.kernel.org
Subject: Re: atomisp kernel driver(s)
Message-ID: <20200430125544.10a9830d@coco.lan>
In-Reply-To: <6fffdf73-a0eb-1b1c-d894-e4799b8ef944@gmail.com>
References: <f3348096-1fb3-5368-ba66-f42a300bde8e@gmail.com>
        <20200418172654.74a1eeea@coco.lan>
        <1d529105-3b7d-38d0-b7a2-d385b2221ff7@gmail.com>
        <20200420013109.65babb54@coco.lan>
        <e45de3ea-4b5c-f2d0-0844-1233ca15a939@gmail.com>
        <eb83f789-9595-55f0-d922-bab00ae85cff@gmail.com>
        <20200420224750.28c0181d@coco.lan>
        <dd8ab5df-31c7-f009-36e4-ca4fd0605e97@gmail.com>
        <20200422211344.2ec3d93e@coco.lan>
        <23b3a078-2a9a-5f50-a35e-9f40f5aa8a6e@gmail.com>
        <86413836-e4b5-cb53-3ac0-1764c693ec7b@gmail.com>
        <682558b0-a2cf-9fe2-6e54-20462ecccb5d@gmail.com>
        <20200425132255.4bf872b2@coco.lan>
        <131a4247-cef3-d651-a0ea-defd32b8bf20@gmail.com>
        <20200426185007.1954885a@coco.lan>
        <45817a6a-dd2f-13a6-835b-fd2b04ded23f@gmail.com>
        <20200427235027.15cd4e03@coco.lan>
        <d9ec5067-142c-66c9-c412-51ddf38e44f7@gmail.com>
        <20200429011339.03af3c2a@coco.lan>
        <3b7366b9-463d-c49b-0f2d-51a1d5475a9d@gmail.com>
        <20200429201753.3b2d679b@coco.lan>
        <6fffdf73-a0eb-1b1c-d894-e4799b8ef944@gmail.com>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Thu, 30 Apr 2020 09:56:53 +0200
Patrik Gfeller <patrik.gfeller@gmail.com> escreveu:

> For my first test tried to re-compile to module, without the whole 
> kernel. That was a mistake, as I mixed something up, probably it loaded 
> an old version of the module ... to be on the save side the steps I used 
> this time (in case we see something unexpected and for my later reference):
> 
> $ git log --oneline
> 4c922df10252 (HEAD -> atomisp, origin/atomisp) media: atomisp2: get rid 
> of ia_css_sc_param.h version dependency
> ...
> 
> $ make -j4 clean
> $ make -j4
> $ sudo make modules_install INSTALL_MOD_STRIP=1
> $ sudo make install

Please try to build from this branch:

	https://git.linuxtv.org/mchehab/experimental.git/log/?h=atomisp_v2

You'll need to setup a new config var there. So, please run this before
make clean. So, for building it, you will do:

	$ ./scripts/config -e CONFIG_VIDEO_ATOMISP_ISP2401 && make -j modules_prepare
	$ make -j4 clean && make -j4
	$ sudo make modules_install INSTALL_MOD_STRIP=1 && sudo make install

This won't change the regulator detection, but it should hopefully use
the ISP2401-specific code, with seems to be needed for your device.

Ah, when replying, could you please use an emailer that won't be breaking
long lines? Your emailer is currently breaking lines longer than 80 columns,
with is quite annoying when checking log results ;-)

Thanks,
Mauro
