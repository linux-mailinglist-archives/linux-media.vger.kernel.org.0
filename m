Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D86765E7E6
	for <lists+linux-media@lfdr.de>; Wed,  3 Jul 2019 17:33:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726621AbfGCPdS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 Jul 2019 11:33:18 -0400
Received: from gofer.mess.org ([88.97.38.141]:43507 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726574AbfGCPdS (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 3 Jul 2019 11:33:18 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 7C34B60A67; Wed,  3 Jul 2019 16:33:17 +0100 (BST)
Date:   Wed, 3 Jul 2019 16:33:17 +0100
From:   Sean Young <sean@mess.org>
To:     Bastien Nocera <hadess@hadess.net>
Cc:     linux-media@vger.kernel.org
Subject: Re: [PATCH 1/2] keytable: Add source information in generated keymaps
Message-ID: <20190703153317.yuv4wxp52w3ingmx@gofer.mess.org>
References: <20190701163813.25032-1-hadess@hadess.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190701163813.25032-1-hadess@hadess.net>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Jul 01, 2019 at 06:38:12PM +0200, Bastien Nocera wrote:
> Add comments to mention that keymap files are generated, and that
> they shouldn't be modified by hand. Also list which tool was used
> to generate them and the kernel source filename.
> 
> Signed-off-by: Bastien Nocera <hadess@hadess.net>
> ---
>  utils/keytable/gen_keytables.pl | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/utils/keytable/gen_keytables.pl b/utils/keytable/gen_keytables.pl
> index 4124e366..3dc74ba6 100755
> --- a/utils/keytable/gen_keytables.pl
> +++ b/utils/keytable/gen_keytables.pl
> @@ -36,10 +36,17 @@ sub flush($$)
>  	my $filename = shift;
>  	my $legacy = shift;
>  	my $defined;
> +	my $relative_filename = $filename;
>  
>  	return if (!$keyname || !$out);
> -	print "Creating $dir/$keyname.toml\n";
> +	$relative_filename =~ s/^$kernel_dir//;
> +	$relative_filename =~ s/^\///;
> +	print "Creating $dir/$keyname.toml from $relative_filename\n";
>  	open OUT, ">$dir/$keyname.toml";
> +	print OUT "# This file is a generated data file, do not modify manually\n";
> +	print OUT "#\n";
> +	print OUT "# Generated with gen_keytables.pl in v4l-utils\n";
> +	print OUT "# using $relative_filename as a source file\n";

This is only relevant for a developer who is wanting to upstream their
keymap changes to v4l-utils. If it should be documented somewhere it
should be in the v4l-utils repo itself, so that anyone generating
patches will notice before spending too much time making a patch on the
keymaps directory.

Also some remotes do not have definitions in the kernel, only in v4l-utils.

For an end user who is trying to patch their keymap this is confusing. Someone
who just wants to patch their keymap for their remote might be put off
by this message; can they not simply edit the toml file?

NAK, I'm afraid.

>  	print OUT "[[protocols]]\n";
>  	print OUT "name = \"$keyname\"\n";
>  	print OUT "protocol = \"$type\"\n";
> -- 
> 2.21.0


Sean
