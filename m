Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A548B153954
	for <lists+linux-media@lfdr.de>; Wed,  5 Feb 2020 20:55:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727306AbgBETyv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 Feb 2020 14:54:51 -0500
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:16142 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727085AbgBETyu (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 5 Feb 2020 14:54:50 -0500
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e3b1d710000>; Wed, 05 Feb 2020 11:54:25 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Wed, 05 Feb 2020 11:54:49 -0800
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Wed, 05 Feb 2020 11:54:49 -0800
Received: from [10.2.167.216] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 5 Feb
 2020 19:54:49 +0000
Subject: Re: [RFC PATCH v1 4/5] media: tegra: Add Tegra Video input driver for
 Tegra210
To:     Stephen Boyd <sboyd@kernel.org>, <frankc@nvidia.com>,
        <hverkuil@xs4all.nl>, <jonathanh@nvidia.com>,
        <thierry.reding@gmail.com>
CC:     <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <1580235801-4129-1-git-send-email-skomatineni@nvidia.com>
 <1580235801-4129-5-git-send-email-skomatineni@nvidia.com>
 <20200205192620.3A1F620720@mail.kernel.org>
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
Message-ID: <7e0ec06e-bb40-acf7-fd47-ced4b401afb2@nvidia.com>
Date:   Wed, 5 Feb 2020 11:54:26 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200205192620.3A1F620720@mail.kernel.org>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1580932466; bh=9S5su+9VPxC93G/dxX1b6jj+ANaeVTDo08rIcJRucg0=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=jovhgea1EE0wEhkSoMo/gyga7GSU0eHEiacjqnE/55fSedszkXo0MVXq8E1bzf4eR
         qIDzn50VKD0blDpbwt+8+XgkJ2Y/XbJmg9mibmLKSEBoh6U5AES3n5hSVX/ANOjB6n
         EamZ/RG9lqCaP+5dTk9lrfdLlDGTHiO2yr/a4h32l0plv2/ryGZImE3qP6IA/auHRJ
         Cl9PVD3HInnYwd4wcYMlhZBh3UZdCy/mD2EMpIo7VRjYIqgEXTiONvHv8N3m0UrrGh
         vzWVB8GpV8WhEO36kW4rekI4JlK5Wli2ijmvcTCTUdKfn4IRiDrEBDqKyLivCIzElV
         MgpE942UVXO2w==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 2/5/20 11:26 AM, Stephen Boyd wrote:
> External email: Use caution opening links or attachments
>
>
> Quoting Sowjanya Komatineni (2020-01-28 10:23:20)
>> diff --git a/drivers/staging/media/tegra/Kconfig b/drivers/staging/media/tegra/Kconfig
>> new file mode 100644
>> index 000000000000..443b99f2e2c9
>> --- /dev/null
>> +++ b/drivers/staging/media/tegra/Kconfig
>> @@ -0,0 +1,12 @@
>> +# SPDX-License-Identifier: GPL-2.0-only
>> +config VIDEO_TEGRA
>> +       tristate "NVIDIA Tegra VI driver"
>> +       depends on ARCH_TEGRA || (ARM && COMPILE_TEST)
>> +       depends on COMMON_CLK
> What depends on the common clk framework? I don't see any clk-provider.h
> includes here.
COMMON_CLK is not needed. Will remove in v2. Thanks.
>
>> +       depends on VIDEO_V4L2 && VIDEO_V4L2_SUBDEV_API
>> +       depends on MEDIA_CONTROLLER
>> +       select TEGRA_HOST1X
>> +       select VIDEOBUF2_DMA_CONTIG
>> +       select V4L2_FWNODE
>> +       help
>> +         Say yes here to enable support for Tegra video input hardware
