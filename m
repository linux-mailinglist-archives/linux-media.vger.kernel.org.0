Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6377D47643E
	for <lists+linux-media@lfdr.de>; Wed, 15 Dec 2021 22:07:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233994AbhLOVHs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Dec 2021 16:07:48 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:57944 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232511AbhLOVHr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Dec 2021 16:07:47 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 839353F0;
        Wed, 15 Dec 2021 22:07:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1639602465;
        bh=/Rg7GqLp0TGu7vMp/zsLOf0KBoM7v75u+ZykH0kmSoQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=p51OfubxcUCKLI27XR7RzIGBzFuUUuqPWuXZa2SL8i9t4Cwu/3m3Q52gsKCIywa+b
         eeNUDSDDkTie5Y8aekAGM8UbhLg2x0Fdq2HnBpRGmyhJGLTDt63ebWuyFdjQOAF7d7
         5MdaMDoslGaLRVo8Z55WKbDdvH2jmINpZlCcwgUo=
Date:   Wed, 15 Dec 2021 23:07:42 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     Ariel D'Alessandro <ariel.dalessandro@collabora.com>,
        linux-media@vger.kernel.org, hverkuil@xs4all.nl, sean@mess.org,
        p.zabel@pengutronix.de, ezequiel@collabora.com,
        nicolas@ndufresne.ca, kieran.bingham@ideasonboard.com,
        gjasny@googlemail.com, xavier.claessens@collabora.com,
        nicolas.dufresne@collabora.com, user.vdr@gmail.com,
        sakari.ailus@iki.fi, mchehab+huawei@kernel.org, rosenp@gmail.com
Subject: Re: [v4l-utils v5 0/5] Add support for meson building
Message-ID: <YbpZHuD9Ga8OvH7U@pendragon.ideasonboard.com>
References: <20210512184946.102863-1-ariel.dalessandro@collabora.com>
 <db868d34-aaa5-7e89-59a5-a61e024b2ec9@ideasonboard.com>
 <400c6b9e-c783-864d-e5c2-63892d133ac7@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <400c6b9e-c783-864d-e5c2-63892d133ac7@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Nov 18, 2021 at 12:09:26PM +0200, Tomi Valkeinen wrote:
> On 18/11/2021 11:03, Tomi Valkeinen wrote:
> 
> > I was testing this (well, I'm using it, as I can't get the autoconf work 
> > with
> > cross-compilation..), and I see this problem if gconv is enabled when
> > cross-compiling for arm (buildroot system):
> > 
> > [1/2] Linking target contrib/gconv/EN300-468-TAB00.so
> > FAILED: contrib/gconv/EN300-468-TAB00.so
> > /home/tomba/work/buildroot/output32/host/bin/arm-buildroot-linux-gnueabihf-gcc  
> > -o contrib/gconv/EN300-468-TAB00.so 
> > contrib/gconv/EN300-468-TAB00.so.p/en300-468-tab00.c.o -Wl,--as-needed 
> > -Wl,--allow-shlib-undefined -shared -fPIC 
> > -Wl,-rpath,/usr/lib/x86_64-linux-gnu/gconv 
> > -Wl,-rpath-link,/usr/lib/x86_64-linux-gnu/gconv -Wl,--start-group 
> > /usr/lib/x86_64-linux-gnu/gconv/libJIS.so 
> > /usr/lib/x86_64-linux-gnu/gconv/libJISX0213.so -Wl,--end-group
> > /usr/lib/x86_64-linux-gnu/gconv/libJIS.so: file not recognized: file 
> > format not recognized
> > collect2: error: ld returned 1 exit status
> > [2/2] Linking target contrib/gconv/ARIB-STD-B24.so
> > FAILED: contrib/gconv/ARIB-STD-B24.so
> > /home/tomba/work/buildroot/output32/host/bin/arm-buildroot-linux-gnueabihf-gcc  
> > -o contrib/gconv/ARIB-STD-B24.so 
> > contrib/gconv/ARIB-STD-B24.so.p/arib-std-b24.c.o -Wl,--as-needed 
> > -Wl,--allow-shlib-undefined -shared -fPIC 
> > -Wl,-rpath,/usr/lib/x86_64-linux-gnu/gconv 
> > -Wl,-rpath-link,/usr/lib/x86_64-linux-gnu/gconv -Wl,--start-group 
> > /usr/lib/x86_64-linux-gnu/gconv/libJIS.so 
> > /usr/lib/x86_64-linux-gnu/gconv/libJISX0213.so -Wl,--end-group
> > /usr/lib/x86_64-linux-gnu/gconv/libJIS.so: file not recognized: file 
> > format not recognized
> 
> You can ignore the above, I think it was an error in my meson cross file.

If anyone runs into the same issue, it's likely caused by a missing
sys_root option in the cross file.

-- 
Regards,

Laurent Pinchart
