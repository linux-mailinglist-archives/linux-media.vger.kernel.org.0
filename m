Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3E7A769F08D
	for <lists+linux-media@lfdr.de>; Wed, 22 Feb 2023 09:42:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230402AbjBVImy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Feb 2023 03:42:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230511AbjBVImx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Feb 2023 03:42:53 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCC1335A9
        for <linux-media@vger.kernel.org>; Wed, 22 Feb 2023 00:42:51 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 779B64E1;
        Wed, 22 Feb 2023 09:42:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1677055369;
        bh=3JbyTfvWbtrZkyjivnkd8zhARw8D/clfpqdWnEHbbm0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=iYFkNMVQ1u8xzjLZlpKzEpE3QVc0A4jWLupTpiiFvVRbJTG/0epjSCJ5CCmyvFEKO
         gODol7tBLTCUK2Uwg/nqxa6YU+HW8vOdPXVznMMXp57SZBj/G/DNzJu/aaoRGIzCf0
         GgeNbix7y0ZACLPEreTtkhdU3w8ZE0V/LGH6ifHo=
Date:   Wed, 22 Feb 2023 10:42:47 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@iki.fi>
Cc:     linux-media@vger.kernel.org, gjasny@googlemail.com,
        hverkuil@xs4all.nl, kieran.bingham@ideasonboard.com,
        mchehab@kernel.org, nicolas@ndufresne.ca, p.zabel@pengutronix.de,
        rosenp@gmail.com, sean@mess.org, user.vdr@gmail.com,
        xavier.claessens@collabora.com, deborah.brouwer@collabora.com,
        ariel@vanguardiasur.com.ar, ezequiel@vanguardiasur.com.ar,
        tomi.valkeinen@ideasonboard.com
Subject: Re: [PATCH 1/1] utils: Add help text for v4l2-tracer-gen.pl
Message-ID: <Y/XVh58fj8vLokan@pendragon.ideasonboard.com>
References: <20230221143204.26591-1-laurent.pinchart@ideasonboard.com>
 <20230221160849.2778-1-sakari.ailus@linux.intel.com>
 <Y/XACCUyQ/2o6ylt@valkosipuli.retiisi.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Y/XACCUyQ/2o6ylt@valkosipuli.retiisi.eu>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

On Wed, Feb 22, 2023 at 09:11:04AM +0200, Sakari Ailus wrote:
> On Tue, Feb 21, 2023 at 06:08:49PM +0200, Sakari Ailus wrote:
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
> 
> This should have been:
> 
> 	exit 1;
> 
> to signal an error if an invalid option is given. The build process should
> stop here in that case.
> 
> Could you change that while squashing it?

Sure. I've done so in my tree.

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

-- 
Regards,

Laurent Pinchart
