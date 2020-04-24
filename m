Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10BBD1B81D7
	for <lists+linux-media@lfdr.de>; Sat, 25 Apr 2020 00:00:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726090AbgDXWAq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Apr 2020 18:00:46 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:8834 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725874AbgDXWAp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Apr 2020 18:00:45 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5ea361170001>; Fri, 24 Apr 2020 14:58:47 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Fri, 24 Apr 2020 15:00:45 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Fri, 24 Apr 2020 15:00:45 -0700
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 24 Apr
 2020 22:00:45 +0000
Received: from [10.2.165.152] (10.124.1.5) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 24 Apr
 2020 22:00:43 +0000
Subject: Re: [RFC PATCH v10 6/9] media: tegra: Add Tegra210 Video input driver
To:     Dmitry Osipenko <digetx@gmail.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <frankc@nvidia.com>, <hverkuil@xs4all.nl>,
        <sakari.ailus@iki.fi>, <helen.koike@collabora.com>
CC:     <sboyd@kernel.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <1587700513-28449-1-git-send-email-skomatineni@nvidia.com>
 <1587700513-28449-7-git-send-email-skomatineni@nvidia.com>
 <3155e0d2-94b0-6e0a-bf35-b3560c201039@gmail.com>
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
Message-ID: <fffc09d1-a25f-2d6e-83bd-f7657dd2ff16@nvidia.com>
Date:   Fri, 24 Apr 2020 15:00:42 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <3155e0d2-94b0-6e0a-bf35-b3560c201039@gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1587765527; bh=FpcOx6PfCadj3eE4qyv+7F6UJr7IJK3I60weagCPMHA=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=OcI9iHqBAt3zPDERTFGnL2DLtT5l+Ros3tkaBJ+lIiz2wCqoottbppfxw2J5GUIt0
         6vqKxZu+WuaHwKEKrDuOtPHlrDLz1eIe+c8D0mDzO9LTkZf3nEpJpodJhQVoXCKCiv
         llf+ryHkBozJqOMG2ThsHFRwTaxOqfnvVRVOvA7O3UvvTLzGyeAItPpnhyxHn0Wlq3
         Tu0aLbLNQbSHOPf2vWWPERAWU6FXUsx/7dRG7rvaMDgxsfqa7aF/6L6/9SRPG1WI92
         vMaEtoNzttKGX+64ZrVFUoZLHvuWJVIULkt0/CcysFySq1tqXyaS9Tr8bDtxOHcjx8
         b48E17i3xbdqg==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 4/24/20 8:07 AM, Dmitry Osipenko wrote:
> External email: Use caution opening links or attachments
>
>
> 24.04.2020 06:55, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>
> Is this driver compiled as a single kernel module file?
>
>> +MODULE_AUTHOR("Sowjanya Komatineni <skomatineni@nvidia.com>");
>> +MODULE_DESCRIPTION("NVIDIA Tegra CSI Device Driver");
>> +MODULE_LICENSE("GPL v2");
> ...
>> +MODULE_AUTHOR("Sowjanya Komatineni <skomatineni@nvidia.com>");
>> +MODULE_DESCRIPTION("NVIDIA Tegra Video Input Device Driver");
>> +MODULE_LICENSE("GPL v2");
> I don't think that these macros are needed in that case.
> The video.c should be enough, isn't it?
yes these can be removed
