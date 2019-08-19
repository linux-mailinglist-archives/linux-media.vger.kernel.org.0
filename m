Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 985BC91F39
	for <lists+linux-media@lfdr.de>; Mon, 19 Aug 2019 10:43:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726767AbfHSInV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Aug 2019 04:43:21 -0400
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:39391 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726211AbfHSInV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Aug 2019 04:43:21 -0400
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud8.xs4all.net with ESMTPA
        id zdFuhLYKWDqPezdFxhnQeg; Mon, 19 Aug 2019 10:43:19 +0200
Subject: Re: [PATCH v7 0/4] DCMI bridge support
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
References: <1566204081-19051-1-git-send-email-hugues.fruchet@st.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <0cd073d9-3d25-9e22-f243-f72e395e9e96@xs4all.nl>
Date:   Mon, 19 Aug 2019 10:43:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1566204081-19051-1-git-send-email-hugues.fruchet@st.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfH+ohgSwKLOrkTCl8qsJ7Y57Hym1F4F9FyCoyVRp/fBrw7CsqXSSkud9Lcf/tqU+l68nNtkRppyvDraao0dc4GoqELCakj53fmo0M9Xtt+xZB/ZAMN9/
 6llV9015cHgtvqEwpxTEWRgxKzhtBL2OT8JR9Ls2JJ6CEETn5xfOHl0278TnlfQq3CrK+WlqvopZ65Z1/gko+rJUnnTTYx83lu48dLzTfGHGFVNrxzKcdO5z
 IjNy1J5RQGb10psoVY1YXoBZH6GyoIAaP2WLonYyM6eYqy9o97MMfYicolvwFJ/HmBVW4SBSGOHuS08UNvnUNpfZZlK6Dz0xjbwE/hHhbyREyKqfBDBKqkwG
 gP7AF1fGzRetJTkYJfl+8Y20ohRW7IZ6YSHFOV4twVIfVqFjNaoNG0ax01yaOhUYSKCW9e9Qc5+CJv/lcV+sOUZnqyg0PY9uWpoQ9rChkqOmtiY0J4QHDIrF
 3gw5+h+hq8Gq8RkChTvY5s9NrcTByHSTsrw1oTaaF0PXdcF/2sqgx+KrucLdy5JwzpY/y6gcHLhg3fB+jOYm6XERNz0JU8TCOzxL73Mcu/YfZZz8IUDiwuNT
 cU/3DMUtDsuQsCxI3QCFDYm/
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 8/19/19 10:41 AM, Hugues Fruchet wrote:
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
> version 7:
>   - minor fix on 80 char trace message

v6 is already in a pending PR. I don't really want to make a new
PR just for a 80 char warning.

It can always be done in a follow-up patch.

Regards,

	Hans

> 
> version 6:
>   - As per Sakari remark: add a FIXME explaining that this
>     version only supports subdevices which expose RGB & YUV
>     "parallel form" mbus code (_2X8)
>   - Add some trace around subdev_call(s_fmt) error & format
>     changes to debug subdev which only expose serial mbus code
>   - Conform to "<name>":<pad index> when tracing subdev infos
> 
> version 5:
>   - Remove remaining Change-Id
>   - Add Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> 
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
> Hugues Fruchet (4):
>   media: stm32-dcmi: improve sensor subdev naming
>   media: stm32-dcmi: trace the supported fourcc/mbus_code
>   media: stm32-dcmi: add media controller support
>   media: stm32-dcmi: add support of several sub-devices
> 
>  drivers/media/platform/Kconfig            |   2 +-
>  drivers/media/platform/stm32/stm32-dcmi.c | 318 +++++++++++++++++++++++++-----
>  2 files changed, 268 insertions(+), 52 deletions(-)
> 

