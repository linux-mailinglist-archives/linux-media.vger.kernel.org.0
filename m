Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ECF6D23E624
	for <lists+linux-media@lfdr.de>; Fri,  7 Aug 2020 05:10:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726582AbgHGDKV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Aug 2020 23:10:21 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:12332 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726038AbgHGDKU (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 Aug 2020 23:10:20 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f2cc5ea0000>; Thu, 06 Aug 2020 20:09:30 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Thu, 06 Aug 2020 20:10:20 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Thu, 06 Aug 2020 20:10:20 -0700
Received: from [10.2.172.190] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 7 Aug
 2020 03:10:19 +0000
Subject: Re: [PATCH v9 08/10] gpu: host1x: mipi: Keep MIPI clock enabled and
 mutex locked till calibration done
To:     Dmitry Osipenko <digetx@gmail.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <frankc@nvidia.com>, <hverkuil@xs4all.nl>,
        <sakari.ailus@iki.fi>, <robh+dt@kernel.org>,
        <helen.koike@collabora.com>
CC:     <gregkh@linuxfoundation.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <1596740494-19306-1-git-send-email-skomatineni@nvidia.com>
 <1596740494-19306-9-git-send-email-skomatineni@nvidia.com>
 <f2522713-6995-d6a1-e691-a5443823056b@gmail.com>
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
Message-ID: <7ef2a6dd-d220-ff47-e6ef-7443a1779fae@nvidia.com>
Date:   Thu, 6 Aug 2020 20:10:23 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <f2522713-6995-d6a1-e691-a5443823056b@gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1596769770; bh=h8SMxrqo0m8Wh6mscNMxC9aBmcsXFcAujw0lF8gqcFI=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=JietN58xXUWYZafsZ/cgKZwoSzUNJXp6R++Ezl7LjQZ+zDxeV83GDBqtys2oeLvdn
         W/5qsdk8JxhvkrTBQo3M//ldp8hdm95v8P6ZntonlnQiEvDaYyWQkuNoIVX+fQib7V
         vOyR2+YVf/X8tiI/jIP05/QfoNWf3SSw9+I4uU3xigzbzOROBXaCT+0vAYtwnE4mGo
         VRQWPK9N/ZlcIbqXWxGrUrSDkcj5kLsFArwiMauh6sqUZq10Y/w72TFIw1Bd/92CUi
         q16WehVQHkqsx86hcMHz4s9/VNZ9dmWsM2Rc5gt7kocFB0asDTKf++Z6vJBPy8oaXw
         GGW7l5+EmO/BQ==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 8/6/20 7:31 PM, Dmitry Osipenko wrote:
> 06.08.2020 22:01, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> ...
>> +int tegra_mipi_start_calibration(struct tegra_mipi_device *device)
>>   {
>>   	const struct tegra_mipi_soc *soc =3D device->mipi->soc;
>>   	unsigned int i;
>> @@ -381,12 +375,16 @@ int tegra_mipi_calibrate(struct tegra_mipi_device =
*device)
>>   	value |=3D MIPI_CAL_CTRL_START;
>>   	tegra_mipi_writel(device->mipi, value, MIPI_CAL_CTRL);
>>  =20
>> -	mutex_unlock(&device->mipi->lock);
>> -	clk_disable(device->mipi->clk);
>> +	/*
>> +	 * Wait for min 72uS to let calibration logic finish calibration
>> +	 * sequence codes before waiting for pads idle state to apply the
>> +	 * results.
>> +	 */
>> +	usleep_range(75, 80);
> Could you please explain why the ACTIVE bit can't be polled instead of
> using the fixed delay? Doesn't ACTIVE bit represents the state of the
> busy FSM?

Based on internal discussion, ACTIVE bit gets cleared when all enabled=20
pads calibration is done (same time as when DONE set to 1).

Will request HW designer to look into design and confirm=C2=A0 exactly when=
=20
ACTIVE bit gets cleared.

Will get back on this.



