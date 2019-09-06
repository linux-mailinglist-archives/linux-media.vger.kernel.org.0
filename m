Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 795FFABF40
	for <lists+linux-media@lfdr.de>; Fri,  6 Sep 2019 20:17:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436494AbfIFSRK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Sep 2019 14:17:10 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:46442 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404380AbfIFSRK (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 6 Sep 2019 14:17:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
        From:Date:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=AN/xZn55x9Paj2FV2HROTLrpQ/d1Z8rdQtqFNYMx15k=; b=a2LyxNAI0Lcsqgpec/cV6Geyu
        csa/ODYVy4viu6nyQy7lzVgeX7GpkedJsMEKqTRisl8Wqr+6K0CjKYsjdhaxFUi6VTOMC0v1sIWBU
        BAoQDAixwLCwGLSHROyiiFLjlJXVuTUMAszBhwQBr1TiJeGkDbSpEWUymdCo5+2aqlyJFYZXawsHh
        D+tLRpYT0rOC4GqQsUfo3GFdznIQ/nBbsUSEdT0bb4M87lFTgalcf1If/McWLOusags15Jnk+Kg8d
        JG6c/nJ+yLbOSAqk/vDFStx05rvTAxpwoe3uFDutK/ZPKAEVYaPExSpKGtX4Y2ypCaXvvEpe2yk/e
        gVtYrPU6w==;
Received: from [177.159.253.249] (helo=coco.lan)
        by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1i6InE-00047a-18; Fri, 06 Sep 2019 18:17:08 +0000
Date:   Fri, 6 Sep 2019 15:17:02 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Joe Perches <joe@perches.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Jessica Yu <jeyu@kernel.org>,
        Federico Vaga <federico.vaga@vaga.pv.it>,
        Thomas Gleixner <tglx@linutronix.de>, linux-doc@vger.kernel.org
Subject: Re: [PATCH] docs: license-rules.txt: cover SPDX headers on Python
 scripts
Message-ID: <20190906151702.3e67ccf7@coco.lan>
In-Reply-To: <9d30210a2d024aae4c36c8995019cdeab29e1e19.camel@perches.com>
References: <20190905055614.7958918b@coco.lan>
        <88e638eb959095ab6657d295f9f8c27169569bf2.1567675272.git.mchehab+samsung@kernel.org>
        <20190905092703.GA30899@kroah.com>
        <20190905090701.37dcf75e@coco.lan>
        <b32c2e46b91e7bcda2a9bd140673f06d71b2487a.camel@perches.com>
        <20190906083457.7e7934ec@coco.lan>
        <9d30210a2d024aae4c36c8995019cdeab29e1e19.camel@perches.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Fri, 06 Sep 2019 10:33:42 -0700
Joe Perches <joe@perches.com> escreveu:

> On Fri, 2019-09-06 at 08:34 -0300, Mauro Carvalho Chehab wrote:
> > I did some changes on it, plus one change at the pedantic mode of
> > scripts/spdxcheck.py, and placed the corresponding patches at:
> > 
> > 	https://git.linuxtv.org/mchehab/experimental.git/log/?h=spdx_pedantic  
> 
> Your script needs a modification of this line:

It is yours script, I just made a few improvements for it to also catch
scripts.

>     $spdx = $1 if m/(SPDX-License-Identifier:.*)/;
> 
> This is on $_ and not $spdx.
> 
> This line needs to be:
> 
>     $spdx = $1 if $spdx =~ m/(SPDX-License-Identifier:.*)/;

Gah, true!

It also doesn't get the case where SPDX-License-Identifier: is
followed by a tab, and fixed an issue when detecting files without
any extension.

The enclosed script does a better job.

I changed the output of it on my testing branch:
	https://git.linuxtv.org/mchehab/experimental.git/log/?h=spdx_pedantic

The only thing that it doesn't change is an issue with an asm code,
with uses "@" for comments.

As this is a single file, better to do it manually:

	https://git.linuxtv.org/mchehab/experimental.git/commit/?h=spdx_pedantic&id=f1b7b2169ae2c8d8ab80a5997ebef9aa03a42d30

Thanks,
Mauro

---

#!/usr/bin/perl 

@file_arr = qx(git grep -nE 'SPDX-License-Identifier:\\s' | grep -v ':1:');
foreach (@file_arr) {
    /^([^:]+):([^:]+):(.*)/;
    my ($file, $line, $spdx) = ($1, $2, $3);

    next if ($file =~ m,(COPYING|LICENSES/|sha1-armv4-large.S),);
    next if ($line > 10);

    $spdx =~ s/^\s*\/?\*\s*//;
    $spdx =~ s/\s*\*\/\s*$//;
    $spdx = $1 if $spdx =~ m/(SPDX-License-Identifier:.*)/;
    $spdx =~ s/(SPDX-License-Identifier:)\s+/$1 /;

    if ($file =~ /\.(h|dts|dtsi|S)$/) {
	$spdx = "/* $spdx */";
    } elsif ($file =~ /\.(c)$/) {
	$spdx = "// $spdx";
    } elsif ($file =~ /\.(rst)$/) {
	$spdx = ".. $spdx";
    } elsif ($file =~ /\.(py|pl|sh|tc)$/ || !($file =~ /\./)) {
	$spdx = "# $spdx";
    } else {
        next;
    }

    open(FH, '<', $file) or die $!;
    my @lines = <FH>;
    close FH;
    open(FH, '>', $file) or die $!;
    my $count = 0;
    my $print_spdx = 1;
    foreach (@lines) {
	$count++;
        if ($print_spdx) {
            if ($count == 1 && (/:orphan:/ || /^#\!/)) {
                print FH "$_";
                next;
            }
            if ($count <= 2 && /^[ \t\f]*#.*?coding[:=][ \t]*([-_.a-zA-Z0-9]+)/) {
                print FH "$_";
                next;
            }
            print FH "$spdx\n";
	    $print_spdx = 0;
        }
	next if ($count == $line);
	next if ($count == $line - 1 && $_ =~ /^\s*\*\s*$/);
	next if ($count == $line + 1 && $_ =~ /^\s*\*\s*$/);
	next if ($count == $line - 1 && $_ =~ /^$/);
	print FH "$_";
    }
    close FH;
}
