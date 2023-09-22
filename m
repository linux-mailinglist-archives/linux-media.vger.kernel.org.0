Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DB1827AB080
	for <lists+linux-media@lfdr.de>; Fri, 22 Sep 2023 13:21:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233593AbjIVLWB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 22 Sep 2023 07:22:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233384AbjIVLWB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 22 Sep 2023 07:22:01 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E01EAC
        for <linux-media@vger.kernel.org>; Fri, 22 Sep 2023 04:21:55 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 080C4C433C8;
        Fri, 22 Sep 2023 11:21:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1695381715;
        bh=cj/my9/3whDlnXi36cp8t42qump91hxgA31IEJk5EPE=;
        h=In-Reply-To:References:Date:From:To:Subject:From;
        b=Zh+N/vSKcqRABM/Qu+ULKl0Q5j18mkB/Y1HEA2V/mtNBLoFjOupUXnAQEc8nlR24p
         1KxDWhCtnEUwJ81gBBVTi7v9UL3RRAnF/+0ab9WsnPVQlX8Qx0STmeBBp8XDNRnpoL
         IoVAVAy562QZu1LqXGfNOTNQHr7Gz8BJTv6JITQvk5YT4Ns4jGecyDXRYK0zWkqg7p
         mIUQcg8zurPx33vzObWyhWngeTifu0h1HQnVST+p8ByRJB5PiSlJhTu+0B7kK4JufH
         piZ/oefBdIRMSIZ1VsUEvYF9y2gNtWlkN7prRPYFHf9LSB3ITWG2lpXUAFQGm4A4cb
         G42cNXsP0riqw==
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
        by mailauth.nyi.internal (Postfix) with ESMTP id D557927C005A;
        Fri, 22 Sep 2023 07:21:53 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Fri, 22 Sep 2023 07:21:53 -0400
X-ME-Sender: <xms:0XgNZS0hw9e3sgmQmb-IJKPA5Xl7nP0R-YCbnc211KplnzXNOP8BYg>
    <xme:0XgNZVGqVRGrax4IrpPDiDriF3Q1Mf1QrADpf88sb10w4S0P2XRtIhQJMsQhjahSH
    7WzhhKmEbQBQ2RqSmw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrudekkedgfedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefofgggkfgjfhffhffvufgtsehttd
    ertderredtnecuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusehk
    vghrnhgvlhdrohhrgheqnecuggftrfgrthhtvghrnhephfetveetffevlefggfduteffgf
    ehieffueejkedvjeetveffueekvedviedufeeinecuvehluhhsthgvrhfuihiivgeptden
    ucfrrghrrghmpehmrghilhhfrhhomheprghrnhguodhmvghsmhhtphgruhhthhhpvghrsh
    honhgrlhhithihqdduvdekhedujedtvdegqddvkeejtddtvdeigedqrghrnhgupeepkhgv
    rhhnvghlrdhorhhgsegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:0XgNZa6iipAIPJxihgVuTmCZmrS4SORaVwiROhU4zap9GWm3gyUKZw>
    <xmx:0XgNZT0EezoJWzLj8Gywcim1Ix_M03tGNUPIpA_UQm9B7vf5B1_MAQ>
    <xmx:0XgNZVFgr3YWRdYLVxugBg4uEmEiDWnqMHo54FFm8hdG-pm6gRb3kA>
    <xmx:0XgNZUx2TM2ltPb3TnpNa1-TOJPnxBmUyJyu1-3O9YhVvrumi3emhg>
Feedback-ID: i36794607:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 76330B6008D; Fri, 22 Sep 2023 07:21:53 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-761-gece9e40c48-fm-20230913.001-gece9e40c
MIME-Version: 1.0
Message-Id: <7a58bc30-da9a-4bea-997c-c63b43e0c354@app.fastmail.com>
In-Reply-To: <20230922105036.3148784-1-hverkuil-cisco@xs4all.nl>
References: <20230922105036.3148784-1-hverkuil-cisco@xs4all.nl>
Date:   Fri, 22 Sep 2023 07:21:33 -0400
From:   "Arnd Bergmann" <arnd@kernel.org>
To:     "Hans Verkuil" <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH 0/7] media: string truncate warnings: fix low-hanging fruit
Content-Type: text/plain
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Sep 22, 2023, at 06:50, Hans Verkuil wrote:
> While going through the string truncate warnings I found several that
> were easy to fix.

These all look good to me:

Acked-by: Arnd Bergmann <arnd@arndb.de>

> The remainder of the warnings (about 33) are all of this type:
>
> 	char name1[32];
> 	char name2[32];
>
> 	snprintf(name2, sizeof(name2), "foo:%s", name1);
>
> Since the [32] part of the character arrays is related to uAPI structures,
> this is not so easy to fix.
>
> One option might be to create a helper function to do the concatenation
> and that warns (once) if actual truncation takes place. Since in most
> case the strings are short enough.
>
> Even if we increase the size to e.g. 64 in the uAPI to avoid some of the
> current truncates, that will still cause the same warning, so a helper
> function that is smarter would probably still be needed.

What are the affected user space interfaces here? It looks like
most of the remaining ones are about the name fields of v4l2_device
and v4l2_subdev, right? I'm probably missing something here, but
as far as I can tell, these are primarily used inside of the
kernel for debug messages that would actually work just as well
with longer strings.

Interfaces that I found that uses the hardcoded name length
is VIDIOC_DBG_G_CHIP_INFO and VIDIOC_G_AUDOUT. At the moment,
these work on the truncated string, which in theory might
be ambiguous. If we use the longer string internally, the
ambiguity could be pushed down into these ioctls specifically,
in one of several ways:

- only compare the first 32 bytes, but warn if the kernel
  side string is longer at the time we call the ioctl

- add a replacement ioctl command for each affected interface,
  using a longer string and possibly addressing other
  problems with the interface at the same time.

- if there is a realistic chance that the strings are not
  unique, find a mangling scheme that converts the long-form
  name into a shorter name that is actually unique.

      Arnd
