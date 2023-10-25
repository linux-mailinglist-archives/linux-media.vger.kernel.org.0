Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 248847D6A2B
	for <lists+linux-media@lfdr.de>; Wed, 25 Oct 2023 13:30:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234738AbjJYLaU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Oct 2023 07:30:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233280AbjJYLaS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Oct 2023 07:30:18 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 142B8131
        for <linux-media@vger.kernel.org>; Wed, 25 Oct 2023 04:30:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=s31663417; t=1698233375; x=1698838175; i=wahrenst@gmx.net;
        bh=wzqK2t8zSwabKpehgNyCy4Qys97N7Wvcq9t1ZXelOTI=;
        h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:
         In-Reply-To;
        b=mqL21FPzXaG9UDjo9qx0YFtjUaeBhzkTqj9y8Lk2Esek0fapJaN5kfb6jkG9o7Bh
         M6cWqQppCdkxja0PT4JtKW9N+U5VoRwYEEDhU3Ocy1YZe+dUhMgtCdUC6VbN+zHYc
         H2zt7BEntQO6dZYfSQW55JMe2Tw8jTDo3T3FQe5FlcvGChbc0utLOv302lfFP2cz3
         YcyEWZta/5/iyZBejuoti7JTiMKA8EZ+f2YIMLbIZCms/kcWJ9P6NJbShKUc0gTav
         Gc50eo61BNQlzggHDtp3n276W5FD5qZC+uY2YgeY8aiZpDHbwVABb/nhLVKTG5dbC
         G4bKbODAR9ixtyWVbQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.129] ([37.4.248.43]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M3DJl-1qumCB34jl-003gar; Wed, 25
 Oct 2023 13:29:34 +0200
Message-ID: <baa56840-8270-4d4e-aec5-2e6ccc8a9bc4@gmx.net>
Date:   Wed, 25 Oct 2023 13:29:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/1] staging: vc04_services: Use %p4cc to print fourcc
Content-Language: en-US
To:     Umang Jain <umang.jain@ideasonboard.com>,
        linux-staging@lists.linux.dev,
        linux-rpi-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Phil Elwell <phil@raspberrypi.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     Stefan Wahren <stefan.wahren@i2se.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dan Carpenter <error27@gmail.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        "Ricardo B . Marliere" <ricardo@marliere.net>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
References: <20231025060717.71895-1-umang.jain@ideasonboard.com>
From:   Stefan Wahren <wahrenst@gmx.net>
In-Reply-To: <20231025060717.71895-1-umang.jain@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:IrkI2/n4fOM+fWg3bTBcGtjAWiONXUffbYvw5yNKS/T6R+tugQl
 mQlWd3hkuEj71C3imhFekLckYymOk1U3174Sww0busu2VJRbu2Jgq0jVV2HdBiENImzlDcM
 SgDBaxuWlkMMFNa9MixT9q/CkoLiW20nJibcMLffT0D1sGp7n69qmMFOPs7pQOZ894OCnyt
 s+acDm6JsJ9dR1P/CytvQ==
UI-OutboundReport: notjunk:1;M01:P0:dhXhY+7uJ1M=;3lbfaKuJ0gdva1ufQA3NnXtsjJ7
 MIkan6w2pgVUhI/Th1fWZkfJTgS4MtypA8KmcfUmfC6+KJNLrPemWFP7F/fh7EWqDkH16CH2E
 lT96nHmUVky4e79Apz7jyHC2mwGjWheK6eui9Rq5biZOAQlmM1EdZExBc+Ndr4M5H3MLjqNPm
 ad4i6g5V+Ip7vBjQg9ZRViy4xjIVhYvzqEeMauGArqQy+Nj9GaD77uWlrBkNxzm9bunyb6tsD
 IIFIqlXOGnGjrIFiDYCYkyA8ecCHi+OPICdWuNwPkhHAaI6Arr3ZSbLZfhtJ/E4vqPspuB57w
 CEL3/O1JQHXtSZMsEvObmH00Fm8M+7SPGHWU1LcysuZF5EAp9PY+ApSyeDo8f/q2Dmf+tCWll
 QOW3J1kq9QSybSOyixrSe6zxGZxXFIoEZQ9S5cQrtW2HjI/4l0uwqtIPs8n/dj1CVB7sXPBGW
 UJQsUTNYl/uup8WI7o14yX62eag9bK7wBWiaFJIkBOFBUr/Vtqlrre8E+mD7IfBv3+M8qVlrC
 p0hZ9i5bDUe2pvaVvqUchIYCtxy4Y7Kh1zBwqm8dXS2N99FW+aJFroxpRrysdUHxyH+NnyjxL
 LWsTZZL/9oO0vS4590b6Ot/dILD2PIBBVtckIjiV0EKn2FKzVCwUWLEIK28Pwzq7hYJUli3e2
 pIbcQssi8p83jZHgA3AOMoJRIB43y1qWsNt5v8Qhzw4mAtKbRuBOO+hJdT+nHSa5adHvIgUWV
 HxXJVLadWtCfqS8ADzgR31Ha5jKT4+adY1UxbIKLlFMGrKeG9X7g3LHuHUm7y1fJvPWUBIUfF
 8YsEHABulT3MevfKf7yPfKQYbB0LSUh8BCfVmxTRB+TNWsfQ9o0aq4/AZbUdxalUZQMzIDwjp
 G+/8qRy4hMeYoM5QxnlnpKJ6VMUhnHCkexlTrZqLNtaAYjWLalxzXLT0hr+ZzfOa0dExpzm03
 Br/rd+TV6sWWQeOntP8j7VfcNRQ=
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

[add Raspberry Pi guys]

Am 25.10.23 um 08:07 schrieb Umang Jain:
> The following patch drop VCHIQ_FOURCC_AS_4CHARS macro in favour of %p4cc
> format modifier to print FourCC codes in the logs.
>
> *Before this patch*
> `mailbox: vchiq_core_msg debug: Sent Msg DATA(5) to AUDS s:1 d:62 len:20`
>
> *After this patch*
> bcm2835_vchiq 3f00b840.mailbox: vchiq_core_msg debug: Sent Msg DATA(5) to SDUA little-endian (0x41554453) s:1 d:62 len:20
>
> The inversion of AUDS to SDUA as per usage of %p4cc
> Does it hamper readability ? Feedback is appreciated.
looks good to me. Any concerns Phil or Dave?
>
> As documented in the commit message, the 'entity' char array length is
> increased to hold more characters for the log output. Not doing so,
> causes kernel stack corruption at runtime.
>
> Based on top of:
> - [PATCH v2 0/8] staging: vc04: Drop custom logging based on printk
>
> Umang Jain (1):
>    staging: vc04_services: Use %p4cc format modifier to print FourCC
>      codes
>
>   .../interface/vchiq_arm/vchiq_arm.c           | 20 +++++-----
>   .../interface/vchiq_arm/vchiq_core.c          | 40 +++++++++----------
>   .../interface/vchiq_arm/vchiq_core.h          |  6 ---
>   .../interface/vchiq_arm/vchiq_dev.c           |  7 ++--
>   4 files changed, 33 insertions(+), 40 deletions(-)
>

