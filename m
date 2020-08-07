Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF23823E634
	for <lists+linux-media@lfdr.de>; Fri,  7 Aug 2020 05:18:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726149AbgHGDSJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Aug 2020 23:18:09 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:1362 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726038AbgHGDSJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 Aug 2020 23:18:09 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f2cc78c0000>; Thu, 06 Aug 2020 20:16:28 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Thu, 06 Aug 2020 20:18:09 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Thu, 06 Aug 2020 20:18:09 -0700
Received: from [10.2.172.190] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 7 Aug
 2020 03:18:08 +0000
Subject: Re: [PATCH v9 08/10] gpu: host1x: mipi: Keep MIPI clock enabled and
 mutex locked till calibration done
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
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
 <7ef2a6dd-d220-ff47-e6ef-7443a1779fae@nvidia.com>
 <a0a187d3-04e9-88d9-5146-1448d4bd79e9@nvidia.com>
Message-ID: <54e01160-4041-f8fa-065d-f635e8d69e2f@nvidia.com>
Date:   Thu, 6 Aug 2020 20:18:12 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <a0a187d3-04e9-88d9-5146-1448d4bd79e9@nvidia.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1596770188; bh=Q7c5COmKNsUWJOpEgoTrMYUm9lwTDUfUI3WVQ2PxY+U=;
        h=X-PGP-Universal:Subject:From:To:CC:References:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=MoZrTt2ic0S4pNRINK57nFq+73kJskPIilWYp8p0zEbhoJgfqCo4RFictZBeZ5H1/
         BkyxlwjscYH/AJ3oSy+zYxWHJsT6xYQmI9lHBo3mtTUf6Udc01KuDhXDMq1s/kTAIA
         9VvVNO7slm0TyB7175t0OE/LeqVjEmpU8rkjgvgVd66ZgkpwdPgdYpkRKg2i/fU9bO
         IhIQoWciEVEZxqY032gI4Dm4AyTQcDRoctgwQp8l5G6hLbi3wdf9k42/mkubxX4Pw0
         NHu//j/DYl0EKeS++jPTHzxQsMI7F0Sk0vAqKh5bCTKhJx7Ka9aNd3P+QNcQEISGQ+
         eepbTGicSq9Gw==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 8/6/20 8:14 PM, Sowjanya Komatineni wrote:
>
> On 8/6/20 8:10 PM, Sowjanya Komatineni wrote:
>>
>> On 8/6/20 7:31 PM, Dmitry Osipenko wrote:
>>> 06.08.2020 22:01, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>> ...
>>>> +int tegra_mipi_start_calibration(struct tegra_mipi_device *device)
>>>> =C2=A0 {
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const struct tegra_mipi_soc *soc =3D de=
vice->mipi->soc;
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int i;
>>>> @@ -381,12 +375,16 @@ int tegra_mipi_calibrate(struct=20
>>>> tegra_mipi_device *device)
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 value |=3D MIPI_CAL_CTRL_START;
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tegra_mipi_writel(device->mipi, value, =
MIPI_CAL_CTRL);
>>>> =C2=A0 -=C2=A0=C2=A0=C2=A0 mutex_unlock(&device->mipi->lock);
>>>> -=C2=A0=C2=A0=C2=A0 clk_disable(device->mipi->clk);
>>>> +=C2=A0=C2=A0=C2=A0 /*
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * Wait for min 72uS to let calibration logic=
 finish calibration
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * sequence codes before waiting for pads idl=
e state to apply the
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * results.
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 */
>>>> +=C2=A0=C2=A0=C2=A0 usleep_range(75, 80);
>>> Could you please explain why the ACTIVE bit can't be polled instead of
>>> using the fixed delay? Doesn't ACTIVE bit represents the state of the
>>> busy FSM?
>>
>> Based on internal discussion, ACTIVE bit gets cleared when all=20
>> enabled pads calibration is done (same time as when DONE set to 1).
>>
>> Will request HW designer to look into design and confirm exactly when=20
>> ACTIVE bit gets cleared.
>>
>> Will get back on this.
>>
> Verified with HW designer. above is correct. ACTIVE bit update happens=20
> same time as DONE bit.
>
> Active =3D !(DONE)
>
> In case of calibration logic waiting for LP-11 where done bit does not=20
> get set, ACTIVE will still be 1 and on next start trigger new=20
> calibration will start
>
Based on internal design check from designer, as long as its in waiting=20
for LP-11 stage, next calibration request can be triggered again but=20
ACTIVE bit we will see it at 1. So we should check for DONE bits to=20
confirm if calibration is done or not.

To start next calibration, it can take effect as long as its in wait for=20
LP-11 mode.

>>
>>
