Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B6C867640E
	for <lists+linux-media@lfdr.de>; Fri, 26 Jul 2019 13:04:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726256AbfGZLE2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Jul 2019 07:04:28 -0400
Received: from foss.arm.com ([217.140.110.172]:41314 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726129AbfGZLE2 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Jul 2019 07:04:28 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 300D4344;
        Fri, 26 Jul 2019 04:04:27 -0700 (PDT)
Received: from [10.1.197.57] (e110467-lin.cambridge.arm.com [10.1.197.57])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 86A963F71A;
        Fri, 26 Jul 2019 04:04:24 -0700 (PDT)
Subject: Re: [RFC, v3 9/9] media: platform: Add Mediatek ISP P1 shared memory
 device
To:     Tomasz Figa <tfiga@chromium.org>,
        Christoph Hellwig <hch@infradead.org>
Cc:     devicetree@vger.kernel.org,
        =?UTF-8?B?U2VhbiBDaGVuZyAo6YSt5piH5byYKQ==?= 
        <sean.cheng@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        =?UTF-8?B?UnlubiBXdSAo5ZCz6IKy5oGpKQ==?= <rynn.wu@mediatek.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        Rob Herring <robh@kernel.org>,
        =?UTF-8?B?UnlhbiBZdSAo5L2Z5a2f5L+uKQ==?= <ryan.yu@mediatek.com>,
        =?UTF-8?B?RnJhbmtpZSBDaGl1ICjpgrHmloflh7Ep?= 
        <frankie.chiu@mediatek.com>, Hans Verkuil <hverkuil@xs4all.nl>,
        Jungo Lin <jungo.lin@mediatek.com>,
        Sj Huang <sj.huang@mediatek.com>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        ddavenport@chromium.org,
        =?UTF-8?B?RnJlZGVyaWMgQ2hlbiAo6Zmz5L+K5YWDKQ==?= 
        <frederic.chen@mediatek.com>,
        "list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
        Joerg Roedel <joro@8bytes.org>,
        linux-arm-kernel@lists.infradead.org,
        Matthias Brugger <matthias.bgg@gmail.com>
References: <jungo.lin@mediatek.com>
 <20190611035344.29814-1-jungo.lin@mediatek.com>
 <20190611035344.29814-10-jungo.lin@mediatek.com>
 <20190701072532.GB137710@chromium.org> <1562297618.1212.46.camel@mtksdccf07>
 <CAAFQd5BaTQ-Q7gsE0X+d4_81OZq9WHaCYkmALt7_4A1JFo=_8g@mail.gmail.com>
 <1562313579.1212.73.camel@mtksdccf07>
 <CAAFQd5AaNFpMGCVJREY85n8UetEwd99TOka8-ECoLzMbMkos_g@mail.gmail.com>
 <1563870117.1212.455.camel@mtksdccf07>
 <CAAFQd5Bh80N+cMhz=eyHUGJLaE5uuypOawQvHrTgGSMDvmcpLA@mail.gmail.com>
 <20190726074116.GA19745@infradead.org>
 <CAAFQd5CXwRm-3jD+rfNNDNLH=gT_i0QYSAG3XBo3SJnPTY56_w@mail.gmail.com>
From:   Robin Murphy <robin.murphy@arm.com>
Message-ID: <4460bc91-352a-7f3a-cbed-1b95e743ca8c@arm.com>
Date:   Fri, 26 Jul 2019 12:04:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAAFQd5CXwRm-3jD+rfNNDNLH=gT_i0QYSAG3XBo3SJnPTY56_w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 26/07/2019 08:42, Tomasz Figa wrote:
> On Fri, Jul 26, 2019 at 4:41 PM Christoph Hellwig <hch@infradead.org> wrote:
>>
>> On Fri, Jul 26, 2019 at 02:15:14PM +0900, Tomasz Figa wrote:
>>> Could you try dma_get_sgtable() with the SCP struct device and then
>>> dma_map_sg() with the P1 struct device?
>>
>> Please don't do that.  dma_get_sgtable is a pretty broken API (see
>> the common near the arm implementation) and we should not add more
>> users of it.  If you want a piece of memory that can be mapped to
>> multiple devices allocate it using alloc_pages and then just map
>> it to each device.
> 
> Thanks for taking a look at this thread.
> 
> Unfortunately that wouldn't work. We have a specific reserved memory
> pool that is the only memory area accessible to one of the devices.
> Any idea how to handle this?

If it's reserved in the sense of being outside struct-page-backed 
"kernel memory", then provided you have a consistent CPU physical 
address it might be reasonable for other devices to access it via 
dma_map_resource().

Robin.
