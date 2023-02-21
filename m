Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 588A469E304
	for <lists+linux-media@lfdr.de>; Tue, 21 Feb 2023 16:04:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234678AbjBUPEh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Feb 2023 10:04:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234361AbjBUPEf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Feb 2023 10:04:35 -0500
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBF8F4496
        for <linux-media@vger.kernel.org>; Tue, 21 Feb 2023 07:04:31 -0800 (PST)
Received: from hillosipuli.retiisi.eu (82-181-192-243.bb.dnainternet.fi [82.181.192.243])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by meesny.iki.fi (Postfix) with ESMTPSA id 83CC92018F;
        Tue, 21 Feb 2023 17:04:29 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
        t=1676991869;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=keDof4MrCrlCq0WRKtZoZEEY6lOlPkCElORMDz0N4ak=;
        b=FcmFgHCmU900uKDuVijKNbRRE3CWe4IQc/w9egsw2XUbyqff5wKvAFdazz1cL0M5bjPdi3
        BXDDIlwsGOnFAMOgtfWjWggePylEh+YFkWM7sNVDZhmo+NJlsjH1ERmFg2/rBQ8vUBqLS0
        dDhIystNV/r5Hk6+erWOp09BaEh98cg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=meesny; t=1676991869;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=keDof4MrCrlCq0WRKtZoZEEY6lOlPkCElORMDz0N4ak=;
        b=GxHwXmswAkdEFKrMCbOnqMA8mG5KuyXy3b0D0H/fshIzGp1ABEAWCRONyn47xlQWMS9aqy
        MUI1UiWGBiuRaTOjzD1HIhn7w0VezvUr/g0pqhL00K+j17QBaNFugXZr8si492FlZrKB2w
        0WcYi+DPnxnBMO26UQ58R+A+y/nXues=
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1676991869; a=rsa-sha256; cv=none;
        b=JEzjh4sEmImTSdZRrlnNKm6lZxYG+rGE/1jzOuC1hmnQzHHVSzrNRTEXdkT2QEgMmr164G
        1TelhueaUv27HLFqPwPMsVR/eeN14nTKcSlaEXwtpTzlRogT/gudMx7N/zqHNvit5Bswlw
        5kcIRaCLKe0ZwTmsjOSrFbPeghJemMo=
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 6B93F634C91;
        Tue, 21 Feb 2023 17:04:19 +0200 (EET)
Date:   Tue, 21 Feb 2023 17:04:19 +0200
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org, gjasny@googlemail.com,
        kieran.bingham@ideasonboard.com, mchehab@kernel.org,
        nicolas@ndufresne.ca, p.zabel@pengutronix.de, rosenp@gmail.com,
        sean@mess.org, user.vdr@gmail.com, xavier.claessens@collabora.com,
        deborah.brouwer@collabora.com, ariel@vanguardiasur.com.ar,
        ezequiel@vanguardiasur.com.ar, tomi.valkeinen@ideasonboard.com
Subject: Re: [v4l-utils] [PATCH v9 1/7] utils: Allow choosing
 v4l2-tracer-gen.pl output
Message-ID: <Y/Tdc+ZNuDSqsaEN@valkosipuli.retiisi.eu>
References: <20230221143204.26591-1-laurent.pinchart@ideasonboard.com>
 <20230221143204.26591-2-laurent.pinchart@ideasonboard.com>
 <2a0cdb5e-6d7f-b59f-bd5f-9ee226097450@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2a0cdb5e-6d7f-b59f-bd5f-9ee226097450@xs4all.nl>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Tue, Feb 21, 2023 at 04:00:34PM +0100, Hans Verkuil wrote:
> On 2/21/23 15:31, Laurent Pinchart wrote:
> > From: Sakari Ailus <sakari.ailus@linux.intel.com>
> > 
> > In v4l2-tracer-gen.pl, add support for setting the output directory for
> > the generated files and choosing which ones to generate (common, trace or
> > retrace). The default is to generate them all in the current directory,
> > i.e. what the script used to do.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > [Append a '/' automatically between $outdir and $fname]
> > Tested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Tested-by: Niklas Söderlund <niklas.soderlund@ragnatech.se>
> > ---
> >  utils/v4l2-tracer/v4l2-tracer-gen.pl | 36 ++++++++++++++++++++++++----
> >  1 file changed, 31 insertions(+), 5 deletions(-)
> > 
> > diff --git a/utils/v4l2-tracer/v4l2-tracer-gen.pl b/utils/v4l2-tracer/v4l2-tracer-gen.pl
> > index fe648182ac34..f7454e7f0bab 100755
> > --- a/utils/v4l2-tracer/v4l2-tracer-gen.pl
> > +++ b/utils/v4l2-tracer/v4l2-tracer-gen.pl
> > @@ -2,6 +2,16 @@
> >  # SPDX-License-Identifier: GPL-2.0-only */
> >  # Copyright 2022 Collabora Ltd.
> >  
> > +my $outdir = ".";
> > +my %outtype = ( "common" => 1, "trace" => 1, "retrace" => 1 );
> > +
> > +while ($ARGV[0] =~ /^-/) {
> > +	my $arg = shift @ARGV;
> > +
> > +	$outdir = shift @ARGV if $arg eq "-o";
> > +	%outtype = (shift @ARGV => 1) if $arg eq '-t';
> > +}
> 
> Can you add a help message as well? At minimum as a comment, even better
> by adding a -h option.
> 
> It's currently only documented in the commit log, which nobody will read :-)

I'll add a patch for that, Laurent can then squash it into this one.

-- 
Regards,

Sakari Ailus
