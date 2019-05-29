Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8CCB62E480
	for <lists+linux-media@lfdr.de>; Wed, 29 May 2019 20:32:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727096AbfE2ScG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 May 2019 14:32:06 -0400
Received: from casper.infradead.org ([85.118.1.10]:47480 "EHLO
        casper.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725917AbfE2ScF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 May 2019 14:32:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
        MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=v4RhH8XlbbmVbvvjKrE9rteDA6GrHG3MQnP6nZEJG7c=; b=hm9Rs7L6F78tgJeDvEnFsGyDKf
        jmyKa3n42YaQgh81tnNc+yFG5z4UbGVdGAvxOCzsFPxi83/yso7sf7WLbrLRBHBdEenSu/yDikMdI
        0mp2Ftlv1xWrUrjf1nSTSI02+9NVkDeYwOwcL/PofpNWaxV8VnVU2LWsABVnxcU5yogY5kXY2sXj8
        khOPW9AnD7wT8VLKm55lj9jguiOCrGiphJXc76tsQtYRBC3J+JVfDs+PHYoRc5hNX+CZ+Lmvk5mUa
        rJsmKDN0+mHsEG/mYHdz1/cHHjcEWS28xkWWTiUdsJn1jxupHm50x0q9fR0he5v1s3NxjdmE2yT+j
        07/TGYhg==;
Received: from 177.132.232.81.dynamic.adsl.gvt.net.br ([177.132.232.81] helo=coco.lan)
        by casper.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1hW3Ml-0003LU-V4; Wed, 29 May 2019 18:32:00 +0000
Date:   Wed, 29 May 2019 15:31:53 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Marian Mihailescu <mihailescu2m@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        JaeChul Lee <jcsing.lee@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Seung-Woo Kim <sw0312.kim@samsung.com>
Subject: Re: [PATCH v2] media: s5p-mfc: Add support for V4L2_MEMORY_DMABUF
 type
Message-ID: <20190529153153.13b1e939@coco.lan>
In-Reply-To: <c894f9b6-5381-b7eb-ba77-35e71958bf45@samsung.com>
References: <CGME20171103081132eucas1p2212e32d26e7921340336d78d0d92cb1b@eucas1p2.samsung.com>
        <20171103081124.30119-1-m.szyprowski@samsung.com>
        <1509716721.3607.6.camel@ndufresne.ca>
        <decd38f5-d3c0-6a60-cdbb-20bb804be3a5@samsung.com>
        <1509996082.30233.51.camel@ndufresne.ca>
        <e360971a-cb3b-0546-e621-ab56f8ed8f36@samsung.com>
        <e71e9a74-736a-5185-a544-845fff4ff63c@xs4all.nl>
        <c894f9b6-5381-b7eb-ba77-35e71958bf45@samsung.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Mon, 18 Dec 2017 09:19:11 +0100
Marek Szyprowski <m.szyprowski@samsung.com> escreveu:

> Hi Hans,
> 
> On 2017-12-15 16:57, Hans Verkuil wrote:
> > On 14/12/17 15:11, Marek Szyprowski wrote:  
> >> I would like to get your opinion on this patch. Do you think it makes sense to:
> >>
> >> 1. add limited support for USERPTR and DMA-buf import? (limited means driver will accept setting buffer pointer/fd only once after reqbufs for each buffer index)  
> > I don't like this. It's unexpected almost-but-not-quite behavior that will make
> > life very difficult for userspace.
> >  
> >> 2. add a V4L2 device flag to let userspace to discover if device support queue buffer reconfiguration on-fly or not?  
> > This seems to me a better approach. It should be possible to implement most/all of this
> > in vb2, but we need to find a way to signal this to the user.  
> 
> Okay, I will prepare a patch with such flag soon.
> 
> > Is this an MFC limitation for the decoder, encoder or both? And is it a limitation
> > of the capture or output side or both?  
> 
> Both and both. DMA addresses of all buffers must be known while 
> initializing decoder
> and encoder.
> 
>  > ...  
> 
> Best regards

Marek/Sylwester,

What's the status of this one? The patch still applies (with a minor
conflict).

Thanks,
Mauro
