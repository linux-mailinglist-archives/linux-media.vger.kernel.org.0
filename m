Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8A0C1C3D2D
	for <lists+linux-media@lfdr.de>; Mon,  4 May 2020 16:35:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729148AbgEDOf1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 May 2020 10:35:27 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:16141 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728187AbgEDOf0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 4 May 2020 10:35:26 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5eb027e90000>; Mon, 04 May 2020 07:34:17 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Mon, 04 May 2020 07:35:26 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Mon, 04 May 2020 07:35:26 -0700
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 4 May
 2020 14:35:26 +0000
Received: from [10.2.165.119] (172.20.13.39) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 4 May 2020
 14:35:25 +0000
Subject: Re: [RFC PATCH v11 6/9] media: tegra: Add Tegra210 Video input driver
To:     Dmitry Osipenko <digetx@gmail.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <frankc@nvidia.com>, <hverkuil@xs4all.nl>,
        <sakari.ailus@iki.fi>, <helen.koike@collabora.com>
CC:     <sboyd@kernel.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <1588197606-32124-1-git-send-email-skomatineni@nvidia.com>
 <1588197606-32124-7-git-send-email-skomatineni@nvidia.com>
 <f1cbb602-163e-a539-aaa5-c7e947a8945b@gmail.com>
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
Message-ID: <834b9295-d46a-dd01-2496-2c24a8e7a8e4@nvidia.com>
Date:   Mon, 4 May 2020 07:36:05 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <f1cbb602-163e-a539-aaa5-c7e947a8945b@gmail.com>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1588602857; bh=QbHAIibWev3PVyqXHVQaxCb68Be+zOimcNcvRZM45Ec=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=WhE5NNBNk2KR58CeKJ3JDTLxgB344OmjUeTKqdEmKhd1HZ78sqnH0vFfhVTrZx05a
         WXVlyyHuW4kCgOKu4JNleNd6oTtCaxH9+0PTpZvFjI57Aj4bkBUSwQGkCZXO0d1g0R
         nb7CYqEXnEoNKR0Qoi789+TZnaXVlly1lTT6O7gwmFthjPDHsEVeOx9qzWyPh6MUTU
         OIRHPn1/WZvoacZOR9UBQI35XrrQRHHo5t0FqUjiR4dcyjBOYyXP31QRo/gJVVyG1s
         hPoB7AqDn9HKFGMi3SdL4Dy5/R/u8WUW6LGkHAiSsMBqYsmYMhKV88e1jhlKZUrAvw
         ayKTD8qVDkYSw==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 5/4/20 12:44 AM, Dmitry Osipenko wrote:
> 30.04.2020 01:00, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> +/*
>> + * VI channel input data type enum.
>> + * These data type enum value gets programmed into corresponding Tegra =
VI
>> + * channel register bits.
>> + */
>> +enum tegra_image_dt {
>> +	TEGRA_IMAGE_DT_YUV420_8 =3D 24,
>> +	TEGRA_IMAGE_DT_YUV420_10,
>> +
>> +	TEGRA_IMAGE_DT_YUV420CSPS_8 =3D 28,
>> +	TEGRA_IMAGE_DT_YUV420CSPS_10,
>> +	TEGRA_IMAGE_DT_YUV422_8,
>> +	TEGRA_IMAGE_DT_YUV422_10,
>> +	TEGRA_IMAGE_DT_RGB444,
>> +	TEGRA_IMAGE_DT_RGB555,
>> +	TEGRA_IMAGE_DT_RGB565,
>> +	TEGRA_IMAGE_DT_RGB666,
>> +	TEGRA_IMAGE_DT_RGB888,
>> +
>> +	TEGRA_IMAGE_DT_RAW6 =3D 40,
>> +	TEGRA_IMAGE_DT_RAW7,
>> +	TEGRA_IMAGE_DT_RAW8,
>> +	TEGRA_IMAGE_DT_RAW10,
>> +	TEGRA_IMAGE_DT_RAW12,
>> +	TEGRA_IMAGE_DT_RAW14,
>> +};
> Are these format IDs common to all Tegra SoCs or they unique to T210?
Common for all SoCs
