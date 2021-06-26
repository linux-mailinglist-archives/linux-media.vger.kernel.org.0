Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D78F03B4BAF
	for <lists+linux-media@lfdr.de>; Sat, 26 Jun 2021 02:46:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229885AbhFZAsv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 25 Jun 2021 20:48:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229831AbhFZAsv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 25 Jun 2021 20:48:51 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD655C061574
        for <linux-media@vger.kernel.org>; Fri, 25 Jun 2021 17:46:26 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id A5A4C1F40F21
Message-ID: <c882d9c4f9eacd9d0f82e6e4ce3b33c383087d8c.camel@collabora.com>
Subject: Re: [PATCH 09/12] media: hantro: Enable H.264 on Rockchip VDPU2
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Alex Bee <knaerzche@gmail.com>, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Heiko Stuebner <heiko@sntech.de>, maccraft123mc@gmail.com,
        Chris Healy <cphealy@gmail.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Jonas Karlman <jonas@kwiboo.se>,
        Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        David Airlie <airlied@linux.ie>, kernel@collabora.com
Date:   Fri, 25 Jun 2021 21:46:10 -0300
In-Reply-To: <2ae869f3-7f3a-f184-93cc-61fca0f9022f@gmail.com>
References: <20210624182612.177969-1-ezequiel@collabora.com>
         <20210624182612.177969-10-ezequiel@collabora.com>
         <2ae869f3-7f3a-f184-93cc-61fca0f9022f@gmail.com>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.2-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

(Adding Nicolas)

Hi Alex,

On Fri, 2021-06-25 at 01:13 +0200, Alex Bee wrote:
> Hi Ezequiel,
> 
> Am 24.06.21 um 20:26 schrieb Ezequiel Garcia:
> > Given H.264 support for VDPU2 was just added, let's enable it.
> > For now, this is only enabled on platform that don't have
> > an RKVDEC core, such as RK3328.
> 
> Is there any reason, you do not want to enabe H.264 on RK3399? I know 
> H.264 can be done by by rkvdec already, but from what I understand that 
> shouldn't be an issue: The first decoder found that meets the 
> requirements will be taken.
> 

Thanks a lot the review.

I really doubt userspace stacks are readily supporting that strategy.

The first decoder device supporting the codec format will be selected,
I doubt features such as profile and levels are checked to decide
which decoder to use.

I'd rather play safe on the kernel side and avoid offering
two competing devices for the same codec.

Kindly,
Ezequiel

