Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BC72F733065
	for <lists+linux-media@lfdr.de>; Fri, 16 Jun 2023 13:50:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241806AbjFPLuP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 16 Jun 2023 07:50:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345271AbjFPLtx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Jun 2023 07:49:53 -0400
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CD112D59
        for <linux-media@vger.kernel.org>; Fri, 16 Jun 2023 04:49:51 -0700 (PDT)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
        by mailout.nyi.internal (Postfix) with ESMTP id E6E405C01E9;
        Fri, 16 Jun 2023 07:49:47 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Fri, 16 Jun 2023 07:49:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
        :cc:content-transfer-encoding:content-type:content-type:date
        :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to; s=fm1; t=
        1686916187; x=1687002587; bh=tsVaKnscihshn+XWUoAkmcthgbGHdIDlich
        8+0pF+Po=; b=j2jk7hnMYxBOey5oHRkSD8gaeZTSCcobqv3aiWw+ab3rAa/D1BU
        6lK5GIkx+HrTpmSn2pImxPRMQeJzcYjjT9eqMZEvwL9CQesssgoOEKXsQ+ljEMLB
        vTT+1VZzPjS1Vm71P2ZVdwSKSIGUbDd5kqUGH/JPtNY5ZIv/Bs96tNgFRgEsbdAZ
        Fj0ghQ4ji9YlzZ3Hb2fiRdh6A+vF0AxKhDIT6FLl6QzJKWTqBdqU+8qGKJt3gUmO
        5Z8t5XA9hMEGsBjThGJWCyIz+cDD0tlO5y5KG+SJf5i1oyDOs8woSPvoiDh7l6Q9
        x7/KLqhZFJlLSf5qI3XV6pOMfcvCkwP/P1w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:content-type:date:date:feedback-id:feedback-id
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
        1686916187; x=1687002587; bh=tsVaKnscihshn+XWUoAkmcthgbGHdIDlich
        8+0pF+Po=; b=aLJq3EDO8qdzvIGcOCl1OJ+wpODOSNkEoOpSBAZHcCw2sYjASQA
        ng3wQ7jy0nTeQnK+dRUXiByYF5T40B5TlODGKNiIBVJevo3IJaP97pqVvWaEwBZd
        3zql/G65FKhX4PCkMUzLfNBLQf6mYY4tW7mrmAj73z/Cc2SsARukKV3SO/HDohHe
        4on6lXCa63WufHTFJSxzJsZEn/T6vI8bZ91Y4hs+edTp63UbXRmAj6w2blwB4Kz/
        RHbHLjhB5LsUzTMZYU83+OtUHV+aYBupf8Tpe2imRcfmIldvlBqXuCdDOoqLge5I
        oQlDP9fUlIaDvH+6spFiHAqQHIAUdKckxMg==
X-ME-Sender: <xms:W0yMZHWONu9cT_S2uwZBaRyUfJEa1XoDyDLiRDhQfT7xRfPDdP0nuw>
    <xme:W0yMZPnhCfBBZg4uHlf2BgAWWXhB1J6s4sQDg6PVRS6PuhN7Ao660Xoz9iqjp5cXo
    _wrepT6rLCMc6aZnxk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrgedvgedggeegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtgfesthhqredtreerjeenucfhrhhomhepfdet
    rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrg
    htthgvrhhnpefgkeeuleegieeghfduudeltdekfeffjeeuleehleefudettddtgfevueef
    feeigeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivg
    eptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:W0yMZDZFJ0zHF5cz_R80yltyEQzN4djqLo561Bqd_ncmdePso-PG3w>
    <xmx:W0yMZCVokpscUQA7V4lBfDYKUUYJT9zPUX6uHryU_sNWtWuR80uiAQ>
    <xmx:W0yMZBlaRxtkWV9kppTDrfl9WxHJ463kZrPwYEjJJWE3kaucM2UTtg>
    <xmx:W0yMZEtwU5Uw-2HM0u_H2oHBgmAQ_vQTvf5QQfhYn3NKGcxeaXBmfQ>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 99D64B60089; Fri, 16 Jun 2023 07:49:47 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-496-g8c46984af0-fm-20230615.001-g8c46984a
Mime-Version: 1.0
Message-Id: <c5f860ac-4bf7-46cd-aaec-f83ccbe4a6de@app.fastmail.com>
In-Reply-To: <8bd6a1d8-a464-dc43-9ea3-a32c7f490bc1@collabora.com>
References: <202306151506.goHEegOd-lkp@intel.com>
 <8bd6a1d8-a464-dc43-9ea3-a32c7f490bc1@collabora.com>
Date:   Fri, 16 Jun 2023 13:49:26 +0200
From:   "Arnd Bergmann" <arnd@arndb.de>
To:     "Benjamin Gaignard" <benjamin.gaignard@collabora.com>,
        "kernel test robot" <lkp@intel.com>
Cc:     oe-kbuild-all@lists.linux.dev,
        "Linux Memory Management List" <linux-mm@kvack.org>,
        "Mauro Carvalho Chehab" <mchehab@kernel.org>,
        linux-media@vger.kernel.org,
        "Nicolas Dufresne" <nicolas.dufresne@collabora.com>,
        "Hans Verkuil" <hverkuil@xs4all.nl>
Subject: Re: [linux-next:master 7549/10326]
 drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c:1022:1:
 warning: the frame size of 1112 bytes is larger than 1024 bytes
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Jun 15, 2023, at 10:46, Benjamin Gaignard wrote:
> Le 15/06/2023 =C3=A0 09:35, kernel test robot a =C3=A9crit=C2=A0:
>>
>> If you fix the issue in a separate patch/commit (i.e. not just a new =
version of
>> the same patch/commit), kindly add following tags
>> | Reported-by: kernel test robot <lkp@intel.com>
>> | Closes: https://lore.kernel.org/oe-kbuild-all/202306151506.goHEegOd=
-lkp@intel.com/
>>
>> All warnings (new ones prefixed by >>):
>>
>>     drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c: =
In function 'rockchip_vpu981_av1_dec_set_segmentation':
>>>> drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c:102=
2:1: warning: the frame size of 1112 bytes is larger than 1024 bytes [-W=
frame-larger-than=3D]
>>      1022 | }
>>           | ^
>
> Arnd have alreaday send a patch to solve this gcc issue:
> https://lore.kernel.org/lkml/20230601151832.3632525-1-arnd@kernel.org/

I just ran into the above issue with my workaround applied, so
I think this is caused by something else.

I can see one 256 byte variable that is a little too large to fit on the=
 stack, but
that is not the main issue:

     u32 segval[V4L2_AV1_MAX_SEGMENTS][V4L2_AV1_SEG_LVL_MAX] ;

The actual problem appears to be the construction of temporary arrays
on the stack like

#define AV1_DEC_REG(b, s, m) \
        ((const struct hantro_reg) { \
                .base =3D AV1_SWREG(b), \
                .shift =3D s, \
                .mask =3D m, \
        })

#define av1_dec_out_ec_bypass           AV1_DEC_REG(3, 8,  0x1)

hantro_reg_write(vpu, &av1_dec_out_ec_bypass, 1);

Each one of these adds 12 bytes to the stack, and there are a lot
of them here. If KASAN_STACK is active, they cannot overlap, and
there is an addition redzone around each one, but the case I saw
does not use KASAN or UBSAN.

I've tried a few things like removing the debug printf in each
register access, but that did not help. Maybe you have some other
idea for how to simplify this code.

      Arnd
