Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9BEB83024AB
	for <lists+linux-media@lfdr.de>; Mon, 25 Jan 2021 13:10:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727764AbhAYMKC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 25 Jan 2021 07:10:02 -0500
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:56247 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727837AbhAYMJk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 Jan 2021 07:09:40 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id 401GlTYvNiWRg401Jlg7og; Mon, 25 Jan 2021 12:27:04 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1611574024; bh=+XdyfNY28ToFLDiRc/RBR//0sjjuFowjTIx+KTzKoq0=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=i+1zAkfaAIxRQTvgU1go+h0YOnXXTljR678qZyzZbdQPIZte63fk015CIE+fC69OA
         e5E5aB53SmK3Fl/hs2C3koIt7LJ9P2vzLEiS4UU5Z9FsDM/oYRYQ8gFJ3/xEK3yT+v
         Ssz/abL1/jNX+bsc+PFRSmz+RshIDgpiSdHkdNEm4+DZkTEhRyqkba+AkmbRVUB+Hl
         j2BgowqjlheoMpwzVUJBcGe1+U7wE8BLzXCDrrHfRVdN/ne4xL/VjogvSy6Hhi7dtW
         +nDNBvw9bt4dxfgUvfkSFxwu7R7VeCiIX1e3A8AccsZT55ysDxtsfCVCCPaL0nXrtn
         PgcnmBOszmHGQ==
Subject: Re: [PATCH] media: vidtv: remove redundant quote
To:     chiguoqing <chi962464zy@163.com>, mchehab@kernel.org
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        zhangwen@yulong.com
References: <20210119010947.709-1-chi962464zy@163.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <b470e011-a21e-f333-6650-5c025906d63e@xs4all.nl>
Date:   Mon, 25 Jan 2021 12:26:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210119010947.709-1-chi962464zy@163.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfEJSgiuFTcjqUv2apOHqwGWaWvNx+RKzAz2hNmDrhr1UOVuBlqmJC+GvNx4eanwjjlWWYWvc7qQPvaAaKkDEdmSvhzn5NZ2QhsPZ1FGxPCifo47YgvQK
 1GVbPQcSK2o2gSaWU4WDWlvA5G4OYgEzQbBhUxMHS/hxPChJL6StI2jmVlCQJSYSH/xI0R+RNkUXTtJ/sCWkfGbvSwDjM7Y70GcvR+luatbqma8G3hV/jzzC
 rxzopeDGFUCRTbgmdzHTL3LLrRlLAeQM2l3ar+0wy3CdfDsL5tXTCEbrnidaOQtk2R5FEzWH6aYvyxphQasWDLa2FCNNf416hj63h0/mwr0=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 19/01/2021 02:09, chiguoqing wrote:
> Repeated references string.h
> 
> Signed-off-by: Wen Zhang <zhangwen@yulong.com>

checkpatch gives me:

ERROR: Missing Signed-off-by: line by nominal patch author 'chiguoqing <chi962464zy@163.com>'

Can you fix this?

Regards,

	Hans

> ---
>  drivers/media/test-drivers/vidtv/vidtv_psi.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/media/test-drivers/vidtv/vidtv_psi.c b/drivers/media/test-drivers/vidtv/vidtv_psi.c
> index 4511a2a98405..8ff27d26c343 100644
> --- a/drivers/media/test-drivers/vidtv/vidtv_psi.c
> +++ b/drivers/media/test-drivers/vidtv/vidtv_psi.c
> @@ -19,7 +19,6 @@
>  #include <linux/ratelimit.h>
>  #include <linux/slab.h>
>  #include <linux/string.h>
> -#include <linux/string.h>
>  #include <linux/time.h>
>  #include <linux/types.h>
>  
> 

