Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 90B30D99BF
	for <lists+linux-media@lfdr.de>; Wed, 16 Oct 2019 21:11:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390711AbfJPTLN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Oct 2019 15:11:13 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:39148 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728944AbfJPTLM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Oct 2019 15:11:12 -0400
Received: by mail-wm1-f66.google.com with SMTP id v17so3947146wml.4
        for <linux-media@vger.kernel.org>; Wed, 16 Oct 2019 12:11:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=Fch1xvA9Gjezerjg5S30azMCXyOonAH5W2UW1B5A1Rk=;
        b=aEpW1b7Mt17YWaoMV7zTTm7MFJj6NUCQt+pEUJpCFWweOHcVuLx5/FWwUPh+YJGilL
         lyTkBv7fRyDKm5qNRGhiIPxUKqDWXYufJBU75tMZU1rT9AooBadRv4ffgkgoWBpVvtxF
         xvwBtFkTNGrFQLmT25YRh97vL3GnVwtQ2mztLG55J13l+dXIZNUFhbNazP4fsjv1uRCD
         HBrTyNNr1mXYjWgXbTeZIo3Nakjro98WrgriG5vFBb8GxIWx7Y/1/j4T2LDlGpk/SySQ
         CGkJNfPqoUZdyMptcNRdwGtbSPP3XPe4fUBWZfUxci0/RKnt43b9gLckn/fU1TPeA7pu
         k4+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=Fch1xvA9Gjezerjg5S30azMCXyOonAH5W2UW1B5A1Rk=;
        b=L/1a24YmJklUWXXcCuIARTnq2U2941s0Gj56/ltUpE2+3WMezGaP5LHuLIQmtDIs/z
         WYTSyQh8nu7pitSRi7HVO+lgOtPodqzQpMOcGdDiuKIYT6/wL3G4uG2yiLOJcb6IJwip
         TAksKFWDJzknwp90Lz2Zy3EZXx8IpVu/to+v8Dm+bb09gkxTAbyVnIIonACh+dpf027C
         uLn1WV5tViZInri8r7Ss98iJ/fyef6iRUYUlvpv7FY6R38uR4V8kF1zYrq+5i7ImuinO
         I8LXk3F4cgaWDQA5CG+tdheFm5YU6BCpEufOIT+RNMq7xUHS+DbB7WHRLW2iKMa8Yqay
         E2bA==
X-Gm-Message-State: APjAAAXEyTU+tPkI1p/mcgRx055Prk0gYJlMp40dG34MijugJPvocr+q
        LPmp/cAkUfnUHLQjMztIdw1NiDmV
X-Google-Smtp-Source: APXvYqwom19Vd+ifreJovhWoHWo7r8ggkgv0gmXtA/lCUgXWE/p25punQXeH4kOForowSbtNxCF4fw==
X-Received: by 2002:a05:600c:253:: with SMTP id 19mr4432356wmj.158.1571253069803;
        Wed, 16 Oct 2019 12:11:09 -0700 (PDT)
Received: from [172.30.88.162] (sjewanfw1-nat.mentorg.com. [139.181.7.34])
        by smtp.gmail.com with ESMTPSA id z142sm4431668wmc.24.2019.10.16.12.11.07
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 16 Oct 2019 12:11:09 -0700 (PDT)
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
 <8b2f0c05-8e4f-72d9-d37f-c41936fcfd07@gmail.com>
 <CAOMZO5D4R+ta6By2Th5WF9THKXuzjFV8cLxPw+zyj-Kv4k=7kA@mail.gmail.com>
From:   Steve Longerbeam <slongerbeam@gmail.com>
Message-ID: <7431d1dc-10fc-0880-01ed-cf75b5ace704@gmail.com>
Date:   Wed, 16 Oct 2019 12:11:05 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAOMZO5D4R+ta6By2Th5WF9THKXuzjFV8cLxPw+zyj-Kv4k=7kA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 10/16/19 11:54 AM, Fabio Estevam wrote:
> On Wed, Oct 16, 2019 at 2:31 PM Steve Longerbeam <slongerbeam@gmail.com> wrote:
>
>> If /dev/video2 is the "ipu1_ic_prpvf capture" node, it's because FIM is
>> not yet available on those nodes. The FIM is only available on the
>> "ipuX_csiY capture" nodes. It's on my plate to fix that.
> On a 5.3.6 kernel on imx6dl-sabreauto:
>
> # v4l2-ctl --list-devices
> imx-media (platform:imx-media):
>          /dev/media0
>
> imx-media-capture (platform:ipu1_csi0):
>          /dev/video0
>
> imx-media-capture (platform:ipu1_csi1):
>          /dev/video3

FIM is available on the above nodes (/dev/video0 and /dev/video3), after 
enabling links to them. So please try:

# media-ctl -l "'ipu1_csi0':2 -> 'ipu1_csi0 capture':0[1]"
# v4l2-ctl -d0  --list-ctrls

# media-ctl -l "'ipu1_csi1':2 -> 'ipu1_csi1 capture':0[1]"
# v4l2-ctl -d3  --list-ctrls

Steve

>
> imx-media-capture (platform:ipu1_ic_prpenc):
>          /dev/video1
>
> imx-media-capture (platform:ipu1_ic_prpvf):
>          /dev/video2
>
>
> # v4l2-ctl -d0  --list-ctrls
> # v4l2-ctl -d1  --list-ctrls
> # v4l2-ctl -d2  --list-ctrls
>
> User Controls
>
>                       brightness 0x00980900 (int)    : min=-128 max=127 step=1 dr
>                         contrast 0x00980901 (int)    : min=0 max=255 step=1 defar
>                       saturation 0x00980902 (int)    : min=0 max=255 step=1 defar
>                              hue 0x00980903 (int)    : min=-127 max=128 step=1 dr
>                  horizontal_flip 0x00980914 (bool)   : default=0 value=0
>                    vertical_flip 0x00980915 (bool)   : default=0 value=0
>                           rotate 0x00980922 (int)    : min=0 max=270 step=90 deft
>                   fast_switching 0x00981970 (bool)   : default=0 value=0
>
> Image Processing Controls
>
>               deinterlacing_mode 0x009f0904 (menu)   : min=0 max=3 default=3 val3
> # v4l2-ctl -d3  --list-ctrls
> #
>
> I cannot see the FIM controls appearing in any device here.
>
> Anything I am missing?
>
> Thanks

