Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7421A1BC1EE
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2020 16:52:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727886AbgD1Owm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Apr 2020 10:52:42 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:7589 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727775AbgD1Owm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Apr 2020 10:52:42 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5ea842c00000>; Tue, 28 Apr 2020 07:50:40 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Tue, 28 Apr 2020 07:52:41 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Tue, 28 Apr 2020 07:52:41 -0700
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 28 Apr
 2020 14:52:41 +0000
Received: from [10.2.165.152] (10.124.1.5) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 28 Apr
 2020 14:52:40 +0000
Subject: Re: [RFC PATCH v1 3/5] media: tegra-video: Move PM runtime handle to
 streaming
To:     Dmitry Osipenko <digetx@gmail.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <frankc@nvidia.com>, <hverkuil@xs4all.nl>
CC:     <linux-media@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <1588047650-29402-1-git-send-email-skomatineni@nvidia.com>
 <1588047650-29402-4-git-send-email-skomatineni@nvidia.com>
 <631390cb-9aff-0e3f-6c39-81d6c565987e@gmail.com>
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
Message-ID: <3ef69413-a606-b475-f530-d5534760b73b@nvidia.com>
Date:   Tue, 28 Apr 2020 07:51:45 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <631390cb-9aff-0e3f-6c39-81d6c565987e@gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1588085440; bh=7Vr55oxdvlc54RS7GqDJrEUI+/BVLfeLIuIbc/K80U4=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=YbQwT+y92pw9Dr0Uq+/Dh/yatrxwXV5i+q6Xv8qfIdM/KUhdW84OmV+0j25fCWynu
         eXAzB2/+UwfyoA6OweHYTcyn7qah9oQmKdX6n30AW0efAKj7l5SMeVE8B6KXYNJ6oX
         QQq2Q1+7kC7WOx1gLKVVU7FqsId3AFn0O4yXaRnRDFqRmTCYV7VJCrEsvfihCOKUoF
         3YfWbUiBuBWLwsX4jNgtHlavQggUCSo1kTRptJiZGH432/3CSV8Q0uAL2fnYhBVhsB
         u4a6t9DF0pR0EjtlhZpnfC4mto9r+VbJ85+xrWdv191Fj9Sc67M6RRfU0kMLpvJN+c
         w7HaPSShQES3A==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 4/28/20 6:59 AM, Dmitry Osipenko wrote:
> External email: Use caution opening links or attachments
>
>
> 28.04.2020 07:20, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> diff --git a/drivers/staging/media/tegra-video/csi.c b/drivers/staging/m=
edia/tegra-video/csi.c
>> index b3dd0c3..29ccdae 100644
>> --- a/drivers/staging/media/tegra-video/csi.c
>> +++ b/drivers/staging/media/tegra-video/csi.c
>> @@ -272,8 +272,25 @@ static int tegra_csi_s_stream(struct v4l2_subdev *s=
ubdev, int enable)
>>        struct tegra_vi_channel *chan =3D v4l2_get_subdev_hostdata(subdev=
);
>>        struct tegra_csi_channel *csi_chan =3D to_csi_chan(subdev);
>>        struct tegra_csi *csi =3D csi_chan->csi;
>> +     int ret;
>> +
>> +     if (enable && atomic_add_return(1, &csi->clk_refcnt) =3D=3D 1) {
>> +             ret =3D pm_runtime_get_sync(csi->dev);
>> +             if (ret < 0) {
>> +                     dev_err(csi->dev,
>> +                             "failed to get runtime PM: %d\n", ret);
>> +                     pm_runtime_put_noidle(csi->dev);
>> +                     atomic_dec(&csi->clk_refcnt);
>> +                     return ret;
>> +             }
>> +     }
>> +
>> +     ret =3D csi->ops->csi_streaming(csi_chan, chan->pg_mode, enable);
>>
>> -     return csi->ops->csi_streaming(csi_chan, chan->pg_mode, enable);
>> +     if ((ret < 0 || !enable) && atomic_dec_and_test(&csi->clk_refcnt))
>> +             pm_runtime_put_sync(csi->dev);
> Runtime PM maintains its own refcount, why these
> clk_refcnt/power_on_refcnt are needed?

Streaming is per channel and we can't turn power/clocks off while other=20
channels may still be running.

