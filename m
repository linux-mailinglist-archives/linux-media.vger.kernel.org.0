Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0ABD5711194
	for <lists+linux-media@lfdr.de>; Thu, 25 May 2023 19:02:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231964AbjEYRCl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 May 2023 13:02:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233274AbjEYRCk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 May 2023 13:02:40 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B1DF194
        for <linux-media@vger.kernel.org>; Thu, 25 May 2023 10:02:39 -0700 (PDT)
Received: from localhost (node-1w7jr9st5p2esmclet71ntnwp.ipv6.telus.net [IPv6:2001:569:beb1:1500:6f9d:3a5c:4d25:e949])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: dbrouwer)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 76D8A6606E7B;
        Thu, 25 May 2023 18:02:37 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1685034157;
        bh=qZq5asB1QLjxEVKS4qEuxmKTzHO+/CWHiQ+58+giOjs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=mtXlAw1WNl77m/O72b5Fe8oDzLEjRd/W19Buq3OLK3H+gCDJHusmAkl/0nhZCLrzB
         Vc/D95Jt6KTh9KcdMy6ssDnjadTUlCDh0RjFBE1evDtmtktzAgeA2znIUutEO0YCfr
         OOdrLW+K41s1EbK4Vx1q2uS44YzRELj07RCENr1IXLjQKOIXeOLvcRl7za/olY46UA
         iXaCyYKOVjAqBEOaDnlVBU2oEzgTCqE3LHSrx2ZMR4GlXIvctMB2MzyBIoScsgNsfr
         i/+oHc5Y0Cw9Udc7MSHQzerEBGNXAhU+Rw2uIhipBa11sMIsb4vEZyLccPxJ4S2j1A
         LoxvlIC8ePOMw==
Date:   Thu, 25 May 2023 10:02:31 -0700
From:   Deborah Brouwer <deborah.brouwer@collabora.com>
To:     Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc:     linux-media@vger.kernel.org, hverkuil-cisco@xs4all.nl
Subject: Re: [PATCH] v4l2-tracer: Fix libv4l2tracer.so loader
Message-ID: <ZG+Up1k2NupYbiBp@db550>
References: <20230525002045.82937-1-deborah.brouwer@collabora.com>
 <c6619ea163206dc31e90234c80070cda3ddb744a.camel@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c6619ea163206dc31e90234c80070cda3ddb744a.camel@collabora.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, May 25, 2023 at 12:45:28PM -0400, Nicolas Dufresne wrote:
> Thanks Deborah,
> 
> Le mercredi 24 mai 2023 à 17:20 -0700, Deborah Brouwer a écrit :
> > From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> > 
> > The code was still assuming libtools being use, so it didn't work
> > installed anymore. Also, it didn't work installed if the full
> > v4l2-tracer path was being passed.
> > 
> > Fix this by always trying next by libv4l2tracer.so loading (using stat()
> > to validate) and always fallback to the installed path otherwise.
> > 
> > Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> 
> Mind adding you Singed-off-by ?

Actually Hans already applied your patch (thanks!) but will do it next
time.

> 
> > ---
> > Hi - thanks to Nicolas for this patch.
> > I tested tracing and retracing on both installed and uninstalled
> > v4l2-tracer including with and without an absolute path and it
> > all works as expected.
> > 
> > Note that I've got three sets of v4l2-tracer patches outstanding now,
> > but they all still apply independently of each other:
> > 
> > Tuner patches:
> > https://lore.kernel.org/linux-media/cover.1684453027.git.deborah.brouwer@collabora.com/
> > 
> > Debug patches:
> > https://lore.kernel.org/linux-media/cover.1681245372.git.deborah.brouwer@collabora.com/
> > 
> > Thanks,
> > Deb
> > 
> >  utils/v4l2-tracer/v4l2-tracer.cpp | 33 +++++++++++++++++--------------
> >  1 file changed, 18 insertions(+), 15 deletions(-)
> > 
> > diff --git a/utils/v4l2-tracer/v4l2-tracer.cpp b/utils/v4l2-tracer/v4l2-tracer.cpp
> > index e3f002a9..7c3662be 100644
> > --- a/utils/v4l2-tracer/v4l2-tracer.cpp
> > +++ b/utils/v4l2-tracer/v4l2-tracer.cpp
> > @@ -5,6 +5,7 @@
> >  
> >  #include "retrace.h"
> >  #include <climits>
> > +#include <sys/stat.h>
> >  #include <sys/wait.h>
> >  #include <time.h>
> >  
> > @@ -295,24 +296,26 @@ int tracer(int argc, char *argv[], bool retrace)
> >  	fclose(trace_file);
> >  
> >  	/*
> > -	 * Preload the libv4l2tracer library. If the program is installed, load the library
> > -	 * from its installed location, otherwise load it locally. If it's loaded locally,
> > -	 * use ./configure --disable-dyn-libv4l.
> > +	 * Preload the libv4l2tracer library. The libv4l2tracer is looked up next to
> > +	 * the executable first in order to support uninstalled build.
> >  	 */
> >  	std::string libv4l2tracer_path;
> >  	std::string program = argv[0];
> > -	std::size_t idx = program.rfind("/v4l2-tracer");
> > -	if (idx != std::string::npos) {
> > -		libv4l2tracer_path = program.replace(program.begin() + idx + 1, program.end(), ".libs");
> > -		DIR *directory_pointer = opendir(libv4l2tracer_path.c_str());
> > -		if (directory_pointer == nullptr)
> > -			libv4l2tracer_path = program.replace(program.begin() + idx, program.end(), "./.libs");
> > -		else
> > -			closedir(directory_pointer);
> > -	} else {
> > -		libv4l2tracer_path = LIBTRACER_PATH;
> > -	}
> > -	libv4l2tracer_path += "/libv4l2tracer.so";
> > +	std::size_t idx = program.rfind("/");
> > +	struct stat sb;
> > +
> > +	if (idx == std::string::npos)
> > +		idx = 0;
> > +	else
> > +		idx++;
> > +
> > +	/* look for libv4l2tracer next to the executable */
> > +	libv4l2tracer_path = program.replace(program.begin() + idx, program.end(), "libv4l2tracer.so");
> > +
> > +	/* otherwise, use the installation path */
> > +	if (stat(libv4l2tracer_path.c_str(), &sb) == -1)
> > +		libv4l2tracer_path = std::string(LIBTRACER_PATH) + "/libv4l2tracer.so";
> > +
> >  	if (is_verbose())
> >  		fprintf(stderr, "Loading libv4l2tracer: %s\n", libv4l2tracer_path.c_str());
> >  	setenv("LD_PRELOAD", libv4l2tracer_path.c_str(), 0);
> 
