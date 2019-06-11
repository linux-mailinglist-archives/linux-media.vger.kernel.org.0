Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 444F63C6CC
	for <lists+linux-media@lfdr.de>; Tue, 11 Jun 2019 10:59:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404321AbfFKI7y (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 11 Jun 2019 04:59:54 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:35797 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2403860AbfFKI7y (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 11 Jun 2019 04:59:54 -0400
Received: by mail-ed1-f67.google.com with SMTP id p26so14865871edr.2
        for <linux-media@vger.kernel.org>; Tue, 11 Jun 2019 01:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PASnnopO7T/n97vN91v+qyJWOS2KsO1RcpQqKw02sVo=;
        b=hKJ2KC6xZjCmH41h834KL9DBOKssuku0pkXd4y8LIUW+dgG8fzTRprMaW/jw8En3+E
         HubSnI4sKFaiMyrY/RWIo8CVwTCUAcz+BL7I2rOOBdmGaIKMAdSpdUuKCaAmQyfjWw+y
         XuE0Z3fbV6D3xsDJnfp9sCTE7bDzy+5JPjK1E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PASnnopO7T/n97vN91v+qyJWOS2KsO1RcpQqKw02sVo=;
        b=e0RWFPeUuORAkDEiLHA714EyYW1ezwWXu9Gsx045+Lon1wvDbeApHaOCqVRBG06Zkc
         JVWx1Zx8IeaQ8T3+WhOMrpsKi2si11JqDD5NjLQxTsD/yfMWcHsSCmJ4w5RavQxOY/qU
         vB2EfwyFQ0p2qB9p3OZ2UwnB6JPelyz4OdLdLNcTKhvVH5m8F98MxXYypM72cFGYfJEi
         jA6PeSju+z1YKht/i0ASP2r9M+Z7eyL2PckUMGfykiapIUDU2M8YmcsDcr/tzKNjew8j
         VrWvPw1E9HbeufFhFJcxKQ+q4B5pOjSM8ZRUTyJXwkdJXnzWrocSHTCnJ9Btm3QORZgO
         DVMg==
X-Gm-Message-State: APjAAAWsIXfJvHIRZ8J3G/TElUWx6jJY6Ipaw9ZqWyl/Vw1OjP6A3t/q
        4x8N2CEb0iYOPMqKFQvSPuLcR65iF3SDCQ==
X-Google-Smtp-Source: APXvYqz0mYuNvLqT4/ptsdlfsZUZnMaDpaWevcVMGhZv6eceBOdHgjqeDbuOHOJLrGB/xBRK9mueyQ==
X-Received: by 2002:a05:6402:1212:: with SMTP id c18mr17680373edw.7.1560243591589;
        Tue, 11 Jun 2019 01:59:51 -0700 (PDT)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com. [209.85.128.51])
        by smtp.gmail.com with ESMTPSA id k62sm3593706edc.70.2019.06.11.01.59.49
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Tue, 11 Jun 2019 01:59:49 -0700 (PDT)
Received: by mail-wm1-f51.google.com with SMTP id a15so1993821wmj.5
        for <linux-media@vger.kernel.org>; Tue, 11 Jun 2019 01:59:49 -0700 (PDT)
X-Received: by 2002:a1c:407:: with SMTP id 7mr17983312wme.113.1560243588440;
 Tue, 11 Jun 2019 01:59:48 -0700 (PDT)
MIME-Version: 1.0
References: <20190417104511.21514-1-frederic.chen@mediatek.com>
 <20190417104511.21514-7-frederic.chen@mediatek.com> <20190509094846.GA65444@google.com>
 <1558466055.15388.342.camel@mtksdccf07> <1560242886.23799.13.camel@mtksdccf07>
In-Reply-To: <1560242886.23799.13.camel@mtksdccf07>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Tue, 11 Jun 2019 17:59:36 +0900
X-Gmail-Original-Message-ID: <CAAFQd5CReiPOySyk-eFkgiQMDMoqB3Uhd=bcho2Qtsv74y8fmg@mail.gmail.com>
Message-ID: <CAAFQd5CReiPOySyk-eFkgiQMDMoqB3Uhd=bcho2Qtsv74y8fmg@mail.gmail.com>
Subject: Re: [RFC PATCH V1 6/6] platform: mtk-isp: Add Mediatek DIP driver
To:     Frederic Chen <frederic.chen@mediatek.com>
Cc:     Matthias Brugger <matthias.bgg@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        yuzhao@chromium.org, zwisler@chromium.org,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <linux-arm-kernel@lists.infradead.org>,
        =?UTF-8?B?U2VhbiBDaGVuZyAo6YSt5piH5byYKQ==?= 
        <Sean.Cheng@mediatek.com>, Sj Huang <sj.huang@mediatek.com>,
        =?UTF-8?B?Q2hyaXN0aWUgWXUgKOa4uOmbheaDoCk=?= 
        <christie.yu@mediatek.com>,
        =?UTF-8?B?SG9sbWVzIENoaW91ICjpgrHmjLop?= 
        <holmes.chiou@mediatek.com>,
        Jerry-ch Chen <Jerry-ch.Chen@mediatek.com>,
        =?UTF-8?B?SnVuZ28gTGluICjmnpfmmI7kv4op?= <jungo.lin@mediatek.com>,
        =?UTF-8?B?UnlubiBXdSAo5ZCz6IKy5oGpKQ==?= <Rynn.Wu@mediatek.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        devicetree@vger.kernel.org, Shik Chen <shik@chromium.org>,
        suleiman@chromium.org,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Hans Verkuil <hans.verkuil@cisco.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Jun 11, 2019 at 5:48 PM Frederic Chen
<frederic.chen@mediatek.com> wrote:
>
> Dear Tomasz,
>
> I'd like to elaborate more about the tuning_data.va.
> Would you like to give us some advice about our improvement proposal inline?
>
> Thank you very much.
>
>
> On Wed, 2019-05-22 at 03:14 +0800, Frederic Chen wrote:
> > Dear Tomasz,
> >
> > I appreciate your comment. It is very helpful for us.
> >
> >
> > > > diff --git a/drivers/media/platform/mtk-isp/isp_50/dip/mtk_dip-sys.c b/drivers/media/platform/mtk-isp/isp_50/dip/mtk_dip-sys.c
> > > > new file mode 100644
> > > > index 000000000000..54d2b5f5b802
> > > > --- /dev/null
> > > > +++ b/drivers/media/platform/mtk-isp/isp_50/dip/mtk_dip-sys.c
> > > > @@ -0,0 +1,1384 @@
>
> [snip]
>
> > > > +static void dip_submit_worker(struct work_struct *work)
> > > > +{
> > > > +       struct mtk_dip_hw_submit_work *dip_submit_work =
> > > > +               container_of(work, struct mtk_dip_hw_submit_work, frame_work);
> > > > +       struct mtk_dip_hw *dip_hw = dip_submit_work->dip_hw;
> > > > +       struct mtk_dip_dev *dip_dev = mtk_dip_hw_to_dev(dip_hw);
> > > > +       struct mtk_dip_hw_work *dip_work;
> > > > +       struct mtk_dip_hw_subframe *buf;
> > > > +       u32 len, num;
> > > > +       int ret;
> > > > +
> > > > +       num  = atomic_read(&dip_hw->num_composing);
> > > > +
> > > > +       mutex_lock(&dip_hw->dip_worklist.queuelock);
> > > > +       dip_work = list_first_entry(&dip_hw->dip_worklist.queue,
>
> [snip]
>
> > > > +
> > > > +       if (dip_work->frameparams.tuning_data.pa == 0) {
> > > > +               dev_dbg(&dip_dev->pdev->dev,
> > > > +                       "%s: frame_no(%d) has no tuning_data\n",
> > > > +                       __func__, dip_work->frameparams.frame_no);
> > > > +
> > > > +               memcpy(&dip_work->frameparams.tuning_data,
> > > > +                      &buf->tuning_buf, sizeof(buf->tuning_buf));
> > >
> > > Ditto.
> > >
> >
> > I got it.
> >
> > > > +               memset((char *)buf->tuning_buf.va, 0, DIP_TUNING_SZ);
> > >
> > > Ditto.
> >
> > I got it.
> >
> > >
> > > > +               /*
> > > > +                * When user enqueued without tuning buffer,
> > > > +                * it would use driver internal buffer.
> > > > +                * So, tuning_data.va should be 0
> > > > +                */
> > > > +               dip_work->frameparams.tuning_data.va = 0;
> > >
> > > I don't understand this. We just zeroed the buffer via this kernel VA few
> > > lines above, so why would it have to be set to 0?
> > >
> >
> > I will remove this unnecessary line.
> >
> > > > +       }
>
> After confirming the firmware part, I found that we use this field
> (tuning_data.va) to notify firmware if there is no tuning data from
> user.
>
> - frameparams.tuning_data.va is 0: use the default tuning data in
>                                    SCP, but we still need to pass
>                                    frameparams.tuning_data.pa because
>                                    the buffer contains some working
>                                    buffer required.
> - frameparams.tuning_data.va is not 0: the tuning data was passed from
>                                        the user
>
> Since we should not pass cpu addres to SCP, could I rename tuning_data.va
> as tuning_data.cookie, and write a constant value to indicate if SCP
> should use its internal default setting or not here?
>
> For example,
> /* SCP uses tuning data passed from userspace*/
> dip_work->frameparams.tuning_data.cookie = MTK_DIP_USER_TUNING_DATA;
>
> /* SCP uses internal tuning data */
> dip_work->frameparams.tuning_data.cookie = MTK_DIP_DEFAULT_TUNING_DATA;

Perhaps we could just call it "present" and set to true or false?

Best regards,
Tomasz
