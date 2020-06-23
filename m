Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B1932052EC
	for <lists+linux-media@lfdr.de>; Tue, 23 Jun 2020 14:57:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732570AbgFWM5U (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Jun 2020 08:57:20 -0400
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:35303 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729504AbgFWM5T (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Jun 2020 08:57:19 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id niUDjbkx5Nb6lniUHjrEMs; Tue, 23 Jun 2020 14:57:17 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1592917037; bh=pw7XrWHBw/mm0JZpv11RBTTXTVIbkT6TptDy1yTxz2c=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=D+c7QI6yEGwaCmKWHVmdYXJvUWRw/oH8ukipZRL9/KLal0xd2Nvav3gcXuySHdNxo
         T85RsGf1Lq+HcDVa4LagEEDnEFgqShhcftLT+YVVfjc83ltrCH/9Am5f6t43NLtPKK
         vfRSg5y9UpRBBXotvryjmY+BgLXElvHuWAkRhD0eVFw+0UupTqI4AxBPAraTLCswf6
         vgg0EjtkaxGuNOtVl9QAD/9O2DrtxOylsnYiJqHLx08tFkOD3y8yT4g4R+UIKyHPGC
         4xYCBwyFhjcJ7LzQrtE4ttiF6gsgx4WJ5yAKeU1mYfcOs7q4khK04SybhhtBH8HVQ8
         tBSeJWVEgeu/A==
Subject: Re: [PATCH] media: dev-encoder.rst: add GFDL-1-1+ to SPDX header
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Michael Tretter <m.tretter@pengutronix.de>,
        linux-kernel@vger.kernel.org
References: <921758bc9b2fd38abe8293c328beff3ed089b395.1592915281.git.mchehab+huawei@kernel.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <c014bee7-09ae-6061-55c1-df59be56761f@xs4all.nl>
Date:   Tue, 23 Jun 2020 14:57:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <921758bc9b2fd38abe8293c328beff3ed089b395.1592915281.git.mchehab+huawei@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfC3aCi1ZVh1wbTfOY5apfrobiqQJyjB12QKSnLfchpnuPte1FRk8PzY87/XKtxremRDIWNeBM3jNMmyV5MMJNLW1VterCEk3tqd49Q3dOtmxFtqpoDdF
 oLZepBI7oINBCKpdzn8vU7mG24+Y0TI1ucJEFIxRwF1d2OpusXJ+Kr2772pKqeTX33O6OoclQXGVEzT+DDArPMBgrHpD9mBuXaTPB0rZ5t6YgGOwU4X5LE/V
 iCZqg+9G3PWVk9on5zgc8m8yeEy6grLhVctbBGsZfBT9pP7DbQ4SeHKzdojudqOBE7F4WD3z+MHInMgwZ2qKIIWwKgqz6PlCGAMmbofyYJM=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 23/06/2020 14:28, Mauro Carvalho Chehab wrote:
> The media documents under the uAPI should be GFDL compatible.
> 
> So, make this one dual-licensed GPL-2.0 or GFDL-1.1+ with
> no-invariant sections.
> 
> Signed-off-by: Tomasz Figa <tfiga@chromium.org>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Thanks!

	Hans

> ---
>  .../userspace-api/media/v4l/dev-encoder.rst   | 26 ++++++++++++++++++-
>  1 file changed, 25 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/userspace-api/media/v4l/dev-encoder.rst b/Documentation/userspace-api/media/v4l/dev-encoder.rst
> index c3a21bfe0052..fb44f20924de 100644
> --- a/Documentation/userspace-api/media/v4l/dev-encoder.rst
> +++ b/Documentation/userspace-api/media/v4l/dev-encoder.rst
> @@ -1,4 +1,28 @@
> -.. SPDX-License-Identifier: GPL-2.0
> +.. This file is dual-licensed: you can use it either under the terms
> +.. of the GPL 2.0 or the GFDL 1.1+ license, at your option. Note that this
> +.. dual licensing only applies to this file, and not this project as a
> +.. whole.
> +..
> +.. a) This file is free software; you can redistribute it and/or
> +..    modify it under the terms of the GNU General Public License as
> +..    published by the Free Software Foundation version 2 of
> +..    the License.
> +..
> +..    This file is distributed in the hope that it will be useful,
> +..    but WITHOUT ANY WARRANTY; without even the implied warranty of
> +..    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> +..    GNU General Public License for more details.
> +..
> +.. Or, alternatively,
> +..
> +.. b) Permission is granted to copy, distribute and/or modify this
> +..    document under the terms of the GNU Free Documentation License,
> +..    Version 1.1 or any later version published by the Free Software
> +..    Foundation, with no Invariant Sections, no Front-Cover Texts
> +..    and no Back-Cover Texts. A copy of the license is included at
> +..    Documentation/userspace-api/media/fdl-appendix.rst.
> +..
> +.. TODO: replace it to GPL-2.0 OR GFDL-1.1-or-later WITH no-invariant-sections
>  
>  .. _encoder:
>  
> 

