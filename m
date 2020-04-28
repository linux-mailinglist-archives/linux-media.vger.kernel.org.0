Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D8331BC1FB
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2020 16:53:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728060AbgD1Oxg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Apr 2020 10:53:36 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:7664 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727775AbgD1Oxg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Apr 2020 10:53:36 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5ea842f60000>; Tue, 28 Apr 2020 07:51:34 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Tue, 28 Apr 2020 07:53:36 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Tue, 28 Apr 2020 07:53:36 -0700
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 28 Apr
 2020 14:53:36 +0000
Received: from [10.2.165.152] (10.124.1.5) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 28 Apr
 2020 14:53:35 +0000
Subject: Re: [RFC PATCH v1 0/5] media: tegra: Tegra video driver follow-up
 patches
To:     Hans Verkuil <hverkuil@xs4all.nl>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <frankc@nvidia.com>
CC:     <digetx@gmail.com>, <linux-media@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <1588047650-29402-1-git-send-email-skomatineni@nvidia.com>
 <5f065fc5-0f45-6b9e-068c-28d0a2e4684e@xs4all.nl>
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
Message-ID: <8ae1bfca-e4bf-ed67-8945-646a6121875a@nvidia.com>
Date:   Tue, 28 Apr 2020 07:52:39 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <5f065fc5-0f45-6b9e-068c-28d0a2e4684e@xs4all.nl>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1588085494; bh=p+kXoWpy+6lidCfK/jU6nAwd2T6v9oCDp2I442hw04E=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=QG1Ei70TnkYDcvOlU4yGcBofHLqeT+hSrFgWQjnYJezhhNEWf5fhl4x/d881flD9e
         Q6Y6ASs02xQ1vLs+fFbUzXMxl/TNgq89FSfLqRXR/FsiNnzdaZyUv4rH4ATif2/k85
         zgezNQtXt+Dk3innTsICvNyEWDTIuYy/385Hv+rJIq/JoF6bfXyS7ZFRcJSlPOuoPD
         zBpKORMoFHqhlSvwvOft86/VlGVkI6O76TXdN1JFWs1rJFC4s+OvBeLs6rrePg/yM9
         9gbg+ECwZwSgXq5QE8NhGn2twkKsCPjkElgv9E4FYbxB3un1B6S09nxVBhjKwchzta
         wTYl0zGEb4i7g==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 4/28/20 12:38 AM, Hans Verkuil wrote:
> External email: Use caution opening links or attachments
>
>
> On 28/04/2020 06:20, Sowjanya Komatineni wrote:
>> This is a fllow-up to some last feedback received for Tegra VI driver RFC
>> v10 patches.
>> https://patchwork.linuxtv.org/cover/63334/
>>
>>
>> Sowjanya Komatineni (5):
>>    MAINTAINERS: Rename Tegra Video driver path
>>    media: tegra: Rename driver path to tegra-video
>>    media: tegra-video: Move PM runtime handle to streaming
>>    media: tegra-video: Rearrange SoC specific to Tegra210 and cleanup
>>      files
>>    media: tegra-video: Remove module macros for vi and csi driver
>>
>>   MAINTAINERS                                  |    2 +-
>>   drivers/staging/media/Kconfig                |    2 +-
>>   drivers/staging/media/Makefile               |    2 +-
>>   drivers/staging/media/tegra-video/Kconfig    |   12 +
>>   drivers/staging/media/tegra-video/Makefile   |    8 +
>>   drivers/staging/media/tegra-video/TODO       |   10 +
>>   drivers/staging/media/tegra-video/csi.c      |  536 ++++++++++++
>>   drivers/staging/media/tegra-video/csi.h      |  146 ++++
>>   drivers/staging/media/tegra-video/tegra210.c | 1080 ++++++++++++++++++++++++
>>   drivers/staging/media/tegra-video/vi.c       | 1082 +++++++++++++++++++++++++
>>   drivers/staging/media/tegra-video/vi.h       |  258 ++++++
>>   drivers/staging/media/tegra-video/video.c    |  155 ++++
>>   drivers/staging/media/tegra-video/video.h    |   29 +
>>   drivers/staging/media/tegra/Kconfig          |   12 -
>>   drivers/staging/media/tegra/Makefile         |    8 -
>>   drivers/staging/media/tegra/TODO             |   10 -
>>   drivers/staging/media/tegra/common.h         |  259 ------
>>   drivers/staging/media/tegra/csi.c            |  604 --------------
>>   drivers/staging/media/tegra/csi.h            |  144 ----
>>   drivers/staging/media/tegra/tegra210.c       |  708 ----------------
>>   drivers/staging/media/tegra/tegra210.h       |  190 -----
>>   drivers/staging/media/tegra/vi.c             | 1127 --------------------------
>>   drivers/staging/media/tegra/vi.h             |   72 --
>>   drivers/staging/media/tegra/video.c          |  153 ----
>>   drivers/staging/media/tegra/video.h          |   29 -
>>   25 files changed, 3319 insertions(+), 3319 deletions(-)
> I thought that the follow-up series was just a rename of a directory
> and perhaps one or two smaller changes, but this is too much change.
> I prefer to have a v11 instead with all these changes incorporated.
>
> Sorry about that,
>
>          Hans
OK Will send v11. Thanks Hans
>
>>   create mode 100644 drivers/staging/media/tegra-video/Kconfig
>>   create mode 100644 drivers/staging/media/tegra-video/Makefile
>>   create mode 100644 drivers/staging/media/tegra-video/TODO
>>   create mode 100644 drivers/staging/media/tegra-video/csi.c
>>   create mode 100644 drivers/staging/media/tegra-video/csi.h
>>   create mode 100644 drivers/staging/media/tegra-video/tegra210.c
>>   create mode 100644 drivers/staging/media/tegra-video/vi.c
>>   create mode 100644 drivers/staging/media/tegra-video/vi.h
>>   create mode 100644 drivers/staging/media/tegra-video/video.c
>>   create mode 100644 drivers/staging/media/tegra-video/video.h
>>   delete mode 100644 drivers/staging/media/tegra/Kconfig
>>   delete mode 100644 drivers/staging/media/tegra/Makefile
>>   delete mode 100644 drivers/staging/media/tegra/TODO
>>   delete mode 100644 drivers/staging/media/tegra/common.h
>>   delete mode 100644 drivers/staging/media/tegra/csi.c
>>   delete mode 100644 drivers/staging/media/tegra/csi.h
>>   delete mode 100644 drivers/staging/media/tegra/tegra210.c
>>   delete mode 100644 drivers/staging/media/tegra/tegra210.h
>>   delete mode 100644 drivers/staging/media/tegra/vi.c
>>   delete mode 100644 drivers/staging/media/tegra/vi.h
>>   delete mode 100644 drivers/staging/media/tegra/video.c
>>   delete mode 100644 drivers/staging/media/tegra/video.h
>>
