Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0031F1B854D
	for <lists+linux-media@lfdr.de>; Sat, 25 Apr 2020 11:36:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726073AbgDYJg2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 25 Apr 2020 05:36:28 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:54873 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725837AbgDYJg1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 25 Apr 2020 05:36:27 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id SHERjN65NlKa1SHEVjTTIE; Sat, 25 Apr 2020 11:36:24 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1587807384; bh=fSYBdxjgYtmYwGO3ICwPcGjEcBBVqN9UZaSZatOml9E=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=CslqNo6TKr61FhjvZFeX4gxFSTW3yda1JQn1LdpQJf2j+M8j5S3RH+XrsXl496S7p
         gf31e4sre4Ofq1DdZLgfcJC8Ac5lpBctqgW7gTPd2cz4Ix6OdwLd+VekbGRSVdXXTK
         fpFLeoeBYqx3mlBVvD4quAru9/yw24j9WZCxnp95EQZq5BJAZKt73XBv1rA/N4TL60
         6WdWxWUFYjKroQBXNemGwgj3M/YdjE3O5BoeeCYQLie9tmGjqgqoExq7exGZd60Qlf
         nvqqbjkQHVOFLYKYNC1x+gdsyMamBqWeAJhhr792mj8y1NlelP0wkPejUVAQlETWNk
         ppsheNEsfYhLA==
Subject: Re: [RFC PATCH v10 6/9] media: tegra: Add Tegra210 Video input driver
To:     Dmitry Osipenko <digetx@gmail.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com, frankc@nvidia.com,
        sakari.ailus@iki.fi, helen.koike@collabora.com
Cc:     sboyd@kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1587700513-28449-1-git-send-email-skomatineni@nvidia.com>
 <1587700513-28449-7-git-send-email-skomatineni@nvidia.com>
 <6ca93ff9-ca59-544f-767c-4355d01a5c20@gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <62546d1f-eca5-06be-2bc2-e45ccd53830a@xs4all.nl>
Date:   Sat, 25 Apr 2020 11:36:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <6ca93ff9-ca59-544f-767c-4355d01a5c20@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfNDz9HNxuqvyVl2LksfOfgdeceMdmfDlPtUuL8p5+1z94jh0ysXaXrk72fRFAoZruzMaSpqmLAabuLPR5TyA5ByC+iydYkYlRyRlM0C7ttuXsNFV1eGY
 LsJkH3/vDAMCBJ8Fv5m1EmuwJm5pi6PX3ch6aCVALXxDadxmW1SA5WVFFbo/LjjGLfyzePjxAWsMOl4PNiGprlcYCqN9VqdJG/IkgFFMUOKPFSSxmoHwkOXZ
 sZzwyghdVQA+TzD0DxfFTpptWzbrvMWwJvpm7/pvgomRw2+iOS5U1NDSfaULH8RDhLI1dlwk1st1XgsqGjbcInAIH34OqwchG0gW24U41PG00p7bkKnhIWB3
 MOKrYVqHcNLQ401YQFQ2uGXfxY9AGfuYHQDSz2jw2CzWCk2BF+/ApXoz+OkOJ03Ap38lV0W5JccjA42GvfgfF0FhSg5cAOtCr+Az78jHzp6Awo/u81IYG3yO
 cCtMKi9bxEuozGXV/hol1DzHh743hJQKa9h8R0WJ2VoyKmsCZGifmne5T1DQZ5bWxP+eD0DBuQGX00+YvBzXvVZKJx1hyfnPYXFers040re5rp3+Y4mMTiqP
 JNc=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 24/04/2020 17:11, Dmitry Osipenko wrote:
> 24.04.2020 06:55, Sowjanya Komatineni пишет:
>> Tegra210 contains a powerful Video Input (VI) hardware controller
>> which can support up to 6 MIPI CSI camera sensors.
>>
>> Each Tegra CSI port can be one-to-one mapped to VI channel and can
>> capture from an external camera sensor connected to CSI or from
>> built-in test pattern generator.
>>
>> Tegra210 supports built-in test pattern generator from CSI to VI.
>>
>> This patch adds a v4l2 capture driver with media interface for
>> Tegra210 built-in CSI to VI test pattern generator.
>>
>> This patch includes TPG support only and all the video pipeline
>> configuration happens through the video device node.
>>
>> Acked-by: Thierry Reding <treding@nvidia.com>
>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>> ---
>>  drivers/staging/media/Kconfig          |    2 +
>>  drivers/staging/media/Makefile         |    1 +
>>  drivers/staging/media/tegra/Kconfig    |   12 +
>>  drivers/staging/media/tegra/Makefile   |    8 +
>>  drivers/staging/media/tegra/TODO       |   10 +
>>  drivers/staging/media/tegra/common.h   |  259 ++++++++
>>  drivers/staging/media/tegra/csi.c      |  604 +++++++++++++++++
>>  drivers/staging/media/tegra/csi.h      |  144 ++++
>>  drivers/staging/media/tegra/tegra210.c |  708 ++++++++++++++++++++
>>  drivers/staging/media/tegra/tegra210.h |  190 ++++++
>>  drivers/staging/media/tegra/vi.c       | 1127 ++++++++++++++++++++++++++++++++
>>  drivers/staging/media/tegra/vi.h       |   72 ++
>>  drivers/staging/media/tegra/video.c    |  153 +++++
>>  drivers/staging/media/tegra/video.h    |   29 +
> 
> The media/tegra/ sounds a bit too generic, the media/tegra-vi/ path
> should better reflect the driver, IMO.
> 
> It also should be better to name the compiled kernel module as tegra-vi,
> IMO.
> 

The driver name and the directory should be in sync, so either tegra-video
or tegra-vi for both. I have no preference myself, as long as they are the
same.

This can be done as a follow-up patch.

Regards,

	Hans
