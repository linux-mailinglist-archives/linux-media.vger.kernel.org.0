Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 988BF7D6A11
	for <lists+linux-media@lfdr.de>; Wed, 25 Oct 2023 13:27:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234913AbjJYL1Y (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Oct 2023 07:27:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234859AbjJYL1R (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Oct 2023 07:27:17 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B584618C
        for <linux-media@vger.kernel.org>; Wed, 25 Oct 2023 04:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=s31663417; t=1698233209; x=1698838009; i=wahrenst@gmx.net;
        bh=MgAJIP/UDMbDxFfmZqV25xqbbm+/RhMgGyvZIltdY8g=;
        h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:
         In-Reply-To;
        b=cLhu3mC9pCSsH1b+ZDdKfHC37CtBxOEQUpgV1s3WnQ/w5MGbDRjv32h/YfCZMxxB
         yOu+L6NvekWEMs1wV6WxI41dLf9DlJusTZB0u6Vm832iwBsDtyB7m0vVukWh37e+L
         AQig7UUfOfXiCTkzlXn1Uk/9X3KwxzN21NH0O56gbKjA5Se6N7GqrusAWCq7d0TlL
         9C5Cc5eY43vZ2CZQPW3YC0lA7bNZzyDqlV3F7VPuUfLu64YAlDoqh2CVjuQVsVPWQ
         /rdnwReoqwqau5smChJKB0pcG+PK7qtvR6CeZw17FVBTTJwZRkNXUqWFoNS0wc1+9
         ECrOmdzPaPQNTKsagA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.129] ([37.4.248.43]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MDysm-1qnsnF12wO-009uER; Wed, 25
 Oct 2023 13:26:49 +0200
Message-ID: <d2de83ea-2c6c-4852-a7cb-e385defc6954@gmx.net>
Date:   Wed, 25 Oct 2023 13:26:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] staging: vc04_services: Drop completed TODO item
Content-Language: en-US
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Umang Jain <umang.jain@ideasonboard.com>,
        Phil Elwell <phil@raspberrypi.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     linux-staging@lists.linux.dev,
        linux-rpi-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Stefan Wahren <stefan.wahren@i2se.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Dan Carpenter <dan.carpenter@linaro.org>
References: <20231025103300.340572-1-umang.jain@ideasonboard.com>
 <20231025103300.340572-3-umang.jain@ideasonboard.com>
 <20231025104630.GB481@pendragon.ideasonboard.com>
From:   Stefan Wahren <wahrenst@gmx.net>
In-Reply-To: <20231025104630.GB481@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:CL54em2qZcNnh48/XB3ciQBwNNQhCT1+4klV+JOWQk8prFLu6fH
 GfU9oUOYhYqgkbjpwUX3bJAuLDkJ8Tvri5YXqNUVVH2Scz8Qq4ZCoB+hqwdmm5z4Mzxq+pU
 jhikkskrLs280plgitaehj+9OElHTDhb7C+TURn+3kxaMZpvWBGCqhsuIvNtRB4w0VlN6lS
 gt+uxVNdyD/+R57/Ju6jw==
UI-OutboundReport: notjunk:1;M01:P0:9gkLOqFKsXQ=;y1Kn4kguwIjRmw2SgTIcz/p/uf8
 zbGfeIwNhMXlwCgS2eMYtgMRn00jt/lkL2eYOt7WfpQ12B5P/PW9zOYXh9M2qifxayMoVr+Fw
 sXW5JeazLR5NBn0iiwY8l2uUAerXIWgife1I/+BarOmkMrmYOCnRFO+CctAHIbr68ztae/Dx5
 bgbctvXMM3QwoAEqSC2604x3OXUyZglYFJiTBOkwjL2KJ0FUm17aQUmaOzIUWqimoM/CjtniX
 7qCwTrr0fzald3yn78IzmNn2y81rMaOQb5H6j/vbjNo2Mqz16itLK7qFlGuvqrmoaOlmLvPSQ
 E0X4krnltSi3g2Hog2YYXM6/lhYnf64ydbquBcXTpkifQgn4IqHPzmn4coCfRZSZgW+ffNhbW
 lNCisJk217JeRZl9JkuB7367PzgqmZwJLp5eEkxgEjBoWqS9sZ0dEmo+xnfH//kXPR2sKQ/tw
 6jNiFkZ0GoBspJOM3cKhhWDgPBjbZM1e28SfZBt0Jv8uPRUuTu9aN9/4RCgrwkEd/jXO5xKGy
 sOdORkow+9tKkuPQMg1QtjgoJptkIEtBE7iYpQndL/n9aW4J9i9yf8OFsHxIOQNrpVq/3vDeD
 3G5wiEWPzQY/yN9lTRk8QcdXjMDFvvywV6/gTjW8atcO/oId+SDGSMfyDijcFOjTPT0ndlqDk
 HMJOF0xuobQadSD++vw6Bh2AvBftlg7Z46NM+ngoV6NXSmYpi2u1ucTKTUjk9EWi1H8xI7N0A
 Plz/AvC6wH3tnTMgL2R1/8Ir4RYWqOGmBrnW3aI1kKm+UdMSJdVHGbX6ZHsqYl/WeHLkg3mf4
 X5
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

[add the Raspberry Pi guys]

Am 25.10.23 um 12:46 schrieb Laurent Pinchart:
> On Wed, Oct 25, 2023 at 06:33:00AM -0400, Umang Jain wrote:
>> Memory barries and remote_event_*() are documented.
>> Drop the TODO item related to them.
>>
>> Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
>> ---
>>   drivers/staging/vc04_services/interface/TODO | 7 -------
>>   1 file changed, 7 deletions(-)
>>
>> diff --git a/drivers/staging/vc04_services/interface/TODO b/drivers/sta=
ging/vc04_services/interface/TODO
>> index 9c79ed549831..2d51f6928e0f 100644
>> --- a/drivers/staging/vc04_services/interface/TODO
>> +++ b/drivers/staging/vc04_services/interface/TODO
>> @@ -33,13 +33,6 @@ such as dev_info, dev_dbg, and friends.
>>   A short top-down description of this driver's architecture (function =
of
>>   kthreads, userspace, limitations) could be very helpful for reviewers=
.
>>
>> -* Review and comment memory barriers
>> -
>> -There is a heavy use of memory barriers in this driver, it would be ve=
ry
>> -beneficial to go over all of them and, if correct, comment on their me=
rits.
>> -Extra points to whomever confidently reviews the remote_event_*() fami=
ly of
>> -functions.
>> -
from my point of view this part is done.
> Is vchiq so timing sensitive that it can't afford spinlocks ?
Sorry, i cannot answer this question. Maybe Phil or Dave?
>
>>   * Reformat core code with more sane indentations
>>
>>   The code follows the 80 characters limitation yet tends to go 3 or 4 =
levels of

