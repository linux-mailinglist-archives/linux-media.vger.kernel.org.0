Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A6432D9A73
	for <lists+linux-media@lfdr.de>; Wed, 16 Oct 2019 21:51:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733219AbfJPTvT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Oct 2019 15:51:19 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:32985 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727148AbfJPTvT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Oct 2019 15:51:19 -0400
Received: by mail-lj1-f196.google.com with SMTP id a22so32687ljd.0
        for <linux-media@vger.kernel.org>; Wed, 16 Oct 2019 12:51:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8bEod88CLzsZI3n/8qHoLTp0cKY9WriwdeZU1wlmZgw=;
        b=hASD8wxmvy4avZqqZJGiGxOlX+YZn8jhGkxew9p9wOtF7xbpo8WfxQwd+/23+2R4jQ
         cfCtoAV15GhifgwtunU0OfvSsBG3LY9YPvYxTHwNEl/D1EBA6a0igkOIw6qN2PgE5/qK
         oxqAiem7Ei1dH3xMNK11mr56f1uyGe517ZQvjNUDKEHqODGMYaJXpF4PJ2QbvyuRwU19
         rijzlidiR73ogmvICJ+UZQz4XL1OXcLyoMwOzc7TbkZblW5+iN/5PPnpcJnz8SoEGJgv
         XhvT78dShyQtI7V/nUr/sWE225V2JIrQkNaHAeJ5RZklvtMFGtd87obTFEXX8iDJ9Rfc
         S09A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8bEod88CLzsZI3n/8qHoLTp0cKY9WriwdeZU1wlmZgw=;
        b=HrEqC5qJy9NvtV77tYIGiiOH8sID83LBtDeeNDBDLMHAK+/dVd0Q2sb/bgSyxb8x5+
         aACIf732p+mUwkMKpvNL8WgOCw7NPZ9ioivfQOoygVZRXLMAnIP9qsHwtXBmnOdIdNA7
         Ip7jB+FHfwarLcaBcgpvluXfC6DPELLp4Kjvd48sk/Mvez/75dvTYEMfZgXB5EqmABaR
         klZo6l3KvRr97Q6SENNIO5CFy3Qk5DH9uMe+IqLvWXD1TOuHK0smySlG3lKZ6xBiKUI8
         W2RYdsvIfNyi1+qFD/3rzG5iRuXSPjleJhfb+/dU1g1yow+PNi2gW0cZu7hVsMVNbxAO
         rIMQ==
X-Gm-Message-State: APjAAAW8J+PiNQwfMCAiRQ6ZfzOTiydv5Vjjt/auNMRilo/vjPw/RS+e
        dpqGVD1/VYaaS6OZKahrXV1+d/oUoVrHYbkQ3ebKbX9qXu0=
X-Google-Smtp-Source: APXvYqy1981wpcFm7R9ykoZoTw7eCcwk+OFcuY/g0WGtj5FXEHkkG5ybFzuJzK+MI5ue7NrIeFex4GxJibK8oKfWekw=
X-Received: by 2002:a2e:b4d5:: with SMTP id r21mr26487660ljm.149.1571255477292;
 Wed, 16 Oct 2019 12:51:17 -0700 (PDT)
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
 <8b2f0c05-8e4f-72d9-d37f-c41936fcfd07@gmail.com> <CAOMZO5D4R+ta6By2Th5WF9THKXuzjFV8cLxPw+zyj-Kv4k=7kA@mail.gmail.com>
 <7431d1dc-10fc-0880-01ed-cf75b5ace704@gmail.com>
In-Reply-To: <7431d1dc-10fc-0880-01ed-cf75b5ace704@gmail.com>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Wed, 16 Oct 2019 16:51:05 -0300
Message-ID: <CAOMZO5CqZyUA0qRBV2LBBq4JEtcQCfuj2qBaBUVpkxTvoC+-Pg@mail.gmail.com>
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

Hi Steve,

On Wed, Oct 16, 2019 at 4:11 PM Steve Longerbeam <slongerbeam@gmail.com> wrote:

> FIM is available on the above nodes (/dev/video0 and /dev/video3), after
> enabling links to them. So please try:
>
> # media-ctl -l "'ipu1_csi0':2 -> 'ipu1_csi0 capture':0[1]"
> # v4l2-ctl -d0  --list-ctrls
>
> # media-ctl -l "'ipu1_csi1':2 -> 'ipu1_csi1 capture':0[1]"
> # v4l2-ctl -d3  --list-ctrls

Thanks. This makes the FIM controls to appear.

However, if I run the following configuration so that I can get
Gstreamer pipeline to run (gst-launch-1.0 v4l2src device=/dev/video2 !
kmssink) then FIM does not appear.

# media-ctl -l "'adv7180 4-0021':0 -> 'ipu1_csi0_mux':4[1]"
media-ctl -l "'ipu1_csi0_mux':5 -> 'ipu1_csi0':0[1]";
media-ctl -l "'ipu1_csi0':1 -> 'ipu1_vdic':0[1]"
media-ctl -l "'ipu1_vdic':2 -> 'ipu1_ic_prp':0[1]"
media-ctl -l "'ipu1_ic_prp':2 -> 'ipu1_ic_prpvf':0[1]"
media-ctl -l "'ipu1_ic_prpvf':1 -> 'ipu1_ic_prpvf capture':0[1]"

But I think this behavior is expected according to your previous explanation:

"If /dev/video2 is the "ipu1_ic_prpvf capture" node, it's because FIM is
not yet available on those nodes. The FIM is only available on the
"ipuX_csiY capture" nodes. It's on my plate to fix that."

Thanks for your patience in clarifying this.

Cheers
