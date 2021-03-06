Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 90DBE32FB59
	for <lists+linux-media@lfdr.de>; Sat,  6 Mar 2021 16:27:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231138AbhCFP1T (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 6 Mar 2021 10:27:19 -0500
Received: from relay10.mail.gandi.net ([217.70.178.230]:60095 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230413AbhCFP0z (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 6 Mar 2021 10:26:55 -0500
Received: from [192.168.1.150] (unknown [78.199.60.242])
        (Authenticated sender: hadess@hadess.net)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id 5F321240003;
        Sat,  6 Mar 2021 15:26:54 +0000 (UTC)
Message-ID: <7dcbca803b370d7cf9eef7658beb338fd100d1c9.camel@hadess.net>
Subject: Re: [PATCH] keytable: Add source information in generated keymaps
From:   Bastien Nocera <hadess@hadess.net>
To:     Sean Young <sean@mess.org>
Cc:     linux-media@vger.kernel.org
Date:   Sat, 06 Mar 2021 16:26:53 +0100
In-Reply-To: <20210306144949.GA29737@gofer.mess.org>
References: <20210126174514.1393240-1-hadess@hadess.net>
         <20210306144949.GA29737@gofer.mess.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, 2021-03-06 at 14:49 +0000, Sean Young wrote:
> On Tue, Jan 26, 2021 at 06:45:14PM +0100, Bastien Nocera wrote:
> > Add comments to mention that keymap files are generated, and list
> > which
> > tool was used to generate them and the kernel source filename.
> > 
> > This should make it less likely that generated files are used as
> > examples to contribute keymaps from, and more likely that upstream
> > changes are channeled through the right source tree.
> > 
> > Signed-off-by: Bastien Nocera <hadess@hadess.net>
> > ---
> >  utils/keytable/gen_keytables.pl | 7 ++++++-
> >  1 file changed, 6 insertions(+), 1 deletion(-)
> > 
> > diff --git a/utils/keytable/gen_keytables.pl
> > b/utils/keytable/gen_keytables.pl
> > index c14aded3..40556479 100755
> > --- a/utils/keytable/gen_keytables.pl
> > +++ b/utils/keytable/gen_keytables.pl
> > @@ -36,10 +36,15 @@ sub flush($$)
> >         my $filename = shift;
> >         my $legacy = shift;
> >         my $defined;
> > +       my $relative_filename = $filename;
> >  
> >         return if (!$keyname || !$out);
> > -       print "Creating $dir/$keyname.toml\n";
> > +       $relative_filename =~ s/^$kernel_dir//;
> > +       $relative_filename =~ s/^\///;
> > +       print "Creating $dir/$keyname.toml from
> > $relative_filename\n";
> >         open OUT, ">$dir/$keyname.toml";
> > +       print OUT "# Generated with gen_keytables.pl in v4l-
> > utils\n";
> > +       print OUT "# using $relative_filename as a source file\n";
> 
> So on second thought, this is a good idea. How would feel about
> shortening it to one line, like:
> 
>         print OUT "# Generated with gen_keytables.pl from
> $relative_filename\n";

That would be fine, yes. Feel free to amend the wording to your liking
with my SoB.

Cheers

> 
> Thanks
> 
> Sean
> 
> >         print OUT "[[protocols]]\n";
> >         print OUT "name = \"$keyname\"\n";
> >         print OUT "protocol = \"$type\"\n";
> > -- 
> > 2.29.2


