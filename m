Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B71C3191E7F
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2020 02:15:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727259AbgCYBPE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Mar 2020 21:15:04 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:13029 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727152AbgCYBPE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Mar 2020 21:15:04 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e7ab03c0000>; Tue, 24 Mar 2020 18:13:32 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Tue, 24 Mar 2020 18:15:03 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Tue, 24 Mar 2020 18:15:03 -0700
Received: from [10.2.160.81] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 25 Mar
 2020 01:15:02 +0000
Subject: Re: [RFC PATCH v5 6/9] media: tegra: Add Tegra210 Video input driver
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     Dmitry Osipenko <digetx@gmail.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <frankc@nvidia.com>, <hverkuil@xs4all.nl>,
        <helen.koike@collabora.com>
CC:     <sboyd@kernel.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <1584985955-19101-1-git-send-email-skomatineni@nvidia.com>
 <1584985955-19101-7-git-send-email-skomatineni@nvidia.com>
 <8f44e42d-2008-fe53-f4fb-b57502da91a8@gmail.com>
 <5695fc27-6839-dda3-9d06-77ef36ecfd43@nvidia.com>
Message-ID: <f59eb7fa-5b26-60e4-771f-f6f9ecfa0b5f@nvidia.com>
Date:   Tue, 24 Mar 2020 18:15:02 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <5695fc27-6839-dda3-9d06-77ef36ecfd43@nvidia.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1585098812; bh=bU2HFAYyjlSHy3XCNC4Et16uw6jnRXPLo6YbsCijPUg=;
        h=X-PGP-Universal:Subject:From:To:CC:References:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=baso6vXvWWdYt8HlMNp87qBzGMKSRA7WE17d7TZx5MfKoYWkttsuOK36Eep8zaeiU
         3yn4nNzyIub8gBdIgJa8pwZL/Cw66sTn1Mgly+KMhLfsMzoVeCOX+XgOrsbxtTsFxD
         MFNxBDvEUZmWt3GYie1uWsCwuHp4GCGBkwxCanW6w05FbY6ldPS2VIGF1sJnFwK2+y
         e+SIYGlBoBaTGfMNchwJMusvSOUNO6vQK5Oobjw+zXmCEmBvbC3Yo8MqfN5EjR1yEA
         mTI8ZQE3e0mropzJJ5fPJQLkB8IZS1PsxKMl3afZeppilYCmlo/EZZGn6cW0i0VjCx
         /eZdAC+VhgcIQ==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 3/24/20 6:08 PM, Sowjanya Komatineni wrote:
>
> On 3/24/20 5:34 PM, Dmitry Osipenko wrote:
>> External email: Use caution opening links or attachments
>>
>>
>> 23.03.2020 20:52, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>> +static void tegra_channel_vi_soft_reset(struct tegra_vi_channel *chan)
>>> +{
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 /* disable clock gating to enable continuous =
clock */
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 tegra_vi_write(chan, TEGRA_VI_CFG_CG_CTRL, 0)=
;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 /*
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * Soft reset memory client interface, p=
ixel format logic, sensor
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * control logic, and a shadow copy logi=
c to bring VI to clean=20
>>> state.
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 vi_csi_write(chan, TEGRA_VI_CSI_SW_RESET, 0xf=
);
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 usleep_range(100, 200);
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 vi_csi_write(chan, TEGRA_VI_CSI_SW_RESET, 0x0=
);
>> Is it safe to reset MCCIF without blocking and flushing memory requests
>> at first?
> Yes to bring VI to clean state on errors its recommended by HW design=20
> team.
BTW, just to be clear this is Software reset.
