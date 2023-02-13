Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1FFE0694280
	for <lists+linux-media@lfdr.de>; Mon, 13 Feb 2023 11:16:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229810AbjBMKQs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Feb 2023 05:16:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229637AbjBMKQr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Feb 2023 05:16:47 -0500
Received: from gofer.mess.org (gofer.mess.org [IPv6:2a02:8011:d000:212::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16B552134
        for <linux-media@vger.kernel.org>; Mon, 13 Feb 2023 02:16:46 -0800 (PST)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 26C1310083D; Mon, 13 Feb 2023 10:16:45 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
        t=1676283405; bh=ZA5p17UQHEswv6m8MWaSxVuCA25U3H0LTysWHJkNB+A=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=b1vU0UsiJ0fm8To93SYDJ0q9DmmBByVfhdQgGKL624wfB6P54nDlbI+EF4tFWaEDm
         eRb9JfJjcXcvCI3VPOn1schrdf5syYu5PJZB0zxGLIzNbOD1Hmt9t9zr3LFFWx116w
         rGSmKFy6WBObAxyr5L8RYNRtnj4qXzDLGa23OLLMs1Aip3nYqf0HCOecl5yaNQf6Mr
         XCPNsayHMfe3U6lIiyeq+lv+oz9CvZ8bSyJ5o+zqGVqiUVyE6D/2LGRxGivoaYgJ5w
         hGvUFInrQdac+iC1eax3r2jZe3sja5gBOF7QO1/Gjz7ZlhvVBHYSAgusktHazAxlMC
         aF3Hq+unsuDmA==
Date:   Mon, 13 Feb 2023 10:16:45 +0000
From:   Sean Young <sean@mess.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Gregor Jasny <gjasny@googlemail.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: Re: [PATCH] [v4l-utils] keytable: Add -fno-stack-protector
 compilation option
Message-ID: <Y+oODfg0dVhdi5W8@gofer.mess.org>
References: <20230211221401.25715-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230211221401.25715-1-laurent.pinchart@ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sun, Feb 12, 2023 at 12:14:01AM +0200, Laurent Pinchart wrote:
> clang may come with stack protector enabled by default, which caused
> compilation errors for BPF programs:
> 
> FAILED: utils/keytable/bpf_protocols/grundig.o
> /usr/lib/llvm/15/bin/clang -idirafter /usr/lib/llvm/15/bin/../../../../lib/clang/15.0.6/include -idirafter /usr/local/include -idirafter /usr/include -D__linux__ -target bpf -O2 -c ../../utils/keytable/bpf_protocols/grundig.c -o utils/keytable/bpf_protocols/grundig.o
> ../../utils/keytable/bpf_protocols/grundig.c:50:5: error: A call to built-in function '__stack_chk_fail' is not supported.
> int bpf_decoder(unsigned int *sample)
>     ^
> 1 error generated.
> 
> Disable the stack protector to fix this, as recommended in [1].
> 
> [1] https://www.spinics.net/lists/netdev/msg556400.html

Looks good, applied.

I could not reproduce the problem, but the -fno-stack-protector cli option
has been supported for a very long time, and stack protection does not make
sense in a BPF context.

Thanks,
Sean

> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  utils/keytable/bpf_protocols/Makefile.am | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/utils/keytable/bpf_protocols/Makefile.am b/utils/keytable/bpf_protocols/Makefile.am
> index 13be2794791b..6096c0de5813 100644
> --- a/utils/keytable/bpf_protocols/Makefile.am
> +++ b/utils/keytable/bpf_protocols/Makefile.am
> @@ -8,7 +8,7 @@ CLANG_SYS_INCLUDES := $(shell $(CLANG) -v -E - </dev/null 2>&1 \
>          | sed -n '/<...> search starts here:/,/End of search list./{ s| \(/.*\)|-idirafter \1|p }')
>  
>  %.o: %.c bpf_helpers.h
> -	$(CLANG) $(CLANG_SYS_INCLUDES) -D__linux__ -I$(top_srcdir)/include -target bpf -O2 -c $<
> +	$(CLANG) $(CLANG_SYS_INCLUDES) -D__linux__ -I$(top_srcdir)/include -target bpf -fno-stack-protector -O2 -c $<
>  
>  PROTOCOLS = grundig.o pulse_distance.o pulse_length.o rc_mm.o manchester.o xbox-dvd.o imon_rsc.o raw.o samsung36.o
>  
> -- 
> Regards,
> 
> Laurent Pinchart
