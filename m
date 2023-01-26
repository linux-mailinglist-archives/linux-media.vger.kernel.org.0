Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ECE8967CA96
	for <lists+linux-media@lfdr.de>; Thu, 26 Jan 2023 13:09:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229631AbjAZMJu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Jan 2023 07:09:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232615AbjAZMJo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Jan 2023 07:09:44 -0500
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFB35410BB
        for <linux-media@vger.kernel.org>; Thu, 26 Jan 2023 04:09:43 -0800 (PST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.nyi.internal (Postfix) with ESMTP id 10C3B5C011A;
        Thu, 26 Jan 2023 07:09:43 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Thu, 26 Jan 2023 07:09:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to; s=fm1; t=1674734983; x=
        1674821383; bh=ypj4mFtjnpiU66wJrIHVlKQwlPz31sSAhEHutMynsSo=; b=J
        0Po/Pu4HV8qxLjZalk5bmnMQES8q0K/peYhMmiiCIaN0uTZWYRgEvTAfv1i41epa
        bpx83E/aQNvi74dl4VGm9wP7MBQpnH1trZFxKdBHdcAiR5TCKD9N2S6OJQkiDL7R
        jRxFsrnM9+FMrKK9Z8ebwyJiVVaH9b1KFjPKdjIpzpMrQG8583bormUmfUEJj9bw
        z0V7FogCDfYqzmQP6Ehcp2y2iiNaAEdy9N8PXtfQjyqXUUwPu8+PVqQaVuen79Za
        5ss44xXhuccurCFEjSRIS6xfrdiJLyBx+8j9WUzMUnuLfkb+bhxxKJa8lNNIOJAU
        fp6GL05zltq+VfGdHlqGQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:date:date:feedback-id:feedback-id:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1674734983; x=
        1674821383; bh=ypj4mFtjnpiU66wJrIHVlKQwlPz31sSAhEHutMynsSo=; b=o
        NNgf46U8yVgcO3eQTEXg4o0a4IWqP/MDKz+Mhn/3tQd2lSxnVJAokjw3aIMrnbcP
        elbtCBFmU6SOz7Y49qKy/fef4LbrAhcR8NRodIDrDtb7HtgxWAXZ0UJy8oEMIbTt
        flIwyWDqjZuyWhgspwK+HMXbD+s4jyNISOQxqjieLH9t2pZLMPRdxf6wRZLiyG6P
        JJz4IfBAg0B6X299E5ffgAw5rk6iuWxx3Co8c5xCLgL9bbvQ8CQDbq1O0HNISHVK
        qnt1ziVOJGJBgWb4nT1NfHCbV/GjBSe8N/hdCJmiXwDsJ2swASbCvSTFZYeSfswk
        P8BseHGPMmnnLFDL5gItw==
X-ME-Sender: <xms:hm3SY7RwAoMrztpga0_kIFzBoFuSbdqLFYMIYSNbb1XpnQudZIs8Cg>
    <xme:hm3SY8zQMT_-lo4y8XZKguZ3um-pBbWZwtT5PGGprr3jvSz9LtWbpINKIuOKA_fg2
    igyuWaNR2Y1vkdzgEk>
X-ME-Received: <xmr:hm3SYw2HPQV2mjIqksaeiIPqeH6Rjs-4sZNWxwpoyKyojWyC3sGW4Ac2-cND88AX7jX5U2GqUR5V6OKHAma2flmPiBPdo0Ii_u52GlvSKZKDrQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedruddvgedgfeeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforgig
    ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
    grthhtvghrnhepueeigefghfffffeifeehudeiuedvteegueefffevgfetvdffheehkeff
    vedufeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:hm3SY7CaZ41Dlxa-XgKTsAlQDvOfZwLGL9VV-JqCVpYuPh2cGtprDw>
    <xmx:hm3SY0jBmsDjlmobl8uLiLTkDGSF85yBwToGOvWPh93qrQM7u4zung>
    <xmx:hm3SY_qX0SrtI1FQ-8sjK6XoAhR5mcSYYRZMbY-5ye2tYfe8C1vR6Q>
    <xmx:h23SY_VqfYU_hn8cyjtvYQ3XrCrSUdYRqKMPRJg8SCsKmyTyDKz8Bw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 26 Jan 2023 07:09:42 -0500 (EST)
From:   Maxime Ripard <maxime@cerno.tech>
To:     dri-devel@lists.freedesktop.org,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Maxime Ripard <maxime@cerno.tech>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: (subset) [PATCH] drm/vc4: hdmi: make CEC adapter name unique
Date:   Thu, 26 Jan 2023 13:09:39 +0100
Message-Id: <167473496914.177631.15766961035206966983.b4-ty@cerno.tech>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <dcf1db75-d9cc-62cc-fa12-baf1b2b3bf31@xs4all.nl>
References: <dcf1db75-d9cc-62cc-fa12-baf1b2b3bf31@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 19 Jan 2023 10:02:19 +0100, Hans Verkuil wrote:
> The bcm2711 has two HDMI outputs, each with their own CEC adapter.
> The CEC adapter name has to be unique, but it is currently
> hardcoded to "vc4" for both outputs. Change this to use the card_name
> from the variant information in order to make the adapter name unique.
> 
> 

Applied to drm/drm-misc (drm-misc-fixes).

Thanks!
Maxime
