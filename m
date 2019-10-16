Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E4AE4D999A
	for <lists+linux-media@lfdr.de>; Wed, 16 Oct 2019 20:54:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436637AbfJPSyu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Oct 2019 14:54:50 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:40157 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731889AbfJPSyt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Oct 2019 14:54:49 -0400
Received: by mail-lj1-f194.google.com with SMTP id 7so25112624ljw.7
        for <linux-media@vger.kernel.org>; Wed, 16 Oct 2019 11:54:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PRFUV0LIsICYWVRCpAe2U15AIn5YKQBZOtGkrFhjP/g=;
        b=R/65m3o8+pnM5r/HqAVeyTasniFy8A4RifVdh95BiF0pwcaYr4EAh/GTdUfMnVqrOe
         P+UOBh2gjlWsKummKfFRhWbvky5P+TsnHwyGS1TSl3gpCVwuRphwQyT08SFf6p4vcqBP
         zgbodibld5TLtC8JIwIYPeag3s98xtk05JVSRNiX0j365KzHUExerpNsGNn9CHJquC6H
         8wVwTn4UjSyO8YRMDgQ5zgtwS0Hv4lWG+29uXHxdbWCnmrh1d0NUK8323/S/lp8qTN7G
         EA/n8UdSHeESOjfCNrp9nWASgeBirhNuIqqLlZvcxWU5z7/O8Wlw0v1pUnjPZ+H4ThBJ
         1t6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PRFUV0LIsICYWVRCpAe2U15AIn5YKQBZOtGkrFhjP/g=;
        b=I7IYy4E6goL246/g65w5+gbMplAgQMjNuzuzxJKK8u3CQtm4CixyLdUvNwrvwjHU6Y
         CQkIUR7BHvcPjo8LHY2n4ar96C+bXWEHs2fzW3NK7aV1ohzq4vXD5P3nd1cfILMNhMMu
         yYtzkuy8P3O87COisZCkxTcK+gz7brBW8D30yvHW0eeQRyhU7C4UKYvQjN7qjyNVJvLw
         7W/scJxUohLIEmBSsSqTEDclnZa2uG/9yu/pStfyEvQO0v30mPOERn2DTFoLX+2NrzUf
         iEXU+p+GP8lRPkZcC+uIOhS8goaTqF/dURN9Rz8q6wr47IlNCmjYRpOXKh5aMyYU5J1G
         yq+Q==
X-Gm-Message-State: APjAAAVLnpdL2J4NHCl+xBYleKIlkCztt5l/+/kFPFPLPSm0ki16t7/C
        lR5oXUtfrFtC/yxSPk8EOtujkYPKqMyV30wa5HI=
X-Google-Smtp-Source: APXvYqy0fJSUp62g2I4k11ULyBhNCs3HGX/2R6kORSs1UgHtf10aEmK6DHZNWe32n0ie2mJNmDP64ngu17UKafEl1ac=
X-Received: by 2002:a2e:86cd:: with SMTP id n13mr26803660ljj.239.1571252087956;
 Wed, 16 Oct 2019 11:54:47 -0700 (PDT)
MIME-Version: 1.0
References: <20191010154417.9437-1-festevam@gmail.com> <0f7a7910-8652-7a95-1f04-e25278ec05aa@gmail.com>
 <593b540b-d5f9-63ba-becc-0902dc5d7900@gmail.com> <CAOMZO5BgnbfFSmu7HEWtaT9Gexb-u13ZxzWEN-+Hw9eMfuC+LQ@mail.gmail.com>
 <CAJ+vNU2fJ_eGMwQH7-HmO_==5p3Uuscv6S2fG_NY67J2o8OG+g@mail.gmail.com>
 <CAOMZO5ABOV+Z7FenZykU82w-yUvae6zm6d6inN8SYrhViudYnA@mail.gmail.com>
 <CAJ+vNU22JmDQ+tyRFSQgM_wp-pgfE7gOt2i3QbdOJp0KuDXfRQ@mail.gmail.com>
 <CAOMZO5Dcv9fz=A8nTsvVsvu7+LNag2Sj03tJyFQKgpt_1B6Dwg@mail.gmail.com>
 <CAJ+vNU1+oS1wFav4W2g0f6XGCP3oqEwzxyvrN3fkggNSBau0Tg@mail.gmail.com>
 <CAOMZO5AMbAHmoYFLQbZbzBjMkmTsPkPctU-OqArPk3_PvtznjA@mail.gmail.com>
 <2acc57d6-da43-866b-fc01-e5e59af413ac@gmail.com> <CAOMZO5B5+_3FxUfgzMJzDH-myfXEQgxT8vfa-0L8cYFK8uhsuQ@mail.gmail.com>
 <e41aa4d6-b84f-33ab-0738-e4f14d582172@gmail.com> <CAOMZO5BAsNzngLF2=1h38j0KYdvGLankQwzZ8tpG68sKSvaboQ@mail.gmail.com>
 <8b2f0c05-8e4f-72d9-d37f-c41936fcfd07@gmail.com>
In-Reply-To: <8b2f0c05-8e4f-72d9-d37f-c41936fcfd07@gmail.com>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Wed, 16 Oct 2019 15:54:36 -0300
Message-ID: <CAOMZO5D4R+ta6By2Th5WF9THKXuzjFV8cLxPw+zyj-Kv4k=7kA@mail.gmail.com>
Subject: Re: [PATCH] media: imx.rst: Update the imx6-sabreauto ADV7180 instructions
To:     Steve Longerbeam <slongerbeam@gmail.com>
Cc:     Tim Harvey <tharvey@gateworks.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Oct 16, 2019 at 2:31 PM Steve Longerbeam <slongerbeam@gmail.com> wrote:

> If /dev/video2 is the "ipu1_ic_prpvf capture" node, it's because FIM is
> not yet available on those nodes. The FIM is only available on the
> "ipuX_csiY capture" nodes. It's on my plate to fix that.

On a 5.3.6 kernel on imx6dl-sabreauto:

# v4l2-ctl --list-devices
imx-media (platform:imx-media):
        /dev/media0

imx-media-capture (platform:ipu1_csi0):
        /dev/video0

imx-media-capture (platform:ipu1_csi1):
        /dev/video3

imx-media-capture (platform:ipu1_ic_prpenc):
        /dev/video1

imx-media-capture (platform:ipu1_ic_prpvf):
        /dev/video2


# v4l2-ctl -d0  --list-ctrls
# v4l2-ctl -d1  --list-ctrls
# v4l2-ctl -d2  --list-ctrls

User Controls

                     brightness 0x00980900 (int)    : min=-128 max=127 step=1 dr
                       contrast 0x00980901 (int)    : min=0 max=255 step=1 defar
                     saturation 0x00980902 (int)    : min=0 max=255 step=1 defar
                            hue 0x00980903 (int)    : min=-127 max=128 step=1 dr
                horizontal_flip 0x00980914 (bool)   : default=0 value=0
                  vertical_flip 0x00980915 (bool)   : default=0 value=0
                         rotate 0x00980922 (int)    : min=0 max=270 step=90 deft
                 fast_switching 0x00981970 (bool)   : default=0 value=0

Image Processing Controls

             deinterlacing_mode 0x009f0904 (menu)   : min=0 max=3 default=3 val3
# v4l2-ctl -d3  --list-ctrls
#

I cannot see the FIM controls appearing in any device here.

Anything I am missing?

Thanks
