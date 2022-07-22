Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1CADC57DF30
	for <lists+linux-media@lfdr.de>; Fri, 22 Jul 2022 12:10:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234422AbiGVJw6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 22 Jul 2022 05:52:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234144AbiGVJwv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 22 Jul 2022 05:52:51 -0400
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 216D138E
        for <linux-media@vger.kernel.org>; Fri, 22 Jul 2022 02:52:50 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.west.internal (Postfix) with ESMTP id C9B4C32005CA;
        Fri, 22 Jul 2022 05:52:47 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Fri, 22 Jul 2022 05:52:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to; s=fm2; t=1658483567; x=
        1658569967; bh=E+QwbFT+XfP1pyqkzPh0c/Zft+7MnYPFXCGYsvA1W94=; b=E
        1tXuipWlGgyielwMteCAjpR6c468YWy4nLwZ5MMsOutekoum4tBXypydzUJAecLL
        XHlOpBAKV9fQN3Du+rJg/SN9PRkKfp4j58sCFjh0TsGOilX+ApIYhmoggw11OWAN
        aaYNtovtdRkw48oPKNEtbePGKDL50/brQWg5IukB/fAB2wPQ8NKGHgwRbkQg3wO6
        YObwTGn+P6yZyGLgh3sLWnKKw00Sy2/JsXVq/36ajkfEy2dMCNJxQ2ziXmRlN8KU
        v7OeTrTZuBvitXEd2PvXByBFAp06ITFvwaFxK+KZRtQcB/8fzG41To8DsA4d/C4L
        Jlnjk926G0CrmsfVUUbcw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:date:date:feedback-id:feedback-id:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1658483567; x=
        1658569967; bh=E+QwbFT+XfP1pyqkzPh0c/Zft+7MnYPFXCGYsvA1W94=; b=H
        CKZZ354Dg3x8JG6dl8WdvZBMiQafoTXZN5Wwx0jmTgyVOCiEyL0TxJvUv7c5CRON
        nKWveq+XG+Uw9ENL+NvQLrky1Wt/5kpYJDcMayetS3sOqPEFRwUnrMzn4v1vZQxF
        8vtKnbTCgzO/vTWKdG48TNgSEGOxVXYS0e5SWLhKVEANQtaO1Bw5aWlux2VN/X1C
        /tgFmjnxsiDW5Ab7XkeGgVOmff4MOvftUaPEMtKJgT7bQgCseK6o5roSnKL6Oijb
        8GVKIta9oXyd4OB4iFI/Qf1GmvIbFY+//as+wkYNBFUtvVF7SN8Jw56DC0lrXVZg
        biYlQ6l6gcD/pdFu4ZxRw==
X-ME-Sender: <xms:bnPaYt4Q7USwc7z1Rts1K-m0nh3O0pWNLbi_pyS3GKlnzT3XePUkVw>
    <xme:bnPaYq6-ta4PyOex2T2Ki-O4AByGjVuE11Ne4CZdMBuScoIq39hYaiyAe9UFSIPpK
    5mFbpAZAL2rllzEeSw>
X-ME-Received: <xmr:bnPaYkfcelCjsDAmnmlFIxLZPnarxlRA4FzJxl6KXo6M1YMdmNM_Y4dqAENJT1JHcy5UtGDCsKkyefwsUYdPM2AQuLIiAziz5F38pZA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvddtvddgvddvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggugfgjsehtqhertddttddvnecuhfhrohhmpeforgig
    ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
    grthhtvghrnhepjedvieelffegveduuddvkeeiffegieeftdejgeehieeftdeuudeffeei
    ueevuedvnecuffhomhgrihhnpehlihhnuhigfhhouhhnuggrthhiohhnrdhorhhgpdhkvg
    hrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhl
    fhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:bnPaYmIAj44jGs3MFf0zrjpYP72vAVVUcF8cg5UlQSM3gjrUy1S4hQ>
    <xmx:bnPaYhL61r_1UZQP7EQYXky7Zztv1ngP_wcnEyXG_XEeOEL_3gtvRQ>
    <xmx:bnPaYvxBs3iXENXmaMVhnam-KH8R1hIp5zVp4UVc8fF9SKr_74xY3Q>
    <xmx:b3PaYueI4SR5hEmOsHU56fBRjo9pxfWDmb7CDtTBeImgsX13dGBemQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 22 Jul 2022 05:52:46 -0400 (EDT)
Date:   Fri, 22 Jul 2022 11:52:43 +0200
From:   Maxime Ripard <maxime@cerno.tech>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Ricardo Ribalda <ribalda@chromium.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Sean Young <sean@mess.org>,
        "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
        Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@gmail.com>,
        paul.kocialkowski@bootlin.com,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: Re: [ANN] Media Summit at OSS Europe in Dublin: September 12
Message-ID: <20220722095243.5qql3weo4mmoslbi@houat>
References: <54d42d4e-5994-68a2-4a21-770167d5405a@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <54d42d4e-5994-68a2-4a21-770167d5405a@xs4all.nl>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Fri, Jul 15, 2022 at 10:15:04AM +0200, Hans Verkuil wrote:
> The Linux Foundation organized a meeting room for us to use on Monday Sep=
tember 12
> at the Convention Centre Dublin. It is co-located with the Open Source Su=
mmit Europe,
> see https://events.linuxfoundation.org/open-source-summit-europe/ for mor=
e info.
>=20
> To attend this Media Summit no registration is required for the OSSE, but=
 you do need
> to register with me by sending me an email. There is a maximum of 20 part=
icipants.
>=20
> I send out a request for topics in May and got quite a few replies:
>=20
> https://lore.kernel.org/all/a7007268a65846674b82a108215992d39b430b38.came=
l@ndufresne.ca/T/
>=20
> If you have more ideas for topics, then reply either to that message (pre=
ferred) or this
> one.
>=20
> See here for more details about the conference:
>=20
> https://events.linuxfoundation.org/open-source-summit-europe/
>=20
> It is primarily meant for media developers to meet face-to-face. Whether =
there will
> be a possibility to participate remotely is not certain at this time. Pas=
t experience
> shows that meetings like this are a poor fit for remote attendance, unles=
s you have
> a meeting room that is designed for such purposes, which we don't have.
>=20
> The actual agenda will depend on who will attend, I hope to be able to pu=
t that
> together around mid August. But the link above with the 'Request for Topi=
cs' thread
> will give a good indication of what to expect.
>=20
> So, if you want to attend, then let me know by email. Please reply as soo=
n as possible,
> even if you are not entirely certain yet if you can attend.

Thanks for the invite, count me in :)

Maxime
