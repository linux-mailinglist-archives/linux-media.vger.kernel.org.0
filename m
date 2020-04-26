Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A14161B8AA2
	for <lists+linux-media@lfdr.de>; Sun, 26 Apr 2020 03:04:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726107AbgDZBEV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 25 Apr 2020 21:04:21 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:7250 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725962AbgDZBEU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 25 Apr 2020 21:04:20 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5ea4dd9d0000>; Sat, 25 Apr 2020 18:02:21 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Sat, 25 Apr 2020 18:04:20 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Sat, 25 Apr 2020 18:04:20 -0700
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Sun, 26 Apr
 2020 01:04:20 +0000
Received: from [10.2.165.152] (10.124.1.5) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Sun, 26 Apr
 2020 01:04:18 +0000
Subject: Re: [RFC PATCH v10 6/9] media: tegra: Add Tegra210 Video input driver
To:     Dmitry Osipenko <digetx@gmail.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <frankc@nvidia.com>, <hverkuil@xs4all.nl>,
        <sakari.ailus@iki.fi>, <helen.koike@collabora.com>
CC:     <sboyd@kernel.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <1587700513-28449-1-git-send-email-skomatineni@nvidia.com>
 <1587700513-28449-7-git-send-email-skomatineni@nvidia.com>
 <ae7a4614-c84c-f5dd-d0a5-4090e1bf5a9d@gmail.com>
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
Message-ID: <64b636af-a63f-6c5e-5d66-d481f79660c2@nvidia.com>
Date:   Sat, 25 Apr 2020 18:04:00 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <ae7a4614-c84c-f5dd-d0a5-4090e1bf5a9d@gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1587862941; bh=VNhJYVm5RUzNojdXqak0dh5Q/KOm805oU3Sr5ZNtA84=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=jPdl+CRuVcIeXZS/MqiiI4UTmP+6IjnTImWyG/16xb1vlvT5DKf/ozaBMy0x17ckL
         kyh7dPa83EoerauLJQhVsAlRhp45f7grmF8rK3yOzwht4Q8+gY9vXvEUs2xESinbij
         C7gbhw90U/F+UL/TtR8ZlBjCI7pR3hXSg+6epTz7SoWhu8pgSvvGB8qHWV59Ie2OFO
         p/GxyywN+V6OlIJ8DdDU7GjRfChkBJetq1h4hYVvQJx994hkv4MsEO/4gY7GB5sS+U
         r1GjIFrTCfrOMTW9KBuUAGlUF0xhtIZbA0N7mOZX+xr9s/4UBX9oMzFFlbWqX0+xVU
         CokQhhT5bwgfQ==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 4/25/20 4:29 PM, Dmitry Osipenko wrote:
> External email: Use caution opening links or attachments
>
>
> 24.04.2020 06:55, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> +static int tegra_csi_init(struct host1x_client *client)
>> +{
>> +     struct tegra_csi *csi =3D host1x_client_to_csi(client);
>> +     struct tegra_video_device *vid =3D dev_get_drvdata(client->host);
>> +     int ret;
>> +
>> +     INIT_LIST_HEAD(&csi->csi_chans);
>> +
>> +     ret =3D pm_runtime_get_sync(csi->dev);
>> +     if (ret < 0) {
>> +             dev_err(csi->dev, "failed to get runtime PM: %d\n", ret);
>> +             pm_runtime_put_noidle(csi->dev);
>> +             return ret;
>> +     }
> The whole point of RPM is to keep hardware enabled only when needed,
> i.e. during of the capture process in this case. You should move all RPM
> handling to the capture start / stop functions.
Will move it to handle during stream start/stop
