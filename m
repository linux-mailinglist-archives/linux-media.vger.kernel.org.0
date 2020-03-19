Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D9C1D18C2BE
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2020 23:09:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727297AbgCSWJI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Mar 2020 18:09:08 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:33940 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726663AbgCSWJI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Mar 2020 18:09:08 -0400
Received: by mail-pl1-f196.google.com with SMTP id a23so1659528plm.1
        for <linux-media@vger.kernel.org>; Thu, 19 Mar 2020 15:09:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=AeOHXO8ZLPslcHElIpFxZXu0X+X1/aFOusecb42TCBw=;
        b=bkbF3FYPNSVl6/+Cou7rXtxo0i9EoGLnkMXTE9CJ0YxxOuaSq/8+PymDkoBSfFzNM0
         AmFUsWAmpJiZjcSKZ/DPPfHqTrKDOdOoIwNHNXNsyJ/V23b//Pgi326JQdaJYnRu3fzB
         WpPJooL+oPzIrV/uSpHDAiTRVGJDwzHjyVj9n3Fr6CYVogdObgWWyXvYHMtZitygQZDc
         UO33pvx5vLj2jp652Fnp90C02jE7fs9VTNfBKcBtPgtAk31Nrr+eQTNiRV9pRuPLdSoH
         pXEyXo07DJDQd+8CLAgWwcOJ37geBmlvYIru07Ko4iPs0EKre73SvAeU3EqISvoVXL9X
         rgVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=AeOHXO8ZLPslcHElIpFxZXu0X+X1/aFOusecb42TCBw=;
        b=lshBGDYwc+nrVT8lOJ8vkQDdHBR/hfYyS/2ApIya/H9stwj5S/Xk1Fx7t0ky5+dab9
         XuQqEfJvTuPLaWdct5HQZ7yFqiZ072PvVCM89wRCTgAott7t17I6o3hKIhJYtRV70nU/
         INYehfmtf6VButP9nn6+fBlOIfFa9E4f3Fqss0eyvtSG8+h3qmMGptW6DDsOk/O7HNNr
         g5jyX2DkkRfh5lpIJ99cFtYHyeTAU6gqN18Y5BEakaQ/4BNmjgoOTzpeDXXgv8rWu5Ie
         30XE25QmtP5GoNgmhv/w/PQgECqJXyQn+kaQDfRNzMmVX6NKz2gKdbWR9nsxuGmHG7re
         SZ3w==
X-Gm-Message-State: ANhLgQ0t/Yaoqa6xI6VwZH4LmV/hedcHIcr05N5hjkAr5L6HGM/xPHef
        tBotkbmkXmrmVAEK7XTpJuI=
X-Google-Smtp-Source: ADFU+vvENyW7tZIYg/MXokPdtlG0xj5lErlf6uGZCqR12zY2uAS11CcjJPFqO9Yp5dB1dSnVMS7QiQ==
X-Received: by 2002:a17:90a:240a:: with SMTP id h10mr5913960pje.123.1584655745560;
        Thu, 19 Mar 2020 15:09:05 -0700 (PDT)
Received: from [192.168.1.103] (c-67-169-51-108.hsd1.ca.comcast.net. [67.169.51.108])
        by smtp.gmail.com with ESMTPSA id 15sm3362619pfu.186.2020.03.19.15.09.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Mar 2020 15:09:04 -0700 (PDT)
Subject: Re: [PATCH] media: imx.rst: Add example media graph
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Rui Miguel Silva <rmfrfs@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
References: <20200319183932.12403-1-slongerbeam@gmail.com>
 <20200319192516.GM14585@pendragon.ideasonboard.com>
From:   Steve Longerbeam <slongerbeam@gmail.com>
Message-ID: <f75d2575-8aa4-a58d-dc01-80ab049a1a96@gmail.com>
Date:   Thu, 19 Mar 2020 15:09:04 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200319192516.GM14585@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

Thanks for the review.

On 3/19/20 12:25 PM, Laurent Pinchart wrote:
> Hi Steve,
>
> Thank you for the patch.
>
> On Thu, Mar 19, 2020 at 11:39:32AM -0700, Steve Longerbeam wrote:
>> Add the media graph topology for the i.MX6Q SabreSD.
> You may want to explain why having the graph in the kernel documentation
> is useful.

