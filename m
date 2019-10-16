Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A5CD3D91F2
	for <lists+linux-media@lfdr.de>; Wed, 16 Oct 2019 15:04:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405284AbfJPNEH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Oct 2019 09:04:07 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:46715 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405282AbfJPNEH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Oct 2019 09:04:07 -0400
Received: by mail-lf1-f68.google.com with SMTP id t8so17378195lfc.13
        for <linux-media@vger.kernel.org>; Wed, 16 Oct 2019 06:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4tKh7FyZX2RwCgxyhDE2zFW4ZYb9Rcpw88p4ZR/ogtA=;
        b=CRKx36eTCOojfGXYIlWggEmPXOkyCjYVJNUB9YwLzcRaVzdqkXYQnLXGr1a3ZvekWV
         oXYA39pMU+DuRsdjGRz9GCBEOHAYWHXAlJ+/wfktpFbejWmGQz3cfGrDwa28O5trkc/b
         LXUn5mkzTqBcbPPHke8D7mrbcR9bZHMTCCDsShNQuPZ1qMsxa7ALNGN/Mz39gMTVEG3Z
         L76dwDmBhO4VLQXKbz5buE7YUGIoWy1NqGwyUEY9JIEL+DLoMCapW+11aFJmAwVuJPso
         p/E5o2e+DA19lWeNAn8H2AI+DDyGSt8rvi5LgwnoZ+2BOyu5pgWOj39mnt6/OKq8gQmi
         y5Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4tKh7FyZX2RwCgxyhDE2zFW4ZYb9Rcpw88p4ZR/ogtA=;
        b=Bhj4zVZEC667R/yakLxdXliBHYxxlUvPV3ZiIrBqzLQkKY0Vj6tNjH3ewG+dEr8/6R
         74PR/38yUFxqOSGhN3+/apCLWtReCLFH1EcB3Ig21Qjji9pyKt3bX/k98fCetWy1DocJ
         TSfIRgn0gGE97ab7G4ffsTXTPIyarq9bSngCY1ZyZNx6p3hWgup9SwT1X7aMQnBSH2bx
         rxn7LLjbERPrPKdbNpl7F2DJp9wLrmFh8R3ilTL2w5oczV9Rw2aNg6cviVAI0Iruvx3n
         ZxH/nWwz0AI4lEXFva/CKcojv5uqU1a7dirOb+PN4mAXnJDdsHl1DPCDFLm9f9Q84Gr3
         iC5Q==
X-Gm-Message-State: APjAAAWfImcP9HhLJB3xU0LHXViAj6ps9Z7wikb0zooAcCO7Xhi64lLJ
        2UP1Lwq4aI/LvHqccvHOG02Pvx3Els4aXtc3J5E=
X-Google-Smtp-Source: APXvYqweQAN/S4ka/KAHzqQADPzchbiWg7CBjUX1i0uqmgKEFR57S4+k4u9CdanAsKE/vNERyQppnkEehi6NYnVWX7g=
X-Received: by 2002:a19:855:: with SMTP id 82mr5780727lfi.44.1571231044801;
 Wed, 16 Oct 2019 06:04:04 -0700 (PDT)
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
 <e41aa4d6-b84f-33ab-0738-e4f14d582172@gmail.com>
In-Reply-To: <e41aa4d6-b84f-33ab-0738-e4f14d582172@gmail.com>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Wed, 16 Oct 2019 10:04:02 -0300
Message-ID: <CAOMZO5BAsNzngLF2=1h38j0KYdvGLankQwzZ8tpG68sKSvaboQ@mail.gmail.com>
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

On Tue, Oct 15, 2019 at 10:18 PM Steve Longerbeam <slongerbeam@gmail.com> wrote:

> Here's a quick example that uses the end-of-frame method to measure fi's
> (all other FIM controls are left at the default values):
>
> v4l2-ctl -d0 --set-ctrl=fim_enable=1
> # disable input capture method
> v4l2-ctl -d0 --set-ctrl=fim_input_capture_edge=0
> v4l2-ctl -d0 --stream-mmap

What needs to be done for 'fim_enable' to be available?

I am using a mx6dl-sabreauto, and this is what I get:

# v4l2-ctl -d2 --set-ctrl=fim_enable=1
unknown control 'fim_enable'

Thanks
