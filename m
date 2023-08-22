Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A187E783D64
	for <lists+linux-media@lfdr.de>; Tue, 22 Aug 2023 11:56:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234521AbjHVJ4e (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Aug 2023 05:56:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234510AbjHVJ4e (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Aug 2023 05:56:34 -0400
Received: from gofer.mess.org (gofer.mess.org [88.97.38.141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9AE491B2
        for <linux-media@vger.kernel.org>; Tue, 22 Aug 2023 02:56:32 -0700 (PDT)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 1D2A01000CD; Tue, 22 Aug 2023 10:56:31 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
        t=1692698191; bh=mB20P+Bi8qCjTxJpuddlFPejyqoT99EEu/9UpzkpEiI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=GiBK8Uid+L9irhFrNVk+zZ5iCcQaqdbR+Q+TRZFRCdKIotJto7Xzo7oDYBCUnIwj+
         n4HOBnjby4BnvlQhuoSLcQgBU5LifKfZjgkJ+t0++9x6Ha12Dfre4sMCLMHs3Qn6lw
         L90Yx5rGlXu8Ox8H8JGoBM/Skw7wyi1mB4r6JirProJypYjwCXUfGTK3IWKQHR7rUO
         eKGf7FbrueGouhHqo/fQmMa1rGQ0Ov9sW0WcX2trO5hZlTsGV8W7VNbIwl7au3cOKZ
         B80hq6PHVhnLgdt0nn9a12YD/14xOCo/aJdjWaC15bw0hpr1Uc4qcpjVMtev9jDx85
         tdViMzGhOiCZw==
Date:   Tue, 22 Aug 2023 10:56:31 +0100
From:   Sean Young <sean@mess.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     linux-media@vger.kernel.org, Sicelo <absicsz@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
        Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
        Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>,
        Pavel Machek <pavel@ucw.cz>,
        Timo Kokkonen <timo.t.kokkonen@iki.fi>,
        Tony Lindgren <tony@atomide.com>
Subject: Re: [PATCH v2 2/2] media: dt-bindings: media: remove nokia,n900-ir
 as pwm-ir-tx is compatible
Message-ID: <ZOSGT6COxF4C4WWV@gofer.mess.org>
References: <20230822091245.209539-1-sean@mess.org>
 <20230822091245.209539-3-sean@mess.org>
 <590a7e74-5af1-1aa3-366b-4fef039e5f66@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <590a7e74-5af1-1aa3-366b-4fef039e5f66@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Aug 22, 2023 at 11:28:00AM +0200, Krzysztof Kozlowski wrote:
> On 22/08/2023 11:12, Sean Young wrote:
> > The generic pwm-ir-tx driver works for the Nokia n900, so nokia,n900-ir
> > can be removed.
> > 
> > Cc: Sicelo <absicsz@gmail.com>
> > Cc: Rob Herring <robh+dt@kernel.org>
> > Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> > Cc: Conor Dooley <conor+dt@kernel.org>
> > Cc: devicetree@vger.kernel.org
> > Cc: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
> > Cc: Pali Rohár <pali.rohar@gmail.com>
> > Cc: Pavel Machek <pavel@ucw.cz>
> > Cc: Timo Kokkonen <timo.t.kokkonen@iki.fi>
> > Cc: Tony Lindgren <tony@atomide.com>
> > Signed-off-by: Sean Young <sean@mess.org>
> 
> Unfortunately not much improved here, so:
> 1. Please use scripts/get_maintainers.pl to get a list of necessary
> people and lists to CC. It might happen, that command when run on an
> older kernel, gives you outdated entries. Therefore please be sure you
> base your patches on recent Linux kernel.
> 
> You missed at least DT list (maybe more), so this won't be tested by
> automated tooling.

So what tree do you want me to run scripts/get_maintainers.pl on? Apparently
Linus' master or media staging master does not suffice.

> Performing review on untested code might be a waste
> of time, thus I will skip this patch entirely till you follow the
> process allowing the patch to be tested.
> 
> Please kindly resend and include all necessary To/Cc entries.

Please kindly tell me how follow your thiefdom's rules. What tree do
you want me to run scripts/get_maintainers.pl on? What is the DT list
that I missed out?

> 2. Test your bindings before sending. Especially if you decide to
> opt-out from automatic testing :/

I ran:

	make dt_binding_check

And it ran successfully. Anything else?

Thanks,

Sean
