Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 862713FEFDF
	for <lists+linux-media@lfdr.de>; Thu,  2 Sep 2021 17:10:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345650AbhIBPLK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Sep 2021 11:11:10 -0400
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:42431 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229941AbhIBPLJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 2 Sep 2021 11:11:09 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id LoLqmkPwflQKhLoLrmKyDc; Thu, 02 Sep 2021 17:10:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1630595404; bh=DKNNXMu5a2O1nKdMpP6bZJC00pZoef+7fzmEKsSYSNo=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=CVZkwgkvlKLGFcPeXwiylGwyiomEi5o+qRAd8KfsTm55rrThX+oApbCnlCm83O6cc
         RWC0AFe62VzNOH4mi5Pmxt4YkTyfWGJb7f0OhVD02YYYV+g9FGyvCh6DNg0p3KCw68
         85XWxHdXw3zxIxtOq+20rFC49rRsdhP4Vbt0TgCyDl7KJ+VFm+7obr4uK4OEpwmAPA
         iw4XGI9B7w0KuoGl/G4hXmYf7zSV/fgcQuhnWZkwudl3wJ8vDONqhaG7F6xNxUHYdz
         k/Pbwnt/dNyj/9CSTCnw066T3jzQgw58o1DNd35NF1+TbGFQwsdE3kj3djDY6to1kw
         gFUbPp8CIM19Q==
Subject: Re: [RFC PATCH 1/2] media: Add AV1 uAPI
To:     daniel.almeida@collabora.com, stevecho@google.com,
        shawnku@google.com, tzungbi@google.com, mcasas@google.com,
        nhebert@google.com, abodenha@google.com, randy.wu@mediatek.com,
        yunfei.dong@mediatek.com, gustavo.padovan@collabora.com,
        andrzej.pietrasiewicz@collabora.com, enric.balletbo@collabora.com,
        ezequiel@collabora.com, nicolas.dufresne@collabora.com,
        tomeu.vizoso@collabora.com, nick.milner@collabora.com,
        xiaoyong.lu@mediatek.com, mchehab@kernel.org
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@collabora.com
References: <20210810220552.298140-1-daniel.almeida@collabora.com>
 <20210810220552.298140-2-daniel.almeida@collabora.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <731ff6d4-ba1c-1918-e134-013786be473a@xs4all.nl>
Date:   Thu, 2 Sep 2021 17:10:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210810220552.298140-2-daniel.almeida@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfLzwtZqd4rd6CeSTZcQNZg2rhjq4hrzNqKyd76Z1NzdSFYhE8deuEo/lvA019CR4soNxeNTOKTn2l/Smb2Bj/UY662bEXdWz3esfZMlfCrxxFb1wTCN4
 artldkEOFsqeqss5YOFZ/7+0U2L2rdPBB7y3yh91cGFy2aMQVdT+c5NdpwmjwGrjjtwQN02gj2pGIFMWEdaK5sgQtwBNXexs6XFNLDGqI/N9AggDxqvqz94d
 u/FdCKCNd+FHUk1CRaN2qLHTy/FDHNOSTuCELvS2HjMyeh8p/ULPFHGhaxqTsPK7OQstDtui6JQO2F340DEBD+4WwNK+ClFkRdbJsOSSFOrL1VTBLRaX/IOo
 4eOCELKtmLwXA3dSif0CatEfwpmRrUP8caoEdvO85LimM9lxLjiXOXoA43uc7qkWd0TheaxjcaIgvjzXf8cI8/EuwXKTyoMWEIxUbsBJiTcscZRk5SLM/iv3
 Tn1hNkj3p/c+ilHbWc5seBX+c3QAfALLjagr9VuIsX/Qp/OD/XzrWCk6fHgQkPoB4SoncoxuEeE6ydxLuOfHIeY92nSruaFcfJJzX/FFfBhp1KMaHKJvcyBv
 /8qmfjvLpkrHTChaBhJ52Ula93uBjslNDcVorNb4A0zRvMJKUjHNbxmyBjIHjq+K0fqt20WZa7D3psTjAUdEegqdBgH/LL+KMicvrSY3bxC8xvqEllJVFwih
 7Ebr2BEkkIFSJ/B8YvbfoZyAqZTQ+zdi8fo5ZLRVivbPlfVqby70lcvIOqLbj0ftngnq89O5t8rrllYUxXPQ+01uo6ZXC53x3caolYoDYsadd0toE1xjDQ7l
 aALxlDdEaDDkfv+Um7OQ8WcmvbB60neIS0gCPSWTI4Bl1plBNwc7tYK5OpNX22oGcmqAFGvTfpSSgNlJlj+JV3W8R+AW4ZVs0cBFlTkmDkwOk4MpsoxuYESi
 A5BxHhQPeK2yRNlU5anCGTYlxpaWkVz6i18Yk9aszqjXOQsSykHlpuaawGXP01CaKYtp3ZivNTD3JgSj/ohvwnjsxFg=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Daniel!

Two small comments below:

