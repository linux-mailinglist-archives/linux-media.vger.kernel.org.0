Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 72AF96D37A5
	for <lists+linux-media@lfdr.de>; Sun,  2 Apr 2023 13:29:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230290AbjDBL3N (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 2 Apr 2023 07:29:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229591AbjDBL3M (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 2 Apr 2023 07:29:12 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3C781EFD3;
        Sun,  2 Apr 2023 04:29:11 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 5A432611C0;
        Sun,  2 Apr 2023 11:29:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CB48C433EF;
        Sun,  2 Apr 2023 11:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1680434950;
        bh=O7FvGnaQoAlD46duLUMHPDdQnP0Mle8dOr2IFMWfzLE=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=KL+N3+UL88woFkI24eWRtK6AMLcd0MJ9b5DGulMTGFzLRGCyC3/yw1q4qzdq1W8Hj
         2+8qglRRKJlXIwTpoM79NplLOomgc+gaCPEOLHow5DMYmWFnMwuN3LnzcMwdD5FtGJ
         ywP0kZ7lFV9OIOEh+dkPYuruyJJ4vrIJSo4lY7THQXTUbF9odJdaw8umU6hw7YOs14
         h1on6wMg50DN00J2k/Am+fgqIPN8lKv2sDAZk1mAIEvsWflrAasJpLSj7j68TnK1D/
         /n65eKa0Nv7SgfLq3vGDxnK3RkJrjIrVi/DpN0n/WLYyriQYG7rAFDW0Kb5p5PNCde
         79B6ZnoozFt8w==
Message-ID: <e200be05-4066-b6d8-badd-c7726741356d@kernel.org>
Date:   Sun, 2 Apr 2023 13:29:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] dt-bindings: i2c: maxim,max96712: Require setting
 bus-type property
To:     =?UTF-8?Q?Niklas_S=c3=b6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Rob Herring <robh+dt@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org
References: <20230331141032.3817866-1-niklas.soderlund+renesas@ragnatech.se>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20230331141032.3817866-1-niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 31/03/2023 16:10, Niklas Söderlund wrote:
> The MAX96712 can support both CSI-2 C-PHY and D-PHY bus. Document the
> supported bus-types and make the property mandatory.

Why making it mandatory? Commit msg should focus on "why" because "what"
is easy to see.

> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---
> Hi,
> 
> This is done in conjunction with adding C-PHY support to the driver,
> patches on list. The current driver only supports D-PHY so this was
> assumed in the driver.
> 
> There is a single user of this binding, r8a779a0-falcon-csi-dsi.dtsi. A
> separate patch to update that binding with a bus-type property is be
> submitted.
> 
> Without the property present the driver fall-back to D-PHY (even with
> the C-PHY work applied). So this change is backward compatible with old
> versions of the only effected DTS file.
> ---

Please use scripts/get_maintainers.pl to get a list of necessary people
and lists to CC.  It might happen, that command when run on an older
kernel, gives you outdated entries.  Therefore please be sure you base
your patches on recent Linux kernel.

>  .../devicetree/bindings/media/i2c/maxim,max96712.yaml      | 7 +++++++
>  1 file changed, 7 insertions(+)


Best regards,
Krzysztof

