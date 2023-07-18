Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 375527576D6
	for <lists+linux-media@lfdr.de>; Tue, 18 Jul 2023 10:41:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231970AbjGRIlD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 Jul 2023 04:41:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229995AbjGRIlD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 Jul 2023 04:41:03 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D10B110C;
        Tue, 18 Jul 2023 01:41:01 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 63ED461440;
        Tue, 18 Jul 2023 08:41:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D91AC433C8;
        Tue, 18 Jul 2023 08:40:59 +0000 (UTC)
Message-ID: <481daff2-ee22-e0a9-3583-a3ee828c5c43@xs4all.nl>
Date:   Tue, 18 Jul 2023 10:40:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 1/2] media: videobuf2-dma-sg: fix vmap and vunmap
 callbacks
Content-Language: en-US
To:     Michael Grzeschik <mgr@pengutronix.de>, linux-usb@vger.kernel.org
Cc:     linux-media@vger.kernel.org, gregkh@linuxfoundation.org,
        balbi@kernel.org, laurent.pinchart@ideasonboard.com,
        kernel@pengutronix.de, stable <stable@kernel.org>
References: <20221125153450.344392-1-m.grzeschik@pengutronix.de>
 <20230124223453.GB7611@pengutronix.de>
From:   Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <20230124223453.GB7611@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-6.8 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Michael,

I'm going through some old patches in patchwork and found this one.
Is this patch specifically for the uvc gadget driver, or is it a
generic fix? If it is the latter (I suspect it is), then can you
post this as a v3 by itself and rebased to the latest kernel?

The fact that it was combined with the uvc gadget patch in the patch
series is the main reason for this delay (see also my upcoming reply
to patch 2/2).

Regards,

	Hans

On 24/01/2023 23:34, Michael Grzeschik wrote:
> Gentle Ping!
> 
> On Fri, Nov 25, 2022 at 04:34:49PM +0100, Michael Grzeschik wrote:
>> For dmabuf import users to be able to use the vaddr from another
>> videobuf2-dma-sg source, the exporter needs to set a proper vaddr on
>> vb2_dma_sg_dmabuf_ops_vmap callback.
>>
>> This patch adds vm_map_ram on map if buf->vaddr was not set, and also
>> adds the vb2_dma_sg_dmabuf_ops_vunmap function to remove the mapping
>> afterwards.
>>
>> Cc: stable <stable@kernel.org>
>> Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
>>
>> ---
>> v1 -> v2: using vmap and vunmap instead of vm_map_ram and vm_unmap_ram
>>
>> .../media/common/videobuf2/videobuf2-dma-sg.c    | 16 ++++++++++++++++
>> 1 file changed, 16 insertions(+)
>>
>> diff --git a/drivers/media/common/videobuf2/videobuf2-dma-sg.c b/drivers/media/common/videobuf2/videobuf2-dma-sg.c
>> index fa69158a65b1fd..dcb8de5ab3e84a 100644
>> --- a/drivers/media/common/videobuf2/videobuf2-dma-sg.c
>> +++ b/drivers/media/common/videobuf2/videobuf2-dma-sg.c
>> @@ -496,11 +496,26 @@ static int vb2_dma_sg_dmabuf_ops_vmap(struct dma_buf *dbuf,
>> {
>>     struct vb2_dma_sg_buf *buf = dbuf->priv;
>>
>> +    if (!buf->vaddr)
>> +        buf->vaddr = vmap(buf->pages, buf->num_pages, VM_MAP,
>> +                  PAGE_KERNEL);
>> +
>>     iosys_map_set_vaddr(map, buf->vaddr);
>>
>>     return 0;
>> }
>>
>> +static void vb2_dma_sg_dmabuf_ops_vunmap(struct dma_buf *dbuf,
>> +                      struct iosys_map *map)
>> +{
>> +    struct vb2_dma_sg_buf *buf = dbuf->priv;
>> +
>> +    if (buf->vaddr)
>> +        vunmap(buf->vaddr);
>> +
>> +    buf->vaddr = NULL;
>> +}
>> +
>> static int vb2_dma_sg_dmabuf_ops_mmap(struct dma_buf *dbuf,
>>     struct vm_area_struct *vma)
>> {
>> @@ -515,6 +530,7 @@ static const struct dma_buf_ops vb2_dma_sg_dmabuf_ops = {
>>     .begin_cpu_access = vb2_dma_sg_dmabuf_ops_begin_cpu_access,
>>     .end_cpu_access = vb2_dma_sg_dmabuf_ops_end_cpu_access,
>>     .vmap = vb2_dma_sg_dmabuf_ops_vmap,
>> +    .vunmap = vb2_dma_sg_dmabuf_ops_vunmap,
>>     .mmap = vb2_dma_sg_dmabuf_ops_mmap,
>>     .release = vb2_dma_sg_dmabuf_ops_release,
>> };
>> -- 
>> 2.30.2
>>
> 

