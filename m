Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A57D669EF24
	for <lists+linux-media@lfdr.de>; Wed, 22 Feb 2023 08:11:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229964AbjBVHLV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Feb 2023 02:11:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229493AbjBVHLU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Feb 2023 02:11:20 -0500
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B70F136682
        for <linux-media@vger.kernel.org>; Tue, 21 Feb 2023 23:11:19 -0800 (PST)
Received: from hillosipuli.retiisi.eu (82-181-192-243.bb.dnainternet.fi [82.181.192.243])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by meesny.iki.fi (Postfix) with ESMTPSA id 5AF6220173;
        Wed, 22 Feb 2023 09:11:16 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
        t=1677049876;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=iychovrpo23gV5eBwV1UdRroraUopeKjfO3jPuRenk0=;
        b=jUWmA55Gk4Vhp3oiMkbFTjz+nL4N4WOM37xAkXnf2YmD/M7G5JzUpLWKqrEQmZGw3av/02
        DQT4vAysOTzOHIN94Zp/y+GmZyws6JH8gRB6SM/XmzRzY7X2dqlrjEM3AnNoMYHIiu28zN
        9erl1JLO26zrConSxpOG6E04x4x3A1Y=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=meesny; t=1677049876;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=iychovrpo23gV5eBwV1UdRroraUopeKjfO3jPuRenk0=;
        b=EqJ23smA6u47amCQs1+sgvpzHyxdGdUGlQKwVatX73YO/O6K2iMVrKlAArL6hjnhBUcE4D
        SmOOtxKm3EuYmVmI0yJIaC6GcWnSwujzYtL0vKZ59T7hk8cbKZOxYFUz4nWTwRKInS7xfc
        KTyN6v+naV5Y3kvmEXiZ6TZXbA9MrQc=
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1677049876; a=rsa-sha256; cv=none;
        b=ez9Hwc4whMcidPBhIMpnDZ1+Jqdat9U575Cqc4dJEQjrY4i5QVLNH5JsGnSvgTh7X0AsJp
        agO3+IBugoBPpKEaQvMxueB2ibUzR5LHR8OBOLVgVx+IwwFvB+hqB9+bl0uUJuzxEKrr0O
        Rh+t4dHddRqGihbYdfc5mVf+ahtq2eE=
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id CB3A0634C92;
        Wed, 22 Feb 2023 09:11:03 +0200 (EET)
Date:   Wed, 22 Feb 2023 09:11:04 +0200
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, gjasny@googlemail.com,
        hverkuil@xs4all.nl, kieran.bingham@ideasonboard.com,
        mchehab@kernel.org, nicolas@ndufresne.ca, p.zabel@pengutronix.de,
        rosenp@gmail.com, sean@mess.org, user.vdr@gmail.com,
        xavier.claessens@collabora.com, deborah.brouwer@collabora.com,
        ariel@vanguardiasur.com.ar, ezequiel@vanguardiasur.com.ar,
        tomi.valkeinen@ideasonboard.com
Subject: Re: [PATCH 1/1] utils: Add help text for v4l2-tracer-gen.pl
Message-ID: <Y/XACCUyQ/2o6ylt@valkosipuli.retiisi.eu>
References: <20230221143204.26591-1-laurent.pinchart@ideasonboard.com>
 <20230221160849.2778-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230221160849.2778-1-sakari.ailus@linux.intel.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Tue, Feb 21, 2023 at 06:08:49PM +0200, Sakari Ailus wrote:
> Add help text for v4l2-tracer-gen.pl, via the '-h' option. Also add
> support for '--' to signal end of options, in case file names would begin
> with dash.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
> Hi Laurent,
> 
> Can you squash this to the utils patch?
> 
> - Sakari
> 
>  utils/v4l2-tracer/v4l2-tracer-gen.pl | 22 ++++++++++++++++++++--
>  1 file changed, 20 insertions(+), 2 deletions(-)
> 
> diff --git a/utils/v4l2-tracer/v4l2-tracer-gen.pl b/utils/v4l2-tracer/v4l2-tracer-gen.pl
> index 8192a5bf..53473ae1 100755
> --- a/utils/v4l2-tracer/v4l2-tracer-gen.pl
> +++ b/utils/v4l2-tracer/v4l2-tracer-gen.pl
> @@ -8,8 +8,26 @@ my %outtype = ( "common" => 1, "trace" => 1, "retrace" => 1 );
>  while ($ARGV[0] =~ /^-/) {
>  	my $arg = shift @ARGV;
>  
> -	$outdir = shift @ARGV if $arg eq "-o";
> -	%outtype = (shift @ARGV => 1) if $arg eq '-t';
> +	($outdir = shift @ARGV) && next if $arg eq "-o";
> +	(%outtype = (shift @ARGV => 1)) && next if $arg eq '-t';
> +	(help() && exit 0) if $arg eq '-h';
> +	last if $arg eq '--';
> +
> +	print stderr "invalid option $arg, use $0 -h for help\n";
> +	exit 0;

This should have been:

	exit 1;

to signal an error if an invalid option is given. The build process should
stop here in that case.

Could you change that while squashing it?

> +}
> +
> +sub help() {
> +	print stderr <<EOF;
> +$0 - Generate files for V4L2 tracer
> +
> +usage: $0 [-o dir] [-t (common|trace|retrace)] [-h] header [header2] ...
> +
> +	-o dir	set output directory
> +	-t x	generate particular trace files, the default is to generate
> +		them all
> +	-h	print this help text and quit
> +EOF
>  }
>  
>  sub convert_type_to_json_type {

-- 
Sakari Ailus
