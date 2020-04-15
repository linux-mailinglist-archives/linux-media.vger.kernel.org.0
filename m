Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA20B1AAEEB
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2020 18:59:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1416319AbgDOQym (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Apr 2020 12:54:42 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:9536 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2410503AbgDOQyk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Apr 2020 12:54:40 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e973c150000>; Wed, 15 Apr 2020 09:53:41 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Wed, 15 Apr 2020 09:54:39 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Wed, 15 Apr 2020 09:54:39 -0700
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 15 Apr
 2020 16:54:39 +0000
Received: from [10.2.171.241] (10.124.1.5) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 15 Apr
 2020 16:54:36 +0000
Subject: Re: [RFC PATCH v7 6/9] media: tegra: Add Tegra210 Video input driver
To:     Dmitry Osipenko <digetx@gmail.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <frankc@nvidia.com>, <hverkuil@xs4all.nl>,
        <sakari.ailus@iki.fi>, <helen.koike@collabora.com>
CC:     <sboyd@kernel.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <1586919463-30542-1-git-send-email-skomatineni@nvidia.com>
 <1586919463-30542-7-git-send-email-skomatineni@nvidia.com>
 <4118112f-f865-5460-6319-d71271fd78d1@gmail.com>
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
Message-ID: <a69a8b34-beea-3ad0-e08e-f7df8b9e7047@nvidia.com>
Date:   Wed, 15 Apr 2020 09:54:35 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <4118112f-f865-5460-6319-d71271fd78d1@gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1586969621; bh=qoQMVbOMXWlnzPj6qRnxRISwVee7/CHgjWqtqRqD2To=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=rH/1dp3DfCTqvWOIb14CzYUIoOBvbHu6es5/YeDMq1vuUKzUsaP0ZogLcKxkaCTAK
         siGgltClP2My3W8nCnSEhAz2rKh7Ms+MCFFBzBAy3OIcIYBeFcdNM+YC1jUfChofDV
         6tGaIcsi5WiscfbsyhITxWJ+y7CFhtsNYhNwHJpK5t8kMyRTEz1wd0SI+elcl9Oroa
         KnIx9MhujgyDZa6x4zPTCoFNAkUYJY6l6UpKddVaY2VSI/igFIy8JwN5iUujfLIGOo
         DV1m9qtkcf53op6YPF9MvP0x84DSESxCuVxJftskbTv74WWeziFineswTyvu6iVHiD
         Jy32J1en+B5eg==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 4/15/20 7:22 AM, Dmitry Osipenko wrote:
> External email: Use caution opening links or attachments
>
>
> 15.04.2020 05:57, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> +static int tegra_csi_remove(struct platform_device *pdev)
>> +{
>> +     struct tegra_csi *csi =3D platform_get_drvdata(pdev);
>> +     int err;
>> +
>> +     err =3D host1x_client_unregister(&csi->client);
>> +     if (err < 0) {
>> +             dev_err(csi->dev,
>> +                     "failed to unregister host1x client: %d\n", err);
>> +             return err;
>> +     }
>> +
>> +     pm_runtime_disable(csi->dev);
>> +     kfree(csi);
> IIRC, the driver removal is invoked on the unbinding. Hence, I'm not
> sure how moving away from the resource-managed API helps here. Could you
> please explain in a more details?
>
> Have you tried to test this driver under KASAN? I suspect that you just
> masked the problem, instead of fixing it.
Using devm_kzalloc for vi/csi structures based on prior feedback request=20
to switch to use kzalloc all over this driver.

Hi Hans,

video devices lifetime is till video device nodes are released. So, v4l2=20
device release callback does the release of tegra channel allocation=20
which hold video device.

Below are the 3 possible cases of unbind/unload,

1. during tegra-video module unload, if v4l2 device refcnt is not 0=20
which is the case when any of video device node handle is kept opened=20
then unloading module will not happen and module refcnt is also non-zero=20
and unloading tegra-video module reports module in use.

2. during tegra-video driver unbind, tegra-video driver removal will do=20
vi/csi clients exit ops which unregisters video device allocated memory=20
during release callback of v4l2 device. vi/csi structure allocation=20
remains same as vi/csi driver removal will not happen in this case.


3. during direct host1x client drivers vi/csi unbind, both=20
host1x_clients vi/csi gets unregistered, deletes host1x logical device=20
which executes tegra-video driver removal() -> vi/csi exit() before=20
vi/csi memory gets freed in vi/csi driver remove().

So, any active streaming will stop and video devices are unregistered=20
during direct client driver unbind prior to freeing vi/csi memory.

Also vi/csi driver remove does explicit free vi/csi as its allocated=20
with kzalloc. So not sure how using kzalloc is different to devm_kzalloc=20
for vi/csi structure in terms of when vi/csi memory gets freed?

Except for channel allocation which holds video device and as video=20
device life time is beyond tegra-video module unbind->vi exit(), looks=20
like we can use devm_kzalloc for vi/csi.


Can you please comment if you still think we need to use kzalloc rather=20
than devm_kzalloc for vi/csi structure allocation?

Thanks

Sowjanya

