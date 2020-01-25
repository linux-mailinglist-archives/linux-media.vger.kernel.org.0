Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F120514952D
	for <lists+linux-media@lfdr.de>; Sat, 25 Jan 2020 12:20:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726761AbgAYLUW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 25 Jan 2020 06:20:22 -0500
Received: from mailoutvs4.siol.net ([185.57.226.195]:34697 "EHLO mail.siol.net"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725767AbgAYLUW (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 25 Jan 2020 06:20:22 -0500
Received: from localhost (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTP id 7DE3B520C74;
        Sat, 25 Jan 2020 12:20:19 +0100 (CET)
X-Virus-Scanned: amavisd-new at psrvmta10.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
        by localhost (psrvmta10.zcs-production.pri [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id ydjZDDwb9wfv; Sat, 25 Jan 2020 12:20:19 +0100 (CET)
Received: from mail.siol.net (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTPS id 2BF84520C7E;
        Sat, 25 Jan 2020 12:20:19 +0100 (CET)
Received: from jernej-laptop.localnet (cpe-194-152-20-232.static.triera.net [194.152.20.232])
        (Authenticated sender: jernej.skrabec@siol.net)
        by mail.siol.net (Postfix) with ESMTPA id AF879520C74;
        Sat, 25 Jan 2020 12:20:18 +0100 (CET)
From:   Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@siol.net>
To:     Chen-Yu Tsai <wens@csie.org>
Cc:     Maxime Ripard <mripard@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        linux-sunxi <linux-sunxi@googlegroups.com>
Subject: Re: [linux-sunxi] [PATCH 1/8] clk: sunxi-ng: sun8i-de2: Swap A64 and H6 definitions
Date:   Sat, 25 Jan 2020 12:20:18 +0100
Message-ID: <2008374.irdbgypaU6@jernej-laptop>
In-Reply-To: <CAGb2v6680yWT8KtjK0uKM00+6ed4NoPpsMaDyfYERwOXgb8Vbg@mail.gmail.com>
References: <20200124232014.574989-1-jernej.skrabec@siol.net> <20200124232014.574989-2-jernej.skrabec@siol.net> <CAGb2v6680yWT8KtjK0uKM00+6ed4NoPpsMaDyfYERwOXgb8Vbg@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi!

Dne sobota, 25. januar 2020 ob 04:05:33 CET je Chen-Yu Tsai napisal(a):
> On Sat, Jan 25, 2020 at 7:20 AM Jernej Skrabec <jernej.skrabec@siol.net> 
wrote:
> > For some reason, A64 and H6 have swapped clocks and resets definitions.
> > H6 doesn't have rotation unit while A64 has. Swap around to correct the
> > issue.
> > 
> > Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
> 
> Could you add Fixes tags for this one?

I'm not sure which commit to reference. H6 one? or also initial A64 one?

I just found out that H5 compatible uses A64 structure, which is not correct. 
H5 doesn't contain rotate core.

Do you have any better idea how to nicely solve this mess? I'm thinking that 
for v2 I would first decouple some compatibles, like this for H5 and R40 and 
V3s from A83T (as it can be seen in the next patch). After that, rather than 
switching definitions I would fix each compatible one by one. At the end, if any 
entry is duplicated, I can add one commit to merge same structures.

What do you think?

Best regards,
Jernej



