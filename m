Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D5492514A8
	for <lists+linux-media@lfdr.de>; Tue, 25 Aug 2020 10:54:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728571AbgHYIyJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Aug 2020 04:54:09 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:8503 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728109AbgHYIyI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Aug 2020 04:54:08 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f44d1a20000>; Tue, 25 Aug 2020 01:53:54 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Tue, 25 Aug 2020 01:54:08 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Tue, 25 Aug 2020 01:54:08 -0700
Received: from [10.2.53.36] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 25 Aug
 2020 08:54:08 +0000
Subject: Re: [PATCH v3] tee: convert convert get_user_pages() -->
 pin_user_pages()
To:     Jens Wiklander <jens.wiklander@linaro.org>
CC:     <arm@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <olof@lixom.net>, <soc@kernel.org>,
        <tee-dev@lists.linaro.org>, Sumit Semwal <sumit.semwal@linaro.org>,
        <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <linaro-mm-sig@lists.linaro.org>
References: <CAHUa44FrxidzSUOM_JchOTa5pF6P+j8uZJA5DpKfGLWaS6tCcw@mail.gmail.com>
 <20200824211125.1867329-1-jhubbard@nvidia.com>
 <20200825083204.GA2068961@jade>
From:   John Hubbard <jhubbard@nvidia.com>
Message-ID: <1f111bb4-6e93-93d5-66ff-b9d4d456140f@nvidia.com>
Date:   Tue, 25 Aug 2020 01:54:08 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200825083204.GA2068961@jade>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1598345634; bh=MtrTtR7W0MYZILUrm95xWM9cnaEcReiy2mPIlaOwxxc=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=l4uR4VK0PiJo5w0LLlk1qyx38HDxhUpGAbiDVLTQSDSZvzqgAuWEGYdtIsFkXSxdz
         yRBUk/5DowXI23mfcBla6xZ9Vp6nBnk/JXDMZwa+y2CCi89SiTVFBx+dvvw6fcBIuO
         H5hho5wMVNMq6Sa5S9drrs9yGhynhzZ8LpRvW737V/8kPSs94U23VsQ8108MhFi96v
         s5Q21rxNTTFMA5jV0uh4MouuV/6NNF3/XK2egERx81KLcb787KwisqLdKs0QJXFEqm
         p6W7UwmAvkrKgMW08nzZITEfncUx95cC0WalvQ7atCLVmsMYh2iVzbISbsTCGd4Dcv
         j9bg78W4DcbHA==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 8/25/20 1:32 AM, Jens Wiklander wrote:
> On Mon, Aug 24, 2020 at 02:11:25PM -0700, John Hubbard wrote:
...
>> OK, one more try, this time actually handling the _USER_MAPPED vs.
>> _KERNEL_MAPPED pages!
>>
>> thanks,
>> John Hubbard
>> NVIDIA
> 
> Looks good and it works too! :-) I've tested it on my Hikey board with
> the OP-TEE test suite.
> I'm picking this up.
> 

Great! I see that I have, once again, somehow doubled up on the subject line:
"tee: convert convert ...". This particular typo just seems to stick to me. :)

If you get a chance to fix that up by changing it to just a single "convert"
I'd appreciate it.

thanks,
-- 
John Hubbard
NVIDIA
