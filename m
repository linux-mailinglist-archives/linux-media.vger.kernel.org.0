Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0C52269E462
	for <lists+linux-media@lfdr.de>; Tue, 21 Feb 2023 17:18:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234033AbjBUQSt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Feb 2023 11:18:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233175AbjBUQSt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Feb 2023 11:18:49 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D5D110DD
        for <linux-media@vger.kernel.org>; Tue, 21 Feb 2023 08:18:46 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A086E60F9E
        for <linux-media@vger.kernel.org>; Tue, 21 Feb 2023 16:18:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4137EC433EF;
        Tue, 21 Feb 2023 16:18:42 +0000 (UTC)
Message-ID: <b5225b0c-db5c-92c4-9dfd-5c1675d01792@xs4all.nl>
Date:   Tue, 21 Feb 2023 17:18:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 1/1] utils: Add help text for v4l2-tracer-gen.pl
Content-Language: en-US
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, gjasny@googlemail.com,
        kieran.bingham@ideasonboard.com, mchehab@kernel.org,
        nicolas@ndufresne.ca, p.zabel@pengutronix.de, rosenp@gmail.com,
        sean@mess.org, user.vdr@gmail.com, xavier.claessens@collabora.com,
        deborah.brouwer@collabora.com, ariel@vanguardiasur.com.ar,
        ezequiel@vanguardiasur.com.ar, tomi.valkeinen@ideasonboard.com
References: <20230221143204.26591-1-laurent.pinchart@ideasonboard.com>
 <20230221160849.2778-1-sakari.ailus@linux.intel.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <20230221160849.2778-1-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 21/02/2023 17:08, Sakari Ailus wrote:
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

Thank you, Sakari!

Laurent, with this patch squashed in to 3/7 you can add my:

Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

But wait a bit to see if Deb has an opinion as well.

Regards,

	Hans
