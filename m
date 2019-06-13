Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A062144ADD
	for <lists+linux-media@lfdr.de>; Thu, 13 Jun 2019 20:39:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728117AbfFMSjJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 13 Jun 2019 14:39:09 -0400
Received: from bisque.elm.relay.mailchannels.net ([23.83.212.18]:39224 "EHLO
        bisque.elm.relay.mailchannels.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727284AbfFMSjJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 13 Jun 2019 14:39:09 -0400
X-Sender-Id: dreamhost|x-authsender|brad@b-rad.cc
Received: from relay.mailchannels.net (localhost [127.0.0.1])
        by relay.mailchannels.net (Postfix) with ESMTP id 0D0003424EB;
        Thu, 13 Jun 2019 18:39:08 +0000 (UTC)
Received: from pdx1-sub0-mail-a91.g.dreamhost.com (100-96-28-110.trex.outbound.svc.cluster.local [100.96.28.110])
        (Authenticated sender: dreamhost)
        by relay.mailchannels.net (Postfix) with ESMTPA id 366EB342531;
        Thu, 13 Jun 2019 18:39:07 +0000 (UTC)
X-Sender-Id: dreamhost|x-authsender|brad@b-rad.cc
Received: from pdx1-sub0-mail-a91.g.dreamhost.com ([TEMPUNAVAIL].
 [64.90.62.162])
        (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384)
        by 0.0.0.0:2500 (trex/5.17.2);
        Thu, 13 Jun 2019 18:39:07 +0000
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|brad@b-rad.cc
X-MailChannels-Auth-Id: dreamhost
X-Company-Hook: 5bc3090f23cced6c_1560451147721_2898281503
X-MC-Loop-Signature: 1560451147720:2850210154
X-MC-Ingress-Time: 1560451147720
Received: from pdx1-sub0-mail-a91.g.dreamhost.com (localhost [127.0.0.1])
        by pdx1-sub0-mail-a91.g.dreamhost.com (Postfix) with ESMTP id C82BB7F9F0;
        Thu, 13 Jun 2019 11:39:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=nextdimension.cc; h=
        subject:to:cc:references:from:message-id:date:mime-version
        :in-reply-to:content-type:content-transfer-encoding; s=
        nextdimension.cc; bh=IAZEZWRTdjUeONkjgmbK4RBfhOo=; b=I5SsazVUOPF
        NmaGeJCUsU88JzlO6uoGZwe2nRM8/sTLrYn2dPthSs6ib3bqoIQIS/97wz2udLli
        Tdiv7i6PKG+oRvSV9LQccurH75tDSuW4alWDbgoPNEIgbnukXsIOZUxgw8bRbIdc
        U+m2hsvlWOmomJoYlyjSvqhtzAZlKAdw=
Received: from [192.168.0.21] (67-198-57-188.static.grandenetworks.net [67.198.57.188])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: brad@b-rad.cc)
        by pdx1-sub0-mail-a91.g.dreamhost.com (Postfix) with ESMTPSA id 2D32C7F9F1;
        Thu, 13 Jun 2019 11:39:04 -0700 (PDT)
Subject: Re: [GIT PULL FOR v5.3] Add Hauppauge DVB devices
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Brad Love <brad@nextdimension.cc>
Cc:     linux-media@vger.kernel.org
References: <20190613181447.16036-1-brad@nextdimension.cc>
 <20190613153507.4b6f95d3@coco.lan>
X-DH-BACKEND: pdx1-sub0-mail-a91
From:   Brad Love <brad@nextdimension.cc>
Openpgp: preference=signencrypt
Autocrypt: addr=brad@nextdimension.cc; prefer-encrypt=mutual; keydata=
 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
