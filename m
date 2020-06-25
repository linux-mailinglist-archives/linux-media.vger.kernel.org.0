Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E627C209D1C
	for <lists+linux-media@lfdr.de>; Thu, 25 Jun 2020 12:54:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404078AbgFYKx4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Jun 2020 06:53:56 -0400
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:56357 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2403952AbgFYKxz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Jun 2020 06:53:55 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id oPVljek1d97i5oPVrjVcdY; Thu, 25 Jun 2020 12:53:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1593082433; bh=U9IdqLbdoB7uTyHiqbpm8y4GNQBWZ4XSI5EjOBwk/kM=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=G+/+FnJxSKRkJLGapYULRLVxwqD0KiHsJZ4ROAnCor0KbqatKNyhFYzkt+ba9mmsk
         Ghf7ptlWE7XFrb4lBmDTXQUAesTMlGkRyoITq5TgXZ7copsKoYHBZ3X759dSoxse5v
         gfLeZbGeHKBaW+tePKHgU5dEbXyxxolcGbRBse5qqPVGWUxTIzmBRlcyRshG1vxvI1
         Of+gc5/IM5mE9l0qNlZa5Awv1YB8fCPq1pAROSvlcsK1QjhliQqgU3neJsZDLC2O75
         sL9oIdCrZ3J0lOY5MHQ4XigVnCz9eYCrleZRBmoF9dlImE0qsJHwGR3z4Q85e6pTxw
         D/c3GbJgkEKzA==
Subject: Re: [PATCH] media: imx.rst: Update the imx6-sabreauto ADV7180
 instructions
To:     Fabio Estevam <festevam@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>
Cc:     Tim Harvey <tharvey@gateworks.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-media <linux-media@vger.kernel.org>
References: <20191010154417.9437-1-festevam@gmail.com>
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
 <7431d1dc-10fc-0880-01ed-cf75b5ace704@gmail.com>
 <CAOMZO5CqZyUA0qRBV2LBBq4JEtcQCfuj2qBaBUVpkxTvoC+-Pg@mail.gmail.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <a61a63b1-b7a6-32d8-df6e-0253cb87c227@xs4all.nl>
Date:   Thu, 25 Jun 2020 12:53:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <CAOMZO5CqZyUA0qRBV2LBBq4JEtcQCfuj2qBaBUVpkxTvoC+-Pg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfP8rUlCQh+8v1Gmm9fXyh7+s2tyMtupZItH3bKeub6pcb2DD291FUQy4nL8+vMz9edLlLjeiWF8UQj3+ERyrEyyzN19FGTcZwswonCCcVrywxFhymPrY
 jNXaj41rh8q6K0IpE4RaJh4/GE+ZoQNGpSqKApIpLNFsBbiew5YdRnpyy3o/lYHv+SlqrjmhGMu2PKqv+3jAKipHUQPu5pwgJ0hTo/AfwMZmgkUZWJB5sSKL
 6sJ0h3wSIc7uSGPmJAvVS7zppHhY6fF+gpKhCOlPfVRxBs6eUNoC/edlz7ee3B/9ycaZo/+Uu8I8wPr2NThUth7tFDu0HdgA9dwepXiXGtIu4UwmnEa3nBHe
 HLpAIWX1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 16/10/2019 21:51, Fabio Estevam wrote:
> Hi Steve,
> 
> On Wed, Oct 16, 2019 at 4:11 PM Steve Longerbeam <slongerbeam@gmail.com> wrote:
> 
>> FIM is available on the above nodes (/dev/video0 and /dev/video3), after
>> enabling links to them. So please try:
>>
>> # media-ctl -l "'ipu1_csi0':2 -> 'ipu1_csi0 capture':0[1]"
>> # v4l2-ctl -d0  --list-ctrls
>>
>> # media-ctl -l "'ipu1_csi1':2 -> 'ipu1_csi1 capture':0[1]"
>> # v4l2-ctl -d3  --list-ctrls
> 
> Thanks. This makes the FIM controls to appear.
> 
> However, if I run the following configuration so that I can get
> Gstreamer pipeline to run (gst-launch-1.0 v4l2src device=/dev/video2 !
> kmssink) then FIM does not appear.
> 
> # media-ctl -l "'adv7180 4-0021':0 -> 'ipu1_csi0_mux':4[1]"
> media-ctl -l "'ipu1_csi0_mux':5 -> 'ipu1_csi0':0[1]";
> media-ctl -l "'ipu1_csi0':1 -> 'ipu1_vdic':0[1]"
> media-ctl -l "'ipu1_vdic':2 -> 'ipu1_ic_prp':0[1]"
> media-ctl -l "'ipu1_ic_prp':2 -> 'ipu1_ic_prpvf':0[1]"
> media-ctl -l "'ipu1_ic_prpvf':1 -> 'ipu1_ic_prpvf capture':0[1]"
> 
> But I think this behavior is expected according to your previous explanation:
> 
> "If /dev/video2 is the "ipu1_ic_prpvf capture" node, it's because FIM is
> not yet available on those nodes. The FIM is only available on the
> "ipuX_csiY capture" nodes. It's on my plate to fix that."
> 
> Thanks for your patience in clarifying this.
> 
> Cheers
> 

This discussion fizzled out, and in any case this patch no longer applies.

I'm marking it as 'Changes Requested' in patchwork.

Regards,

	Hans
