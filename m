Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 778EC32FB40
	for <lists+linux-media@lfdr.de>; Sat,  6 Mar 2021 15:50:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230461AbhCFOuB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 6 Mar 2021 09:50:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230429AbhCFOty (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 6 Mar 2021 09:49:54 -0500
Received: from gofer.mess.org (gofer.mess.org [IPv6:2a02:8011:d000:212::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E982C06174A
        for <linux-media@vger.kernel.org>; Sat,  6 Mar 2021 06:49:54 -0800 (PST)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 528E7C6380; Sat,  6 Mar 2021 14:49:50 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mess.org; s=2020;
        t=1615042190; bh=1ekqBed7ks9tqnrO0MBePOvwCzxLMks8k/wkLgUcCqA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ZkyYnLFQm6G4GGeZ4PQNt1yda0MGyRaRD/TZWtMgfrSd1zdooqwXImpjIf7wUEePw
         OdcNFf3FQshIr7pWO47JO6vHxHcZjfRNdcu5IbvTZRt1TEDOfyW1S4uR6PWF7lEG6f
         YcfqRzzJLfhWeMHhP8uW+RZh2VSKKw51IFk4hIvIOxS2P9LBhgSgxlMGCmFmdWiXFp
         g1V/pBIFR78GB/O9v8lTrZYw0NDLDKMvv/yIDcwACRYetg6iRJnA7oqUuiAMHfIjMn
         tiyUekGKdcCNE8NHBQeFSztlTVBX8tHvD1BqmOhqxNK/jpDcsQUFvdxZ49tInnr/wu
         V56dTwOIF5u0A==
Date:   Sat, 6 Mar 2021 14:49:50 +0000
From:   Sean Young <sean@mess.org>
To:     Bastien Nocera <hadess@hadess.net>
Cc:     linux-media@vger.kernel.org
Subject: Re: [PATCH] keytable: Add source information in generated keymaps
Message-ID: <20210306144949.GA29737@gofer.mess.org>
References: <20210126174514.1393240-1-hadess@hadess.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210126174514.1393240-1-hadess@hadess.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Jan 26, 2021 at 06:45:14PM +0100, Bastien Nocera wrote:
> Add comments to mention that keymap files are generated, and list which
> tool was used to generate them and the kernel source filename.
> 
> This should make it less likely that generated files are used as
> examples to contribute keymaps from, and more likely that upstream
> changes are channeled through the right source tree.
> 
> Signed-off-by: Bastien Nocera <hadess@hadess.net>
> ---
>  utils/keytable/gen_keytables.pl | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/utils/keytable/gen_keytables.pl b/utils/keytable/gen_keytables.pl
> index c14aded3..40556479 100755
> --- a/utils/keytable/gen_keytables.pl
> +++ b/utils/keytable/gen_keytables.pl
> @@ -36,10 +36,15 @@ sub flush($$)
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
> +	print OUT "# Generated with gen_keytables.pl in v4l-utils\n";
> +	print OUT "# using $relative_filename as a source file\n";

So on second thought, this is a good idea. How would feel about
shortening it to one line, like:

	print OUT "# Generated with gen_keytables.pl from $relative_filename\n";

Thanks

Sean

>  	print OUT "[[protocols]]\n";
>  	print OUT "name = \"$keyname\"\n";
>  	print OUT "protocol = \"$type\"\n";
> -- 
> 2.29.2
