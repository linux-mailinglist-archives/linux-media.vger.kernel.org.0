Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 194EB696E4D
	for <lists+linux-media@lfdr.de>; Tue, 14 Feb 2023 21:12:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231816AbjBNUMZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Feb 2023 15:12:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229761AbjBNUMY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Feb 2023 15:12:24 -0500
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB8009ED2
        for <linux-media@vger.kernel.org>; Tue, 14 Feb 2023 12:12:22 -0800 (PST)
Received: from nicolas-tpx395.localdomain (192-222-136-102.qc.cable.ebox.net [192.222.136.102])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: nicolas)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id EF7A86602167;
        Tue, 14 Feb 2023 20:12:19 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1676405540;
        bh=noCE6VkN7ddLio1nO3NMu412fU762jc9R4pLENnEvD4=;
        h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
        b=Cj2y8nrrx/D35wge4zbwQLRnnvkBuyRse9sF5sWg1aQ4fNFvu/eWE27qSuQKPSGBK
         01uhBZBhvqJ+2c/FUTcoJgerQKIJzoQ6x/5W6q6dovWnipKnds8YJruIuuKtfcKHqR
         /0KlmjcfPFA/TiH+GHFk+kSXjtIIqbacpmzQxK2IEFOYOMOgjXRFZ7SlqvIOKi+lFJ
         wlTOLgKyEb5RnF7RWHG5hVt1Yx2j6SvYWvgWDNPh5+VZXj+KwpTS/DL59xOrhWHp5u
         GOV5h+IoH7gLbyrwFXsMWj0a+046dui7GJUCg08icOfbac+19/f8sm2lnhbsnH3cEN
         Zmt6wg8enYQ9w==
Message-ID: <9b4cec8a18d9cce377e7ad0bb7f8794c07ccf9b3.camel@collabora.com>
Subject: Re: [PATCH v11 0/6] Wave5 codec driver
From:   Nicolas Dufresne <nicolas.dufresne@collabora.com>
To:     Som Qin <som.qin@starfivetech.com>,
        Sebastian Fricke <sebastian.fricke@collabora.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Cc:     "kernel@collabora.com" <kernel@collabora.com>,
        "bob.beckett@collabora.com" <bob.beckett@collabora.com>,
        "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
        "nas.chung@chipsnmedia.com" <nas.chung@chipsnmedia.com>
Date:   Tue, 14 Feb 2023 15:12:10 -0500
In-Reply-To: <405b9c8f-707e-9009-dafc-277f48c30749@starfivetech.com>
References: <a336c17afc9143858fb9beb82aa800a8@EXMBX164.cuchost.com>
         <2829b86c409058fb566a6a398eedff96b76cf6fe.camel@collabora.com>
         <405b9c8f-707e-9009-dafc-277f48c30749@starfivetech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37) 
MIME-Version: 1.0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Som,

Le mardi 14 f=C3=A9vrier 2023 =C3=A0 15:11 +0800, Som Qin a =C3=A9crit=C2=
=A0:
> Sure we will share the test stream we met issue, via Wetransfer net=20
> disk. I'm not sure if this is a driver issue or a soc cache issue, it=20
> not occurs with any stream. Hope you can clarify it.

thanks for the stream, I have shared them internally with Sebastian who wil=
l
test them on his board (a TI board). We'll be able to confirm with you if w=
e can
also reproduce the issues there, and that will help regarding possible SoC =
cache
issues.

>=20
> It did run out the ram with h264_v4l2m2m if not do some modify, it=20
> should be due to alignment.

What LibreELEC dev told me is that in absence of V4L2_CID_MIN_BUFFER_FOR*
controls, ffmpeg will allocate too many buffers and cause ram issue. We wil=
l
have this implemented in later update, so hopefully this problem will go aw=
ay.

>=20
> p.s. are you interested in using 7110soc for verification? We can=20
> provide the board for it.

Can you provide a status of what has been fixed from the SoC revision found=
 on
BeagleV ? We stopped using the BeagleV for testing has it has SoC issue and=
 no
known workaround for.

regards,
Nicolas

