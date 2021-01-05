Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 678E62EA6D8
	for <lists+linux-media@lfdr.de>; Tue,  5 Jan 2021 10:00:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727391AbhAEJAZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Jan 2021 04:00:25 -0500
Received: from wout4-smtp.messagingengine.com ([64.147.123.20]:49047 "EHLO
        wout4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727056AbhAEJAU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 5 Jan 2021 04:00:20 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailout.west.internal (Postfix) with ESMTP id 9BA5B757;
        Tue,  5 Jan 2021 03:59:28 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Tue, 05 Jan 2021 03:59:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=sYiyZnNaw9vrvutD44uZuAX9Zub
        ELOu1wtvHaq29vxU=; b=bWoWgCLRb/06NCzWaEDsGxmpYRhcvDXJRQq3xD+h3C4
        udQZi9Mfv4t+3tr8d45cg32FS5uGtZT8ZqUEBBlrIpnpC1EeCdydbjVXsZ7UJzbj
        v/uMtKP+q44uzZW5ch13OghGvNsWz53e+Lx/bNj4kUstv7tcs5ZRvIohrF88AXDD
        mMXjk7Xv66mp876hQeGmnbhwa8C0VNo8TCqDcKKXtDKKn3a6qwwXInHhj8sIcVHS
        +Vs6iaytKJ6i0E+MfmxpHOfx+s12d0Vbyq1HVwrP+1P194i/ojsSMvz6BUddk3oF
        zhMRY4Hr9OGSn5faTzIZxYu2aBH9s4ZhZ+BoyMR6rfA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=sYiyZn
        Naw9vrvutD44uZuAX9ZubELOu1wtvHaq29vxU=; b=OikiACw2mkv0WriVEXKQMG
        Rsh+/Kuqg3tAEpe8R4UZR8EmDHEVqg7sX9MTNChfYTs3OW1l3hcub3mji4Hm0Bzd
        IesPR4mSpwA33RiMuQ8LYA4/jaffD0/l48qaePYJrYFwKkeut/DZoH/sI0D74XT1
        CZHCNtjnZq4rRcno4vOhxy3Y1bnafJDIdOc5mKDne07G8ExBafhOjZhjM9z336pA
        xUovufkBLLOMZBdcB215FZHBJSXgF46FHelw+vYJDS5i5FbVuOkK1IznaocM2Mbp
        ovNbq3gUh/znSQ04bNh3MC+mV6j4YpnmLLCtU/OeHOQk9lqfKFZrHqi4T8OkKDJQ
        ==
X-ME-Sender: <xms:bir0X4WULSFCtzO6HdLI_UnqP0gs2y5H7PAW7S84FcYdeq9LwEC1Dw>
    <xme:bir0X8nWaZzAIV6PHvvjtW2rNEBnceC8xDqtI69-UjQ2hHB7SO914PeAO2orpwRUH
    bEFjU2Ii6lz2e7u3jk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvdefgedguddvgecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeeujefgiedvgfeifeeuveegjeehtddtheegleeghedvgefhtddvgfdvjeek
    vdefueenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:byr0X8ZhtfYW5_gHCaygOTp2YGY6pcY4JfE86ZxtWbGgCJP27OOuYA>
    <xmx:byr0X3XxfRwsWPhaNizTQ4UCz_GqTHfIQddAoXXbMFgm9k1y9Uwkeg>
    <xmx:byr0XymxrpJ-Ycnir-EMe1IiKLLCghOO_lSmHVsTUW4PyonfQS566w>
    <xmx:cCr0X0WlCjCQSoBNBJK9G2uq3yLUqmaq4PbT8d1fHWzFjOiMqNRHdg>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id B944324005B;
        Tue,  5 Jan 2021 03:59:26 -0500 (EST)
Date:   Tue, 5 Jan 2021 09:59:24 +0100
From:   Maxime Ripard <maxime@cerno.tech>
To:     Rob Herring <robh@kernel.org>
Cc:     Guennadi Liakhovetski <g.liakhovetski@gmx.de>,
        Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v4 2/2] dt-bindings: media: Use graph and
 video-interfaces schemas
Message-ID: <20210105085924.pfkjnaks47dw5gtw@gilmour>
References: <20210104165808.2166686-1-robh@kernel.org>
 <20210104165808.2166686-3-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210104165808.2166686-3-robh@kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Jan 04, 2021 at 09:58:08AM -0700, Rob Herring wrote:
> Now that we have graph and video-interfaces schemas, rework the media
> related schemas to use them.
> 
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: Jacopo Mondi <jacopo@jmondi.org>
> Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Cc: linux-media@vger.kernel.org
> Signed-off-by: Rob Herring <robh@kernel.org>

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
