Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AF545D9885
	for <lists+linux-media@lfdr.de>; Wed, 16 Oct 2019 19:31:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388899AbfJPRbb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Oct 2019 13:31:31 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:53262 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726619AbfJPRba (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Oct 2019 13:31:30 -0400
Received: by mail-wm1-f65.google.com with SMTP id i16so3814559wmd.3
        for <linux-media@vger.kernel.org>; Wed, 16 Oct 2019 10:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=rIH0YkDRAK7uRxosRZovN4SQ0IAy1/00KDbj4CUqZuA=;
        b=FUxQesIWS09SDWgYULgh3b/ab+oXXi0WozEKbf6jpqj6eBZWZqWdG+NGy8hs6C2vyq
         SQ/N6DMWyFTeU8u/2RxNug8uCIA6BeRvLEMMeRex7pk62UKBsNeYIB9iQJJM+dQqEf7h
         Kqype0jzVnw+9oc+aFYocVbPUNBNzKpOd8GVi3p+mxiC6fVXFnUAJxZ2fZH6dK8mKEH/
         Kdm+DlUO/ikq4lh/cgybQDhJ6h3YswdCvP6rx10ecFT6Schm0EBVYR4X5PASrlA7V9fo
         7gUuPuSZCFeXQ91xBfR8OZboiVVDn2tEXFmX0HnsZys7vskgPr2SwS94oT4yUpLPTrtn
         kD5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=rIH0YkDRAK7uRxosRZovN4SQ0IAy1/00KDbj4CUqZuA=;
        b=dKt67JKexWGErLF7mWkDdvD6yusCFRnl7t6BT0Do+3JQ9AvMArY7fQZ1/DFolSwXYE
         rIntQyZyLeGuSe+D04MxK9uyXZRiWj6UI5IZL0UirgGCUUgafpk76XPHp0drfRP9SRfC
         6EbfF8C+T7buK+d5dCelwnCscn4Dj69l6FqL0EHiCcqm3fYMxs/OUDWURQCNklINKzRf
         gdAh6VO8f+eJ+1090tJPHdKZwZ1JIoxDT/+0RxdsPyQEZ4NpceMnakq9CtKCgcBJrigV
         8XzMiwaAZd3y6/6DB+15qH6wU/g/J+y0pTwwf8+xGZYSgw+qpmTn00dU7akJe7HJFqsf
         Zl5w==
X-Gm-Message-State: APjAAAXrVmcmwZspmfSHXRtFXUUjA7bjCLAhVduAW1vurUR1C6QHWs4R
        dLcU4y+KUYGzqdSIQGEC+zJA0PKx
X-Google-Smtp-Source: APXvYqyP+AnvQHBemR2OLRyUXuLoiFlJT9F85EgCH8Q0vgVrhfISZVjnqCozBFod4vCj25iZ1ei8Kw==
X-Received: by 2002:a05:600c:40f:: with SMTP id q15mr4349309wmb.30.1571247088037;
        Wed, 16 Oct 2019 10:31:28 -0700 (PDT)
Received: from [172.30.88.162] (sjewanfw1-nat.mentorg.com. [139.181.7.34])
        by smtp.gmail.com with ESMTPSA id f8sm2620702wmb.37.2019.10.16.10.31.25
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 16 Oct 2019 10:31:27 -0700 (PDT)
Subject: Re: [PATCH] media: imx.rst: Update the imx6-sabreauto ADV7180
 instructions
To:     Fabio Estevam <festevam@gmail.com>
Cc:     Tim Harvey <tharvey@gateworks.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-media <linux-media@vger.kernel.org>
References: <20191010154417.9437-1-festevam@gmail.com>
 <0f7a7910-8652-7a95-1f04-e25278ec05aa@gmail.com>
 <593b540b-d5f9-63ba-becc-0902dc5d7900@gmail.com>
 <CAOMZO5BgnbfFSmu7HEWtaT9Gexb-u13ZxzWEN-+Hw9eMfuC+LQ@mail.gmail.com>
 <CAJ+vNU2fJ_eGMwQH7-HmO_==5p3Uuscv6S2fG_NY67J2o8OG+g@mail.gmail.com>
 <CAOMZO5ABOV+Z7FenZykU82w-yUvae6zm6d6inN8SYrhViudYnA@mail.gmail.com>
 <CAJ+vNU22JmDQ+tyRFSQgM_wp-pgfE7gOt2i3QbdOJp0KuDXfRQ@mail.gmail.com>
 <CAOMZO5Dcv9fz=A8nTsvVsvu7+LNag2Sj03tJyFQKgpt_1B6Dwg@mail.gmail.com>
 <CAJ+vNU1+oS1wFav4W2g0f6XGCP3oqEwzxyvrN3fkggNSBau0Tg@mail.gmail.com>
 <CAOMZO5AMbAHmoYFLQbZbzBjMkmTsPkPctU-OqArPk3_PvtznjA@mail.gmail.com>
 <2acc57d6-da43-866b-fc01-e5e59af413ac@gmail.com>
 <CAOMZO5B5+_3FxUfgzMJzDH-myfXEQgxT8vfa-0L8cYFK8uhsuQ@mail.gmail.com>
 <e41aa4d6-b84f-33ab-0738-e4f14d582172@gmail.com>
 <CAOMZO5BAsNzngLF2=1h38j0KYdvGLankQwzZ8tpG68sKSvaboQ@mail.gmail.com>
From:   Steve Longerbeam <slongerbeam@gmail.com>
Message-ID: <8b2f0c05-8e4f-72d9-d37f-c41936fcfd07@gmail.com>
Date:   Wed, 16 Oct 2019 10:31:23 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAOMZO5BAsNzngLF2=1h38j0KYdvGLankQwzZ8tpG68sKSvaboQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 10/16/19 6:04 AM, Fabio Estevam wrote:
> Hi Steve,
>
> On Tue, Oct 15, 2019 at 10:18 PM Steve Longerbeam <slongerbeam@gmail.com> wrote:
>
>> Here's a quick example that uses the end-of-frame method to measure fi's
>> (all other FIM controls are left at the default values):
>>
>> v4l2-ctl -d0 --set-ctrl=fim_enable=1
>> # disable input capture method
>> v4l2-ctl -d0 --set-ctrl=fim_input_capture_edge=0
>> v4l2-ctl -d0 --stream-mmap
> What needs to be done for 'fim_enable' to be available?
>
> I am using a mx6dl-sabreauto, and this is what I get:
>
> # v4l2-ctl -d2 --set-ctrl=fim_enable=1
> unknown control 'fim_enable'

If /dev/video2 is the "ipu1_ic_prpvf capture" node, it's because FIM is 
not yet available on those nodes. The FIM is only available on the 
"ipuX_csiY capture" nodes. It's on my plate to fix that.

But also remember that the FIM controls are inherited from the ipuX_csiY 
subdevices when the link from ipuX_csiY is enabled, so while the 
controls are always available on ipuX_csiY, they become available on 
"ipuX_csiY capture" nodes when the link is enabled.

Steve

