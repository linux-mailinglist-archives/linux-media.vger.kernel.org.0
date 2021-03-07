Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 23833330024
	for <lists+linux-media@lfdr.de>; Sun,  7 Mar 2021 11:40:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231325AbhCGKjz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 7 Mar 2021 05:39:55 -0500
Received: from mslow2.mail.gandi.net ([217.70.178.242]:44377 "EHLO
        mslow2.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230155AbhCGKj0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 7 Mar 2021 05:39:26 -0500
Received: from relay13.mail.gandi.net (unknown [217.70.178.233])
        by mslow2.mail.gandi.net (Postfix) with ESMTP id A96D03BD2D1
        for <linux-media@vger.kernel.org>; Sun,  7 Mar 2021 10:25:31 +0000 (UTC)
Received: from [192.168.1.150] (unknown [78.199.60.242])
        (Authenticated sender: hadess@hadess.net)
        by relay13.mail.gandi.net (Postfix) with ESMTPSA id 304D680006;
        Sun,  7 Mar 2021 10:25:09 +0000 (UTC)
Message-ID: <78d8afa360822dfe4a46122da42833e6bd9ff6cd.camel@hadess.net>
Subject: Re: [PATCH] keytable: Add source information in generated keymaps
From:   Bastien Nocera <hadess@hadess.net>
To:     Sean Young <sean@mess.org>
Cc:     linux-media@vger.kernel.org
Date:   Sun, 07 Mar 2021 11:25:09 +0100
In-Reply-To: <20210306153443.GA513@gofer.mess.org>
References: <20210126174514.1393240-1-hadess@hadess.net>
         <20210306144949.GA29737@gofer.mess.org>
         <7dcbca803b370d7cf9eef7658beb338fd100d1c9.camel@hadess.net>
         <20210306153443.GA513@gofer.mess.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, 2021-03-06 at 15:34 +0000, Sean Young wrote:
> On Sat, Mar 06, 2021 at 04:26:53PM +0100, Bastien Nocera wrote:
> > On Sat, 2021-03-06 at 14:49 +0000, Sean Young wrote:
> > > On Tue, Jan 26, 2021 at 06:45:14PM +0100, Bastien Nocera wrote:
> > > > Add comments to mention that keymap files are generated, and
> > > > list
> > > > which
> > > > tool was used to generate them and the kernel source filename.
> > > > 
> > > > This should make it less likely that generated files are used
> > > > as
> > > > examples to contribute keymaps from, and more likely that
> > > > upstream
> > > > changes are channeled through the right source tree.
> > > > 
> > > > Signed-off-by: Bastien Nocera <hadess@hadess.net>
> > > > ---
> > > >  utils/keytable/gen_keytables.pl | 7 ++++++-
> > > >  1 file changed, 6 insertions(+), 1 deletion(-)
> > > > 
> > > > diff --git a/utils/keytable/gen_keytables.pl
> > > > b/utils/keytable/gen_keytables.pl
> > > > index c14aded3..40556479 100755
> > > > --- a/utils/keytable/gen_keytables.pl
> > > > +++ b/utils/keytable/gen_keytables.pl
> > > > @@ -36,10 +36,15 @@ sub flush($$)
> > > >         my $filename = shift;
> > > >         my $legacy = shift;
> > > >         my $defined;
> > > > +       my $relative_filename = $filename;
> > > >  
> > > >         return if (!$keyname || !$out);
> > > > -       print "Creating $dir/$keyname.toml\n";
> > > > +       $relative_filename =~ s/^$kernel_dir//;
> > > > +       $relative_filename =~ s/^\///;
> > > > +       print "Creating $dir/$keyname.toml from
> > > > $relative_filename\n";
> > > >         open OUT, ">$dir/$keyname.toml";
> > > > +       print OUT "# Generated with gen_keytables.pl in v4l-
> > > > utils\n";
> > > > +       print OUT "# using $relative_filename as a source
> > > > file\n";
> > > 
> > > So on second thought, this is a good idea. How would feel about
> > > shortening it to one line, like:
> > > 
> > >         print OUT "# Generated with gen_keytables.pl from
> > > $relative_filename\n";
> > 
> > That would be fine, yes. Feel free to amend the wording to your
> > liking
> > with my SoB.
> 
> Thanks -- patch applied
> 
> Do you want to fix the rc protocol in the Dell RC 260 keymap and
> apply?

I haven't had the time to modify the patch and fix it, probably next
week.

Cheers

