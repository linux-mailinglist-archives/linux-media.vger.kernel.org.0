Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA49A3F2C9C
	for <lists+linux-media@lfdr.de>; Fri, 20 Aug 2021 14:59:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240596AbhHTM7h (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 20 Aug 2021 08:59:37 -0400
Received: from smtp-fw-6001.amazon.com ([52.95.48.154]:3640 "EHLO
        smtp-fw-6001.amazon.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240375AbhHTM7h (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 20 Aug 2021 08:59:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1629464339; x=1661000339;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=3GaV9/2LUBs09neoeWMPRUX3WscxmyrwA0SK3q39Ixc=;
  b=LoiS9i1T4OYa9V0iTVCQMRtb+09rHznROQ0llkwBwc60EnXQM1LWnakC
   sMto0Nam+V98/RHoIBxYwYf54Jm1wCYSEhPXSDVoAOMOl2QhFY8YozJJX
   jMR2J5Sub2VhzDbF/XlnWcumtCFhZTgnUh63B4pcL0aIK1nDdfkf2Yulc
   w=;
X-IronPort-AV: E=Sophos;i="5.84,337,1620691200"; 
   d="scan'208";a="135308554"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO email-inbound-relay-2a-53356bf6.us-west-2.amazon.com) ([10.43.8.6])
  by smtp-border-fw-6001.iad6.amazon.com with ESMTP; 20 Aug 2021 12:58:51 +0000
Received: from EX13D19EUB003.ant.amazon.com (pdx1-ws-svc-p6-lb9-vlan2.pdx.amazon.com [10.236.137.194])
        by email-inbound-relay-2a-53356bf6.us-west-2.amazon.com (Postfix) with ESMTPS id 8E868A2760;
        Fri, 20 Aug 2021 12:58:49 +0000 (UTC)
Received: from 8c85908914bf.ant.amazon.com (10.43.160.41) by
 EX13D19EUB003.ant.amazon.com (10.43.166.69) with Microsoft SMTP Server (TLS)
 id 15.0.1497.23; Fri, 20 Aug 2021 12:58:38 +0000
Subject: Re: [RFC] Make use of non-dynamic dmabuf in RDMA
To:     Jason Gunthorpe <jgg@ziepe.ca>, Daniel Vetter <daniel@ffwll.ch>
CC:     Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
        Doug Ledford <dledford@redhat.com>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-rdma <linux-rdma@vger.kernel.org>,
        Oded Gabbay <ogabbay@habana.ai>,
        Tomer Tayar <ttayar@habana.ai>,
        Yossi Leybovich <sleybo@amazon.com>,
        Alexander Matushevsky <matua@amazon.com>,
        Leon Romanovsky <leonro@nvidia.com>,
        Jianxin Xiong <jianxin.xiong@intel.com>,
        John Hubbard <jhubbard@nvidia.com>
References: <20210818074352.29950-1-galpress@amazon.com>
 <CAKMK7uGZ_eX+XfYJU6EkKEOVrHz3q6QMxaEbyyD3_1iqj9YSjw@mail.gmail.com>
 <20210819230602.GU543798@ziepe.ca>
 <CAKMK7uGgQWcs4Va6TGN9akHSSkmTs1i0Kx+6WpeiXWhJKpasLA@mail.gmail.com>
 <20210820123316.GV543798@ziepe.ca>
From:   Gal Pressman <galpress@amazon.com>
Message-ID: <0fc94ac0-2bb9-4835-62b8-ea14f85fe512@amazon.com>
Date:   Fri, 20 Aug 2021 15:58:33 +0300
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210820123316.GV543798@ziepe.ca>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.43.160.41]
X-ClientProxiedBy: EX13D46UWB002.ant.amazon.com (10.43.161.70) To
 EX13D19EUB003.ant.amazon.com (10.43.166.69)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 20/08/2021 15:33, Jason Gunthorpe wrote:
> On Fri, Aug 20, 2021 at 09:25:30AM +0200, Daniel Vetter wrote:
>> On Fri, Aug 20, 2021 at 1:06 AM Jason Gunthorpe <jgg@ziepe.ca> wrote:
>>> On Wed, Aug 18, 2021 at 11:34:51AM +0200, Daniel Vetter wrote:
>>>> On Wed, Aug 18, 2021 at 9:45 AM Gal Pressman <galpress@amazon.com> wrote:
>>>>>
>>>>> Hey all,
>>>>>
>>>>> Currently, the RDMA subsystem can only work with dynamic dmabuf
>>>>> attachments, which requires the RDMA device to support on-demand-paging
>>>>> (ODP) which is not common on most devices (only supported by mlx5).
>>>>>
>>>>> While the dynamic requirement makes sense for certain GPUs, some devices
>>>>> (such as habanalabs) have device memory that is always "pinned" and do
>>>>> not need/use the move_notify operation.
>>>>>
>>>>> The motivation of this RFC is to use habanalabs as the dmabuf exporter,
>>>>> and EFA as the importer to allow for peer2peer access through libibverbs.
>>>>>
>>>>> This draft patch changes the dmabuf driver to differentiate between
>>>>> static/dynamic attachments by looking at the move_notify op instead of
>>>>> the importer_ops struct, and allowing the peer2peer flag to be enabled
>>>>> in case of a static exporter.
>>>>>
>>>>> Thanks
>>>>>
>>>>> Signed-off-by: Gal Pressman <galpress@amazon.com>
>>>>
>>>> Given that habanalabs dma-buf support is very firmly in limbo (at
>>>> least it's not yet in linux-next or anywhere else) I think you want to
>>>> solve that problem first before we tackle the additional issue of
>>>> making p2p work without dynamic dma-buf. Without that it just doesn't
>>>> make a lot of sense really to talk about solutions here.
>>>
>>> I have been thinking about adding a dmabuf exporter to VFIO, for
>>> basically the same reason habana labs wants to do it.
>>>
>>> In that situation we'd want to see an approach similar to this as well
>>> to have a broad usability.
>>>
>>> The GPU drivers also want this for certain sophisticated scenarios
>>> with RDMA, the intree drivers just haven't quite got there yet.
>>>
>>> So, I think it is worthwhile to start thinking about this regardless
>>> of habana labs.
>>
>> Oh sure, I've been having these for a while. I think there's two options:
>> - some kind of soft-pin, where the contract is that we only revoke
>> when absolutely necessary, and it's expected to be catastrophic on the
>> importer's side. 
> 
> Honestly, I'm not very keen on this. We don't really have HW support
> in several RDMA scenarios for even catastrophic unpin.
> 
> Gal, can EFA even do this for a MR? You basically have to resize the
> rkey/lkey to zero length (or invalidate it like a FMR) under the
> catstrophic revoke. The rkey/lkey cannot just be destroyed as that
> opens a security problem with rkey/lkey re-use.

I had some discussions with our hardware guys about such functionality in the
past, I think it should be doable (not necessarily the same way that FMR does it).

Though it would've been nicer if we could agree on a solution that could work
for more than 1-2 RDMA devices, using the existing tools the RDMA subsystem has.
That's why I tried to approach this by denying such attachments for non-ODP
importers instead of exposing a "limited" dynamic importer.
