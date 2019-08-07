Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7C25E8493C
	for <lists+linux-media@lfdr.de>; Wed,  7 Aug 2019 12:16:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727018AbfHGKQE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Aug 2019 06:16:04 -0400
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:33083 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726685AbfHGKQE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 7 Aug 2019 06:16:04 -0400
Received: from [IPv6:2001:983:e9a7:1:9c05:4bbc:890e:7747] ([IPv6:2001:983:e9a7:1:9c05:4bbc:890e:7747])
        by smtp-cloud9.xs4all.net with ESMTPA
        id vIz9hkTa7AffAvIzBh7ksg; Wed, 07 Aug 2019 12:16:01 +0200
Subject: Re: [PATCH v4 0/3] DCMI bridge support
To:     Hugues Fruchet <hugues.fruchet@st.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        Benjamin Gaignard <benjamin.gaignard@linaro.org>,
        Yannick Fertre <yannick.fertre@st.com>,
        Philippe CORNU <philippe.cornu@st.com>,
        Mickael GUENE <mickael.guene@st.com>
References: <1564577783-18627-1-git-send-email-hugues.fruchet@st.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <28a2a9ac-d5b9-a312-616a-620e0385cf66@xs4all.nl>
Date:   Wed, 7 Aug 2019 12:15:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1564577783-18627-1-git-send-email-hugues.fruchet@st.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfCP9LqKEIJwW0pIhFdbw6tGpB9o9mbS/qErOZQWhGe5Bzq7r6mVey37KBsvPv5vRS+rwW4N5qvZSOS4HYAHC9TbGd7KxoLiLiXGiTEb4+kK7x5xBPXQF
 BEKx6sgrIvZ0Uk2csPHS/u6dM4/EZ5RzZJMoc3sSL2Ftnd5D30a8380raWQ37PDsgqgo+XwyUsC8ecezUORYKUaiu8AlQFpK7NcZ2kqkqGNoNRUqkL5lv6/E
 6rGGcxbPLAgjVmhsp7xtoJB/0/1nhlIxo/nNlOLvN8hVjXTEb7mxhtCkYIC4PnrI0k7Uco9RR/DSvYRlVtiOp0g8QbNMcYWGmMKQMmlbdATwpMwb6+o9/PKB
 0f7OS+bm6jQC/JXUbtu66bq5e6dE+yd97Z+6+FMEUJMTDM6wT3RRAIFhkLAiFFivFkidzKEf81ZgWil9qupnniOLQrlviMaJxsrpGfXVuc/yafzDWGVoJxqP
 D3R2drlaxdCqAOIL1KqFuKS83fDDdoqFITo/xflSSwF5DDCAWnMaPTA/NzI97hMd3xRm78K1xATAN3zdgSDiuBna7qJ7k6d/keAn6jL4hVk/lTEMkAb4f45i
 2MTqZy5jWM31PmqA90PGPUrXraELt3plhtT7xGq0dbSWVDd8k3RdHKG0EZyFASMtmNcJXDWCzo/KHUDfoovEGU1MmAHiSUcGg8zzov+mAvBSslhhkZbWLqGt
 AVIwa0VN8r0=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hugues,

Can you provide the output of the most recent v4l2-compliance?

Use 'v4l2-compliance -s'.

Also, just to confirm, with this v4 there are no /dev/mediaX or
/dev/v4l-subdevX devices created anymore, right?

This v4 looks good to me, I just want to have these final checks
done.

Regards,

	Hans

On 7/31/19 2:56 PM, Hugues Fruchet wrote:
> This patch serie allows to connect non-parallel camera sensor to
> DCMI thanks to a bridge connected in between such as STMIPID02 [1].
> 
> Media controller support is introduced first, then support of
> several sub-devices within pipeline with dynamic linking
> between them.
> In order to keep backward compatibility with applications
> relying on V4L2 interface only, format set on video node
> is propagated to all sub-devices connected to camera interface.
> 
> [1] https://www.spinics.net/lists/devicetree/msg278002.html
> 
> ===========
> = history =
> ===========
> version 4:
>   - Also drop subdev nodes registry as suggested by Hans:
>     https://www.spinics.net/lists/arm-kernel/msg743375.html
> 
> version 3:
>   - Drop media device registry to not expose media controller
>     interface to userspace as per Laurent' suggestion:
>     https://www.spinics.net/lists/linux-media/msg153417.html
>   - Prefer "source" instead of "sensor" and keep it in 
>     dcmi_graph_entity struct, move asd as first member
>     of struct as per Sakari' suggestion:
>     https://www.spinics.net/lists/linux-media/msg153119.html
>   - Drop dcmi_graph_deinit() as per Sakari' suggestion:
>     https://www.spinics.net/lists/linux-media/msg153417.html
> 
> version 2:
>   - Fix bus_info not consistent between media and V4L:
>     https://www.spinics.net/lists/arm-kernel/msg717676.html
>   - Propagation of format set on video node to the sub-devices
>     chain connected on camera interface
> 
> version 1:
>   - Initial submission
> 
> Hugues Fruchet (3):
>   media: stm32-dcmi: improve sensor subdev naming
>   media: stm32-dcmi: add media controller support
>   media: stm32-dcmi: add support of several sub-devices
> 
>  drivers/media/platform/Kconfig            |   2 +-
>  drivers/media/platform/stm32/stm32-dcmi.c | 283 +++++++++++++++++++++++++-----
>  2 files changed, 236 insertions(+), 49 deletions(-)
> 

