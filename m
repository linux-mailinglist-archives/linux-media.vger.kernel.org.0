Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 27BC77843C4
	for <lists+linux-media@lfdr.de>; Tue, 22 Aug 2023 16:18:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236030AbjHVOSa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Aug 2023 10:18:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234725AbjHVOS3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Aug 2023 10:18:29 -0400
Received: from gofer.mess.org (gofer.mess.org [IPv6:2a02:8011:d000:212::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28696E74;
        Tue, 22 Aug 2023 07:18:09 -0700 (PDT)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 4C1921000CD; Tue, 22 Aug 2023 15:18:03 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
        t=1692713883; bh=gI5Rj4qdz5gHvcfyiGyLvvt8KUCL20uhhqs2SdUi7Es=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=PVj4e+QVoxnAYLTqWU/AtozPnpQ6bBUErYDx6C8IFLOumweTmL7F+VWIiHAVQiR3r
         0HRWAUBQfVxJH+p83f1yKwpbH+AQwpRD89HkNrX7Qr08Zg1BubGIdTH6RWpW65im4T
         hjkqN0jcF2CQaUF3d8W1az1Xjp2Pia4VeFOBIk2jBfLQrcTwxH5LhSVxjXuwZnj8mC
         4FH1Ns6MmFdvriOmlhbyL0PNMZDo1UGCtiYA1H1y1E3LoCJhOHzpkPcH5ov8ucetxQ
         7WDFZnhrXIaDAHIi5+zYl6bcbfenB3YwUahixj0dirKHz9X/Br//yYeR34V9y902oY
         mxGO1QiutAkdw==
Date:   Tue, 22 Aug 2023 15:18:03 +0100
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
Message-ID: <ZOTDm6irIC02UEKH@gofer.mess.org>
References: <20230822091245.209539-1-sean@mess.org>
 <20230822091245.209539-3-sean@mess.org>
 <590a7e74-5af1-1aa3-366b-4fef039e5f66@linaro.org>
 <ZOSGT6COxF4C4WWV@gofer.mess.org>
 <96285b1a-a083-15d6-dbba-dff67d48aa3a@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <96285b1a-a083-15d6-dbba-dff67d48aa3a@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Aug 22, 2023 at 01:37:08PM +0200, Krzysztof Kozlowski wrote:
> On 22/08/2023 11:56, Sean Young wrote:
> >> 2. Test your bindings before sending. Especially if you decide to
> >> opt-out from automatic testing :/
> > 
> > I ran:
> > 
> > 	make dt_binding_check
> > 
> > And it ran successfully. Anything else?
> 
> This should be enough, but I doubt that it was successful.

The command succeeds just fine with a 0 exit code, however I failed to spot
the error in the output. My bad. I'll send a v3 soon.

Thanks,

Sean
