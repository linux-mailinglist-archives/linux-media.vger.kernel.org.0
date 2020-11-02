Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC76B2A2536
	for <lists+linux-media@lfdr.de>; Mon,  2 Nov 2020 08:29:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728167AbgKBH3o (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 2 Nov 2020 02:29:44 -0500
Received: from mail.kernel.org ([198.145.29.99]:59856 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728156AbgKBH3n (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 2 Nov 2020 02:29:43 -0500
Received: from coco.lan (ip5f5ad5bd.dynamic.kabel-deutschland.de [95.90.213.189])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 10FED2223C;
        Mon,  2 Nov 2020 07:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604302182;
        bh=EDYSId/IkW5h9Ri5D4679FkeZOCdB9NtFRmEIvFp2PI=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=0Ky3Tv+pqMfTTLjoOLstqgE3rUopAaQN/7c2VtGGgFS2LQTym0JUthvu9GvS5Cwbl
         5K5YZFZuM5MbmHBp522mTSe9C/oXP5ec4labDOOoLEwUzt0xdAvR4dQmF9UG056pmy
         QWRHkx10RhpfYszj7lit2Eu6RALgku7UKRVBrn5w=
Date:   Mon, 2 Nov 2020 08:29:38 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     "filip.mutterer@gmail.com" <filip.mutterer@gmail.com>
Cc:     linux-media@vger.kernel.org
Subject: Re: Linux Mint 20
Message-ID: <20201102082938.07054ebc@coco.lan>
In-Reply-To: <0c9ca3ce-f08c-984e-5be3-f748720de009@gmail.com>
References: <0c9ca3ce-f08c-984e-5be3-f748720de009@gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Sun, 1 Nov 2020 22:51:01 +0100
"filip.mutterer@gmail.com" <filip.mutterer@gmail.com> escreveu:

> Hi there,
> 
> I had the following error, which was easy to solve on Linux Mint 20:
> 
> Checking if the needed tools for Linux Mint 20 are available
> ERROR: please install "Proc::ProcessTable", otherwise, build won't work.
> I don't know distro Linux Mint 20. So, I can't provide you a hint with 
> the package names.
> Be welcome to contribute with a patch for media-build, by submitting a 
> distro-specific hint
> to linux-media@vger.kernel.org
> Build can't procceed as 1 dependency is missing at ./build line 276.

Never used Linux Mint. Yet, on a quick search for "ProcessTable linux-mint perl"

Showed a few packages:

	https://community.linuxmint.com/software/view/libproc-processtable-perl
	https://community.linuxmint.com/software/view/libproc-process-perl

It would be cool if you could send us a patch against ./build adding
support for Linux Mint dependencies.

If you take a look on it, you'll notice that it should be very easy to
teach the script about a new distro. You just need to add a new if
inside sub give_hints(). Something like:

	if ($system_release =~ /Linux Mint/) {
		give_mint_hints;
		return;
	}

And create a new subroutine telling the package names for:

	- the "lsdiff" command;
	- two perl packages: Digest::SHA and Proc::ProcessTable

Yet, as Mint is based on Debian/Ubuntu, perhaps just the enclosed
patch would be enough. 

> Here is what I installed to have it compile:
> 
> sudo cpan Proc::ProcessTable

Well, you can always install packages via cpan, although
this perl extension should very likely be there on all
distros.

Thanks,
Mauro

diff --git a/build b/build
index c2067e759213..2aa92cc2e819 100755
--- a/build
+++ b/build
@@ -207,6 +207,10 @@ sub give_hints()
 		give_ubuntu_hints;
 		return;
 	}
+	if ($system_release =~ /Linux Mint/) {
+		give_ubuntu_hints;
+		return;
+	}
 	if ($system_release =~ /Gentoo/) {
 		give_gentoo_hints;
 		return;


