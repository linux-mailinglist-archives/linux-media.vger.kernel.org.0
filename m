Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5E7A1CA98A
	for <lists+linux-media@lfdr.de>; Fri,  8 May 2020 13:26:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726908AbgEHL0M (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 8 May 2020 07:26:12 -0400
Received: from o1.b.az.sendgrid.net ([208.117.55.133]:3377 "EHLO
        o1.b.az.sendgrid.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726913AbgEHL0L (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 8 May 2020 07:26:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
        h=subject:references:from:mime-version:in-reply-to:to:cc:content-type:
        content-transfer-encoding;
        s=001; bh=PWK4XLf8uT47fjT53Iwr1F6YaT+HIpbOZWH2ruYq3Bk=;
        b=LvV+RynM2vXcBlzqjJlEN+mcoAEMTEqWYGG4uE8+80MxEtI1MdccK9AFCxTz0wFT5eMl
        j0gs5M6LAOBz7EBOorWqQdvKjNb48SptAokbJslf9+FuVBd5JB3Fqkj5hteD++DRYcpEu3
        c0tdVAUKcz/hRD9tayPl21ARKn4BHjpOw=
Received: by filterdrecv-p1iad2-asgard1-688d55b576-8lwk5 with SMTP id filterdrecv-p1iad2-asgard1-688d55b576-8lwk5-17-5EB540A4-41
        2020-05-08 11:21:08.626344087 +0000 UTC m=+322689.304433033
Received: from [192.168.1.14] (unknown)
        by ismtpd0002p1lon1.sendgrid.net (SG) with ESMTP
        id nviAOGnKRJCcgVKaIBvmzQ
        Fri, 08 May 2020 11:21:08.286 +0000 (UTC)
Subject: Re: [PATCH v3 3/3] media: rkvdec: Add the VP9 backend
References: <20200505134110.3435-1-ezequiel@collabora.com>
 <20200505134110.3435-4-ezequiel@collabora.com>
From:   Jonas Karlman <jonas@kwiboo.se>
Message-ID: <4ac628c6-0845-7bca-2c1a-4d6ef2a4019f@kwiboo.se>
Date:   Fri, 08 May 2020 11:21:08 +0000 (UTC)
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200505134110.3435-4-ezequiel@collabora.com>
X-SG-EID: =?us-ascii?Q?TdbjyGynYnRZWhH+7lKUQJL+ZxmxpowvO2O9SQF5CwCVrYgcwUXgU5DKUU3QxA?=
 =?us-ascii?Q?fZekEeQsTe+RrMu3cja6a0h=2FJngJCfOXTHYiA64?=
 =?us-ascii?Q?a6CEbDfl66SIIwIB00p85CVBgT4TGI6ZDzCtGbT?=
 =?us-ascii?Q?+PzqdSwTwd98bSU5cYCWbHrqdKeGhym4hz26ahE?=
 =?us-ascii?Q?qwZwR9qCjy+3NGdXUELFKFMdzeQMxDft9uyw3Ir?=
 =?us-ascii?Q?S40NSBM7PGXLoMjR2CFuP6lGFK0Vwvg08UQKwO1?=
 =?us-ascii?Q?mjI8jsMwpXgIqROwHfxRg=3D=3D?=
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc:     Tomasz Figa <tfiga@chromium.org>, kernel@collabora.com,
        Heiko Stuebner <heiko@sntech.de>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Alexandre Courbot <acourbot@chromium.org>,
        Jeffrey Kardatzke <jkardatzke@chromium.org>,
        gustavo.padovan@collabora.com,
        Boris Brezillon <boris.brezillon@collabora.com>
Content-Type: text/plain; charset=us-ascii
Content-Language: sv
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 2020-05-05 15:41, Ezequiel Garcia wrote:
> From: Boris Brezillon <boris.brezillon@collabora.com>
> 
> The Rockchip VDEC supports VP9 profile 0 up to 4096x2304@30fps. Add
> a backend for this new format.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>

I have tested this series on a Rock Pi 4 RK3399 device using
the ffmpeg vp9 request api hwaccel at [1].
Decoding up to 3840x2160@30fps media is working great.
(frame scaling was not tested or fully implemented in ffmpeg hwaccel)

Tested-by: Jonas Karlman <jonas@kwiboo.se>

[1] https://github.com/Kwiboo/FFmpeg/commits/v4l2-request-hwaccel-4.2.2

Regards,
Jonas

> ---
>  drivers/staging/media/rkvdec/Makefile     |    2 +-
>  drivers/staging/media/rkvdec/rkvdec-vp9.c | 1577 +++++++++++++++++++++
>  drivers/staging/media/rkvdec/rkvdec.c     |   56 +-
>  drivers/staging/media/rkvdec/rkvdec.h     |    6 +
>  4 files changed, 1637 insertions(+), 4 deletions(-)
>  create mode 100644 drivers/staging/media/rkvdec/rkvdec-vp9.c
> 

[...]