Message-ID: <ed0b49f2-15ef-19c1-fa1c-877956425bce@nextdimension.cc>
Date:   Thu, 13 Jun 2019 13:39:03 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190613153507.4b6f95d3@coco.lan>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-VR-OUT-STATUS: OK
X-VR-OUT-SCORE: -85
X-VR-OUT-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduuddrudehledguddvjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucggtfgfnhhsuhgsshgtrhhisggvpdfftffgtefojffquffvnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfghrlhcuvffnffculdduhedmnecujfgurhepuffvfhfhkffffgggjggtgfesthejredttdefjeenucfhrhhomhepuehrrgguucfnohhvvgcuoegsrhgrugesnhgvgihtughimhgvnhhsihhonhdrtggtqeenucffohhmrghinheplhhinhhugihtvhdrohhrghenucfkphepieejrdduleekrdehjedrudekkeenucfrrghrrghmpehmohguvgepshhmthhppdhhvghloheplgduledvrdduieekrddtrddvudgnpdhinhgvthepieejrdduleekrdehjedrudekkedprhgvthhurhhnqdhprghthhepuehrrgguucfnohhvvgcuoegsrhgrugesnhgvgihtughimhgvnhhsihhonhdrtggtqedpmhgrihhlfhhrohhmpegsrhgrugesnhgvgihtughimhgvnhhsihhonhdrtggtpdhnrhgtphhtthhopehmtghhvghhrggssehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedt
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,


On 13/06/2019 13.35, Mauro Carvalho Chehab wrote:
> Em Thu, 13 Jun 2019 13:14:47 -0500
> Brad Love <brad@nextdimension.cc> escreveu:
>
>> Hi Mauro,
>>
>> Here is my first pull request. Please be gentle :)
> :-)
>
> First problem:
>
> 	error: FETCH_HEAD: cannot verify a non-tag object of type commit.
>
> You should use branches and sign them with your gpg signature.


I will look into this now and do so going forward. Thanks.



> Patches applied, thanks!
>
> There are also a /12 patch series from you:
>
> 	https://patchwork.linuxtv.org/project/linux-media/list/?series=&submitter=7220&state=13&q=&archive=&delegate=


Cheers Mauro :)

The analog tuning series still has some changes requested. I'll be
moving on to it next.

Regards,

Brad



>> This adds support for Hauppauge HVR1955 and HVR1975 devices, along with
>> adding a vid:pid for a missing OEM Hauppauge 955Q variant.
>>
>> Cheers,
>>
>> Brad
>> ---
>> The following changes since commit 513dbd35b5d93c45fa7291147f21fc0227a9f999:
>>
>>   media: add SPDX headers to some files (2019-06-12 11:42:27 -0400)
>>
>> are available in the Git repository at:
>>
>>   git://linuxtv.org/brad/media_tree.git pr-5.3
>>
>> for you to fetch changes up to 24a620ad0b74d485a1e61d5babe043f59a0ddd57:
>>
>>   cx231xx-cards: Add Hauppauge 955Q variant (2019-06-13 12:27:57 -0500)
>>
>> ----------------------------------------------------------------
>> Brad Love (5):
>>       si2157: add detection of si2177 tuner
>>       pvrusb2: Add multiple dvb frontend support
>>       pvrusb2: Add i2c client demod/tuner support
>>       pvrusb2: Add Hauppauge HVR1955/1975 devices
>>       cx231xx-cards: Add Hauppauge 955Q variant
>>
>>  drivers/media/tuners/si2157.c                   |   6 +
>>  drivers/media/tuners/si2157_priv.h              |   3 +-
>>  drivers/media/usb/cx231xx/cx231xx-cards.c       |   2 +
>>  drivers/media/usb/pvrusb2/Kconfig               |   2 +
>>  drivers/media/usb/pvrusb2/pvrusb2-cx2584x-v4l.c |  25 +++
>>  drivers/media/usb/pvrusb2/pvrusb2-devattr.c     | 212 +++++++++++++++++++++---
>>  drivers/media/usb/pvrusb2/pvrusb2-devattr.h     |   1 +
>>  drivers/media/usb/pvrusb2/pvrusb2-dvb.c         |  88 +++++++---
>>  drivers/media/usb/pvrusb2/pvrusb2-dvb.h         |   5 +-
>>  drivers/media/usb/pvrusb2/pvrusb2-fx2-cmd.h     |   4 +
>>  drivers/media/usb/pvrusb2/pvrusb2-hdw.c         |  36 +++-
>>  11 files changed, 339 insertions(+), 45 deletions(-)
>
>
> Thanks,
> Mauro
