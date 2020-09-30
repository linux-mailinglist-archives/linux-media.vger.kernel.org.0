Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C8D227F0EF
	for <lists+linux-media@lfdr.de>; Wed, 30 Sep 2020 19:57:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727468AbgI3R5F (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Sep 2020 13:57:05 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:14199 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725372AbgI3R5E (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Sep 2020 13:57:04 -0400
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5f74c68a0001>; Wed, 30 Sep 2020 10:55:22 -0700
Received: from [10.2.161.235] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 30 Sep
 2020 17:57:03 +0000
Subject: Re: [PATCH v1 2/2] media: tegra-video: Allow building driver with
 COMPILE_TEST
To:     =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
CC:     <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <hverkuil@xs4all.nl>, <linux-media@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>
References: <1601434958-29305-1-git-send-email-skomatineni@nvidia.com>
 <1601434958-29305-3-git-send-email-skomatineni@nvidia.com>
 <20200930173442.GC12964@qmqm.qmqm.pl>
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
Message-ID: <515ed18f-3849-3f36-78f5-916e40e1501b@nvidia.com>
Date:   Wed, 30 Sep 2020 10:59:56 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200930173442.GC12964@qmqm.qmqm.pl>
Content-Type: text/plain; charset="iso-8859-2"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1601488522; bh=1+zI+9FOTgFghS9LidSO0Q3MfBnPNIrwHYASCdluZW0=;
        h=Subject:To:CC:References:From:Message-ID:Date:User-Agent:
         MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding:
         Content-Language:X-Originating-IP:X-ClientProxiedBy;
        b=iXnYvRVqWufqZcP3tevl8usR4BCPiMpVf66NJJwkhzJfvTsNQWnbc+DHGM/3tj7SF
         WNOjUIQdUh9SkGyMeXWG/Ff+TCUkYBBKUUwwbP2sjxvDJ9K1UXD98stdfUB+CY5RX2
         AMjey5Lu99hGHZJDcB0TBd8Mi5xskvT06KN+PFZl10F/gzxF0Lop9K9Oiqp+vWW3Xn
         FObWK6VYnz56jn0/EVU1I2ucqf8Xki3q8faPy6yDgvYUM0eFUJbll4Zypg6H8yctjB
         eA2ykDBk3Kvp3umLJA2pAzxxxfAMUyomEq1urQzwx0A6+T8TJoLMer+gi8p+VKciwP
         tt0Y/b6Uo7CrQ==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 9/30/20 10:34 AM, Micha=B3 Miros=B3aw wrote:
> On Tue, Sep 29, 2020 at 08:02:38PM -0700, Sowjanya Komatineni wrote:
>> This patch adds COMPILE_TEST option to Kconfig to allow building
>> it with COMPILE_TEST option.
> Does it build without TEGRA_HOST1X selected? Isn't the previous patch
> enough to allow the build with COMPILE_TEST?
>
> Best Regards,
> Micha=B3 Miros=B3aw

No, it does not build without selecting CONFIG_TEGRA_HOST1X along with=20
CONFIG_VIDEO_TEGRA

