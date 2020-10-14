Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C39328E004
	for <lists+linux-media@lfdr.de>; Wed, 14 Oct 2020 13:50:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388484AbgJNLuO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Oct 2020 07:50:14 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:45358 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388327AbgJNLuO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Oct 2020 07:50:14 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: aratiu)
        with ESMTPSA id 1FFD51F40ED4
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
In-Reply-To: <20201013102656.GA5425@sirena.org.uk>
References: <20201012205957.889185-1-adrian.ratiu@collabora.com>
 <20201012205957.889185-8-adrian.ratiu@collabora.com>
 <20201013102656.GA5425@sirena.org.uk>
Date:   Wed, 14 Oct 2020 14:51:14 +0300
Message-ID: <87o8l581ql.fsf@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Mark,

On Tue, 13 Oct 2020, Mark Brown <broonie@kernel.org> wrote:
> On Mon, Oct 12, 2020 at 11:59:46PM +0300, Adrian Ratiu wrote: 
> 
>> -	writeb(val, ctx->regs + reg); +	if (ctx->relaxed_mmio) + 
>> writeb_relaxed(val, ctx->regs + reg); +	else + 
>> writeb(val, ctx->regs + reg); 
> 
> There is no point in doing a conditional operation on every I/O, 
> it'd be better to register a different set of ops when doing 
> relaxed I/O. 

Indeed I have considered adding new functions but went with this 
solution because it's easier for the users to only have to define 
a "relaxed" config then test the regmap ctx as above.

Thinking a bit more about it, yes, it makes more sense to have 
dedicated ops: this way users don't have to be explicit about 
adding membarriers and can combine relaxed and non-relaxed more 
easily, so it's also a better API trade-off in addition to 
avoiding the conditional. Thanks!

Question: Do you want me to split this patch from the series and 
send it separately just for the regmap subsystem to be easier to 
review / apply?

Kind regards,
Adrian
