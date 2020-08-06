Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A2C4623E157
	for <lists+linux-media@lfdr.de>; Thu,  6 Aug 2020 20:44:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727078AbgHFSoG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Aug 2020 14:44:06 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:6177 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726197AbgHFSoD (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 Aug 2020 14:44:03 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f2c4f0e0002>; Thu, 06 Aug 2020 11:42:22 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Thu, 06 Aug 2020 11:44:03 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Thu, 06 Aug 2020 11:44:03 -0700
Received: from [10.2.172.190] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 6 Aug
 2020 18:44:02 +0000
Subject: Re: [PATCH v8 08/10] gpu: host1x: mipi: Keep MIPI clock enabled till
 calibration is done
To:     Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>
CC:     <jonathanh@nvidia.com>, <frankc@nvidia.com>, <hverkuil@xs4all.nl>,
        <sakari.ailus@iki.fi>, <robh+dt@kernel.org>,
        <helen.koike@collabora.com>, <gregkh@linuxfoundation.org>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <1596469346-937-1-git-send-email-skomatineni@nvidia.com>
 <1c12e40e-de7f-0599-a941-82760b4c7668@gmail.com>
 <9ef0b875-e826-43e2-207e-168d2081ff6a@nvidia.com>
 <4689cfe9-e7c4-48bf-217f-3a31b59b8bda@nvidia.com>
 <0e78c5ca-c529-1e98-891d-30351c9aae81@gmail.com>
 <b2098a68-d02f-b406-fc57-56e3ff5d8d1a@nvidia.com>
 <309e3b66-9288-91ef-71b4-be73eacbbd62@nvidia.com>
 <fde2431a-0585-ac32-ac25-73e198aaa948@nvidia.com>
 <4025a458-fa78-924d-c84f-166f82df0f8e@gmail.com>
 <4f15d655-3d62-cf9f-82da-eae379d60fa6@nvidia.com>
 <b5612e93-f1c4-4762-baa1-5d85eb1edbe1@gmail.com>
 <412f8c53-1aca-db31-99a1-a0ecb2081ca5@nvidia.com>
 <61275bd6-58e7-887f-aa7d-8e60895e7b2b@nvidia.com>
 <6ff57c38-9847-42b0-643b-0d167c13779f@gmail.com>
 <c6ef5e77-2b0a-1712-ca58-dbd8d232e1f1@nvidia.com>
 <ed79b201-85ba-f725-c5fa-fcde0761bc3d@nvidia.com>
 <26ed2841-db5d-aeb0-11c7-cbe2ddd1d76b@gmail.com>
 <eddfdaf0-818a-c4dd-e3b4-4d432af56982@nvidia.com>
 <e965076a-dc31-5774-dd27-98c992331bd2@gmail.com>
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
Message-ID: <50aa439e-a572-ce77-9d06-e060304b9bd4@nvidia.com>
Date:   Thu, 6 Aug 2020 11:44:04 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <e965076a-dc31-5774-dd27-98c992331bd2@gmail.com>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1596739342; bh=hjtCqBLT9+XaCFVA4DWtudBFoaTKIKtpNhkT5ZGd7rA=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=ANeuKtW0WzWf1saO5fqSgMQAmjZn3w6C/Hl1i/smgxHVcxNwWmlBtXNSLhrvi3kxN
         C+Cl4g8TUY1dKinTCP+pEF6+4j891st7uTl3I8psuUITeLxafc/r2R8gIWS8gqCmcj
         jVgBROi9dq79L1oTPbbM7DmQ6sriLVZrOZQTzuBJnkwwHCiKjpytqtFNqv+x/UNaAt
         ZOfheuvDq3pU8GEUsnZLVAO3qxasnhv5SnWguhGYthqZqOYgXYQAGus+c7JNIYbwlP
         uqRsxmcM7+5Y5lG4+OlOTyzua4MUFVLmSlyuihw1Nb9t76DxtSBz8+BcUMsO/oHb5W
         0xam/NpL+5otw==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 8/6/20 11:18 AM, Dmitry Osipenko wrote:
> 06.08.2020 21:07, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> On 8/6/20 11:01 AM, Dmitry Osipenko wrote:
>>> 06.08.2020 20:52, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>> ...
>>>> Right mutex_unlock should happen at end of finish_calibration.
>>>>
>>>> With keeping mutex locked in start, we dont have to check for active t=
o
>>>> be 0 to issue start as mutex will keep it locked and other pads
>>>> calibration can only go thru when current one is done.
>>>>
>>>> So instead of below sequence, its simpler to do this way?
>>>>
>>>> start_calibration()
>>>>
>>>> - mutex_lock
>>>>
>>>> - wait for 72uS after start
>>>>
>>>> finish_calibration()
>>>>
>>>> - keep check for ACTIVE =3D 0 and DONE =3D 1
>>> I think only the DONE bits which correspond to the mipi_device->pads
>>> bitmask should be awaited.
>> As next START can't be triggered when auto cal is ACTIVE, we should keep
>> this in finish.
>>
>> As we do mutex_unlock only at end of finish, other pads calibrations
>> dont go thru till the one in process is finished.
>>
>> So in this case ACTIVE applies to current selected pads that are under
>> calibration.
> Should be better to check only the relevant bits in order to catch bugs,
> otherwise you may get a DONE status from the irrelevant pads.
tegra_mipi_device is separate for DSI and CSI channels. mutex lock used=20
during calibrate is device specific lock.
So, it will not prevent other devices to hold till on going calibration=20
is done unless we add wait for active bit before triggering start.

Currently we wait for active bit at end during calibration done check=20
after start trigger. But when other devices go thru calibration in=20
parallel as lock is device specific and not common lock for all devices=20
it will trigger start but MIPI calibration logic ignore if previous=20
calibration is still in progress.

Need to serialize calibration start requests from different devices=20
based on ACTIVE bit.

>>> Perhaps the start_calibration() also needs to be changed to not touch
>>> the MIPI_CAL_CONFIG bits of the unrelated pads?
>> Driver already takes care of programming corresponding pads config only.
> It writes 0 to the config of the unrelated pads, which probably isn't
> nice if some pads use periodic auto-calibration.
>
> https://elixir.bootlin.com/linux/v5.8/source/drivers/gpu/host1x/mipi.c#L3=
50
>
> Although looks like auto-calibration isn't supported by the current drive=
r.

Yes we don't use auto-calibration.

Only common bit here is MIPI_CAL_CTRL start. All others are pad specific=20
currently.

