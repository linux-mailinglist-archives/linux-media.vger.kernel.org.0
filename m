Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 876AD46DED1
	for <lists+linux-media@lfdr.de>; Thu,  9 Dec 2021 00:02:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241047AbhLHXFd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Dec 2021 18:05:33 -0500
Received: from mout.gmx.net ([212.227.17.21]:44673 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237516AbhLHXFc (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 8 Dec 2021 18:05:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1639004515;
        bh=V+8G84Vx6wczHVef7YQlG8n0M7pr8IZWstrpOlGW9cI=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=gwVe9exWBXMw+33sfVzWWh7ghzLS4NtGtD66/9Hr1uj1nTq8cSe1iPA3NQn1+aKaX
         vl7oUw7vYo/IYfphKmtFbvxPTKBD2auP6ufV9by0hUfyFzKcSTiaziAywa/QfAKbnt
         mb9xbZuYvR478S2WDpkrm4vaKFzWq3kvO1ft001A=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [91.65.60.26] ([91.65.60.26]) by web-mail.gmx.net
 (3c-app-gmx-bap08.server.lan [172.19.172.78]) (via HTTP); Thu, 9 Dec 2021
 00:01:55 +0100
MIME-Version: 1.0
Message-ID: <trinity-8c68f148-355b-481f-8671-fb703307cb76-1639004515653@3c-app-gmx-bap08>
From:   Robert Schlabbach <robert_s@gmx.net>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linux-media@vger.kernel.org
Subject: Re: [PATCH RFC] media: si2157: optionally load firmare for
 SI2146_A10 and
Content-Type: text/plain; charset=UTF-8
Date:   Thu, 9 Dec 2021 00:01:55 +0100
Importance: normal
Sensitivity: Normal
In-Reply-To: <cd3a382dc39e72229a73149cb91e80cf69e2b07d.1638958947.git.mchehab+huawei@kernel.org>
References: <cd3a382dc39e72229a73149cb91e80cf69e2b07d.1638958947.git.mchehab+huawei@kernel.org>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:rnMDYYNhlGYc/FcGykecYqtoTlSBl4GNBzxPiw/Xhv0EI952wQr26HVAiTuhLE6fg1eBU
 8lXp51++y2FVgVl1ZlL0vojl/1Qj5mRA6PoXQ7OZmcy+wjhdKDqE0SFm8/qIWUw6fJe4YX3L9CG9
 bQG0MeKX4+TYhrcuMWYiAdLML6H4d6X3jdmE4mEJmqVs3C5C+8/JEt6ZETG8YUkaxwaihFRikCDi
 xATIGyfIbXhzKFk5uuYgJepzUqQMfz8LuSMIgR6URnHedN9ux5jMt+WRCr0Bsqc8DCozCglp/hxe
 Ns=
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:fDdmj5iSC18=:ZOiSXAZC43joS+BSX1mIkX
 2yh7dTw9N+rF31oaAQlDsxHg/NqURcwhrwC5L+VDAUAu5wB79fl828OFww8x3wlXHBbntO1JS
 ka9GBlux7JWEqym6L6VXE8r/hDOtfHvRrw8Fgj+APKeAxGJBJPRm/y+Bgbs9Qabbwtjc+dnUA
 HZ6R83o+YhpdgpXXD6PTS9eQsV/ALf2TH9cNjHz7nmTSY9YD6xJFLOtimCoHzdwYTDEV2dEYc
 U/5tc2oHV4gTRmxwKf3mhAJioeyc8ZbOcQdc4LS5g7Kv+1y4PtxlOwStfTjkoTpSdZQpW+jCA
 21Yq3t1fjP2vpktXuwUJAETznl7xYQolcYgs82noehM+zS7tZRPicRyg4nsvF6AsbG72EC7OF
 43isnpmWaeRQ7HulXVEYh6eFZ6/73eBjTfPMQOwMN95MKJHnX2cJ7e+ftKIYwT57TLP0Jc8Xf
 5fAdMJCVux8XyrsYvkmF4/RzBWxGlQg/3I4uPirhwSadpmytXU/2nhh6NtQoYgrv1zJ3XgVrt
 T+ROcW7L0OwMGHjlOA+P0wb3RSleUzE0vVnEAmFnd7Sh0YtM7X19/Z9ChHvtFcOfHc+RPXyLS
 bb1mg6/uoL+cIEXtFZOnwxxlCix2SZQ2AtLSfXmw4fl7Htrk0vkgkJDABaGVtUZZkqXgDSjb2
 +zpgpEOqYlhS6VvjlSFMpZFnHGztITlBdM2IQKbFUbrHLCKo/SvumDMDV6cWsVYinWr2bPwVl
 lCmwePkNO4nq4G1Y/oedAKtAWi6BwC10/WlQRCkoeMudJl5u3XRCi2TyXS03CO+HZLTiLrarW
 RKDcPic
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

> + case SI2146_A10:
> + fw_required = false;
> + fallthrough;
> case SI2141_A10:
> fw_name = SI2141_A10_FIRMWARE;
> break;

I don't think this form of firmware name aliasing is
a good idea. The SiLabs code has a dedicated source
file for the ROM patch for each tuner model, even if
some are binary identical.

And in this particular case, there are not even
binary identical firmware patches available for these
two tuners, so they definitely should NOT share the
same firmware filename.

So I propose having a clean 1:1 model <-> firmware
filename mapping. For si2157/si2177 and si2148/si2158
it's already too late, but we should not expand this
error even further.

More broadly, the SiLabs code actually matches the
applicable firmware patch to the rom_id returned by
the tuner. So if we wanted to do a real cleanup,
I would propose having a const struct table, e.g.

const struct {
    unsigned char part;
    unsigned char chiprev;
    unsigned char pmajor;
    unsigned char pminor;
    unsigned char rom_id;
    const char *  firmware_name
} supported_models[] = {
    { /*Si21*/41, 'A', 1, 0, 0x60, "dvb-tuner-si2141-a10-00.fw" },
    { /*Si21*/41, 'A', 1, 0, 0x61, "dvb-tuner-si2141-a10-01.fw" },
    { /*Si21*/57, 'A', 3, 0, 0x50, "dvb-tuner-si2157-a30-01.fw" },
(etc)
};

Best Regards,
-Robert Schlabbach
