Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0E27169E7CA
	for <lists+linux-media@lfdr.de>; Tue, 21 Feb 2023 19:44:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229854AbjBUSoA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Feb 2023 13:44:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229665AbjBUSoA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Feb 2023 13:44:00 -0500
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 035B1199D6
        for <linux-media@vger.kernel.org>; Tue, 21 Feb 2023 10:43:58 -0800 (PST)
Received: from localhost (node-1w7jr9st5p2etziuntaazujnj.ipv6.telus.net [IPv6:2001:569:beb1:1500:c96f:992f:7c34:9ff])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: dbrouwer)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id C7CE366003AD;
        Tue, 21 Feb 2023 18:43:56 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1677005037;
        bh=bDk6cpKT664E7a6ZKcX6t4XdcinN35izz8H1otGUI1w=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=FyHfkG+vdfhF9qE9OzATJStDpjJZC4CP3NBrX5NZJ9HSpE+W/xv6lIXeFVAfyu29q
         xNBDu3coEzGdDIVV4ffOjNp+veg9MbdE8Hlu5m7CJ5kZEDbU9+TAep8SNakn/4hP7Y
         XC/rsCXtRMvXvO4MmisMX0jyneVIlI1RIu4yBYObgg5zaFwVmspRgD4nGm0NcZUphM
         6dULQ4iBQ4Fk/745JM2mhpA5yECDyqmcP0amqNdSpPtIoNDzN/wu9ivH6jGF5h1IfB
         eNgf27l+Axe5Ez/W4+J4S8VFcEviDH0Si3/ujiqN2La9+Ruq8oQSYJuqbs0FG06R5P
         TdlACx7rv7B4w==
Date:   Tue, 21 Feb 2023 10:45:32 -0800
From:   Deborah Brouwer <deborah.brouwer@collabora.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        gjasny@googlemail.com, kieran.bingham@ideasonboard.com,
        mchehab@kernel.org, nicolas@ndufresne.ca, p.zabel@pengutronix.de,
        rosenp@gmail.com, sean@mess.org, user.vdr@gmail.com,
        xavier.claessens@collabora.com, ariel@vanguardiasur.com.ar,
        ezequiel@vanguardiasur.com.ar, tomi.valkeinen@ideasonboard.com
Subject: Re: [PATCH 1/1] utils: Add help text for v4l2-tracer-gen.pl
Message-ID: <Y/URF85XLV2cVMGL@xps>
References: <20230221143204.26591-1-laurent.pinchart@ideasonboard.com>
 <20230221160849.2778-1-sakari.ailus@linux.intel.com>
 <b5225b0c-db5c-92c4-9dfd-5c1675d01792@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b5225b0c-db5c-92c4-9dfd-5c1675d01792@xs4all.nl>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Feb 21, 2023 at 05:18:40PM +0100, Hans Verkuil wrote:
> On 21/02/2023 17:08, Sakari Ailus wrote:
> > Add help text for v4l2-tracer-gen.pl, via the '-h' option. Also add
> > support for '--' to signal end of options, in case file names would begin
> > with dash.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> > Hi Laurent,
> > 
> > Can you squash this to the utils patch?
> > 
> > - Sakari
> > 
> >  utils/v4l2-tracer/v4l2-tracer-gen.pl | 22 ++++++++++++++++++++--
> >  1 file changed, 20 insertions(+), 2 deletions(-)
> > 
> > diff --git a/utils/v4l2-tracer/v4l2-tracer-gen.pl b/utils/v4l2-tracer/v4l2-tracer-gen.pl
> > index 8192a5bf..53473ae1 100755
> > --- a/utils/v4l2-tracer/v4l2-tracer-gen.pl
> > +++ b/utils/v4l2-tracer/v4l2-tracer-gen.pl
> > @@ -8,8 +8,26 @@ my %outtype = ( "common" => 1, "trace" => 1, "retrace" => 1 );
> >  while ($ARGV[0] =~ /^-/) {
> >  	my $arg = shift @ARGV;
> >  
> > -	$outdir = shift @ARGV if $arg eq "-o";
> > -	%outtype = (shift @ARGV => 1) if $arg eq '-t';
> > +	($outdir = shift @ARGV) && next if $arg eq "-o";
> > +	(%outtype = (shift @ARGV => 1)) && next if $arg eq '-t';
> > +	(help() && exit 0) if $arg eq '-h';
> > +	last if $arg eq '--';
> > +
> > +	print stderr "invalid option $arg, use $0 -h for help\n";
> > +	exit 0;
> > +}
> > +
> > +sub help() {
> > +	print stderr <<EOF;
> > +$0 - Generate files for V4L2 tracer
> > +
> > +usage: $0 [-o dir] [-t (common|trace|retrace)] [-h] header [header2] ...
> > +
> > +	-o dir	set output directory
> > +	-t x	generate particular trace files, the default is to generate
> > +		them all
> > +	-h	print this help text and quit
> > +EOF
> >  }
> >  
> >  sub convert_type_to_json_type {
> 
> Thank you, Sakari!
> 
> Laurent, with this patch squashed in to 3/7 you can add my:
> 
> Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> 
> But wait a bit to see if Deb has an opinion as well.

All the perl script changes works great for me, thanks.

Reviewed-by: Deborah Brouwer <deborah.brouwer@collabora.com>

> 
> Regards,
> 
> 	Hans
