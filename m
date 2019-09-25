Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 24525BE4B9
	for <lists+linux-media@lfdr.de>; Wed, 25 Sep 2019 20:40:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2440033AbfIYSkN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Sep 2019 14:40:13 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:35751 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2437676AbfIYSkN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Sep 2019 14:40:13 -0400
Received: by mail-pl1-f195.google.com with SMTP id y10so2927586plp.2
        for <linux-media@vger.kernel.org>; Wed, 25 Sep 2019 11:40:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=MuGT3zeB87Kf7bqZ0dAnnifWsbY2EnFsryvY8zE4L20=;
        b=k2hiS4xUarg1KgRUWzgkyJyk06WmpFYdsvsbt373eel40fuHIDRGpwUz7FZd+51YIG
         ZzEbDVZaBIqOp0cV56ziKFIIkARUnORU5d2B26MfwxYZoU3n6aR4XJq4FPAGHIpDZCGF
         dTzMqTXw3L/SZ3PidwBtj6rE4L+16Q0ZM2aM8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=MuGT3zeB87Kf7bqZ0dAnnifWsbY2EnFsryvY8zE4L20=;
        b=AYklNrlEJP6hJcs46Qn2MJEV9c8/I/RhK2qythda2lndafck+vH95IwtAWK6y4fQKO
         YN64SjU4LIXnKEX3JBPu/VfYmGdhV01ckeE0rgNAJ/OTAsBS+sBzjMsmqNISaFbT2Nwt
         /NtVCIr1a16NxaGT0MoFaaBxkOtzGNQEeqpqp0Z8ODKpwROUTIR4T2dLLcqFoG1HH2/x
         LVuft7bHwO4WKAOIyvkEcBvD+f+DOmv/AKeLmPuOcDZUuGf4MCUfQLskZV9f8d7h7L5j
         eoc06LcDs6tA0Bj80Sgg2f7WQxMYyV1xTmXbPKJvjn0jrgvJ8OI1AA9zBAQmYomCQNXw
         sPFw==
X-Gm-Message-State: APjAAAW/IDkvHOz7Sb5xC/6kgxOe3fOdyvBgoGDsovYfwVo9z6z39/k5
        6l8N9J17ovMwsnEUzxQ3Qpj7Ag==
X-Google-Smtp-Source: APXvYqyi345HBHvXtJFrdrAFgsh83ZZSsqYUWK7abFYoPZWKB/q6DvRBZYtN+lJ6jxADvL2+CTxQwQ==
X-Received: by 2002:a17:902:9045:: with SMTP id w5mr10341767plz.226.1569436810831;
        Wed, 25 Sep 2019 11:40:10 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id g12sm10754208pfb.97.2019.09.25.11.40.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2019 11:40:09 -0700 (PDT)
Date:   Wed, 25 Sep 2019 11:40:08 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Joe Perches <joe@perches.com>
Cc:     Dan Carpenter <dan.carpenter@oracle.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        ksummit-discuss@lists.linuxfoundation.org,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: [Ksummit-discuss] [PATCH] media: add a subsystem profile
 documentation
Message-ID: <201909251127.D0C517171E@keescook>
References: <156821693963.2951081.11214256396118531359.stgit@dwillia2-desk3.amr.corp.intel.com>
 <434c05bddd2b364e607e565227487910a8dd9793.1568391461.git.mchehab+samsung@kernel.org>
 <20190918123620.GA6306@pendragon.ideasonboard.com>
 <20190918105728.24e7eb48@coco.lan>
 <20190919065447.GF2959@kadam>
 <5d71311232fd6d4aa0fab038512eab933c13a722.camel@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5d71311232fd6d4aa0fab038512eab933c13a722.camel@perches.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Sep 25, 2019 at 10:13:37AM -0700, Joe Perches wrote:
> On Thu, 2019-09-19 at 09:56 +0300, Dan Carpenter wrote:
> > When I sent a patch, I use get_maintainer.pl then I add whoever the
> > wrote the commit from the Fixes tag.  Then I remove Colin King and Kees
> > Cook from the CC list because they worked all over the tree and I know
> > them.  I also normally remove LKML if there is another mailing list but
> > at least one subsystem uses LKML for patchwork so this isn't safe.
> > 
> > So the safest instructions are "Use get_matainer.pl and add the person
> > who wrote the commit in the Fixes tag".
> 
> Maybe add this:
> 
> Add the signers of any commit referenced in a "Fixes: <commit>" line
> of a patch description.

Oh yes please! I've always done this manually, so that's a nice bit of
automation. :)

