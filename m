Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C13DD69E2E7
	for <lists+linux-media@lfdr.de>; Tue, 21 Feb 2023 16:00:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234578AbjBUPAz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Feb 2023 10:00:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233202AbjBUPAx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Feb 2023 10:00:53 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C5F82BEC5
        for <linux-media@vger.kernel.org>; Tue, 21 Feb 2023 07:00:42 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id D7F3AB80EFA
        for <linux-media@vger.kernel.org>; Tue, 21 Feb 2023 15:00:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFDA5C433EF;
        Tue, 21 Feb 2023 15:00:35 +0000 (UTC)
Message-ID: <2a0cdb5e-6d7f-b59f-bd5f-9ee226097450@xs4all.nl>
Date:   Tue, 21 Feb 2023 16:00:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [v4l-utils] [PATCH v9 1/7] utils: Allow choosing
 v4l2-tracer-gen.pl output
Content-Language: en-US
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     gjasny@googlemail.com, kieran.bingham@ideasonboard.com,
        mchehab@kernel.org, nicolas@ndufresne.ca, p.zabel@pengutronix.de,
        rosenp@gmail.com, sakari.ailus@iki.fi, sean@mess.org,
        user.vdr@gmail.com, xavier.claessens@collabora.com,
        deborah.brouwer@collabora.com, ariel@vanguardiasur.com.ar,
        ezequiel@vanguardiasur.com.ar, tomi.valkeinen@ideasonboard.com
References: <20230221143204.26591-1-laurent.pinchart@ideasonboard.com>
 <20230221143204.26591-2-laurent.pinchart@ideasonboard.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <20230221143204.26591-2-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 2/21/23 15:31, Laurent Pinchart wrote:
> From: Sakari Ailus <sakari.ailus@linux.intel.com>
> 
> In v4l2-tracer-gen.pl, add support for setting the output directory for
> the generated files and choosing which ones to generate (common, trace or
> retrace). The default is to generate them all in the current directory,
> i.e. what the script used to do.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> [Append a '/' automatically between $outdir and $fname]
> Tested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Tested-by: Niklas Söderlund <niklas.soderlund@ragnatech.se>
> ---
>  utils/v4l2-tracer/v4l2-tracer-gen.pl | 36 ++++++++++++++++++++++++----
>  1 file changed, 31 insertions(+), 5 deletions(-)
> 
> diff --git a/utils/v4l2-tracer/v4l2-tracer-gen.pl b/utils/v4l2-tracer/v4l2-tracer-gen.pl
> index fe648182ac34..f7454e7f0bab 100755
> --- a/utils/v4l2-tracer/v4l2-tracer-gen.pl
> +++ b/utils/v4l2-tracer/v4l2-tracer-gen.pl
> @@ -2,6 +2,16 @@
>  # SPDX-License-Identifier: GPL-2.0-only */
>  # Copyright 2022 Collabora Ltd.
>  
> +my $outdir = ".";
> +my %outtype = ( "common" => 1, "trace" => 1, "retrace" => 1 );
> +
> +while ($ARGV[0] =~ /^-/) {
> +	my $arg = shift @ARGV;
> +
> +	$outdir = shift @ARGV if $arg eq "-o";
> +	%outtype = (shift @ARGV => 1) if $arg eq '-t';
> +}

Can you add a help message as well? At minimum as a comment, even better
by adding a -h option.

It's currently only documented in the commit log, which nobody will read :-)

Regards,

	Hans

> +
>  sub convert_type_to_json_type {
>  	my $type = shift;
>  	if ($type eq __u8 || $type eq char || $type eq __u16 || $type eq __s8 || $type eq __s16 || $type eq __s32 || $type eq 'int') {
> @@ -696,29 +706,45 @@ sub struct_gen_ctrl {
>  	printf $fh_retrace_cpp "}\n\n";
>  }
>  
> -open($fh_trace_cpp, '>', 'trace-gen.cpp') or die "Could not open trace-gen.cpp for writing";
> +sub do_open($$) {
> +	my ($type, $fname) = @_;
> +	my $fh;
> +
> +	if (defined $outtype{$type}) {
> +		$fname = "$outdir/$fname";
> +	} else {
> +		$fname = "/dev/null";
> +	}
> +
> +	open($fh, "> $fname") or die "Could not open $fname for writing";
> +
> +	return $fh;
> +}
> +
> +
> +$fh_trace_cpp = do_open("trace", "trace-gen.cpp");
>  printf $fh_trace_cpp "/* SPDX-License-Identifier: GPL-2.0-only */\n/*\n * Copyright 2022 Collabora Ltd.\n";
>  printf $fh_trace_cpp " *\n * AUTOMATICALLY GENERATED BY \'%s\' DO NOT EDIT\n */\n\n", __FILE__;
>  printf $fh_trace_cpp "#include \"v4l2-tracer-common.h\"\n\n";
>  
> -open($fh_trace_h, '>', 'trace-gen.h') or die "Could not open trace-gen.h for writing";
> +$fh_trace_h = do_open("trace", "trace-gen.h");
>  printf $fh_trace_h "/* SPDX-License-Identifier: GPL-2.0-only */\n/*\n * Copyright 2022 Collabora Ltd.\n";
>  printf $fh_trace_h " *\n * AUTOMATICALLY GENERATED BY \'%s\' DO NOT EDIT\n */\n\n", __FILE__;
>  printf $fh_trace_h "\#ifndef TRACE_GEN_H\n";
>  printf $fh_trace_h "\#define TRACE_GEN_H\n\n";
>  
> -open($fh_retrace_cpp, '>', 'retrace-gen.cpp') or die "Could not open retrace-gen.cpp for writing";
> +$fh_retrace_cpp = do_open("retrace", "retrace-gen.cpp");
>  printf $fh_retrace_cpp "/* SPDX-License-Identifier: GPL-2.0-only */\n/*\n * Copyright 2022 Collabora Ltd.\n";
>  printf $fh_retrace_cpp " *\n * AUTOMATICALLY GENERATED BY \'%s\' DO NOT EDIT\n */\n\n", __FILE__;
>  printf $fh_retrace_cpp "#include \"v4l2-tracer-common.h\"\n\n";
>  
> -open($fh_retrace_h, '>', 'retrace-gen.h') or die "Could not open retrace-gen.h for writing";
> +$fh_retrace_h = do_open("retrace", "retrace-gen.h");
>  printf $fh_retrace_h "/* SPDX-License-Identifier: GPL-2.0-only */\n/*\n * Copyright 2022 Collabora Ltd.\n";
>  printf $fh_retrace_h " *\n * AUTOMATICALLY GENERATED BY \'%s\' DO NOT EDIT\n */\n\n", __FILE__;
>  printf $fh_retrace_h "\#ifndef RETRACE_GEN_H\n";
>  printf $fh_retrace_h "\#define RETRACE_GEN_H\n\n";
>  
> -open($fh_common_info_h, '>', 'v4l2-tracer-info-gen.h') or die "Could not open v4l2-tracer-info-gen.h for writing";
> +$fh_common_info_h = do_open("common", "v4l2-tracer-info-gen.h");
>  printf $fh_common_info_h "/* SPDX-License-Identifier: GPL-2.0-only */\n/*\n * Copyright 2022 Collabora Ltd.\n";
>  printf $fh_common_info_h " *\n * AUTOMATICALLY GENERATED BY \'%s\' DO NOT EDIT\n */\n\n", __FILE__;
>  printf $fh_common_info_h "\#ifndef V4L2_TRACER_INFO_GEN_H\n";

