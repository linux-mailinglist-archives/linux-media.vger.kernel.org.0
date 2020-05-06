Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D9CF1C6C5B
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2020 11:01:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729013AbgEFJBb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 May 2020 05:01:31 -0400
Received: from mail.kernel.org ([198.145.29.99]:43150 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728679AbgEFJBb (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 6 May 2020 05:01:31 -0400
Received: from coco.lan (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 97440206B8;
        Wed,  6 May 2020 09:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588755690;
        bh=4sIpXubP0+sC8ylxmrF8TVm46EBH4JzVOxBG2NmOZFw=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=lRL5L2xpknMLiaSJ2rXgF9zUKhEQqN9Udn0GejmwRbdhZsqrwey3OQXwZLC33P+KZ
         IEoA5XO+CJ4iKAD8MaWXe5MwAIp/Avpg1KyLxKL27NnCbVyCQBPNTq/5xcYW3+3GKb
         n5sasde/HOjxjaCeTe/rcuYpIMWQt7hgSgigiI9s=
Date:   Wed, 6 May 2020 11:01:25 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
Cc:     "sean@mess.org" <sean@mess.org>,
        "kstewart@linuxfoundation.org" <kstewart@linuxfoundation.org>,
        "allison@lohutok.net" <allison@lohutok.net>,
        "tglx@linutronix.de" <tglx@linutronix.de>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "skhan@linuxfoundation.org" <skhan@linuxfoundation.org>,
        "linux-kernel-mentees@lists.linuxfoundation.org" 
        <linux-kernel-mentees@lists.linuxfoundation.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [RFC, WIP, v4 11/11] media: vidtv: Add a MPEG Transport Stream
 Multiplexer
Message-ID: <20200506110125.03f42b03@coco.lan>
In-Reply-To: <48DFD57D-AE44-4117-A408-F6D557281FB0@getmailspring.com>
References: <20200503111338.53db66b8@coco.lan>
        <48DFD57D-AE44-4117-A408-F6D557281FB0@getmailspring.com>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Wed, 6 May 2020 04:05:25 -0300
"Daniel W. S. Almeida" <dwlsalmeida@gmail.com> escreveu:

> Hi Mauro! Thank you for reviewing this!
> 
> 
> >> Add a MPEG Transport Stream multiplexer responsible for polling encoders,
> >> interleaving packets, padding the resulting stream with NULL packets if
> >> necessary and then delivering the resulting TS packets to the bridge
> >> driver so it can feed the demux.
> >> 
> >> This patch includes a "channel" abstraction, which attempts to map a
> >> MPEG service into a struct that vidtv can work with.
> >> 
> >> When vidtv boots, it will create some hardcoded channels:
> >> 
> >> -Their services will be concatenated to populate the SDT.
> >> -Their programs will be concatenated to populate the PAT
> >> -For each program in the PAT, a PMT section will be created
> >> -The PMT section for a channel will be assigned its streams.
> >> -Every stream will have its corresponding encoder polled to produce
> >> TS packets
> >> -These packets may be interleaved by the mux and then delivered to
> >> the bridg
> >> 
> >> Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>  
> > 
> > The same notes I made on previous patches apply here.  
> 
> I did not understand this. Do you mean to say that I should remove these
> dashes in the beginning of the lines?

No. I just meant to say that I won't be repeating the comments I made
about WARN_ON, bit order, and other generic comments on other patches 
that will also apply here :-)

Thanks,
Mauro
