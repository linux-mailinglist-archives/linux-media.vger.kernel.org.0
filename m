Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6093F6710CB
	for <lists+linux-media@lfdr.de>; Wed, 18 Jan 2023 03:07:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229878AbjARCHV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 Jan 2023 21:07:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229895AbjARCHK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 Jan 2023 21:07:10 -0500
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D4DB53555
        for <linux-media@vger.kernel.org>; Tue, 17 Jan 2023 18:06:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nurfuerspam.de;
        s=s31663417; t=1674007605;
        bh=M1Q2WaJ+aIJkB17srQ2BRKqSt2vDIe5Vq8cHsdIZw+0=;
        h=X-UI-Sender-Class:Date:Subject:To:References:From:In-Reply-To;
        b=VlbP8VVqoQhBzJpMKhd+Rx3u9s+ySAKR8QnEH/g7xNcd5wor+55EKsykhGC1RX86s
         FF6Q4Ln9JKIrI3bFr/Jv4EDqB3Z9cMJ0BNU+e0UXma9ZFqmi9KIOCuTOeRZOyuABlq
         vpW7W4kfarhV3II7sClDzGdmO7+Qjrm2lrvNUF/q5XUK6HYO9PzVFs+DbBvqdLjFaX
         qA+SlA2UqDsofIudClkMelAFbm5IBaxvtXeEv0njZB5Vd/LhPqaVzwAa9eD7ykDhvf
         VnZst4bHX81fo6fN8DHXDsDw7mbAt6u8FdRah+0KPE4neXSUywR9xGspChOS6tHdnL
         rleg5sQuWeQIg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [127.0.0.1] ([185.101.174.106]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MqJqN-1ovIbG0SkV-00nPOe for
 <linux-media@vger.kernel.org>; Wed, 18 Jan 2023 03:06:45 +0100
Message-ID: <0b085009-2301-7980-dc23-030df97defc9@nurfuerspam.de>
Date:   Wed, 18 Jan 2023 03:06:44 +0100
MIME-Version: 1.0
Subject: Re: [PATCHv2 00/16] staging/media: remove most deprecated drivers
Content-Language: de-DE, en-US
To:     linux-media@vger.kernel.org
References: <20230111112418.687882-1-hverkuil-cisco@xs4all.nl>
From:   Stefan Herdler <herdler@nurfuerspam.de>
In-Reply-To: <20230111112418.687882-1-hverkuil-cisco@xs4all.nl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:brqhFL5rpxRNj0c/tbZDtrCe/1hoi7Qq3gVA3F9Rlz7+PmEHQ6G
 YOKWyVjEe2ead4YAT40LqreLvikLopDWmev4pjnbIoNlQG7ZMDXg+SYLujLR2meXFdzWS4U
 GqKEjj6NgH5PrJ4SUOGvaosHcBHrhbG2oYf5uyRav/ciTHLgQfQenRu4XZA3qPi64MsWgZQ
 1QYlX/POUdGr+Fc4GnPCw==
UI-OutboundReport: notjunk:1;M01:P0:E7GblCIfKVU=;UAIMizZjvMawAC3B9C0UfqOc002
 0wtGmVg+7oBtEuzPJSfdGxIiyZ+intBPQ8RHMtBRqfuz/geebNUuIJYKuPBXREyiwhwFM5ZBG
 ieiKbLkaaRpYoAn5v5wUUdCsNr5650i5vF6oscDSTawYOwuu01VYZEgH25IpC8X3Xu6d8K3zG
 yAeDDEHJuWZVG8AW7/UWEQrR6mL4Mwcsy1DL0Uiv7bJKv7aN8mCbedUW/Z4tHCx+OB+ZWmSa0
 qVRonc+lmdXUVTiZgR66pOS/OVx8Eo/hjhKu3Eg0tjrkmnSWjEMZCFNYPolxhr546w0p5VH5e
 MuvJ1XRMgpiOM+v9CO0vDHbcm+49jcDsQeKh+kmMeyM6+eDLM30dF1wWcidSzxJThBqPO6OaB
 An0oTvdf04MlPa6EKESP1vdTMj1zACoyuVGIDzcHX3C6so8dH5loku/cFmSwUXIVhtZvSeJ+4
 xcrKWfemBX2urbQ25tqKl/qhzKJ4bL/D6htmBFvZvoKUsTsIUUcvCfXzOW2QaQ0L5PD5sW3kQ
 CtEnaX8WEj6HfDOQNDQ6UVkyrepk8Wg0uMyKQ8D0JPz0ZTIVDtlD6Rsw/tMJxIQbaYkNRH0FR
 uQn4xaRN+cP8I10aE7Q834vK5PHaoWRcsu+l2HD6NYV9TCQwkGf1O9BQsQhUqsBIw6Vb22/4+
 zldLHIQLr/7XjfIAtnXTp/2IIOLbLJin+2tyi4p20NSEKqT1Osp5EPRTmPqAMTKO58VrBj1iZ
 PfipL1rTp4GF8AcBU3pRP53Kpn/gtEWqLKsF6sCDlsJIk3CiFk55AhzpRhVBgfuclMpMvDcTB
 Gki34w/ZrZrzw9vq2up3oaxU1A4+xyxQI8qisvZo6+48qtQqz+wU4O3HMKiKLULV18jgWMWBy
 1YjIruwDcSjhm7I9TBWwph7BJ3nKTDhV9K8TsRLxoNqpSFfKE6JqN0RNmEFmZ27YA3VE92IGf
 o/hk3g==
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,URIBL_ABUSE_SURBL
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

- Some user feedback about ttpci and ttbudget removal...


Hi everyone.

First I have to apologize for the late reaction and hope it is not too
late now.
I'm primary a user and normally not subscribed to this list.
I just got aware of the possible removal of the ttpci and ttbudget
driver by a thread in the german "vdr-portal.de" forum (1).

I own a several different of the SAA7146 based cards and use them daily
in my VDR-system.

In germany many channels are free-to-air in the DVB-S version only.
DVB-S-Cards are still useful today, at least in combination with a
DVB-S2 Card.
Just like DVB-C and DVB-S2 Cards, AFAIK are their capabilities still up
to date.
Only the DVB-T cards are already obsolete (al least in germany).

My system contains different types of DVB-S/S2 cards, SAA7146 based and
others. All carefully selected to have mainline kernel support.
I never expected the tt* drivers will be removed so early.

Replacing the SAA7146 is not a real option.
DVB-cards with kernel support are rare, still expensive and now a days
hard to obtain too. And I don't want to scrap working hardware.
My plans are to use this cards as long as the DVB-S situation doesn't
change. That will be at least 2 more years.

The SAA7146 cards were very popular in the VDR-Community, there must be
more users out there.
I suspect, most of them will notice the driver removal, when the cards
stop working after a update.

Initially I thought an API upgrade is not a big deal, but it seems to be
a mayor change to the driver. Unfortunately that exceeds my skills.
But I may provide help with testing on the DVB-S FF and budget-cards if
desired.



Best Regards
