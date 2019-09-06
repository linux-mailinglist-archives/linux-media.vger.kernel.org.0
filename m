Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2DB0DAB73B
	for <lists+linux-media@lfdr.de>; Fri,  6 Sep 2019 13:37:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390049AbfIFLhU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Sep 2019 07:37:20 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:35432 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389971AbfIFLhU (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 6 Sep 2019 07:37:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
        From:Date:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=BaJkMB0z7Fy2B1fYpEwhEuwf2lT0IavJbz0NGtBNe7A=; b=Yi4+2SyNocYccqH5MaR05tEwk
        UhWa7a8ZwoiMYGKa7iNi6YtrkC7IQm2mYtRRmN+DxRdmBy2ecV4WVuB9yc7r/UNYLHtYnAzP5yG6+
        pvotiKG+LSMrLD04qx5Cy0drkF7LLJlwoa9r4PdTVL2j+lAwCiBPK+PN+OQY/ZlPPUiw0mi8Xu/3C
        bVTyfZ7DX+LAr5nqg4zh+6PiyTCsY8SEsZT3rTOsCotDT0jv3L6HUGtsQdkpAjJJgsUTjtNXj5t9g
        cGIyZYV+/6BFXcKN9ry/UVb0S8kLANNXsgUaT0E+C9DCd6DTBbuQZSE6Dq9x9BBlbE8yxyyF7mTae
        lvrOZvzBQ==;
Received: from [177.159.253.249] (helo=coco.lan)
        by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1i6CYJ-0005fo-2Y; Fri, 06 Sep 2019 11:37:19 +0000
Date:   Fri, 6 Sep 2019 08:37:14 -0300
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
Message-ID: <20190906083714.0cf7eb20@coco.lan>
In-Reply-To: <20190906083457.7e7934ec@coco.lan>
References: <20190905055614.7958918b@coco.lan>
        <88e638eb959095ab6657d295f9f8c27169569bf2.1567675272.git.mchehab+samsung@kernel.org>
        <20190905092703.GA30899@kroah.com>
        <20190905090701.37dcf75e@coco.lan>
        <b32c2e46b91e7bcda2a9bd140673f06d71b2487a.camel@perches.com>
        <20190906083457.7e7934ec@coco.lan>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Fri, 6 Sep 2019 08:34:57 -0300
Mauro Carvalho Chehab <mchehab+samsung@kernel.org> escreveu:

> Em Thu, 05 Sep 2019 10:45:36 -0700
> Joe Perches <joe@perches.com> escreveu:
> 
> > On Thu, 2019-09-05 at 09:07 -0300, Mauro Carvalho Chehab wrote:  
> > > There are currently 227 files that don't complain with the "up to line 3"
> > > rule, including COPYING (with should probably be excluded from the check).
> > > 
> > > Patches are at:
> > > 
> > > 	https://git.linuxtv.org/mchehab/experimental.git/log/?h=spdx_pedantic
> > > 
> > > Btw, most violations are due to:
> > > 
> > > /*
> > >  * SPDX...    
> > 
> > Hey Mauro.
> > 
> > Here's a little script to move all of the improperly located
> > SPDX-License-Identifier lines in [.ch] files.
> > 
> > Using this command line:
> > 
> > $ git grep -n 'SPDX-License-Identifier: ' -- '*.[ch]' | \
> >   grep -v ':1:' | perl move_spdx.pl
> > 
> > and
> > 
> > $ cat move_spdx.pl
> > while (<>) {
> >     /^([^:]+):([^:]+):(.*)/;
> >     my ($file, $line, $spdx) = ($1, $2, $3);
> >     $spdx =~ s/^\s*\/?\*\s*//;
> >     $spdx =~ s/\s*\*\/\s*$//;
> >     if ($file =~ /\.h$/) {
> > 	$spdx = "/* $spdx */";
> >     } else {
> > 	$spdx = "// $spdx";
> >     }
> >     open(FH, '<', $file) or die $!;
> >     my @lines = <FH>;
> >     close FH;
> >     open(FH, '>', $file) or die $!;
> >     print FH "$spdx\n";
> >     my $count = 0;
> >     foreach (@lines) {
> > 	$count++;
> > 	next if ($count == $line);
> > 	next if ($count == $line - 1 && $_ =~ /^\s*\*\s*$/);
> > 	next if ($count == $line + 1 && $_ =~ /^\s*\*\s*$/);
> > 	print FH "$_";
> >     }
> >     close FH;
> > }
> > 
> > which gives this diff for today's -next  
> 
> Nice script!
> 
> I did some changes on it

In time: I'm enclosing the modified script. just run it directly with:

	perl ./move_spdx.pl

and it will move the SPDX headers where pertinent.

Thanks,
Mauro

---

#!/usr/bin/perl 

@file_arr = qx(git grep -n 'SPDX-License-Identifier: ' | grep -v ':1:');
foreach (@file_arr) {
    /^([^:]+):([^:]+):(.*)/;
    my ($file, $line, $spdx) = ($1, $2, $3);

    next if ($file =~ m,(COPYING|LICENSES/|sha1-armv4-large.S),);
    next if ($line > 10);

    $spdx =~ s/^\s*\/?\*\s*//;
    $spdx =~ s/\s*\*\/\s*$//;
    $spdx = $1 if m/(SPDX-License-Identifier:.*)/;
    $is_script = 0;
    if ($file =~ /\.(h|dts|dtsi|S)$/) {
	$spdx = "/* $spdx */";
    } elsif ($file =~ /\.(c)$/) {
	$spdx = "// $spdx";
    } elsif ($file =~ /\.(rst)$/) {
	$spdx = ".. $spdx";
    } elsif ($file =~ /\.(py|pl|sh)$/ || !$file =~ /\./) {
        $is_script = 1;
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
