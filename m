Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E7644191E69
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2020 02:08:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727234AbgCYBIx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Mar 2020 21:08:53 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:16847 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727119AbgCYBIx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Mar 2020 21:08:53 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e7aaef70000>; Tue, 24 Mar 2020 18:08:07 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Tue, 24 Mar 2020 18:08:52 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Tue, 24 Mar 2020 18:08:52 -0700
Received: from [10.2.160.81] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 25 Mar
 2020 01:08:51 +0000
Subject: Re: [RFC PATCH v5 6/9] media: tegra: Add Tegra210 Video input driver
To:     Dmitry Osipenko <digetx@gmail.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <frankc@nvidia.com>, <hverkuil@xs4all.nl>,
        <helen.koike@collabora.com>
CC:     <sboyd@kernel.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <1584985955-19101-1-git-send-email-skomatineni@nvidia.com>
 <1584985955-19101-7-git-send-email-skomatineni@nvidia.com>
 <8f44e42d-2008-fe53-f4fb-b57502da91a8@gmail.com>
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
Message-ID: <5695fc27-6839-dda3-9d06-77ef36ecfd43@nvidia.com>
Date:   Tue, 24 Mar 2020 18:08:52 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <8f44e42d-2008-fe53-f4fb-b57502da91a8@gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1585098487; bh=aKHthfLue+1H2XDz473VqkpiUrB/NbryW9pP8d76r+s=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=and8LT/30BHlj1Hs1vFx5H2aqxApXzDkDdNer+loRB+Wgj+01QrMDvgjzESzdwwxd
         ChtlCFqZQPGZmdLWJzx/x22OQ94pCqO3R0jismKLaALCIUtlesptrkE/fxP1CjLca2
         jCU4ugZjhQ2n1Kd6KriXNfve5uSN/5KC6JpGGCOF4EUDEzlE3sV1vXPjQxA6m+ijg5
         wr5E/1sX3iF0JjJAE4mmwDI+MciU9rfJd7Q/0zczolkJQBXUTmTUeJmDs06vD/ZbtF
         5dbYP/EJ5QxPkoff0zwMjk/SNPEFuxKOMOSf8HfSGvZBfsfWUguUEGkVao+Duojqf/
         D952W4A2bjHdg==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 3/24/20 5:34 PM, Dmitry Osipenko wrote:
> External email: Use caution opening links or attachments
>
>
> 23.03.2020 20:52, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> +static void tegra_channel_vi_soft_reset(struct tegra_vi_channel *chan)
>> +{
>> +     /* disable clock gating to enable continuous clock */
>> +     tegra_vi_write(chan, TEGRA_VI_CFG_CG_CTRL, 0);
>> +     /*
>> +      * Soft reset memory client interface, pixel format logic, sensor
>> +      * control logic, and a shadow copy logic to bring VI to clean sta=
te.
>> +      */
>> +     vi_csi_write(chan, TEGRA_VI_CSI_SW_RESET, 0xf);
>> +     usleep_range(100, 200);
>> +     vi_csi_write(chan, TEGRA_VI_CSI_SW_RESET, 0x0);
> Is it safe to reset MCCIF without blocking and flushing memory requests
> at first?
Yes to bring VI to clean state on errors its recommended by HW design team.
