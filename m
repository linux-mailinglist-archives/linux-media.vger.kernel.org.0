Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 836987AD0A9
	for <lists+linux-media@lfdr.de>; Mon, 25 Sep 2023 08:52:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232278AbjIYGxC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 25 Sep 2023 02:53:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232333AbjIYGws (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 Sep 2023 02:52:48 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85F15CFB
        for <linux-media@vger.kernel.org>; Sun, 24 Sep 2023 23:52:13 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 936BFC433C8;
        Mon, 25 Sep 2023 06:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1695624732;
        bh=3SKQZCiHJg1YqrPxw8jbB+5GpD+nHTfXK74ByvhhNGM=;
        h=In-Reply-To:References:Date:From:To:Cc:Subject:From;
        b=uE6B4FtykgILzfAYmlV5URyZoY3IvsFzyNKdivwSBmmKltIlOMe0hq+VvpzeIzMDz
         CYpXnJty9dFQBhqEihvA83JmctBERppI5kTlBxnVpC449PNr/cYWyj+GkwkyJrTnuu
         p7GbkxGegBzy9QrejNLGRBwhAHKtXbmDOMLp9EWnh3bk8gHkxkKJ/0maDF/jI48wkd
         nMPCSC4O1zgtZDNHMTMYC13Ww9XYXmhisy8hYLzmqcsKvp/3Sz86/ntJ57nS3PEfwx
         MU5Afk3VipMMhYeHblkQbFdYZE4BWrly5eUrAVmYOmRmpI9aZNQ2mhpQ4PH1sfLt73
         fzlaiJTCIsFHQ==
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
        by mailauth.nyi.internal (Postfix) with ESMTP id 7482927C005B;
        Mon, 25 Sep 2023 02:52:11 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Mon, 25 Sep 2023 02:52:11 -0400
X-ME-Sender: <xms:Gi4RZSvjOyUk8en7agjZRaXYfyrRR81gjmvmLPw3kt4deMacVHcxeA>
    <xme:Gi4RZXd3MqatKEPUrctGWBYIvFh9kxLStEnDM4K-bw91vSwC0TjqwuI1hlpVRZxlC
    QOx1obJRkRRRUuR3E4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrudelfedgudduhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecunecujfgurhepofgfggfkjghffffhvfevufgtse
    httdertderredtnecuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgu
    sehkvghrnhgvlhdrohhrgheqnecuggftrfgrthhtvghrnhepvdeviefgtedugeevieelvd
    fgveeuvdfgteegfeeiieejjeffgeeghedugedtveehnecuvehluhhsthgvrhfuihiivgep
    tdenucfrrghrrghmpehmrghilhhfrhhomheprghrnhguodhmvghsmhhtphgruhhthhhpvg
    hrshhonhgrlhhithihqdduvdekhedujedtvdegqddvkeejtddtvdeigedqrghrnhgupeep
    khgvrhhnvghlrdhorhhgsegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:Gi4RZdwf5mW_qviXe4WUA2pA6omWq-DTEiosg8perT0Zxgc1sqihgQ>
    <xmx:Gi4RZdOkTo_TTRpuyjmdzhxLWpVRrjcTmUzCqcxEKzgo5_SPSyk_AQ>
    <xmx:Gi4RZS-EWdXNhuSQJ5mwbYA2JTrQEPuCCr9EIlolM4orAtvul6v4vw>
    <xmx:Gy4RZXHcjHc8NEPRUhZikqFkfRU0VeX-ks28y3ckxGdAd3VK3bbbFA>
Feedback-ID: i36794607:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id CCB05B60089; Mon, 25 Sep 2023 02:52:10 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-761-gece9e40c48-fm-20230913.001-gece9e40c
MIME-Version: 1.0
Message-Id: <76aed346-e1e3-4262-aafa-974e6934b0d0@app.fastmail.com>
In-Reply-To: <b730277c-4239-4e5e-aff6-f1b8cbeeaac9@xs4all.nl>
References: <20230923152107.283289-1-hverkuil-cisco@xs4all.nl>
 <20230923152107.283289-13-hverkuil-cisco@xs4all.nl>
 <20230923181128.GA22193@pendragon.ideasonboard.com>
 <b730277c-4239-4e5e-aff6-f1b8cbeeaac9@xs4all.nl>
Date:   Mon, 25 Sep 2023 08:51:49 +0200
From:   "Arnd Bergmann" <arnd@kernel.org>
To:     "Hans Verkuil" <hverkuil-cisco@xs4all.nl>,
        "laurent.pinchart" <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org
Subject: Re: [PATCHv2 12/23] media: v4l2-subdev.h: increase struct v4l2_subdev name
 size
Content-Type: text/plain
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Sep 25, 2023, at 08:26, Hans Verkuil wrote:
> On 23/09/2023 20:11, Laurent Pinchart wrote:
>>>  
>>> -#define V4L2_SUBDEV_NAME_SIZE 32
>>> +#define V4L2_SUBDEV_NAME_SIZE 52
>> 
>> Can we allocate it dynamically instead ?
>
> Anything is possible :-)
>
> But that's a separate issue and, I think, should be part of a larger
> uAPI discussion. Right now it is just to squash those annoying warnings.

Agreed, and I don't think that dynamic allocation here would
help either on saving memory (because of the slab overhead) or
for correctness (making it even harder for uapi to if there is no
upper bound on the name length).

   Arnd
