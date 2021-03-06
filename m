Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 988B532FB60
	for <lists+linux-media@lfdr.de>; Sat,  6 Mar 2021 16:36:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230346AbhCFPfY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 6 Mar 2021 10:35:24 -0500
Received: from gofer.mess.org ([88.97.38.141]:47913 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230390AbhCFPep (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 6 Mar 2021 10:34:45 -0500
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 12BB1C6380; Sat,  6 Mar 2021 15:34:44 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mess.org; s=2020;
        t=1615044884; bh=t5rDOOC3QqvgYyW0DMljp7i449hwexNHUJIzDzER39c=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=OV3DR3uiYfj5Ohj+s2iAyk/JZ5LZcTv7/cJrC4XK6RyJ4fHfzjizfaCLV4hW/yfxF
         s2SvmP5aws8RLIaKy3WbjU4P6zL/9mK0r3Jvqi+Fl/UmuJcI1X8CUy/p7P5pJbSCYQ
         58JR9kNs6dSV2Npr8aaG5HK7L8rGfC9N6Uk5+BsX2qh8902HjtFocU94wCrjSpxTOD
         SUOhzQXtStcadFtKjcu3BWgiSc8Ir15zocaFp35S9zXwwcgSj/WQCk7XQJBhVYg24N
         DDyQq8VlgwCLJ3o0R+havtymu59qbYRdG0XwrohudJJhGGjJ0QOYixpcodCqhch6J3
         JJ0hu9QGxJ8aQ==
Date:   Sat, 6 Mar 2021 15:34:43 +0000
From:   Sean Young <sean@mess.org>
To:     Bastien Nocera <hadess@hadess.net>
Cc:     linux-media@vger.kernel.org
Subject: Re: [PATCH] keytable: Add source information in generated keymaps
Message-ID: <20210306153443.GA513@gofer.mess.org>
References: <20210126174514.1393240-1-hadess@hadess.net>
 <20210306144949.GA29737@gofer.mess.org>
 <7dcbca803b370d7cf9eef7658beb338fd100d1c9.camel@hadess.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7dcbca803b370d7cf9eef7658beb338fd100d1c9.camel@hadess.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, Mar 06, 2021 at 04:26:53PM +0100, Bastien Nocera wrote:
> On Sat, 2021-03-06 at 14:49 +0000, Sean Young wrote:
> > On Tue, Jan 26, 2021 at 06:45:14PM +0100, Bastien Nocera wrote:
> > > Add comments to mention that keymap files are generated, and list
> > > which
> > > tool was used to generate them and the kernel source filename.
> > > 
> > > This should make it less likely that generated files are used as
> > > examples to contribute keymaps from, and more likely that upstream
> > > changes are channeled through the right source tree.
> > > 
> > > Signed-off-by: Bastien Nocera <hadess@hadess.net>
> > > ---
> > >  utils/keytable/gen_keytables.pl | 7 ++++++-
> > >  1 file changed, 6 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/utils/keytable/gen_keytables.pl
> > > b/utils/keytable/gen_keytables.pl
> > > index c14aded3..40556479 100755
> > > --- a/utils/keytable/gen_keytables.pl
> > > +++ b/utils/keytable/gen_keytables.pl
> > > @@ -36,10 +36,15 @@ sub flush($$)
> > >         my $filename = shift;
> > >         my $legacy = shift;
> > >         my $defined;
> > > +       my $relative_filename = $filename;
> > >  
> > >         return if (!$keyname || !$out);
> > > -       print "Creating $dir/$keyname.toml\n";
> > > +       $relative_filename =~ s/^$kernel_dir//;
> > > +       $relative_filename =~ s/^\///;
> > > +       print "Creating $dir/$keyname.toml from
> > > $relative_filename\n";
> > >         open OUT, ">$dir/$keyname.toml";
> > > +       print OUT "# Generated with gen_keytables.pl in v4l-
> > > utils\n";
> > > +       print OUT "# using $relative_filename as a source file\n";
> > 
> > So on second thought, this is a good idea. How would feel about
> > shortening it to one line, like:
> > 
> >         print OUT "# Generated with gen_keytables.pl from
> > $relative_filename\n";
> 
> That would be fine, yes. Feel free to amend the wording to your liking
> with my SoB.

Thanks -- patch applied

Do you want to fix the rc protocol in the Dell RC 260 keymap and apply?


Sean


> 
> Cheers
> 
> > 
> > Thanks
> > 
> > Sean
> > 
> > >         print OUT "[[protocols]]\n";
> > >         print OUT "name = \"$keyname\"\n";
> > >         print OUT "protocol = \"$type\"\n";
> > > -- 
> > > 2.29.2
> 