Ok, I should expand on the reasoning. Also I need to explain that this 
is only one example graph for imx6, and what is common and what will 
differ in other graphs.

Steve

>   Apart from that,
>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>
>> Signed-off-by: Steve Longerbeam <slongerbeam@gmail.com>
>> ---
>>   Documentation/media/v4l-drivers/imx.rst       | 14 +++++
>>   .../media/v4l-drivers/imx6q-sabresd.dot       | 56 +++++++++++++++++++
>>   2 files changed, 70 insertions(+)
>>   create mode 100644 Documentation/media/v4l-drivers/imx6q-sabresd.dot
>>
>> diff --git a/Documentation/media/v4l-drivers/imx.rst b/Documentation/media/v4l-drivers/imx.rst
>> index 1246573c1019..9ce4b7d122e5 100644
>> --- a/Documentation/media/v4l-drivers/imx.rst
>> +++ b/Documentation/media/v4l-drivers/imx.rst
>> @@ -102,6 +102,20 @@ Some of the features of this driver include:
>>     problems with the ADV718x video decoders.
>>   
>>   
>> +Topology
>> +--------
>> +
>> +The following shows the media topology for the i.MX6Q SabreSD:
>> +
>> +.. _imx6q_sabresd_topology_graph:
>> +
>> +.. kernel-figure:: imx6q-sabresd.dot
>> +    :alt:   Diagram of the i.MX6Q SabreSD media pipeline topology
>> +    :align: center
>> +
>> +    Media pipeline graph on i.MX6Q SabreSD
>> +
>> +
>>   Entities
>>   --------
>>   
>> diff --git a/Documentation/media/v4l-drivers/imx6q-sabresd.dot b/Documentation/media/v4l-drivers/imx6q-sabresd.dot
>> new file mode 100644
>> index 000000000000..7d56cafa1944
>> --- /dev/null
>> +++ b/Documentation/media/v4l-drivers/imx6q-sabresd.dot
>> @@ -0,0 +1,56 @@
>> +digraph board {
>> +	rankdir=TB
>> +	n00000001 [label="{{<port0> 0} | ipu1_csi0\n/dev/v4l-subdev0 | {<port1> 1 | <port2> 2}}", shape=Mrecord, style=filled, fillcolor=green]
>> +	n00000001:port2 -> n00000005 [style=dashed]
>> +	n00000001:port1 -> n0000000f:port0 [style=dashed]
>> +	n00000001:port1 -> n0000000b:port0 [style=dashed]
>> +	n00000005 [label="ipu1_csi0 capture\n/dev/video0", shape=box, style=filled, fillcolor=yellow]
>> +	n0000000b [label="{{<port0> 0 | <port1> 1} | ipu1_vdic\n/dev/v4l-subdev1 | {<port2> 2}}", shape=Mrecord, style=filled, fillcolor=green]
>> +	n0000000b:port2 -> n0000000f:port0 [style=dashed]
>> +	n0000000f [label="{{<port0> 0} | ipu1_ic_prp\n/dev/v4l-subdev2 | {<port1> 1 | <port2> 2}}", shape=Mrecord, style=filled, fillcolor=green]
>> +	n0000000f:port1 -> n00000013:port0 [style=dashed]
>> +	n0000000f:port2 -> n0000001c:port0 [style=dashed]
>> +	n00000013 [label="{{<port0> 0} | ipu1_ic_prpenc\n/dev/v4l-subdev3 | {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
>> +	n00000013:port1 -> n00000016 [style=dashed]
>> +	n00000016 [label="ipu1_ic_prpenc capture\n/dev/video1", shape=box, style=filled, fillcolor=yellow]
>> +	n0000001c [label="{{<port0> 0} | ipu1_ic_prpvf\n/dev/v4l-subdev4 | {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
>> +	n0000001c:port1 -> n0000001f [style=dashed]
>> +	n0000001f [label="ipu1_ic_prpvf capture\n/dev/video2", shape=box, style=filled, fillcolor=yellow]
>> +	n0000002f [label="{{<port0> 0} | ipu1_csi1\n/dev/v4l-subdev5 | {<port1> 1 | <port2> 2}}", shape=Mrecord, style=filled, fillcolor=green]
>> +	n0000002f:port2 -> n00000033 [style=dashed]
>> +	n0000002f:port1 -> n0000000f:port0 [style=dashed]
>> +	n0000002f:port1 -> n0000000b:port0 [style=dashed]
>> +	n00000033 [label="ipu1_csi1 capture\n/dev/video3", shape=box, style=filled, fillcolor=yellow]
>> +	n0000003d [label="{{<port0> 0} | ipu2_csi0\n/dev/v4l-subdev6 | {<port1> 1 | <port2> 2}}", shape=Mrecord, style=filled, fillcolor=green]
>> +	n0000003d:port2 -> n00000041 [style=dashed]
>> +	n0000003d:port1 -> n0000004b:port0 [style=dashed]
>> +	n0000003d:port1 -> n00000047:port0 [style=dashed]
>> +	n00000041 [label="ipu2_csi0 capture\n/dev/video4", shape=box, style=filled, fillcolor=yellow]
>> +	n00000047 [label="{{<port0> 0 | <port1> 1} | ipu2_vdic\n/dev/v4l-subdev7 | {<port2> 2}}", shape=Mrecord, style=filled, fillcolor=green]
>> +	n00000047:port2 -> n0000004b:port0 [style=dashed]
>> +	n0000004b [label="{{<port0> 0} | ipu2_ic_prp\n/dev/v4l-subdev8 | {<port1> 1 | <port2> 2}}", shape=Mrecord, style=filled, fillcolor=green]
>> +	n0000004b:port1 -> n0000004f:port0 [style=dashed]
>> +	n0000004b:port2 -> n00000058:port0 [style=dashed]
>> +	n0000004f [label="{{<port0> 0} | ipu2_ic_prpenc\n/dev/v4l-subdev9 | {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
>> +	n0000004f:port1 -> n00000052 [style=dashed]
>> +	n00000052 [label="ipu2_ic_prpenc capture\n/dev/video5", shape=box, style=filled, fillcolor=yellow]
>> +	n00000058 [label="{{<port0> 0} | ipu2_ic_prpvf\n/dev/v4l-subdev10 | {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
>> +	n00000058:port1 -> n0000005b [style=dashed]
>> +	n0000005b [label="ipu2_ic_prpvf capture\n/dev/video6", shape=box, style=filled, fillcolor=yellow]
>> +	n0000006b [label="{{<port0> 0} | ipu2_csi1\n/dev/v4l-subdev11 | {<port1> 1 | <port2> 2}}", shape=Mrecord, style=filled, fillcolor=green]
>> +	n0000006b:port2 -> n0000006f [style=dashed]
>> +	n0000006b:port1 -> n0000004b:port0 [style=dashed]
>> +	n0000006b:port1 -> n00000047:port0 [style=dashed]
>> +	n0000006f [label="ipu2_csi1 capture\n/dev/video7", shape=box, style=filled, fillcolor=yellow]
>> +	n00000079 [label="{{<port0> 0} | imx6-mipi-csi2\n/dev/v4l-subdev12 | {<port1> 1 | <port2> 2 | <port3> 3 | <port4> 4}}", shape=Mrecord, style=filled, fillcolor=green]
>> +	n00000079:port2 -> n0000002f:port0 [style=dashed]
>> +	n00000079:port3 -> n0000003d:port0 [style=dashed]
>> +	n00000079:port1 -> n0000007f:port0 [style=dashed]
>> +	n00000079:port4 -> n00000083:port0 [style=dashed]
>> +	n0000007f [label="{{<port0> 0 | <port1> 1} | ipu1_csi0_mux\n/dev/v4l-subdev13 | {<port2> 2}}", shape=Mrecord, style=filled, fillcolor=green]
>> +	n0000007f:port2 -> n00000001:port0 [style=dashed]
>> +	n00000083 [label="{{<port0> 0 | <port1> 1} | ipu2_csi1_mux\n/dev/v4l-subdev14 | {<port2> 2}}", shape=Mrecord, style=filled, fillcolor=green]
>> +	n00000083:port2 -> n0000006b:port0 [style=dashed]
>> +	n00000087 [label="{{} | ov5640 1-003c\n/dev/v4l-subdev15 | {<port0> 0}}", shape=Mrecord, style=filled, fillcolor=green]
>> +	n00000087:port0 -> n00000079:port0 [style=dashed]
>> +}

