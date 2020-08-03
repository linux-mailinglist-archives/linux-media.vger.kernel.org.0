Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A98A23A719
	for <lists+linux-media@lfdr.de>; Mon,  3 Aug 2020 15:00:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726624AbgHCNAH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Aug 2020 09:00:07 -0400
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:56407 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726291AbgHCNAG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 3 Aug 2020 09:00:06 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id 2a4Qko4eJuuXO2a4RkccFX; Mon, 03 Aug 2020 15:00:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1596459604; bh=1yqyfOlE3EzYvqZxQNITXZHea/U7xgp9NSdCTeNETiI=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=rWDrRDt2VbwgVdLVi3tMdXbNe35OWeD2SCAL6Vh0Wt4HiCjM9QlPpfwTnY4vB5rM2
         G3La/j5P8tqeYdeZXmRE7qo+CFEnSVuMxUSgFmh9ykmVED0psf8phFU/XRPa/KnXdL
         JxXhx7yjVQ2DxAS0gk5+CFhlqFw+6VNknoTV+zQLjZmhGwkCC++Y02NZIBjNZ0aaXs
         w+//6mfVaS9JEqldbDnW9ItEBW0dNEK8zXxVKuxzFOc9jbRjPiZ5TgbZAt2gq0xzQ2
         8MpzzlloGw4ckzJzdAReS+/5VE8QBkpzwbda3hS7t6ZWdBqgo+va6Go23gu29CJKQH
         N4ginYew4yLfg==
Subject: Re: [PATCH 1/3] dt-bindings: vendor-prefixes: Add KT Micro
To:     Santiago Hormazabal <santiagohssl@gmail.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org
References: <20200803020921.64151-1-santiagohssl@gmail.com>
 <20200803020921.64151-2-santiagohssl@gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <2b629e8c-3f05-be0e-2e7d-9461924ff462@xs4all.nl>
Date:   Mon, 3 Aug 2020 15:00:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200803020921.64151-2-santiagohssl@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfJwx4h/GOcMoVFWvbH3QVkv7iGULnltU8bU1y5otAe2bRJ9GPQk5xe7XbRgH7ldZJ6dQLI6ECnWXsEOQIYXRJNvsd5+jOJgLg3dOus5vjo1njNQwuEZj
 /2HrINAXjdUeeLqi0nTRdNmCtlccDzJdzF6kx77K3nF0GBcYkS1DcoJTBiXj9UeYxD2tWVqrUfn/2GbrAdu7eUI4NAXmQaLB1Z8uzanTp53Coo0yGOZGVc+M
 kSMMqINA5qU2ozb9CBdecMOMo9PVaBNii5V7C8yybMu9fZXpU8+y+8KtcRoDDAB59L1yOuyCM4365qmG8evApHh1E6ML1SUoab0PHBsUpmL3NPynz4A2rDQG
 mCXYYGx809KABVMXysRIPf1/i/dxpIfT4QdcGyPm4TIkU/zcPSWfCoTlJtSM/LdVeLZ6QmsqqAjfO251GMxk/KFzG6Ujhf+fSqq4FAMNcmgG8u/Ruch3KAXY
 lZ3Lk2DHF0SDkiS3
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 03/08/2020 04:09, Santiago Hormazabal wrote:
> Adds ktm as the prefix of KT Micro, Inc.
> 
> Signed-off-by: Santiago Hormazabal <santiagohssl@gmail.com>

Rob provided a Acked-by for v1 of this patch, so when you post a v2 you should
add that Acked-by as well (unless you made major changes to the code).

Ditto for patch 2/3 for which Rob provided a Reviewed-by.

Regards,

	Hans

> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> index 8261ede298f8..34809300fddd 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@ -547,6 +547,8 @@ patternProperties:
>      description: Kontron S&T AG
>    "^kosagi,.*":
>      description: Sutajio Ko-Usagi PTE Ltd.
> +  "^ktm,.*":
> +    description: KT Micro, Inc.
>    "^kyo,.*":
>      description: Kyocera Corporation
>    "^lacie,.*":
> 