On 11/08/2021 00:05, daniel.almeida@collabora.com wrote:
> From: Daniel Almeida <daniel.almeida@collabora.com>
> 
> This patch adds the  AOMedia Video 1 (AV1) kernel uAPI.
> 
> This design is based on currently available AV1 API implementations and
> aims to support the development of AV1 stateless video codecs
> on Linux.
> 
> Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
> ---
>  .../userspace-api/media/v4l/biblio.rst        |   10 +
>  .../media/v4l/ext-ctrls-codec-stateless.rst   | 1268 +++++++++++++++++
>  .../media/v4l/pixfmt-compressed.rst           |   21 +
>  .../media/v4l/vidioc-g-ext-ctrls.rst          |   36 +
>  .../media/v4l/vidioc-queryctrl.rst            |   54 +
>  .../media/videodev2.h.rst.exceptions          |    9 +
>  drivers/media/v4l2-core/v4l2-ctrls-core.c     |  286 +++-
>  drivers/media/v4l2-core/v4l2-ctrls-defs.c     |   79 +
>  drivers/media/v4l2-core/v4l2-ioctl.c          |    1 +
>  include/media/v4l2-ctrls.h                    |   12 +
>  include/uapi/linux/v4l2-controls.h            |  796 +++++++++++
>  include/uapi/linux/videodev2.h                |   15 +
>  12 files changed, 2586 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/userspace-api/media/v4l/biblio.rst b/Documentation/userspace-api/media/v4l/biblio.rst
> index 7b8e6738ff9e..7061144d10bb 100644
> --- a/Documentation/userspace-api/media/v4l/biblio.rst
> +++ b/Documentation/userspace-api/media/v4l/biblio.rst
> @@ -417,3 +417,13 @@ VP8
>  :title:     RFC 6386: "VP8 Data Format and Decoding Guide"
>  
>  :author:    J. Bankoski et al.
> +
> +.. _av1:
> +
> +AV1
> +===
> +
> +
> +:title:     AV1 Bitstream & Decoding Process Specification
> +
> +:author:    Peter de Rivaz, Argon Design Ltd, Jack Haughton, Argon Design Ltd

<snip>

> diff --git a/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst b/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
> index 819a70a26e18..73ff5311b7ae 100644
> --- a/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
> +++ b/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
> @@ -507,6 +507,60 @@ See also the examples in :ref:`control`.
>        - n/a
>        - A struct :c:type:`v4l2_ctrl_hevc_decode_params`, containing HEVC
>  	decoding parameters for stateless video decoders.
> +    * - ``V4L2_CTRL_TYPE_AV1_SEQUENCE``
> +      - n/a
> +      - n/a
> +      - n/a
> +      - A struct :c:type:`v4l2_ctrl_av1_sequence`, containing AV1 Sequence OBU
> +	decoding parameters for stateless video decoders.
> +    * - ``V4L2_CTRL_TYPE_AV1_TILE_GROUP``
> +      - n/a
> +      - n/a
> +      - n/a
> +      - A struct :c:type:`v4l2_ctrl_av1_tile_group`, containing AV1 Tile Group
> +	OBU decoding parameters for stateless video decoders.
> +    * - ``V4L2_CTRL_TYPE_AV1_TILE_GROUP_ENTRY``
> +      - n/a
> +      - n/a
> +      - n/a
> +      - A struct :c:type:`v4l2_ctrl_av1_tile_group`, containing AV1 Tile Group

I guess this should be:

Tile Group -> Tile Group Entry

> +	OBU decoding parameters for stateless video decoders.
> +    * - ``V4L2_CTRL_TYPE_AV1_TILE_LIST``
> +      - n/a
> +      - n/a
> +      - n/a
> +      - A struct :c:type:`v4l2_ctrl_av1_tile_list`, containing AV1 Tile List
> +	OBU decoding parameters for stateless video decoders.
> +    * - ``V4L2_CTRL_TYPE_AV1_TILE_LIST_ENTRY``
> +      - n/a
> +      - n/a
> +      - n/a
> +      - A struct :c:type:`v4l2_ctrl_av1_tile_list_entry`, containing AV1 Tile List

Also missing 'Entry'

> +	OBU decoding parameters for stateless video decoders.
> +    * - ``V4L2_CTRL_TYPE_AV1_FRAME_HEADER``
> +      - n/a
> +      - n/a
> +      - n/a
> +      - A struct :c:type:`v4l2_ctrl_av1_frame_header`, containing AV1 Frame/Frame
> +	Header OBU decoding parameters for stateless video decoders.
> +    * - ``V4L2_CTRL_TYPE_AV1_PROFILE``
> +      - n/a
> +      - n/a
> +      - n/a
> +      - A enum :c:type:`v4l2_ctrl_av1_profile`, indicating what AV1 profiles
> +	an AV1 stateless decoder might support.
> +    * - ``V4L2_CTRL_TYPE_AV1_LEVEL``
> +      - n/a
> +      - n/a
> +      - n/a
> +      - A enum :c:type:`v4l2_ctrl_av1_level`, indicating what AV1 levels
> +	an AV1 stateless decoder might support.
> +    * - ``V4L2_CTRL_TYPE_AV1_OPERATING_MODE``
> +      - n/a
> +      - n/a
> +      - n/a
> +      - A enum :c:type:`v4l2_ctrl_av1_operating_mode`, indicating what AV1
> +	operating modes an AV1 stateless decoder might support.
>  
>  .. raw:: latex
>  

Regards,

	Hans
