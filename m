Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 419E21CE4B6
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2020 21:44:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729786AbgEKToO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 May 2020 15:44:14 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:9071 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728283AbgEKToO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 May 2020 15:44:14 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5eb9aac30000>; Mon, 11 May 2020 12:42:59 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Mon, 11 May 2020 12:44:13 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Mon, 11 May 2020 12:44:13 -0700
Received: from [10.2.160.186] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 11 May
 2020 19:44:12 +0000
Subject: Re: [PATCH] MAINTAINERS: correct path in TEGRA VIDEO DRIVER
To:     Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
CC:     <linux-media@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Joe Perches <joe@perches.com>,
        <kernel-janitors@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20200511192844.11044-1-lukas.bulwahn@gmail.com>
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
Message-ID: <00ec3aa4-07c5-49ed-df89-de3f7f8b8cd8@nvidia.com>
Date:   Mon, 11 May 2020 12:44:11 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200511192844.11044-1-lukas.bulwahn@gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1589226179; bh=ZAJ4p4RMMS1vBtAsaXLjQ8611G1IZhQ/M9RFUKFXuXY=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=XOKuJxnlv8I4m9zkHkmOwkvc/6HjEZarwzCpahJiHOpkAnufxQD1YXVPmGzQ7TIS2
         PIIeGIlWbhhEQZ7bWmPkU+PQFxIc/FDkEIGf/wEyiKSTO1vLWMMEUzn6dlumMio6bJ
         R1ybvUAgBaAXGPlKUy1nfrSaox9Ya+1E63UmoEiuRC4bp4ri1NIqOGuFzglDTZqq9A
         5N4VmGZvFXprqZfubGd3hfkqR9N9nZ89cm/3pHOAPy6b4yHXeWlTFGVZyhUo5O0z01
         SgscTwObRWa5KRsV/3Fg7Eca6OBnbAh9X83/ZCSikgGWySIz+iGySaxeIpKh2IipZL
         dQSYDn6+Q4T1w==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 5/11/20 12:28 PM, Lukas Bulwahn wrote:
> Commit 423d10a99b30 ("media: tegra: Add Tegra210 Video input driver") added
> the driver to drivers/staging/media/tegra-video/, but commit 2c6b617f2cca
> ("MAINTAINERS: Add Tegra Video driver section") added a file entry
> referring to drivers/staging/media/tegra/.
>
> Hence, ./scripts/get_maintainer.pl --self-test=patterns complains:
>
>    warning: no file matches  F:  drivers/staging/media/tegra/
>
> Adjust the file entry in TEGRA VIDEO DRIVER to the correct path.
>
> Signed-off-by: Lukas Bulwahn<lukas.bulwahn@gmail.com>
> ---
> Sowjanya, please ack this minor patch.
>
> applies cleanly on next-20200511
>
>   MAINTAINERS | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
Acked-by: Sowjanya Komatineni <skomatineni@nvidia.com>
