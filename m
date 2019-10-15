Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 35779D7BBD
	for <lists+linux-media@lfdr.de>; Tue, 15 Oct 2019 18:33:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388156AbfJOQdj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Oct 2019 12:33:39 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:43267 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388171AbfJOQdj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Oct 2019 12:33:39 -0400
Received: by mail-wr1-f68.google.com with SMTP id j18so24654488wrq.10
        for <linux-media@vger.kernel.org>; Tue, 15 Oct 2019 09:33:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gateworks-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MHaZiSvZLup9NRmpNItEwy1DEMyS+2opDRq9pk4ysag=;
        b=V8DbuloW/J+uyLolnzYhq3Z14bVxpcWLYPOChtei8ho77RZ/pXPaYKyu8gcEThssPI
         IpKsQhZVeGH5l25/DXH7bOjNILh/8QuxAJ0D9ydDe2DQgLBcA6CrHyIB2w1kcWgyeCHt
         iK71auoO4ljr0oSq9jBSJhIknVn3R4DqiMxWHijdNQMqlGyAi4Kx7B/E7EZx8EplQtIj
         mWfhCtPjcWoPP1dCZ8QsvpkSB3mm6yqh//8Z+PPT5nPg3eBiO5NvUMDs5+KZX2ddfM4b
         9Z9/y86dDwNI+VCqWMGT/eQA2UjUAbXBkzvXgZ4RUl0Y3xd9B5+sZTkef029OJg8du/Q
         UbhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MHaZiSvZLup9NRmpNItEwy1DEMyS+2opDRq9pk4ysag=;
        b=NNgGcg3FNdaxm5pDJyrDXexExQ6F3YOtcWXSGsfO9bMN+15+LLPocxp9+DtoygUTMp
         NFnQJU0i6vgFJVxv5i/DyiGeIORo/8QHosDojcsrW60jGARh33YN7jQeNRNCWVJCOj3P
         v/8akxm94bwsUpMfOzkUX0+fAvBIhZXbIOOxQf2YMMWk+Ew+7oUov/Lify+WzUIPk4d/
         RYcy8SzTbT0Phrn4wCCB1jqUc1bYCB3tlegIFrdjxKSfQhhcGhwdiF0SwZ2LtSIKOhKv
         zRAf89cFu2EoOJDygyUwIPoCu12u/PsMLYrI3mEaphJ2Z02SSdV9VMxVwzvPCIb8Xk1C
         ZDPg==
X-Gm-Message-State: APjAAAVDiNAQpRt9djzbhlcbC89G4p7bvXTCuJ7XbfqFF/64Jf3H52EI
        N8BFTa+w/HKU9EafzhiEzcfylvnertx+YB1+oWfQow==
X-Google-Smtp-Source: APXvYqwot+GwKU3410avQkcWkbsjTaE7LsCmrw4amaCtWjJjAw9qXOjjKE5zYVmqkIfSG+YulaQ39rVtMgWIX51ZJeE=
X-Received: by 2002:adf:94e2:: with SMTP id 89mr771692wrr.259.1571157216558;
 Tue, 15 Oct 2019 09:33:36 -0700 (PDT)
MIME-Version: 1.0
References: <20191010154417.9437-1-festevam@gmail.com> <0f7a7910-8652-7a95-1f04-e25278ec05aa@gmail.com>
 <593b540b-d5f9-63ba-becc-0902dc5d7900@gmail.com> <CAOMZO5BgnbfFSmu7HEWtaT9Gexb-u13ZxzWEN-+Hw9eMfuC+LQ@mail.gmail.com>
 <CAJ+vNU2fJ_eGMwQH7-HmO_==5p3Uuscv6S2fG_NY67J2o8OG+g@mail.gmail.com>
 <CAOMZO5ABOV+Z7FenZykU82w-yUvae6zm6d6inN8SYrhViudYnA@mail.gmail.com>
 <CAJ+vNU22JmDQ+tyRFSQgM_wp-pgfE7gOt2i3QbdOJp0KuDXfRQ@mail.gmail.com> <CAOMZO5Dcv9fz=A8nTsvVsvu7+LNag2Sj03tJyFQKgpt_1B6Dwg@mail.gmail.com>
In-Reply-To: <CAOMZO5Dcv9fz=A8nTsvVsvu7+LNag2Sj03tJyFQKgpt_1B6Dwg@mail.gmail.com>
From:   Tim Harvey <tharvey@gateworks.com>
Date:   Tue, 15 Oct 2019 09:33:25 -0700
Message-ID: <CAJ+vNU1+oS1wFav4W2g0f6XGCP3oqEwzxyvrN3fkggNSBau0Tg@mail.gmail.com>
Subject: Re: [PATCH] media: imx.rst: Update the imx6-sabreauto ADV7180 instructions
To:     Fabio Estevam <festevam@gmail.com>
Cc:     Steve Longerbeam <slongerbeam@gmail.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Oct 15, 2019 at 9:16 AM Fabio Estevam <festevam@gmail.com> wrote:
>
> Hi Tim,
>
> On Tue, Oct 15, 2019 at 1:07 PM Tim Harvey <tharvey@gateworks.com> wrote:
> >
> > Right, I understand there is something else going on with the i.MX53
> > but what about the i.MX6 testing related to these patches?
>
> I tested it on a imx6 sabreauto board with 5.3.x kernel plus Steve's
> patch that discard the 10 initial corrupted frames and I do not get
> rolling video.
>
> I do get rolling video if I remove/insert the cable though.

Right, because this re-creates the initial issue. Upon any signal lock
you would need to throw away the first few frames. I wish I knew the
proper way to deal with this.

Tim

>
> > Regarding the i.MX53 as you have a kernel that does work you could
> > start looking for i2c register differences and csi config differences
> > between the two kernels. I discovered an issue with the adv7280 by
> > comparing i2c register dumps.
>
> Yes, I am in the process of comparing the two kernels.
>
> Thanks
