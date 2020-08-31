Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 681782583DB
	for <lists+linux-media@lfdr.de>; Tue,  1 Sep 2020 00:04:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729365AbgHaWEs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 31 Aug 2020 18:04:48 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:9448 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725934AbgHaWEr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 31 Aug 2020 18:04:47 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f4d73f10000>; Mon, 31 Aug 2020 15:04:33 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Mon, 31 Aug 2020 15:04:47 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Mon, 31 Aug 2020 15:04:47 -0700
Received: from [10.2.173.243] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 31 Aug
 2020 22:04:47 +0000
Subject: Re: [PATCH v4 3/4] dt-bindings: media: imx274: Move clock and
 supplies to required properties
To:     Sakari Ailus <sakari.ailus@iki.fi>
CC:     <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <hverkuil@xs4all.nl>, <luca@lucaceresoli.net>,
        <leonl@leopardimaging.com>, <robh+dt@kernel.org>,
        <lgirdwood@gmail.com>, <broonie@kernel.org>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <1598903558-9691-1-git-send-email-skomatineni@nvidia.com>
 <1598903558-9691-4-git-send-email-skomatineni@nvidia.com>
 <20200831202613.GE844@valkosipuli.retiisi.org.uk>
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
Message-ID: <36852aee-7292-77d3-7101-9ac2bdcecd8b@nvidia.com>
Date:   Mon, 31 Aug 2020 15:04:35 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200831202613.GE844@valkosipuli.retiisi.org.uk>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1598911473; bh=nlFUKa3wKlEr/o7jMIZW6ahyy4Dbl0gouZbHwH5S80w=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=sKKDyTikhAXBVS+8GNDgrd3X180QRMvK0xig2t2Ng5XOQC7e+G+D5Na9o0UcYwdU3
         q99801Ep7lQyA5vqudtnq5/ki3PwMa8a8ytUiQujVXFE8smiogXuZmJs25syNI+3yF
         WFArIARxhUirOWC7uzZ2Rj+J2vp/fZLBJhNSRb9guKfBy4XfQ/0uoJKvrOYedyy/UK
         /7VCnJPI2BjDWIrqFMMYVhHJrD8K6tW9UCAv7kA5oszqrCc2ez2k9gfvkTAV4XiD/w
         30Nxb+YnTTy82NsaZV/i/zEud5Yt7R/2glzImc7FSRctfUHBitk3OyjaqQzWH7ojuN
         EyVuVI0COwkhA==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 8/31/20 1:26 PM, Sakari Ailus wrote:
> Hi Sowjanya,
>
> On Mon, Aug 31, 2020 at 12:52:37PM -0700, Sowjanya Komatineni wrote:
>> Clock and supplies are external to IMX274 sensor and are dependent
>> on camera module design.
>>
>> So, this patch moves them to required properties.
>>
>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> One more comment.
>
> Jacopo has been working on converting this to YAML format. Could you rebase
> your patch on his? I believe he's still working on some changes. The
> subject is "[PATCH v3] dt-bindings: media: imx274: Convert to json-schema".
Sure, will keep them as optional and will rebase dt-bindings on 
json-schema patch
