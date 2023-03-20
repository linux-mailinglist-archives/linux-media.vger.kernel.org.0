Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2763C6C22E7
	for <lists+linux-media@lfdr.de>; Mon, 20 Mar 2023 21:37:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229917AbjCTUhJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 Mar 2023 16:37:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230035AbjCTUhI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 Mar 2023 16:37:08 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E87B1351A
        for <linux-media@vger.kernel.org>; Mon, 20 Mar 2023 13:36:37 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 5224F617ED
        for <linux-media@vger.kernel.org>; Mon, 20 Mar 2023 20:36:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3013C433EF;
        Mon, 20 Mar 2023 20:36:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1679344592;
        bh=2medDEnJSbBLirdxcXFeiP4e66G+RFD+tcgNQQf0brI=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=WFj6aMbt6XN4ekBInFTGSp523kBkcnX0ymzHh21nROQVDvHWXzYB21fafk8T5ID8K
         8bnYKMZJC13nZ2mlQzayNBUylqddR/RkMvHV/zo+SXcd+bOxf8niKmlRjK/1PJeKnE
         xO/KDKZgALSMJ42VCsF2jjnPy3LWZZ9CkHFP61zhzBkCFCZcntBOAjx82gpqjpaOnJ
         OnzPxg0Ns4outpqX5AAoZpWg0s6B7/XtXr18Qmgbt9SqoIqLGxwcG7uNzJCaAPo9LL
         ypXi9EVKzidjQZFfuz8gIrQK7DkrQtf2GJTjXZKIG+OThDsVqInRrGTXVT8WJvYy+g
         +2UMGkJePF37w==
Date:   Mon, 20 Mar 2023 21:36:19 +0100
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Gregor Jasny <gjasny@googlemail.com>
Subject: Re: [PATCH] meson: Fix install location of doxygen's man pages
Message-ID: <20230320213619.3cf1affb@coco.lan>
In-Reply-To: <20230320195057.16195-1-laurent.pinchart@ideasonboard.com>
References: <20230320195057.16195-1-laurent.pinchart@ideasonboard.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

Em Mon, 20 Mar 2023 21:50:57 +0200
Laurent Pinchart <laurent.pinchart@ideasonboard.com> escreveu:

> The doxygen man pages are incorrectly being installed alongside the HTML
> documentation. Install them in the right location, in the $mandir
> directory, by specifying a separate install location for each doxygen
> target.
> 
> As a drive-by cleanup, replace the join_path() function with the meson's
> '/' path concatenation operator.

Thanks for the quick fix!

> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  doc/meson.build | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/doc/meson.build b/doc/meson.build
> index fef3e83fa432..02a30dc5688a 100644
> --- a/doc/meson.build
> +++ b/doc/meson.build
> @@ -15,15 +15,16 @@ doxyfile = configure_file(input : 'Doxyfile.in',
>                            output : 'Doxyfile',
>                            configuration : cdata)
>  
> -doxygen_install_dir = join_paths(get_option('datadir'), 'doc',
> -                                 '@0@'.format(meson.project_name()))
> +doxygen_install_dirs = []
>  
>  doxygen_output = []
>  if get_option('doxygen-html')
>      doxygen_output += 'html'
> +    doxygen_install_dirs += get_option('datadir') / 'doc' / '@0@'.format(meson.project_name())
>  endif
>  if get_option('doxygen-man')
>      doxygen_output += 'man'
> +    doxygen_install_dirs += get_option('mandir') / '..'

This is hacky, but it also sounded to me the easiest/quickest way to
address it. I wonder if are there a cleaner way to avoid it to place
files under ${mandir}/man/man3. e. g. /usr/share/man/man/man3.

This shouldn't be causing real problems, though, except if some
distro would use non-Unix standard places, like setting mandir
to something like "/weird/distro/manual_pages".

Thanks,
Mauro
