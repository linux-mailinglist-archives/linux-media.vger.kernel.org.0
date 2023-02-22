Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6212F69FD20
	for <lists+linux-media@lfdr.de>; Wed, 22 Feb 2023 21:41:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232508AbjBVUlb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Feb 2023 15:41:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231312AbjBVUla (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Feb 2023 15:41:30 -0500
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8743141B7A
        for <linux-media@vger.kernel.org>; Wed, 22 Feb 2023 12:41:29 -0800 (PST)
Received: from localhost (node-1w7jr9st5p2etziuntaazujnj.ipv6.telus.net [IPv6:2001:569:beb1:1500:c96f:992f:7c34:9ff])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: dbrouwer)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 4E73866021D8;
        Wed, 22 Feb 2023 20:41:27 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1677098487;
        bh=yR4lDvGe+TE8a+vx3XTm6XP0vVfaMOVnu15w6oaoH6A=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=XfY4SP1UCd3oHsg22sDJINvePeNIhW5qJX3hq4wGEisEFXqryn3o7KczdSuvSxyvI
         RFmUmbKbm+P1ciC7q7SmscPiVSEPMTx5D7Q9SSTCCeCY3xQ+BSL0F8n7uvFyMLXFQG
         uh5yUW7GBUYVjUllJ200Ud6wWExBEPemp6T3BW9cCESDI9e9L1nzCVEnXmFLcK7xf6
         Ti9dSQbcuo38E3Uy/ODq/9fXatvd6/p2USqG3WBXJ0KqvzQorMMsYrfqi8vNQRke9s
         fCEVaqIQKqfkd+M8xwx2CdhqnptoRYX8lDd8Rm9qtl80ynlt37oLYyKE7xFRHmzUBm
         mKHcsqkY0wSeA==
Date:   Wed, 22 Feb 2023 12:43:04 -0800
From:   Deborah Brouwer <deborah.brouwer@collabora.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org
Subject: Re: [PATCH 2/5] v4l2-tracer: remove trailing comma from JSON trace
Message-ID: <Y/Z+WMoaR1d2d/vX@xps>
References: <cover.1675920064.git.deborah.brouwer@collabora.com>
 <abcc11027eb2a9364c7ba8f6b7ea2d3688ef8f09.1675920064.git.deborah.brouwer@collabora.com>
 <a00558a5-2168-8f86-5db8-a8b3f3928a37@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a00558a5-2168-8f86-5db8-a8b3f3928a37@xs4all.nl>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Feb 22, 2023 at 08:26:33PM +0100, Hans Verkuil wrote:
> On 09/02/2023 07:06, Deborah Brouwer wrote:
> > Put the trace file into valid JSON format by removing the trailing comma
> > from the trace file array.
> > 
> > Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
> > ---
> >  utils/v4l2-tracer/v4l2-tracer.cpp | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/utils/v4l2-tracer/v4l2-tracer.cpp b/utils/v4l2-tracer/v4l2-tracer.cpp
> > index ae6f68e4..7adbe04e 100644
> > --- a/utils/v4l2-tracer/v4l2-tracer.cpp
> > +++ b/utils/v4l2-tracer/v4l2-tracer.cpp
> > @@ -346,7 +346,7 @@ int tracer(int argc, char *argv[], bool retrace)
> >  
> >  	/* Close the json-array and the trace file. */
> >  	trace_file = fopen(trace_filename.c_str(), "a");
> > -	fseek(trace_file, 0L, SEEK_END);
> > +	ftruncate(fileno(trace_file), lseek(fileno(trace_file), 0, SEEK_END) - 2);
> >  	fputs("\n]\n", trace_file);
> 
> ftruncate seems overkill to me. Wouldn't it be enough to just do
> 
> fseek(trace_file, -2, SEEK_END);
> 
> since the fputs afterwards will overwrite those last two characters anyway?
> 
> (I think it is -2 for SEEK_END, I'm not 100% certain though, it could be 2)

It took me a while to remember why I didn't use this simpler method,
but it's because the trace file is opened in append mode "a" in
write_json_object_to_json_file() and so fputs() stubbornly ignores the
file position indicator set by fseek.

> 
> Regards,
> 
> 	Hans
> 
> >  	fclose(trace_file);
> >  
> 
