Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B72C32AA73C
	for <lists+linux-media@lfdr.de>; Sat,  7 Nov 2020 18:34:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727332AbgKGReN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 7 Nov 2020 12:34:13 -0500
Received: from asavdk4.altibox.net ([109.247.116.15]:58098 "EHLO
        asavdk4.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726364AbgKGReN (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 7 Nov 2020 12:34:13 -0500
Received: from ravnborg.org (unknown [188.228.123.71])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk4.altibox.net (Postfix) with ESMTPS id 37A3980530;
        Sat,  7 Nov 2020 18:34:08 +0100 (CET)
Date:   Sat, 7 Nov 2020 18:34:06 +0100
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc:     Lee Jones <lee.jones@linaro.org>, David Airlie <airlied@linux.ie>,
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
Message-ID: <20201107173406.GA1030984@ravnborg.org>
References: <20201106214949.2042120-1-lee.jones@linaro.org>
 <9d4be6a4-4f39-b908-4086-2b6adb695465@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9d4be6a4-4f39-b908-4086-2b6adb695465@amd.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VafZwmh9 c=1 sm=1 tr=0
        a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
        a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8 a=mBk19mKJqlyWPAr97ekA:9
        a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Christian.

> I'm not sure if we want to do some of the suggested changes to radeon.

All patches for radeon looks good to me except "drm/radeon/radeon: Move
prototype into shared header".

Acked-by: Sam Ravnborg <sam@ravnborg.org>
from me to have them applied (except the shared header one).
I can reply to the individual patches if you like.

	Sam
