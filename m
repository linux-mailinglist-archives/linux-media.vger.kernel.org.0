Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CBCC71A0006
	for <lists+linux-media@lfdr.de>; Mon,  6 Apr 2020 23:15:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726303AbgDFVPq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Apr 2020 17:15:46 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:2183 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725933AbgDFVPq (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Apr 2020 17:15:46 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e8b9bcd0000>; Mon, 06 Apr 2020 14:14:53 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Mon, 06 Apr 2020 14:15:45 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Mon, 06 Apr 2020 14:15:45 -0700
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 6 Apr
 2020 21:15:45 +0000
Received: from [10.2.164.193] (172.20.13.39) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 6 Apr 2020
 21:15:42 +0000
Subject: Re: [RFC PATCH v6 6/9] media: tegra: Add Tegra210 Video input driver
To:     Dmitry Osipenko <digetx@gmail.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <frankc@nvidia.com>, <hverkuil@xs4all.nl>,
        <sakari.ailus@iki.fi>, <helen.koike@collabora.com>
CC:     <sboyd@kernel.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <1585963507-12610-1-git-send-email-skomatineni@nvidia.com>
 <1585963507-12610-7-git-send-email-skomatineni@nvidia.com>
 <200bb96e-2d07-764f-9e14-55538dc742fd@gmail.com>
 <23bfab09-b464-6e51-9843-06d13000e9b9@nvidia.com>
 <be77b0ef-d605-8357-4180-f40b2886d07a@gmail.com>
 <08cd31d5-e8b9-4d3a-fb0e-0e4462947d96@nvidia.com>
 <12a834ac-52b1-6dc0-7d3a-3e6a1fa85a2a@gmail.com>
 <e3712e7b-b335-b35b-a94f-24eb85122dca@nvidia.com>
 <b1726d33-0d35-9323-a747-407148d0104e@gmail.com>
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
Message-ID: <eb80178f-30f4-8f46-51cd-ea3f4914b81d@nvidia.com>
Date:   Mon, 6 Apr 2020 14:15:41 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <b1726d33-0d35-9323-a747-407148d0104e@gmail.com>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1586207693; bh=Kv75TubSJj0DHZzF3UwZ3SfwFPRT0XtEK+o2p9OzCz4=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=qKfh1vjprU5DhAD9bO0W5nWhBdQ/7A3WJiOluJIV3WPbx5nntDAPt+OLiYco5+Pa7
         I1S6i43+TOw6LxOnCGcy4OLg+6QKK33sSLwQguucce3kOEJvbMYR6iZme54RoCiLar
         e1c99kmX6S6cqT8/22v2AUb9P24brCJ5jN8JimzUBsEGRSjAMpV6mAGXUb0I38wYBN
         FEn80MqSadiBUqW2SLHDzcLmAlMfFJYe00l0tXLqKXewx8DksRYxjdApnpG02UvhZR
         D7N53eWes7r7Kxx4A7TSw46SWTr4dJ/j+SiDsY8gbNlHypoxwmwEzyVelku3CG3VPv
         7QI2a7EUT5/cQ==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 4/6/20 2:11 PM, Dmitry Osipenko wrote:
> External email: Use caution opening links or attachments
>
>
> 07.04.2020 00:02, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>>>>> Am I understanding correctly that this thread will take 100% CPU,
>>>>>>> spinning here, if more than 2 frame-captures queued?
>>>>>> on more than 2 frames captures, it breaks thread and on next wakeup =
it
>>>>>> continues
>>>>> The wait_event() won't wait if condition is true.
>>>> condition is checked when waitqueue is woken up
>>> https://elixir.bootlin.com/linux/v5.6.2/source/include/linux/wait.h#L46=
2
>> process is put to sleep until the condition evaluates to true or signal
>> is received.
>>
>> condition is checked each time the waitqueue head is woken up.
> This is a wrong assumption in accordance to the code.

when every buffer is available as long as we are in streaming, we should=20
process it.

So if wake up happens when list has buffer, it will be processed but at=20
a time we limit processing 2 simultaneous buffer capture starts only.

