Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 761B628E0E7
	for <lists+linux-media@lfdr.de>; Wed, 14 Oct 2020 14:59:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388146AbgJNM7i (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Oct 2020 08:59:38 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:46556 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727187AbgJNM7i (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Oct 2020 08:59:38 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: aratiu)
        with ESMTPSA id CC77C1F41295
From:   Adrian Ratiu <adrian.ratiu@collabora.com>
To:     Mark Brown <broonie@kernel.org>,
        Adrian Ratiu <adrian.ratiu@collabora.com>
Cc:     Ezequiel Garcia <ezequiel@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Fruehberger Peter <Peter.Fruehberger@de.bosch.com>,
        kuhanh.murugasen.krishnan@intel.com,
        Daniel Vetter <daniel@ffwll.ch>, kernel@collabora.com,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 07/18] regmap: mmio: add config option to allow relaxed
 MMIO accesses
In-Reply-To: <20201014121249.GA4580@sirena.org.uk>
References: <20201012205957.889185-1-adrian.ratiu@collabora.com>
 <20201012205957.889185-8-adrian.ratiu@collabora.com>
 <20201013102656.GA5425@sirena.org.uk> <87o8l581ql.fsf@collabora.com>
 <20201014121249.GA4580@sirena.org.uk>
Date:   Wed, 14 Oct 2020 16:00:38 +0300
Message-ID: <87lfg97yix.fsf@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 14 Oct 2020, Mark Brown <broonie@kernel.org> wrote:
> On Wed, Oct 14, 2020 at 02:51:14PM +0300, Adrian Ratiu wrote: 
>> On Tue, 13 Oct 2020, Mark Brown <broonie@kernel.org> wrote: 
>> > On Mon, Oct 12, 2020 at 11:59:46PM +0300, Adrian Ratiu wrote: 
> 
>> > > -	writeb(val, ctx->regs + reg); +	if 
>> > > (ctx->relaxed_mmio) + writeb_relaxed(val, ctx->regs + reg); 
>> > > +	else + writeb(val, ctx->regs + reg); 
> 
>> > There is no point in doing a conditional operation on every 
>> > I/O, it'd be better to register a different set of ops when 
>> > doing relaxed I/O. 
> 
>> Indeed I have considered adding new functions but went with 
>> this solution because it's easier for the users to only have to 
>> define a "relaxed" config then test the regmap ctx as above. 
> 
> It seems like you've taken this in a direction other than what 
> I was thinking of here - defining separate ops doesn't mean we 
> have to do anything which has any impact on the interface seen 
> by users.  The regmap config is supplied at registration time, 
> it's just as available then as it is when doing I/O.

Right. I got confused by the meaning of ops :) Sorry about that.
 
> 
>> Thinking a bit more about it, yes, it makes more sense to have 
>> dedicated ops: this way users don't have to be explicit about 
>> adding membarriers and can combine relaxed and non-relaxed more 
>> easily, so it's also a better API trade-off in addition to 
>> avoiding the conditional. Thanks! 
> 
> I'm not sure what you're proposing here - it does seem useful to 
> be able to combine relaxed and non-relaxed I/O but that seems 
> like it'd break down the abstraction for regmap since tht's not 
> really a concept other buses are going to have?  Unless we 
> provide an operation to switch by setting flags or somethin 
> possibly and integrate it with the cache perhaps.  Could you be 
> a bit more specific about what you were thinking of here please?

I was thinking about exposing a relaxed API like 
regmap_write_relaxed but now that I know what you meant by ops and 
also that it doesn't make sense for other busses / violates the 
abstraction, I realize that is a bad idea and I will continue 
improving this to avoid the conditional and send a separete 
patch. Thanks again!

>
>> Question: Do you want me to split this patch from the series and send it
>> separately just for the regmap subsystem to be easier to review / apply?
>
> Sure.
