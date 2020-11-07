Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 47B982AA79F
	for <lists+linux-media@lfdr.de>; Sat,  7 Nov 2020 20:29:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726021AbgKGT33 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 7 Nov 2020 14:29:29 -0500
Received: from asavdk4.altibox.net ([109.247.116.15]:35530 "EHLO
        asavdk4.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725836AbgKGT32 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 7 Nov 2020 14:29:28 -0500
Received: from ravnborg.org (unknown [188.228.123.71])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk4.altibox.net (Postfix) with ESMTPS id 8498E8052E;
        Sat,  7 Nov 2020 20:29:24 +0100 (CET)
Date:   Sat, 7 Nov 2020 20:29:22 +0100
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        David Airlie <airlied@linux.ie>,
        dri-devel@lists.freedesktop.org, Huang Rui <ray.huang@amd.com>,
        Rob Clark <rob@ti.com>, Gareth Hughes <gareth@valinux.com>,
        amd-gfx@lists.freedesktop.org, Rob Clark <rob.clark@linaro.org>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Keith Whitwell <keith@tungstengraphics.com>,
        Andy Gross <andy.gross@ti.com>, linux-media@vger.kernel.org,
        Leo Li <sunpeng.li@amd.com>, linaro-mm-sig@lists.linaro.org,
        by <jhartmann@precisioninsight.com>,
        Jeff Hartmann <jhartmann@valinux.com>,
        linux-kernel@vger.kernel.org, Faith <faith@valinux.com>,
        Alex Deucher <alexander.deucher@amd.com>
Subject: Re: [PATCH 00/19] [Set 2] Rid W=1 warnings from GPU
Message-ID: <20201107192922.GA1039949@ravnborg.org>
References: <20201106214949.2042120-1-lee.jones@linaro.org>
 <9d4be6a4-4f39-b908-4086-2b6adb695465@amd.com>
 <20201107173406.GA1030984@ravnborg.org>
 <20201107184138.GS2063125@dell>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201107184138.GS2063125@dell>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VafZwmh9 c=1 sm=1 tr=0
        a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
        a=kj9zAlcOel0A:10 a=z3vUUUWfv_O9Fg17TOIA:9 a=CjuIK1q_8ugA:10
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, Nov 07, 2020 at 06:41:38PM +0000, Lee Jones wrote:
> On Sat, 07 Nov 2020, Sam Ravnborg wrote:
> 
> > Hi Christian.
> > 
> > > I'm not sure if we want to do some of the suggested changes to radeon.
> > 
> > All patches for radeon looks good to me except "drm/radeon/radeon: Move
> > prototype into shared header".
> 
> Was that the one where the prototype needs moving to radeon.h?
Yes,

	Sam
