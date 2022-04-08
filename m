Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B507A4F8DA4
	for <lists+linux-media@lfdr.de>; Fri,  8 Apr 2022 08:25:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234342AbiDHEwA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 8 Apr 2022 00:52:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231300AbiDHEv7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 8 Apr 2022 00:51:59 -0400
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E3FE100A5C;
        Thu,  7 Apr 2022 21:49:57 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.nyi.internal (Postfix) with ESMTP id 4A9A35C01E1;
        Fri,  8 Apr 2022 00:49:56 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Fri, 08 Apr 2022 00:49:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
        :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm1; bh=UKRAqjIyk3u/7Nc2jYsbmjPc4t3Bo4xKZ5lbmy
        1u21o=; b=AFJ7S4Jm8JH8P+BR2Cshitcs0MHWmoJS4iI7azn5nr7eHHpP/B0X72
        poQmc+8Y3MyMWh/NV1NsLMNe+m4cp+JN+p5DT6u4w4Zt1UD5mySsl4k5dy52z+g+
        fqOypgwy5eXVY3axgAuxOGZnBuwsQKyAyzAKqp/TX0QLm23j/+V4hRfrAKhN1sC5
        7VqJZ3y25oRei2P+az4GUsA6l5/Q5SQSUycrQTRZBTrRfamPKFMkG9Cu1fxK1K/J
        KpHPF18MgJted80DJkU38aPAFAWw1YPCI/ju2CIFT++tIDqA5V6W2muSYMdxaqEg
        1+ZqoJwGz+SkEasHx0pSLY8P8PN4Gplw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=UKRAqjIyk3u/7Nc2j
        YsbmjPc4t3Bo4xKZ5lbmy1u21o=; b=DA1dPRM+k8gZEqkU2Or1uYYG+1Gm1f3t5
        vNvY6g+3D4RX6Z8rUmeE+TQFh4OQVT5uzg4d1lYdcfNDF1O8ny46pyoEy7gvFISd
        igihhw7BqxavYaJ+B5hT7lxWwl1vjnULlf9RgNzMuPmBvPw2d8swgkglZ4DWC6BK
        9EfzlLF8k82cz3UdWxAZuuFcuElcYeAty+RC5tz9jfGENFe1q8clor7jx0fKDhyO
        9/pwfMkEWrEE3t/euKbm9eys3HOqs2NLqPJJGB1wuagNdBquu4AHCRDNmc7aKDlX
        sGkNSCMQ3SeiHGvtFDwqfhPGPuJs+n4fNFWm6tGqRjwoyTUMujHhQ==
X-ME-Sender: <xms:875PYpm26dFIqqO0bRWy218xIr9DgSETogBwUHyyGyQ9Ra9Q63l3kQ>
    <xme:875PYk1RkqX_c-FzmItdbzVFmgSqR9dYeE2NalrFKA3g5XvNokatoRA5o42MpENXI
    FRS-10d2UdOCg>
X-ME-Received: <xmr:875PYvojtKSZRiv9MSJOPDm5WG4Iq_m_WYeR2ZLkJTb_Mcc66I_mg1_Isi_0Yw0NNTnnTE4H2q3r1nnQ5hpl36p9_jfz2l6O>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudejledgkeefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefirhgvghcu
    mffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtffrrghtthgvrhhnpeehfefgvd
    dukefhvdfgueevffevfedutdeiueevleejfeeijeeuveevudegteejfeenucffohhmrghi
    nhepfhhrvggvuggvshhkthhophdrohhrghdpghhithhhuhgsrdgtohhmnecuvehluhhsth
    gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepghhrvghgsehkrhhorghh
    rdgtohhm
X-ME-Proxy: <xmx:875PYplZYTT1Eb71wGrTp5r2XnttRnuE31bvFMS9MtEn8PAArzz1CQ>
    <xmx:875PYn1gQkersWCherpZFakYcDRM9nAczA8e9pnZcml_rS0v0v9bTA>
    <xmx:875PYov_FdRHZc6uHwf2AVyQ6DTL2MeoDua34Lpy3AkS8TBlAyO9jw>
    <xmx:9L5PYoGHzlwGcjZGNkLhiJzv23Ax5O_ZdMKcse0VoSFucrFCv4pIHw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 8 Apr 2022 00:49:55 -0400 (EDT)
Date:   Fri, 8 Apr 2022 06:49:52 +0200
From:   Greg KH <greg@kroah.com>
To:     Michael Grzeschik <mgr@pengutronix.de>
Cc:     linux-usb@vger.kernel.org, balbi@kernel.org,
        paul.elder@ideasonboard.com, kieran.bingham@ideasonboard.com,
        nicolas@ndufresne.ca, laurent.pinchart@ideasonboard.com,
        kernel@pengutronix.de, linux-media@vger.kernel.org
Subject: Re: [PATCH v7 0/7] usb: gadget: uvc: use configfs entries for
 negotiation and v4l2 VIDIOCS
Message-ID: <Yk++8L5ecHBQbmGt@kroah.com>
References: <20220315143356.3919911-1-m.grzeschik@pengutronix.de>
 <20220407195350.GA11432@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220407195350.GA11432@pengutronix.de>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Apr 07, 2022 at 09:53:50PM +0200, Michael Grzeschik wrote:
> On Tue, Mar 15, 2022 at 03:33:49PM +0100, Michael Grzeschik wrote:
> > This series improves the uvc video gadget by parsing the configfs
> > entries. With the configfs data, the driver now is able to negotiate the
> > format with the usb host in the kernel and also exports the supported
> > frames/formats/intervals via the v4l2 VIDIOC interface.
> > 
> > The uvc userspace stack is also under development. One example is an generic
> > v4l2uvcsink gstreamer elemnt, which is currently under discussion. [1]
> > 
> > [1] https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/1304
> > 
> > With the libusbgx library [1] used by the gadget-tool [2] it is now also
> > possible to fully describe the configfs layout of the uvc gadget with scheme
> > files.
> > 
> > [2] https://github.com/linux-usb-gadgets/libusbgx/pull/61/commits/53231c76f9d512f59fdc23b65cd5c46b7fb09eb4
> > 
> > [3] https://github.com/linux-usb-gadgets/gt/tree/master/examples/systemd
> > 
> > The bigger picture of these patches is to provide a more versatile interface to
> > the uvc gadget. The goal is to simply start a uvc-gadget with the following
> > commands:
> > 
> > $ gt load uvc.scheme
> > $ gst-launch v4l2src ! v4l2uvcsink
> 
> Cc: linux-media@vger.kernel.org

That does not actually get the full set of patches sent to the list :(

Please resend the whole series.

thanks,

greg k-h
