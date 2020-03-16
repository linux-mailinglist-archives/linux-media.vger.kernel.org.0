Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 97B1818684F
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2020 10:56:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730461AbgCPJ4x (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Mar 2020 05:56:53 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:37789 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730431AbgCPJ4x (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Mar 2020 05:56:53 -0400
Received: by mail-wr1-f66.google.com with SMTP id 6so20320792wre.4
        for <linux-media@vger.kernel.org>; Mon, 16 Mar 2020 02:56:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=4uFjuIar5NrPLcBZJPObOsb7IgzEi+xWM2W1XFlAhG0=;
        b=MKnh4eqiajGVxiWBSEZMhJK78EufIWCaAajO2U8EZBruc02ewFnzmSll3FPGSyz4Hk
         xPq8uLRmHc0q0D4U9xamBCevqwUDOHipFL6D5kF9zcnF8d7pv6w3+C3wGNepqSZVK7sA
         1GiLkSHxkP0/BmZATcbxmT7B1ucb7SosFQg/0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:mail-followup-to
         :references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to;
        bh=4uFjuIar5NrPLcBZJPObOsb7IgzEi+xWM2W1XFlAhG0=;
        b=g4HTIWN1IDC25h4WbrkUPQBeUdvjwLTp8QRVvHlVHSJNtgn9AhU0ImZPBRHyaMZsBd
         Ij7Y9FEEC3tfFQSzX3IyJSbKfJ1xQc9MjMaFZfludCz4yfiAbo/y8xWowchigFKpTSEz
         kkbPpbkwaUI9qv7LQM1hziPurHGir/JLiq/qC+E7shh9W3viHzLShQgNU+Fksx92GNDK
         tbo96kgiISoGOl3qtaYdKwtQDWQmRVjsVhaRhnDWCHE7JI1hMbUjn/x6uMKIVAPxNRvQ
         2fDOtLwByo8jIYgkaVOcsG46n4kyiLZ6vXnKkbpkBl5WvCmQ5VdHd/FYlmipyNj2Fkj1
         OnRQ==
X-Gm-Message-State: ANhLgQ3V6xNJN8SgLZ78SybZBET+PzCx4kWt6GvxtDhPMHpvJEwQ0gtF
        JM5J/JWJZoo1SBU/bNOLL07e1w==
X-Google-Smtp-Source: ADFU+vtMt31tP7+bdrL8Xnvjkbvor50IyCbDn+WnCnsbJXMAyj9Melvbj6Mpc4exxa3r1An2EKb0dg==
X-Received: by 2002:a5d:6150:: with SMTP id y16mr35501106wrt.352.1584352611440;
        Mon, 16 Mar 2020 02:56:51 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id i6sm29154761wru.40.2020.03.16.02.56.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2020 02:56:50 -0700 (PDT)
Date:   Mon, 16 Mar 2020 10:56:49 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Joe Perches <joe@perches.com>,
        Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Sebastian Duda <sebastian.duda@fau.de>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        linux-media@vger.kernel.org
Subject: Re: [Intel-gfx] [PATCH] MAINTAINERS: adjust to reservation.h renaming
Message-ID: <20200316095649.GK2363188@phenom.ffwll.local>
Mail-Followup-To: Joe Perches <joe@perches.com>,
        Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Sebastian Duda <sebastian.duda@fau.de>,
        Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org
References: <20200304120711.12117-1-lukas.bulwahn@gmail.com>
 <b0296e3a-31f8-635a-f26d-8b0bc490aae3@amd.com>
 <20200306103946.GT2363188@phenom.ffwll.local>
 <155f99baffe11836fc9d794ff297bdcee7831050.camel@perches.com>
 <20200316095007.GI2363188@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200316095007.GI2363188@phenom.ffwll.local>
X-Operating-System: Linux phenom 5.3.0-3-amd64 
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Mar 16, 2020 at 10:50:07AM +0100, Daniel Vetter wrote:
> On Fri, Mar 06, 2020 at 02:56:06AM -0800, Joe Perches wrote:
> > On Fri, 2020-03-06 at 11:39 +0100, Daniel Vetter wrote:
> > > On Wed, Mar 04, 2020 at 01:08:32PM +0100, Christian König wrote:
> > > > Am 04.03.20 um 13:07 schrieb Lukas Bulwahn:
> > > > > Commit 52791eeec1d9 ("dma-buf: rename reservation_object to dma_resv")
> > > > > renamed include/linux/reservation.h to include/linux/dma-resv.h, but
> > > > > missed the reference in the MAINTAINERS entry.
> > > > > 
> > > > > Since then, ./scripts/get_maintainer.pl --self-test complains:
> > > > > 
> > > > >    warning: no file matches F: include/linux/reservation.h
> > > > > 
> > > > > Adjust the DMA BUFFER SHARING FRAMEWORK entry in MAINTAINERS.
> > > > > 
> > > > > Co-developed-by: Sebastian Duda <sebastian.duda@fau.de>
> > > > > Signed-off-by: Sebastian Duda <sebastian.duda@fau.de>
> > > > > Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> > > > 
> > > > Reviewed-by: Christian König <christian.koenig@amd.com>
> > > 
> > > You'll push this too?
> > > -Daniel
> > > 
> > > > > ---
> > > > > Christian, please pick this patch.
> > > > > applies cleanly on current master and next-20200303
> > > > > 
> > > > >   MAINTAINERS | 2 +-
> > > > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > > > > 
> > > > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > > > index 6158a143a13e..3d6cb2789c9e 100644
> > > > > --- a/MAINTAINERS
> > > > > +++ b/MAINTAINERS
> > > > > @@ -5022,7 +5022,7 @@ L:	dri-devel@lists.freedesktop.org
> > > > >   L:	linaro-mm-sig@lists.linaro.org (moderated for non-subscribers)
> > > > >   F:	drivers/dma-buf/
> > > > >   F:	include/linux/dma-buf*
> > > > > -F:	include/linux/reservation.h
> > > > > +F:	include/linux/dma-resv.h
> > > > >   F:	include/linux/*fence.h
> > > > >   F:	Documentation/driver-api/dma-buf.rst
> > > > >   K:	dma_(buf|fence|resv)
> > 
> > Slightly unrelated:
> > 
> > The K: entry matches a lot of other things
> > and may have a lot of false positive matches
> > like any variable named dma_buffer
> > 
> > This should also use (?:...) to avoid a perl
> > capture group.
> > 
> > Perhaps:
> > 
> > K:	'\bdma_(?:buf|fence|resv)\b'
> 
> Hm either people aren't using get_maintainers.pl consistently, or it
> doesn't seem to be a real world problem. I'm not seeing any unrelated
> patches on dri-devel at least.
> 
> But happy to merge such a patch if it shows up ofc, it's definitely the
> more correct thing :-)

Ofc as usual if you lean out the window you immediately get to eat your
hat, right after sending this I got a mail from syzbot about some random
stuff because of this :-)

I'm gonna do the patch now ...
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
