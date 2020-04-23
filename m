Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 44CD71B68FD
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2020 01:19:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729645AbgDWXT3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 23 Apr 2020 19:19:29 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:17649 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729810AbgDWXTW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 Apr 2020 19:19:22 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5ea2226d0001>; Thu, 23 Apr 2020 16:19:09 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Thu, 23 Apr 2020 16:19:21 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Thu, 23 Apr 2020 16:19:21 -0700
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 23 Apr
 2020 23:19:21 +0000
Received: from [10.2.165.49] (10.124.1.5) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 23 Apr
 2020 23:19:20 +0000
Subject: Re: [RFC PATCH v9 6/9] media: tegra: Add Tegra210 Video input driver
To:     Dmitry Osipenko <digetx@gmail.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <frankc@nvidia.com>, <hverkuil@xs4all.nl>,
        <sakari.ailus@iki.fi>, <helen.koike@collabora.com>
CC:     <sboyd@kernel.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <1587536339-4030-1-git-send-email-skomatineni@nvidia.com>
 <1587536339-4030-7-git-send-email-skomatineni@nvidia.com>
 <7e473fa9-0409-d868-e818-2e7928a8acca@gmail.com>
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
Message-ID: <a83bfc89-35de-85b5-fe5f-71e62456f5e9@nvidia.com>
Date:   Thu, 23 Apr 2020 16:19:19 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <7e473fa9-0409-d868-e818-2e7928a8acca@gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1587683949; bh=oU0Wfn+wZyvfbdQdhKn0QkbGqj+n2qkMVpStz95S7M8=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=KE+HmEUNg+W7/ykVVaTcd+lF7j8sL6Isr1yR05pKLfbV2Sn5yFho6pQ8dlJOkvy9L
         7liQmHBwNlRf9ruNAUdJ305CP6B0BPMl3m00ppK5Bu3+ELq9enVY7b00y6cwIQ5aJ6
         T76XcIaaFRWMhVpiqfhGdet1hASX+UKfAO6oOJlmuV1VsRvPpRB3WRNbSVeqvCzosB
         fOzIlLSiYjDEAjtSxDNPseayuPSherCpm/Cx5bqDhDZrI7oIgrOvRrAcWkhQO45A0W
         fN8sjkwvndOBnW02zk3otKTxL0ydL31giLF1IYn+SXuVZWxADDLTvdl6SN8ogE7aTg
         RB1pVjdAXarIw==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 4/23/20 4:16 PM, Dmitry Osipenko wrote:
> External email: Use caution opening links or attachments
>
>
> 22.04.2020 09:18, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> +static int chan_capture_kthread_start(void *data)
>> +{
>> +     struct tegra_vi_channel *chan =3D data;
>> +     struct tegra_channel_buffer *buf;
>> +     int err =3D 0;
>> +
>> +     set_freezable();
>> +
>> +     while (1) {
>> +             try_to_freeze();
>> +
>> +             wait_event_interruptible(chan->start_wait,
>> +                                      !list_empty(&chan->capture) ||
>> +                                      kthread_should_stop());
>> +
>> +             if (kthread_should_stop())
>> +                     break;
>> +
>> +             /*
>> +              * Source is not streaming if error is non-zero.
>> +              * So, do not dequeue buffers on capture error.
>> +              */
>> +             if (err)
>> +                     continue;
> This will result in an endless loop, I suppose it wasn't the intention.

no it will not. on error we report vb2_queue_error which will do=20
streaming stop request.

So thread will be stopped on streaming stop request thru kthread stop signa=
l

