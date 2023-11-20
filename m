Return-Path: <linux-media+bounces-603-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D0AA87F10C9
	for <lists+linux-media@lfdr.de>; Mon, 20 Nov 2023 11:50:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5880A1F23642
	for <lists+linux-media@lfdr.de>; Mon, 20 Nov 2023 10:50:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BEFB6FC8;
	Mon, 20 Nov 2023 10:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A07366D1B
	for <linux-media@vger.kernel.org>; Mon, 20 Nov 2023 10:50:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95C2EC433C8;
	Mon, 20 Nov 2023 10:50:48 +0000 (UTC)
Message-ID: <8086ca7b-60b6-442a-a5ce-438722a505b7@xs4all.nl>
Date: Mon, 20 Nov 2023 11:50:47 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: videobuf2-dma-sg: use v{un,}map instead of
 vm_{un,}map_ram
Content-Language: en-US, nl
To: Michael Grzeschik <mgr@pengutronix.de>, Tomasz Figa <tfiga@chromium.org>
Cc: linux-media@vger.kernel.org, m.szyprowski@samsung.com,
 kernel@pengutronix.de, Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
 Sergey Senozhatsky <senozhatsky@chromium.org>
References: <20221120234441.550908-1-m.grzeschik@pengutronix.de>
 <5e585a78-15c8-fd17-bc34-96f7ed18f592@xs4all.nl>
 <CAAFQd5Aicurw-pjYpWJK_qNemy1qszvN4rL=TfAuxhOdAOTGNg@mail.gmail.com>
 <20230510142509.GA14356@pengutronix.de>
 <CAAFQd5AmVBc6LQ1eyZ=WrvtLR4oSD4K0mMeszcuY12CK7djiUA@mail.gmail.com>
 <CAAFQd5D_o3wE98=wFXR2nbWkpCAdCDxz2tP8ssSSYVkZ5iC1Qg@mail.gmail.com>
 <ZVU8Kpp83bOjq0fL@pengutronix.de>
From: Hans Verkuil <hverkuil@xs4all.nl>
Autocrypt: addr=hverkuil@xs4all.nl; keydata=
 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
In-Reply-To: <ZVU8Kpp83bOjq0fL@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Michael,

On 15/11/2023 22:46, Michael Grzeschik wrote:
> On Wed, Nov 01, 2023 at 12:43:25PM +0900, Tomasz Figa wrote:
>> On Tue, May 16, 2023 at 7:50 PM Tomasz Figa <tfiga@chromium.org> wrote:
>>>
>>> Hi Michael,
>>>
>>> On Wed, May 10, 2023 at 11:25 PM Michael Grzeschik <mgr@pengutronix.de> wrote:
>>> >
>>> > Sorry for the late comeback, however here are some thoughts.
>>> >
>>> > On Fri, Dec 02, 2022 at 06:01:02PM +0900, Tomasz Figa wrote:
>>> > >On Thu, Nov 24, 2022 at 10:35 PM Hans Verkuil <hverkuil@xs4all.nl> wrote:
>>> > >>
>>> > >> On 21/11/2022 00:44, Michael Grzeschik wrote:
>>> > >> > The comments before the vm_map_ram function state that it should be used
>>> > >> > for up to 256 KB only, and video buffers are definitely much larger. It
>>> > >> > recommends using vmap in that case.
>>> > >> >
>>> > >> > Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
>>> > >> > ---
>>> > >> >  drivers/media/common/videobuf2/videobuf2-dma-sg.c | 7 ++++---
>>> > >>
>>> > >> drivers/media/common/videobuf2/videobuf2-vmalloc.c uses it as well,
>>> > >> probably also incorrectly. It makes sense to change that one as well.
>>> > >
>>> > >Comparing vm_map_ram() and vmap(..., VM_MAP, PAGE_KERNEL), for blocks
>>> > >bigger than VMAP_MAX_ALLOC they're equivalent and for smaller blocks
>>> > >the former should be faster, so I don't see what's wrong with the
>>> > >current code.
>>> >
>>> > I got another comment on this from Andrzej Pietrasiewicz
>>> > where he expands the comment on the use of vmap over vm_map_ram.
>>> >
>>> > https://lore.kernel.org/linux-media/64375ff4-dbbb-3d5b-eaf6-32d6780fd496@collabora.com
>>> >
>>> > As I understand this, we should probably update the vm_map_ram to vmap,
>>> > due to the expectation that video buffers are long-living objects.
>>> >
>>> > Since there are some more places that would probably need to be updated
>>> > if we should decide to use vmap over vm_map_ram in the whole
>>> > videbuf2-* users, I would like to clarify on this before making
>>> > a series.
>>>
>>> Ah, I see. Thanks for the pointer.
>>>
>>> VB2 buffers would usually require long-lived mappings, so based on
>>> that, we should switch to vmap() indeed.
>>>
>>> As a side note, not directly related to this patch, I wonder if we
>>> should also call invalidate/flush_kernel_vmap_range() in
>>> vb2_dma_sg_prepare/finish(). (In principle we shouldn't, but so far
>>> our drivers don't explicitly call begin/end_cpu_access() and rely on
>>> prepare/finish to handle the cache maintenance of the kernel
>>> mapping...) Let me also add Sergey on CC for visibility.
>>
>> Sorry, I forgot last time, so maybe it wasn't clear I'm good with this patch:
>>
>> Acked-by: Tomasz Figa <tfiga@chromium.org>
>>
>> Hans, will you pick it? Thanks!
> 
> Gentle Ping!
> 

This patch is marked with "Changes Requested" in patchwork:

https://patchwork.linuxtv.org/project/linux-media/patch/20221120234441.550908-1-m.grzeschik@pengutronix.de/

Looking at the comments, there is a request to improve a comment and a request
from me to make the same change to videobuf2-vmalloc.c.

I have no problem with the change itself, it makes sense to use vmap.

In any case, a v2 is needed.

Regards,

	Hans

