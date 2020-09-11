Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 142E8265A8C
	for <lists+linux-media@lfdr.de>; Fri, 11 Sep 2020 09:32:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725770AbgIKHcI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 11 Sep 2020 03:32:08 -0400
Received: from mail.kernel.org ([198.145.29.99]:34200 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725562AbgIKHcC (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Sep 2020 03:32:02 -0400
Received: from coco.lan (ip5f5ad5a5.dynamic.kabel-deutschland.de [95.90.213.165])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 71E65207FB;
        Fri, 11 Sep 2020 07:32:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599809521;
        bh=cXV1CkXTBeihyP2pjnoybF53VLlJRqk7zs9ZrAnC9RQ=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=p1a/ROkrKY8+KZKwlchqh3JR+5/q8K4dk/jRlWe/h+7u3iM0oBBgv1iLZ6hy+8vgE
         eqbS4Na1ObfqwGgy3ZdolPtR+SMftp20WdJLtw1RCxFM4piWYyz/euuQVItqUTKjQ5
         M39ESj6yB9WXlZnQzQf27gLe8nyzaZx44zsnoQdY=
Date:   Fri, 11 Sep 2020 09:31:56 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-media <linux-media@vger.kernel.org>
Subject: Re: linux-next: Tree for Sep 10 (drivers/media/pci/ttpci/dvb-ttpci)
Message-ID: <20200911093156.15282b69@coco.lan>
In-Reply-To: <97f03d35-acd3-1c65-0c93-4ca4cabf6613@infradead.org>
References: <20200910174252.0698c743@canb.auug.org.au>
        <97f03d35-acd3-1c65-0c93-4ca4cabf6613@infradead.org>
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Randy,

Em Thu, 10 Sep 2020 09:02:35 -0700
Randy Dunlap <rdunlap@infradead.org> escreveu:

> On 9/10/20 12:42 AM, Stephen Rothwell wrote:
> > Hi all,
> > 
> > Changes since 20200909:
> >   
> 
> 
> on i386:
> 
> ERROR: modpost: "__floatunsidf" [drivers/media/pci/ttpci/dvb-ttpci.ko] undefined!
> ERROR: modpost: "__ltdf2" [drivers/media/pci/ttpci/dvb-ttpci.ko] undefined!
> 
> 
> Full randconfig file is attached.

I was unable to reproduce it here with the .config file you sent.

I suspect that the only difference is the compiler version. Here, I'm
using:

	gcc (Ubuntu 9.2.1-9ubuntu2) 9.2.1 20191008

While you're using:

	gcc (SUSE Linux) 7.5.0

Yet, the only patch that could possibly have affected it is
this changeset 13c129066845 ("media: av7110_v4l: avoid a typecast").

It sounds to me that gcc 7.5.0 only does the right math at compile
time if there is a typecast. Could you please check if the enclosed
patch fixes it?

Thanks,
Mauro

[PATCH] media: av7110: don't do float point math

It sounds that earlier versions of GCC have troubles when
doing const math at compile time, if no typecast is used:

on i386:
	ERROR: modpost: "__floatunsidf" [drivers/media/pci/ttpci/dvb-ttpci.ko] undefined!
	ERROR: modpost: "__ltdf2" [drivers/media/pci/ttpci/dvb-ttpci.ko] undefined!

The warning was generated on gcc (SUSE Linux) 7.5.0.
Gcc 9.2 compiles it fine.

Reported-by: Randy Dunlap <rdunlap@infradead.org>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

diff --git a/drivers/media/pci/ttpci/av7110_v4l.c b/drivers/media/pci/ttpci/av7110_v4l.c
index 6d9c908be713..c89f536f699c 100644
--- a/drivers/media/pci/ttpci/av7110_v4l.c
+++ b/drivers/media/pci/ttpci/av7110_v4l.c
@@ -160,9 +160,9 @@ static int ves1820_set_tv_freq(struct saa7146_dev *dev, u32 freq)
 	buf[1] = div & 0xff;
 	buf[2] = 0x8e;
 
-	if (freq < 16U * 168.25)
+	if (freq < 16U * 16825 / 100)
 		config = 0xa0;
-	else if (freq < 16U * 447.25)
+	else if (freq < 16U * 44725 / 100)
 		config = 0x90;
 	else
 		config = 0x30;

