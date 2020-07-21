Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E3A722821F
	for <lists+linux-media@lfdr.de>; Tue, 21 Jul 2020 16:29:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728692AbgGUO1w (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Jul 2020 10:27:52 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:1749 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728362AbgGUO1w (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Jul 2020 10:27:52 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f16fb5b0000>; Tue, 21 Jul 2020 07:27:39 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Tue, 21 Jul 2020 07:27:51 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Tue, 21 Jul 2020 07:27:51 -0700
Received: from [10.2.168.236] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 21 Jul
 2020 14:27:51 +0000
Subject: Re: [PATCH v3 3/3] media: i2c: imx274: Add IMX274 power on and off
 sequence
To:     Luca Ceresoli <luca@lucaceresoli.net>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <frankc@nvidia.com>, <hverkuil@xs4all.nl>,
        <leonl@leopardimaging.com>, <robh+dt@kernel.org>,
        <lgirdwood@gmail.com>, <broonie@kernel.org>
CC:     <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <1595264494-2400-1-git-send-email-skomatineni@nvidia.com>
 <1595264494-2400-3-git-send-email-skomatineni@nvidia.com>
 <a66723a1-d88d-28e2-8c8c-2779ab7ead78@lucaceresoli.net>
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
Message-ID: <56105f23-5aab-9b88-fa40-20f523e64f52@nvidia.com>
Date:   Tue, 21 Jul 2020 07:28:53 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <a66723a1-d88d-28e2-8c8c-2779ab7ead78@lucaceresoli.net>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1595341659; bh=mhvZ+ZOWLkMT31a9ATRd84r9IJhYpQVXyj+LhDJq50Y=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=IzkdVePCXVj6+zcxfrVWRoeT6wUzigR4gOK7AYt9uhamsodeXdDeSu6tnbxDxHs2h
         GgIn3wp31CtDUZmvwpNvbhAc+mIJB0OvTU3/2DdxTsyCiRtcDEyM9x7PsurtOnTQku
         4uiGHc05mumEKaZ2l2cds9fSdMTr+ac8/HAXepolw5rjOZYz+e1NM2J6Fa+R3dPBxm
         P39S92ooKA+j+mcDi8Il3QWjRRQXj/GhbH7P6NSFHon5kKkSMrRAYv17hoU+Uq72U0
         nb5Uw2J/4GMwGNRAX+OJwyE+xEJZa3ZJTMuqG2rXiyzbtdwzvk4Jjppuk8th6Bg1RS
         FmDl+ZCfsrx5w==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 7/21/20 7:03 AM, Luca Ceresoli wrote:
> Hi Sowjanya,
>
> On 20/07/20 19:01, Sowjanya Komatineni wrote:
>> IMX274 has VANA analog 2.8V supply, VDIG digital core 1.8V supply,
>> and VDDL digital io 1.2V supply which are optional based on camera
>> module design.
>>
>> IMX274 also need external 24Mhz clock and is optional based on
>> camera module design.
>>
>> This patch adds support for IMX274 power on and off to enable and
>> disable these supplies and external clock.
>>
>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>> ---
> In the future please add a log of changes since previous versions here.
>
> As far as the patch is concerned:
> Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>
>
> Thanks.

Sure.

Thanks

Sowjanya

