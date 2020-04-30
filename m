Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A87A1C016C
	for <lists+linux-media@lfdr.de>; Thu, 30 Apr 2020 18:06:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728312AbgD3QGK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 Apr 2020 12:06:10 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:10786 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727813AbgD3QGJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 Apr 2020 12:06:09 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5eaaf72c0002>; Thu, 30 Apr 2020 09:05:00 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Thu, 30 Apr 2020 09:06:07 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Thu, 30 Apr 2020 09:06:07 -0700
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 30 Apr
 2020 16:06:07 +0000
Received: from [10.2.165.152] (10.124.1.5) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 30 Apr
 2020 16:06:06 +0000
Subject: Re: [RFC PATCH v11 6/9] media: tegra: Add Tegra210 Video input driver
To:     Dmitry Osipenko <digetx@gmail.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <frankc@nvidia.com>, <hverkuil@xs4all.nl>,
        <sakari.ailus@iki.fi>, <helen.koike@collabora.com>
CC:     <sboyd@kernel.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <1588197606-32124-1-git-send-email-skomatineni@nvidia.com>
 <1588197606-32124-7-git-send-email-skomatineni@nvidia.com>
 <bacc4308-4b95-f566-b80e-096ff96407b5@gmail.com>
 <4da289e6-036f-853b-beb4-379d6462adb0@gmail.com>
 <c6d54885-6f23-f60c-a17b-3481fc4d6adf@gmail.com>
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
Message-ID: <b14b9dc5-7ac9-7735-d98d-eebc7e151cba@nvidia.com>
Date:   Thu, 30 Apr 2020 09:04:40 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <c6d54885-6f23-f60c-a17b-3481fc4d6adf@gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1588262700; bh=eWajUdI0iXeAXeqVD5ZpEmRaSpEhM1U8KfCosqzO194=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=kP9ln9IFyG1CyD2zYD6UBRJU+3nqtrfnnZ+cS/JlbzMx3B5faTPLBdCdqyTod9yo1
         Z0Z2LBvNwQOpWFZIlo0fsv987r878bT2zeUtFfUToRuBf1Lh/HgCJgU7bLrKBMWn3Q
         7EPPKclFWEMjk0R/r47l9T1m3+0SRS07OY7Pci/cE1nIgNUWDe6tk+Kayl8v2RJ0Rk
         3nt0YCCT4XfBt1BFf++ZQhEXx6KRIn9v+noVua6ZqWw5Skg8oeWfj68av04Fza1i/d
         F7E8EIRMAtO/MowkXFoanRyv6lWSbQx/oMz+9gxgwUq+u9RKO8pXG3cOzg4ztuNvIk
         5iYSGa7WbeIhA==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 4/30/20 7:13 AM, Dmitry Osipenko wrote:
> 30.04.2020 17:02, Dmitry Osipenko =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> 30.04.2020 16:56, Dmitry Osipenko =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>> 30.04.2020 01:00, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>> +static int chan_capture_kthread_finish(void *data)
>>>> +{
>>>> +	struct tegra_vi_channel *chan =3D data;
>>>> +	struct tegra_channel_buffer *buf;
>>>> +
>>>> +	set_freezable();
>>>> +
>>>> +	while (1) {
>>>> +		try_to_freeze();
>>> I guess it won't be great to freeze in the middle of a capture process,=
 so:
>>> 		if (list_empty(&chan->done))
>>> 			try_to_freeze();
>> And here should be some locking protection in order not race with the
>> chan_capture_kthread_start because kthread_finish could freeze before
>> kthread_start.
> Or maybe both start / finish threads should simply be allowed to freeze
> only when both capture and done lists are empty.
>
> if (list_empty(&chan->capture) &&
>      list_empty(&chan->done))
> 	try_to_freeze();

good to freeze when not in middle of the frame capture but why should we=20
not allow freeze in between captures?

Other drivers do allow freeze in between frame captures.

I guess we can freeze before dequeue for capture and in finish thread we=20
can freeze after capture done. This also don't need to check for=20
list_empty with freeze to allow between frame captures.


