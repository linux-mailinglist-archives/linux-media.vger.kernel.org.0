Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7A26A1944FF
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2020 18:04:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727717AbgCZREF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Mar 2020 13:04:05 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:8681 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726401AbgCZREF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Mar 2020 13:04:05 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e7ce0760004>; Thu, 26 Mar 2020 10:03:50 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Thu, 26 Mar 2020 10:04:04 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Thu, 26 Mar 2020 10:04:04 -0700
Received: from [10.2.160.81] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 26 Mar
 2020 17:04:03 +0000
Subject: Re: [RFC PATCH v5 6/9] media: tegra: Add Tegra210 Video input driver
To:     Sakari Ailus <sakari.ailus@iki.fi>
CC:     <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <frankc@nvidia.com>, <hverkuil@xs4all.nl>,
        <helen.koike@collabora.com>, <digetx@gmail.com>,
        <sboyd@kernel.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <1584985955-19101-1-git-send-email-skomatineni@nvidia.com>
 <1584985955-19101-7-git-send-email-skomatineni@nvidia.com>
 <20200325110358.GB853@valkosipuli.retiisi.org.uk>
 <a219aeb2-3d00-016e-eed9-503a9fbd0d13@nvidia.com>
 <20200326144820.GB2394@valkosipuli.retiisi.org.uk>
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
Message-ID: <927e0263-38b4-4502-f2ad-ab76f31412e4@nvidia.com>
Date:   Thu, 26 Mar 2020 10:04:02 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200326144820.GB2394@valkosipuli.retiisi.org.uk>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1585242231; bh=ArIq0uQfFAe5fhuSNbr2KiN+eIVzFbu+br9BrixrP1c=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=gs3bJfO5d/ogtrFvlXEV5q+y4otlWnnyxl0dWXESAteNwOC1RBhxufltT7vcZEN88
         80RtkFvKzwrl2YYayEd0D6EccKh0YhjMphzjaETqAaXH4iBuC4H5rmJu9Y1WXbT2E1
         VH0axj8t8rrswd7X8q3qN+QbEp9YgSGZxQsDSJ5s62UkdZnRPvgwsfnZUon4bXMU1o
         uu1Uv2FbYosRYtDrIJs3LMWZoOQ8Fi+gEyajt/ilcvPexEItxvyrPK1Ukat6R9x2EJ
         YZVIT6o4YaWC1MSaP+OFaK+vlARoy27UaqhUpBAymErZGk1rPreU8a5EJvHu886Qks
         L+R7mhOHtQojQ==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 3/26/20 7:48 AM, Sakari Ailus wrote:
> External email: Use caution opening links or attachments
>
>
> Hi Sowjanya,
>
> On Wed, Mar 25, 2020 at 11:30:18PM -0700, Sowjanya Komatineni wrote:
>> On 3/25/20 4:03 AM, Sakari Ailus wrote:
>>>> +static int tegra_channel_enum_input(struct file *file, void *fh,
>>>> +                                 struct v4l2_input *inp)
>>>> +{
>>>> +     /* currently driver supports internal TPG only */
>>>> +     if (inp->index)
>>>> +             return -EINVAL;
>>>> +
>>>> +     inp->type = V4L2_INPUT_TYPE_CAMERA;
>>>> +     strscpy(inp->name, "Tegra TPG", sizeof(inp->name));
>>>> +
>>>> +     return 0;
>>>> +}
>>>> +
>>>> +static int tegra_channel_g_input(struct file *file, void *priv,
>>>> +                              unsigned int *i)
>>>> +{
>>>> +     *i = 0;
>>>> +     return 0;
>>>> +}
>>>> +
>>>> +static int tegra_channel_s_input(struct file *file, void *priv,
>>>> +                              unsigned int input)
>>>> +{
>>>> +     if (input > 0)
>>>> +             return -EINVAL;
>>>> +
>>>> +     return 0;
>>>> +}
>>> Please see patchset on topic "v4l2-dev/ioctl: Add V4L2_CAP_IO_MC" on
>>> linux-media; it's relevant here, too.
>> Can update in v6 to add device caps V4L2_CAP_IO_MC and remove enum/g/s_input
>> ioctls.
>>
>> But, I don't see this patch "v4l2-dev/ioctl: Add V4L2_CAP_IO_MC" on latest
>> linux-next
> It's not merged yet but likely will be very soon.
>
> --
> Sakari Ailus

OK, Will wait and send v6 once I see that patch merged. Thanks Sakari.

