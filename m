Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 91B51675DB7
	for <lists+linux-media@lfdr.de>; Fri, 20 Jan 2023 20:13:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230215AbjATTNt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 20 Jan 2023 14:13:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229379AbjATTNs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 20 Jan 2023 14:13:48 -0500
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4AE4948A33
        for <linux-media@vger.kernel.org>; Fri, 20 Jan 2023 11:13:47 -0800 (PST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.west.internal (Postfix) with ESMTP id 4A0703200955;
        Fri, 20 Jan 2023 14:13:46 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Fri, 20 Jan 2023 14:13:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to; s=fm1; t=1674242025; x=
        1674328425; bh=KDAu4lflKAilT2GeujzJmvpfE31X4Cxo27fbXFr0VBc=; b=a
        xGlY6uH4dKzA5Ak0SqAdKXq/ZgWFop97HDOAFyzic+zQoUptBIDdnRlDw9uXICJ/
        4NRFkSR5m0w7O+zgjJVihHOAnf06Wn/k++VvUHrrDCjpQeJ7kryo6ChXiNAFsqHz
        nd0bM3k5gGTy74fzYp9lu/33iSwq9TPKGEHeFiFJoxo33H/KttiPnxsmbE+xhJpw
        5PCFl89nSbfBCv+4MDCKHPF9vb6odcWJRppDPrINR5614W9/FY24CBZAAOdGUPmY
        2XbfML5RPjBrJjVratqgTIHAxCo7meh4+Nq9a6aMWeKkkXAkPZB7hTy8+MO2/20U
        bllpwyfpVU2O+u1x9ernQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:date:date:feedback-id:feedback-id:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1674242025; x=
        1674328425; bh=KDAu4lflKAilT2GeujzJmvpfE31X4Cxo27fbXFr0VBc=; b=X
        P0NbZCRrYM001QH5WcRFP8VKlwYWlrH2gpyHoEfpvyOHkJqYDwJI4s61BjBKo06F
        2GppP+Q2cUWuvJqqTvhG9uDBIqnbc8gghkZWQl2Kyp4zvk9brlXjucmyM3pgbh3G
        ItZJitmzNw57V9sWMcC5+XG0Tk740ZxfTHzkA13Jykk9965Y1NVrdc4kxdc82xMP
        f+n4CR4uNM1+53L4gEy5mz47ZUQno1gZU0Tpc44RZS4xn7pzJ92K3iAjAN0e97WQ
        rSi5Tmy0YfjD6naN+lv1HxHwP2nNslL1FBJYik+TSxh2/NuwzjIAnVUMoBgGQasS
        nDxDgIOAd6tsHQG/jBUtw==
X-ME-Sender: <xms:6efKY04FYgYDEnhZVDPd_YAAbTmplPgdvvs0S8wqOkE6st0yDWdHIA>
    <xme:6efKY15yXpiNS-l2fn1YNh1ti4SDp9CetlrTF4iEGUDhijMz3l5Pxvu1CFbyB6RSE
    8SDsCL3w6895V6NCVk>
X-ME-Received: <xmr:6efKYzd-_6STEbxydb7L5Q7l41aic4l6raUpRHsacdQA-2Ac1BU8wl4Q1OCVtwAlhaYqs9vIkBt4W4xEdvVgzs5L4TSy-j1N07rS7CCk1fHaRw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudduvddguddvgecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefukfhfgggtugfgjgesthhqredttddtvdenucfhrhhomhepofgr
    gihimhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtf
    frrghtthgvrhhnpeetgfelgefggeekkefggfeludeiudffjeffgeevveekjedukedtudeu
    teefteefgfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:6efKY5KTxR3drEDWgRCVIFAc_WMiOgax68SczL9p6PbUIuKkfhldoQ>
    <xmx:6efKY4LFkBK8qeTAqzqifiXfZVnjx6uG8ZDbqJ0AW5LWzrxtEnAjiw>
    <xmx:6efKY6yA1UnlfUwofXSob7G9EPFf_fd9JcJp4i60B1c2Y0mYOswrPw>
    <xmx:6efKY9FHfqdDTf8EEE8lOtRhTt1XMt07toEPWWAecUVlujG4nxCyiQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 20 Jan 2023 14:13:45 -0500 (EST)
Date:   Fri, 20 Jan 2023 20:13:44 +0100
From:   Maxime Ripard <maxime@cerno.tech>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: [PATCH] drm/vc4: hdmi: make CEC adapter name unique
Message-ID: <20230120191344.xldhudsmb4xar4u3@houat>
References: <dcf1db75-d9cc-62cc-fa12-baf1b2b3bf31@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <dcf1db75-d9cc-62cc-fa12-baf1b2b3bf31@xs4all.nl>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Thu, Jan 19, 2023 at 10:02:19AM +0100, Hans Verkuil wrote:
> The bcm2711 has two HDMI outputs, each with their own CEC adapter.
> The CEC adapter name has to be unique, but it is currently
> hardcoded to "vc4" for both outputs. Change this to use the card_name
> from the variant information in order to make the adapter name unique.
>=20
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

The patch looks good but should we Cc stable and add a Fixes tag here?

Thanks!
