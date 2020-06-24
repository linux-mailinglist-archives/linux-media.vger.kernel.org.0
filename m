Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 79F7D207247
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2020 13:40:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389037AbgFXLkF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Jun 2020 07:40:05 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:35683 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2388226AbgFXLkE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Jun 2020 07:40:04 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id o3ksjttD0x3Ajo3kwjjE8i; Wed, 24 Jun 2020 13:40:01 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1592998802; bh=M4pU4U03MaYJwcvRFJNv8nTld2vvriNqiHmYpFeqiHo=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=Y9PBhRygZJH8v1qTk6GeENyM1/HdGazWDB7Ff3TkRYW/JneSWne/pb8QisIu+lvxX
         s6wIPSx6k2Jpf5JxscBCdHeUYP3D/pBt3ZXJ8fhnpWq4+o4WKK5ajoQUs5vDOcaMTc
         4tltD5Vnoges6WBpw3pR0Rnmdtg5ruTXmUqNrgoHV7eSzXZe4tiQYrEBvIunPBOpwa
         7yvPzB3Ailhp+89o/svrDEUzpkLv7nF/FIJtDxuM7QI/3x6xg3KURVEfE8gvOmh88d
         Z1RcjC8xxnJ9kmGSi34l/OeHaAde9ETswOIDRjHPAuBrMYQ5dXGXy17heEixMLfxEo
         11PxwfetmBLfQ==
Subject: Re: [PATCH 00/11] media: exynos4-is: Improve support for s5pv210 and
 parallel ports
To:     Jonathan Bakker <xc-racer2@live.ca>, kyungmin.park@samsung.com,
        s.nawrocki@samsung.com, mchehab@kernel.org, kgene@kernel.org,
        krzk@kernel.org, linux-media@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tomasz Figa <tfiga@chromium.org>
References: <BN6PR04MB06602E7221CC7455F3142540A3AE0@BN6PR04MB0660.namprd04.prod.outlook.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <07fb9000-ae00-efcd-e91a-48765ff3d4bf@xs4all.nl>
Date:   Wed, 24 Jun 2020 13:39:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <BN6PR04MB06602E7221CC7455F3142540A3AE0@BN6PR04MB0660.namprd04.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfBEJKAd4Mb8tPxX9RLS4ybX9o3HV73/5KTa134SPVtKW/YYaw5qOt+O5gwi6sopzKQ2i3FKcPWxMmrPVijbeohlLU6MqYP15cTTMJuig6vtLZ9x7apez
 9kSPT+EtAWTSmnzGpP+sTg9wML3vMgoanWQ+iRRwd8F+gGyV7gxJBpEqIwPaxvESqlQLJKwNc8J5MF3XAguRDC+iwrJDI1E5GBW08Gm3FDVznr6dzN+LytN/
 KjcfwoZ4M0Qjsu0D2orcwn3K5LcgHx5COin6vjUM9X/3TjPAwylQNgbnU4bLrmWCYIb40MTDkCpVjnJuFuBGYiw+uySwNog80v/qSgjGqfw07+Rd/tGV3D5t
 O14m+MGSIyeUWCY4X8qWEFKrQ/PS4n+K1WW80FHtT8a4BRk9QOrqmIpQk9bhmmM5sdI5bKzdwGOOWd8HxvWTKVRtrh0SakR3+36L7RyXR80QLDAbDqcxn5K8
 eVE8xlcO6NnAo3/TljJTbZCK0GgttXCQgmo+tVswlRz13tC/dXuS+TDgZTg=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Can someone from Samsung or someone who knows this SoC take a look at this series?

This series looks sane to me, so I'll probably merge this if nobody replies
in the next two weeks or so.

Regards,

	Hans

On 26/04/2020 04:26, Jonathan Bakker wrote:
> This patchset improves support in the exynos4-is driver for s5pv210
> platforms as well as for sensors connected to the parallel ports
> and not using the CSIS device.
> 
> Fixes range from nullptr exceptions to probe fixes to JPEG fixes.
> 
> Notably, it also changes the fwnode probing of parallel port sensors
> to match the binding doc.  The binding doc said port A = reg 0 and
> port B = reg 1 but the driver implemented A=1 and B=2.  The only in-tree
> user of parallel ports is currently Goni, which notes that it uses port
> A but has reg = 1.  Also note that the sensor driver is not mainlined
> despite being present.  I have left the DTS as-is.
> 
> Some patches cleaning up non-DT support are also included.
> 
> The patches have been tested on a first-gen Galaxy S GT-i900M device based
> on S5PV210.  Two sensors (CE147 and S5KA3DFX, both with non-mainline
> drivers), both attached to port A, were succesfully used.
> 
> Jonathan Bakker (10):
>   media: exynos4-is: Remove static driver data for S5PV210 FIMC variants
>   media: exynos4-is: Fix nullptr when no CSIS device present
>   media: exynos4-is: Correct missing entity function initialization
>   media: exynos4-is: Improve support for sensors with multiple pads
>   media: exynos4-is: Properly set JPEG options when not using CSIS
>   media: exynos4-is: Add support for multiple sensors on one port
>   media: exynos4-is: Remove inh_sensor_ctrls
>   media: exynos4-is: Remove unused struct member input_index
>   media: exynos4-is: Prevent duplicate call to media_pipeline_stop
>   media: exynos4-is: Correct parallel port probing
> 
> Tomasz Figa (1):
>   media: exynos4-is: Request syscon only if ISP writeback is present
> 
>  .../media/platform/exynos4-is/fimc-capture.c  | 22 ++----
>  drivers/media/platform/exynos4-is/fimc-core.c | 67 ++----------------
>  drivers/media/platform/exynos4-is/fimc-core.h |  5 --
>  drivers/media/platform/exynos4-is/fimc-reg.c  |  7 ++
>  drivers/media/platform/exynos4-is/media-dev.c | 68 ++++++++++++++-----
>  drivers/media/platform/exynos4-is/media-dev.h |  1 +
>  include/media/drv-intf/exynos-fimc.h          |  2 +-
>  7 files changed, 72 insertions(+), 100 deletions(-)
> 

