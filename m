Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 064E332313A
	for <lists+linux-media@lfdr.de>; Tue, 23 Feb 2021 20:18:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231878AbhBWTRG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Feb 2021 14:17:06 -0500
Received: from mail.horus.com ([78.46.148.228]:38641 "EHLO mail.horus.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230309AbhBWTRB (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Feb 2021 14:17:01 -0500
Received: from lenny.lan (62-116-60-6.adsl.highway.telekom.at [62.116.60.6])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256
         client-signature RSA-PSS (2048 bits) client-digest SHA256)
        (Client CN "E-Mail Matthias Reichl Lenny", Issuer "HiassofT CA 2014" (verified OK))
        by mail.horus.com (Postfix) with ESMTPSA id 8F7EC6409C;
        Tue, 23 Feb 2021 20:16:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=horus.com;
        s=20180324; t=1614107776;
        bh=2Ln8sXaUcPqd52opEGRKwtnhRMtiyt944ME2ZUZwCbg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=fJpEs7gCBK6lJAj8GLkSWoovZjsyAbUiJoQD3W7CM2LGY110WmNDDSif85OVWnLyg
         v5IO5KVjlvC8OYmx5cozwSflbkl41OshD9TE1o8CnPNeBgRSP4UrprIeoDh39MSjG/
         rshut8ssh0aBhcYVoE+EK+Fr2iIDbuC2YrSnHNhE=
Received: by lenny.lan (Postfix, from userid 1000)
        id E7A70202224; Tue, 23 Feb 2021 20:16:15 +0100 (CET)
Date:   Tue, 23 Feb 2021 20:16:15 +0100
From:   Matthias Reichl <hias@horus.com>
To:     Sean Young <sean@mess.org>
Cc:     linux-media@vger.kernel.org,
        Juan =?iso-8859-1?Q?Jes=FAs_Garc=EDa?= de Soria 
        <skandalfo@gmail.com>
Subject: Re: [PATCH 0/6] media: ite-cir driver cleanups
Message-ID: <20210223191615.GA9243@lenny.lan>
References: <cover.1613989288.git.sean@mess.org>
 <20210223161307.GB10715@camel2.lan>
 <20210223175001.GA12871@gofer.mess.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210223175001.GA12871@gofer.mess.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sean,

On Tue, Feb 23, 2021 at 05:50:01PM +0000, Sean Young wrote:
> On Tue, Feb 23, 2021 at 05:13:07PM +0100, Matthias Reichl wrote:
> > I could only test receiving (don't have a transmitter on that PC)
> > and also couldn't test the carrier options (I'm using a demodulating
> > TSOP receiver here), but your changes look sane to me.
> 
> I only have got an eeepc box, with the same limitations. Do you happen to
> know what hardware there is for this driver? It would be nice to test this
> properly.
> 
> This is the only IR driver that can change the RX carrier range, so it's
> kinda interesting.

In the most recent bug report I got (about a month ago) the user was
using an intel NUC (NUC10i3FNH/NUC10i3FNB according to DMI):
https://forum.libreelec.tv/thread/23211-intel-nightly-build-problem-with-mce-remote/?postID=148823#post148823

I've also seen NUCs with Nuvoton CIR though and I suspect they'll
all probably have a demodulating receiver soldered directly to the
board, so probably not easy to tinker with (haven't checked though).

I have only an ancient Pentium 4 mainboard (Gigabyte 8IPE775) with
an IT8712 here. IR RX/TX and CIR RX/TX are all exposed on a header,
but the BIOS is somewhat odd and doesn't contain CIR on/off settings
or announce the CIR via ACPI. So I had to manually patch ACPI tables
to get that beast working.... ITE8713 pnpid was close enough (couldn't
find a datasheet for 8713, only 8712 - that does mention demodulating
though).

I don't think I have a simple IR diode or transistor here to easily
test that, only demodulating TSOPs (and some clones) - hooking that
up to the mainboard wouldn't be too hard.

so long,

Hias