> 
> ---
>  scripts/get_maintainer.pl | 38 +++++++++++++++++++++++++++++++++++++-
>  1 file changed, 37 insertions(+), 1 deletion(-)
> 
> diff --git a/scripts/get_maintainer.pl b/scripts/get_maintainer.pl
> index 5ef59214c555..34085d146fa2 100755
> --- a/scripts/get_maintainer.pl
> +++ b/scripts/get_maintainer.pl
> @@ -26,6 +26,7 @@ my $email = 1;
>  my $email_usename = 1;
>  my $email_maintainer = 1;
>  my $email_reviewer = 1;
> +my $email_fixes = 1;
>  my $email_list = 1;
>  my $email_moderated_list = 1;
>  my $email_subscriber_list = 0;
> @@ -249,6 +250,7 @@ if (!GetOptions(
>  		'r!' => \$email_reviewer,
>  		'n!' => \$email_usename,
>  		'l!' => \$email_list,
> +		'fixes!' => \$email_fixes,
>  		'moderated!' => \$email_moderated_list,
>  		's!' => \$email_subscriber_list,
>  		'multiline!' => \$output_multiline,
> @@ -503,6 +505,7 @@ sub read_mailmap {
>  ## use the filenames on the command line or find the filenames in the patchfiles
>  
>  my @files = ();
> +my @fixes = ();			# If a patch description includes Fixes: lines
>  my @range = ();
>  my @keyword_tvi = ();
>  my @file_emails = ();
> @@ -568,6 +571,8 @@ foreach my $file (@ARGV) {
>  		my $filename2 = $2;
>  		push(@files, $filename1);
>  		push(@files, $filename2);
> +	    } elsif (m/^Fixes:\s+([0-9a-fA-F]{6,40})/) {

Is "6" a safe lower bound here? I thought 12 was the way to go?

$ git log | egrep 'Fixes: [a-f0-9]{1,40}' | col2 | awk '{print length }' | sort | uniq -c | sort -n | tail
    238 8
    300 7
    330 14
    344 6
    352 11
    408 40
    425 10
    735 16
   1866 13
  31446 12

Hmpf, 6 is pretty high up there...

> +		push(@fixes, $1) if ($email_fixes);
>  	    } elsif (m/^\+\+\+\s+(\S+)/ or m/^---\s+(\S+)/) {
>  		my $filename = $1;
>  		$filename =~ s@^[^/]*/@@;
> @@ -598,6 +603,7 @@ foreach my $file (@ARGV) {
>  }
>  
>  @file_emails = uniq(@file_emails);
> +@fixes = uniq(@fixes);
>  
>  my %email_hash_name;
>  my %email_hash_address;
> @@ -612,7 +618,6 @@ my %deduplicate_name_hash = ();
>  my %deduplicate_address_hash = ();
>  
>  my @maintainers = get_maintainers();
> -
>  if (@maintainers) {
>      @maintainers = merge_email(@maintainers);
>      output(@maintainers);
> @@ -927,6 +932,10 @@ sub get_maintainers {
>  	}
>      }
>  
> +    foreach my $fix (@fixes) {
> +	vcs_add_commit_signers($fix, "blamed_fixes");
> +    }
> +
>      foreach my $email (@email_to, @list_to) {
>  	$email->[0] = deduplicate_email($email->[0]);
>      }
> @@ -1031,6 +1040,7 @@ MAINTAINER field selection options:
>      --roles => show roles (status:subsystem, git-signer, list, etc...)
>      --rolestats => show roles and statistics (commits/total_commits, %)
>      --file-emails => add email addresses found in -f file (default: 0 (off))
> +    --fixes => for patches, add signatures of commits with 'Fixes: <commit>' (default: 1 (on))

Should "Tested-by" and "Co-developed-by" get added to @signature_tags ?

>    --scm => print SCM tree(s) if any
>    --status => print status if any
>    --subsystem => print subsystem name if any
> @@ -1730,6 +1740,32 @@ sub vcs_is_hg {
>      return $vcs_used == 2;
>  }
>  
> +sub vcs_add_commit_signers {
> +    return if (!vcs_exists());
> +
> +    my ($commit, $desc) = @_;
> +    my $commit_count = 0;
> +    my $commit_authors_ref;
> +    my $commit_signers_ref;
> +    my $stats_ref;
> +    my @commit_authors = ();
> +    my @commit_signers = ();
> +    my $cmd;
> +
> +    $cmd = $VCS_cmds{"find_commit_signers_cmd"};
> +    $cmd =~ s/(\$\w+)/$1/eeg;	#substitute variables in $cmd
> +
> +    ($commit_count, $commit_signers_ref, $commit_authors_ref, $stats_ref) = vcs_find_signers($cmd, "");
> +    @commit_authors = @{$commit_authors_ref} if defined $commit_authors_ref;
> +    @commit_signers = @{$commit_signers_ref} if defined $commit_signers_ref;
> +
> +    foreach my $signer (@commit_signers) {
> +	$signer = deduplicate_email($signer);
> +    }
> +
> +    vcs_assign($desc, 1, @commit_signers);
> +}

@commit_authors is unused?

> +
>  sub interactive_get_maintainers {
>      my ($list_ref) = @_;
>      my @list = @$list_ref;
> 
> 
> _______________________________________________
> Ksummit-discuss mailing list
> Ksummit-discuss@lists.linuxfoundation.org
> https://lists.linuxfoundation.org/mailman/listinfo/ksummit-discuss

Yay! :)

-- 
Kees Cook
