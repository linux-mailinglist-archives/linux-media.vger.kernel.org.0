Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 12F051664D3
	for <lists+linux-media@lfdr.de>; Thu, 20 Feb 2020 18:29:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728639AbgBTR3N (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 Feb 2020 12:29:13 -0500
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:15099 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728115AbgBTR3M (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 Feb 2020 12:29:12 -0500
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e4ec1c60001>; Thu, 20 Feb 2020 09:28:38 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Thu, 20 Feb 2020 09:29:11 -0800
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Thu, 20 Feb 2020 09:29:11 -0800
Received: from [10.2.163.58] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 20 Feb
 2020 17:29:11 +0000
Subject: Re: [RFC PATCH v3 4/6] media: tegra: Add Tegra210 Video input driver
To:     Hans Verkuil <hverkuil@xs4all.nl>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <frankc@nvidia.com>,
        <helen.koike@collabora.com>, <sboyd@kernel.org>
CC:     <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <1581704608-31219-1-git-send-email-skomatineni@nvidia.com>
 <1581704608-31219-5-git-send-email-skomatineni@nvidia.com>
 <b301c247-537d-d78e-b057-a3225b10de7e@xs4all.nl>
 <dc592f29-3109-d10c-7df7-ffdb2755ade0@xs4all.nl>
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
Message-ID: <9dc0a5a6-af2c-f84f-298f-2c16a9c2bb0c@nvidia.com>
Date:   Thu, 20 Feb 2020 09:29:19 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <dc592f29-3109-d10c-7df7-ffdb2755ade0@xs4all.nl>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1582219718; bh=nx1Sr0EKixZLUgshUzVM6e0KzOAURHBiDUNPYMB5sPg=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=pbYRTskJJUref7EGSEcJ5K6ZVOYBkfwD6fMc5PvkRHqFuwhLUgsJcn4GohE+n+0PA
         XHZS+2g3WsaeWmYw+KZUtB27sSmKAyblJklinJ0xC8Vur8mhKHD4P77+2ISw7EctDC
         hn6W0P/nW8JFbN0wD9QogBUUBFyd4yPPfQKsXCxZZmboKeQuL4IPaNj4JSnzhX5fkC
         cTIIUgBSVlDzDyYB0DUaPwlFZthH76lova4BBZ9HOPzVA5mM4rI7XYnd/m6Xg4sIN7
         OawXFq4rArM2BpbyzZwSUAjGScZCbKLudOx9B2j6kpwhjo+ntQNt9nKXZJkqYq2cmi
         XFiYMN/H6QWdA==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Sure, Will update in v4.

On 2/20/20 5:33 AM, Hans Verkuil wrote:
> External email: Use caution opening links or attachments
>
>
> (Replying to myself so I can explain this a bit more)
>
> On 2/20/20 1:44 PM, Hans Verkuil wrote:
>>> +
>>> +static int tegra_csi_tpg_channels_alloc(struct tegra_csi *csi)
>>> +{
>>> +    struct device_node *node = csi->dev->of_node;
>>> +    unsigned int port_num;
>>> +    int ret;
>>> +    struct tegra_csi_channel *item;
>>> +    unsigned int tpg_channels = csi->soc->csi_max_channels;
>>> +
>>> +    /* allocate CSI channel for each CSI x2 ports */
>>> +    for (port_num = 0; port_num < tpg_channels; port_num++) {
>>> +            item = devm_kzalloc(csi->dev, sizeof(*item), GFP_KERNEL);
>> Using devm_*alloc can be dangerous. If someone unbinds the driver, then
>> all memory allocated with devm_ is immediately freed. But if an application
>> still has a filehandle open, then when it closes it it might still reference
>> this already-freed memory.
>>
>> I recommend that you avoid using devm_*alloc for media drivers.
> A good test is to unbind & bind the driver:
>
> cd /sys/devices/platform/50000000.host1x/54080000.vi/driver
> echo -n 54080000.vi >unbind
> echo -n 54080000.vi >bind
>
> First just do this without the driver being used. That already
> gives me 'list_del corruption' kernel messages (list debugging
> is turned on in my kernel).
>
> Note that this first test is basically identical to a rmmod/modprobe
> of the driver. But when I compiled the driver as a module it didn't
> create any video device nodes! Nor did I see any errors in the kernel
> log. I didn't pursue this, and perhaps I did something wrong, but it's
> worth taking a look at.
>
> The next step would be to have a video node open with:
>
> v4l2-ctl --sleep 10
>
> then while it is sleeping unbind the driver and see what happens
> when v4l2-ctl exits.
>
> Worst case is when you are streaming:
>
> v4l2-ctl --stream-mmap
>
> and then unbind.
>
> In general, the best way to get this to work correctly is:
>
> 1) don't use devm_*alloc
> 2) set the release callback of struct v4l2_device and do all freeing there.
> 3) in the platform remove() callback you call media_device_unregister()
>     and video_unregister_device().
>
> It's worth getting this right in this early stage, rather than fixing it
> in the future.
>
> Regards,
>
>          Hans
