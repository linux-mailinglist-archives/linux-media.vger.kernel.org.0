Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9157B5F90F
	for <lists+linux-media@lfdr.de>; Thu,  4 Jul 2019 15:22:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727118AbfGDNWv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Jul 2019 09:22:51 -0400
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:45803 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726994AbfGDNWu (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 4 Jul 2019 09:22:50 -0400
X-Originating-IP: 83.155.44.161
Received: from classic (mon69-7-83-155-44-161.fbx.proxad.net [83.155.44.161])
        (Authenticated sender: hadess@hadess.net)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 25C031C0016;
        Thu,  4 Jul 2019 13:22:48 +0000 (UTC)
Message-ID: <e83329c72c8a29eb8e1164292663284e818a649f.camel@hadess.net>
Subject: Re: [PATCH 1/2] keytable: Add source information in generated
 keymaps
From:   Bastien Nocera <hadess@hadess.net>
To:     Sean Young <sean@mess.org>
Cc:     linux-media@vger.kernel.org
Date:   Thu, 04 Jul 2019 15:22:48 +0200
In-Reply-To: <20190703153317.yuv4wxp52w3ingmx@gofer.mess.org>
References: <20190701163813.25032-1-hadess@hadess.net>
         <20190703153317.yuv4wxp52w3ingmx@gofer.mess.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.3 (3.32.3-1.fc30) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 2019-07-03 at 16:33 +0100, Sean Young wrote:
> On Mon, Jul 01, 2019 at 06:38:12PM +0200, Bastien Nocera wrote:
> > Add comments to mention that keymap files are generated, and that
> > they shouldn't be modified by hand. Also list which tool was used
> > to generate them and the kernel source filename.
> > 
> > Signed-off-by: Bastien Nocera <hadess@hadess.net>
> > ---
> >  utils/keytable/gen_keytables.pl | 9 ++++++++-
> >  1 file changed, 8 insertions(+), 1 deletion(-)
> > 
> > diff --git a/utils/keytable/gen_keytables.pl
> > b/utils/keytable/gen_keytables.pl
> > index 4124e366..3dc74ba6 100755
> > --- a/utils/keytable/gen_keytables.pl
> > +++ b/utils/keytable/gen_keytables.pl
> > @@ -36,10 +36,17 @@ sub flush($$)
> >  	my $filename = shift;
> >  	my $legacy = shift;
> >  	my $defined;
> > +	my $relative_filename = $filename;
> >  
> >  	return if (!$keyname || !$out);
> > -	print "Creating $dir/$keyname.toml\n";
> > +	$relative_filename =~ s/^$kernel_dir//;
> > +	$relative_filename =~ s/^\///;
> > +	print "Creating $dir/$keyname.toml from $relative_filename\n";
> >  	open OUT, ">$dir/$keyname.toml";
> > +	print OUT "# This file is a generated data file, do not modify
> > manually\n";
> > +	print OUT "#\n";
> > +	print OUT "# Generated with gen_keytables.pl in v4l-utils\n";
> > +	print OUT "# using $relative_filename as a source file\n";
> 
> This is only relevant for a developer who is wanting to upstream
> their
> keymap changes to v4l-utils.

It's only relevant to you. Or the chump that tried to do things well
(me). I wouldn't have wasted this much time writing tests, or making
patches if there had been a bit of guidance on how you wanted those
problems fixed. I'll let you create a README for that instead.

I'll send the "check" patch again.

