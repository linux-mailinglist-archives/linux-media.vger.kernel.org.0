Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EF9565AAAE3
	for <lists+linux-media@lfdr.de>; Fri,  2 Sep 2022 11:07:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234042AbiIBJHN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Sep 2022 05:07:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230317AbiIBJHL (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 2 Sep 2022 05:07:11 -0400
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BACCA2203
        for <linux-media@vger.kernel.org>; Fri,  2 Sep 2022 02:07:10 -0700 (PDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.nyi.internal (Postfix) with ESMTP id B95E55C01B0;
        Fri,  2 Sep 2022 05:07:09 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Fri, 02 Sep 2022 05:07:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
        cc:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm1; t=1662109629; x=1662196029; bh=MRR1YZdxaG
        AlHdlYc1EG3QgaEliVAG6nHxdD6yN/0jk=; b=ngtMb9BvnYC5NyKJG9tGh1X7HP
        LzEQP7Y9Aa681iCV1KwmnJniwZhC2XzLt3fu8mBkNj60xn079AvI/sehYWEA2mxT
        3xkA4/q2PqTXqmJ85xUfMQgHFg0es3KJ+zn7SqQIUy+16YhrGHF+v6dhmHKkx3Ym
        guXNpQMPDQ8eklouLgM1+BsZA1pSk8MunyUkWkaYS3CnwbJOXa0f6XSohOskkc1S
        f7/LmB0+S4Efc6yzsb0YBgYqRRVowZ5dY7RRBqZtBZxCiIcGOnTQj88+MPqvTs91
        K+LuS6CZR9mpaVG1V5FwWUalAaCT33dfoCDrvljcEKtsf0anSpfOPLugolTw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
        :feedback-id:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm1; t=1662109629; x=1662196029; bh=MRR1YZdxaGAlHdlYc1EG3QgaEliV
        AG6nHxdD6yN/0jk=; b=FheTf9MUrnBms8wMxV6i0TLRxQPDlUfRL/nGJhEN8UfC
        I7uZAhqLmWjFYtvHhtrM855hoeXh4lzcW9Vbg4mVDZazLm4v5WBxKAQ1sYmtDd94
        sij2zbJp6UU2aRODeuduBbhmBdZbJABAYWcFUfWaitKoYCGSx2Cj4QMo2zIj3q07
        PIVZgjGgkONRbyLY6guqBMrX7uZTaYPxhn8/rme3l0FXbLQ2aXjyf3ez1VCoaI8z
        oUQmKm0QVAnGToA7wOg/bSxmqcWRSFw2XOAF8S+1MJQIxHG5q+zS8QCPqXp032QS
        IL91C4rj3OE6EbMv11pblmeSPU7H142AMqeamj6WaQ==
X-ME-Sender: <xms:vccRY3YnapSToqeMqT6EMAlukXCrLGf50tyequ4imlq5mB5YW-ozWA>
    <xme:vccRY2btZI16nY_A5FiW6jZ4JsHr8L3JOF5eDxdlzTjJ72LrrT-p7Ln5eRNQQnwVv
    cR02Wq1KJkgOvMuw0Q>
X-ME-Received: <xmr:vccRY58Qqyab1xsRq9OOYYd1NQosq62n96ckxBPNHU3ywT6gdNoBvQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdeltddgudefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtjeenucfhrhhomhepffgrfhhn
    rgcujfhirhhstghhfhgvlhguuceouggrfhhnrgesfhgrshhtmhgrihhlrdgtohhmqeenuc
    ggtffrrghtthgvrhhnpeejieduveekueegfedvgfettdffgeevheeihffgteetveelhfef
    ueehgffghfelvdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrh
    fuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepuggrfhhnrgesfhgrshhtmhgr
    ihhlrdgtohhm
X-ME-Proxy: <xmx:vccRY9pZPKEMQe3Au5Z-5zwTE2VIs_lnt8m-vjUsH105Yv1ICer1fQ>
    <xmx:vccRYyrip_x32_spiiUe_07xiqRGjWiosBKjbVleILgdMbREasoCDg>
    <xmx:vccRYzSkS9QhAzaIE6WYrBac1T7cwkawFcUVbiE-riPnY23rzsQ-4A>
    <xmx:vccRY7nNCadh3QIM2C3iuxEbI-jHRrUIlPKz38Yhk1n9nERU9ws_Gg>
Feedback-ID: i0e894699:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 2 Sep 2022 05:07:07 -0400 (EDT)
Date:   Fri, 2 Sep 2022 12:07:04 +0300
From:   Dafna Hirschfeld <dafna@fastmail.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>,
        linux-rockchip@lists.infradead.org,
        Paul Elder <paul.elder@ideasonboard.com>,
        Florian Sylvestre <fsylvestre@baylibre.com>
Subject: Re: [PATCH 0/5] media: rkisp1: Fix LSC initial configuration on
 i.MX8MP
Message-ID: <20220902090704.crddbkvmguvezyiy@guri>
References: <20220817021850.20460-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20220817021850.20460-1-laurent.pinchart@ideasonboard.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 17.08.2022 05:18, Laurent Pinchart wrote:
>Hello,
>
>This patch series fixes the Lens Shading Correction initial
>configuration on the i.MX8MP.
>
>The i.MX8MP integrates an ISP8000Nano v18.02, which unlike other
>versions currently supported by the driver, gates access to the LSC RAM
>with the ISP_CTRL.ISP_ENABLE bit. The initial LSC configuration being
>performed before the ISP gets enabled, the writes to the RAM are
>ignored, leading to incorrect results.
>
>The series starts with four small drive-by cleanups of the LSC code, and
>patch 5/5 then fixes the issue. I'm not totally thrilled by the code
>architecture, but I'm not sure why, and I have a feeling doing better
>would require a large refactoring of the ISP parameters handling. If
>anyone sees an option for a better implementation, please say so.
>
>The series is based on top of "[PATCH 0/7] media: rkisp1: Fix and
>improve color space support" ([1]). Reviews for that base series would
>thus be appreciated too.
>
>[1] https://lore.kernel.org/linux-media/20220815065235.23797-1-laurent.pinchart@ideasonboard.com

Hi, I see that the series is also based on "[PATCH v2 00/55] media: rkisp1: Cleanups and add support"
right? I could not apply patch 5/5 because it seems to sit on top of
'[PATCH v2 49/55] media: rkisp1: Configure gasket on i.MX8MP'
Do you have a branch you can share with all the sets?

Thanks,
Dafna

>
>Laurent Pinchart (5):
>  media: rkisp1: Clean up LSC configuration code
>  media: rkisp1: Store LSC register values in u32 variables
>  media: rkisp1: Simplify LSC x/y size and grad register macros
>  media: rkisp1: Use RKISP1_CIF_ISP_LSC_GRAD_SIZE() for gradient
>    registers
>  media: rkisp1: Configure LSC after enabling the ISP
>
> .../platform/rockchip/rkisp1/rkisp1-common.h  |  29 +-
> .../platform/rockchip/rkisp1/rkisp1-isp.c     |   9 +-
> .../platform/rockchip/rkisp1/rkisp1-params.c  | 378 ++++++++++--------
> .../platform/rockchip/rkisp1/rkisp1-regs.h    |  20 +-
> 4 files changed, 239 insertions(+), 197 deletions(-)
>
>-- 
>Regards,
>
>Laurent Pinchart
>
