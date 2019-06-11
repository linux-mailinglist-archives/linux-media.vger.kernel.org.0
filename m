Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 635A13C850
	for <lists+linux-media@lfdr.de>; Tue, 11 Jun 2019 12:13:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405239AbfFKKNW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 11 Jun 2019 06:13:22 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:42660 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404766AbfFKKNW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 11 Jun 2019 06:13:22 -0400
Received: by mail-ed1-f65.google.com with SMTP id z25so19224513edq.9
        for <linux-media@vger.kernel.org>; Tue, 11 Jun 2019 03:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=X0C5tQts1L+LXt2Q6k9c6ouRJcr990w6/a3NoyIORNQ=;
        b=hMSEhr1Ibx3hCZ1fwXTjoT0WNF47kP/wJklo2hoCJz1xUYosHQcyhZduBi4ldMd4u5
         E1DFtj7cgLW/CRLILv3exZPt3kEXlkD3pLqVUz+QF2sMXilMvWtC3DtptVfHdjGIuxi2
         y8sVqaA5Phb46+tnfHdR/Z1k05JiQ36ou7x8Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=X0C5tQts1L+LXt2Q6k9c6ouRJcr990w6/a3NoyIORNQ=;
        b=IQhlE8EHJxhCb/oZx0E1wpTOoyOPAVvrBvqZzpXjvNyjueRUjKh45r8m5ChIjK7F+Y
         53xcH5yV4cKphcccyL6d392Faa94qk5dO4C6DFDx3FCNQQ0g1CCn2+HB9oQdThQ+0AbX
         fsgU0Yn0InIDex1R5M/5WhrewuAS6wBNnMTLGwIU2rxp6ODQJAP2aATrA34nr8F0+olu
         8aF5OBRHSolZhMYGAAgCIeynn2vBdpLWBXpwqlv6HRB5pKCOOMQlhx1XHIwrlN8kMziH
         N0arYTQngo0kJM1P8zY99dzNzjzJWMtjl395AOMhjYpLNtMWfCWOAn7glNaRFojvqkJm
         696Q==
X-Gm-Message-State: APjAAAUwurzfxOzjcRDUu+JzQhEluedjBz9Sv4IJ7Gbb9thwuGfDEG0/
        cNwCDwWWGjzZa4e4FPVGr7Xqhl9NFIH4/A==
X-Google-Smtp-Source: APXvYqy6hN8dvtX4RzoD7zNF2antj7n9vNhEHKekFb4NnYGhiN/qnXHmsFl4MB9+6KyNIKpzKPq1kA==
X-Received: by 2002:a17:906:2ecf:: with SMTP id s15mr37857557eji.176.1560247999409;
        Tue, 11 Jun 2019 03:13:19 -0700 (PDT)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com. [209.85.221.47])
        by smtp.gmail.com with ESMTPSA id o93sm353694edd.46.2019.06.11.03.13.18
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Tue, 11 Jun 2019 03:13:18 -0700 (PDT)
Received: by mail-wr1-f47.google.com with SMTP id n4so12290909wrw.13
        for <linux-media@vger.kernel.org>; Tue, 11 Jun 2019 03:13:18 -0700 (PDT)
X-Received: by 2002:a5d:514d:: with SMTP id u13mr32683805wrt.77.1560247997738;
 Tue, 11 Jun 2019 03:13:17 -0700 (PDT)
MIME-Version: 1.0
References: <20190417104511.21514-1-frederic.chen@mediatek.com>
 <20190417104511.21514-7-frederic.chen@mediatek.com> <20190509094846.GA65444@google.com>
 <1558466055.15388.342.camel@mtksdccf07> <1560242886.23799.13.camel@mtksdccf07>
 <CAAFQd5CReiPOySyk-eFkgiQMDMoqB3Uhd=bcho2Qtsv74y8fmg@mail.gmail.com> <1560247648.23799.16.camel@mtksdccf07>
In-Reply-To: <1560247648.23799.16.camel@mtksdccf07>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Tue, 11 Jun 2019 19:13:06 +0900
X-Gmail-Original-Message-ID: <CAAFQd5Ai2JmwY+_inA-WkE1rKhTOyvJeLM8XG3E6BsYCrp4pnw@mail.gmail.com>
Message-ID: <CAAFQd5Ai2JmwY+_inA-WkE1rKhTOyvJeLM8XG3E6BsYCrp4pnw@mail.gmail.com>
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

On Tue, Jun 11, 2019 at 7:07 PM Frederic Chen
<frederic.chen@mediatek.com> wrote:
>
> Hi Tomasz,
>
>
> On Tue, 2019-06-11 at 17:59 +0900, Tomasz Figa wrote:
> > On Tue, Jun 11, 2019 at 5:48 PM Frederic Chen
> > <frederic.chen@mediatek.com> wrote:
> > >
> > > Dear Tomasz,
> > >
> > > I'd like to elaborate more about the tuning_data.va.
> > > Would you like to give us some advice about our improvement proposal inline?
> > >
> > > Thank you very much.
> > >
> > >
> > > On Wed, 2019-05-22 at 03:14 +0800, Frederic Chen wrote:
> > > > Dear Tomasz,
> > > >
> > > > I appreciate your comment. It is very helpful for us.
> > > >
> > > >
> > > > > > diff --git a/drivers/media/platform/mtk-isp/isp_50/dip/mtk_dip-sys.c b/drivers/media/platform/mtk-isp/isp_50/dip/mtk_dip-sys.c
> > > > > > new file mode 100644
> > > > > > index 000000000000..54d2b5f5b802
> > > > > > --- /dev/null
> > > > > > +++ b/drivers/media/platform/mtk-isp/isp_50/dip/mtk_dip-sys.c
> > > > > > @@ -0,0 +1,1384 @@
> > >
> > > [snip]
> > >
> > > > > > +static void dip_submit_worker(struct work_struct *work)
> > > > > > +{
> > > > > > +       struct mtk_dip_hw_submit_work *dip_submit_work =
> > > > > > +               container_of(work, struct mtk_dip_hw_submit_work, frame_work);
> > > > > > +       struct mtk_dip_hw *dip_hw = dip_submit_work->dip_hw;
> > > > > > +       struct mtk_dip_dev *dip_dev = mtk_dip_hw_to_dev(dip_hw);
> > > > > > +       struct mtk_dip_hw_work *dip_work;
> > > > > > +       struct mtk_dip_hw_subframe *buf;
> > > > > > +       u32 len, num;
> > > > > > +       int ret;
> > > > > > +
> > > > > > +       num  = atomic_read(&dip_hw->num_composing);
> > > > > > +
> > > > > > +       mutex_lock(&dip_hw->dip_worklist.queuelock);
> > > > > > +       dip_work = list_first_entry(&dip_hw->dip_worklist.queue,
> > >
> > > [snip]
> > >
> > > > > > +
> > > > > > +       if (dip_work->frameparams.tuning_data.pa == 0) {
> > > > > > +               dev_dbg(&dip_dev->pdev->dev,
> > > > > > +                       "%s: frame_no(%d) has no tuning_data\n",
> > > > > > +                       __func__, dip_work->frameparams.frame_no);
> > > > > > +
> > > > > > +               memcpy(&dip_work->frameparams.tuning_data,
> > > > > > +                      &buf->tuning_buf, sizeof(buf->tuning_buf));
> > > > >
> > > > > Ditto.
> > > > >
> > > >
> > > > I got it.
> > > >
> > > > > > +               memset((char *)buf->tuning_buf.va, 0, DIP_TUNING_SZ);
> > > > >
> > > > > Ditto.
> > > >
> > > > I got it.
> > > >
> > > > >
> > > > > > +               /*
> > > > > > +                * When user enqueued without tuning buffer,
> > > > > > +                * it would use driver internal buffer.
> > > > > > +                * So, tuning_data.va should be 0
> > > > > > +                */
> > > > > > +               dip_work->frameparams.tuning_data.va = 0;
> > > > >
> > > > > I don't understand this. We just zeroed the buffer via this kernel VA few
> > > > > lines above, so why would it have to be set to 0?
> > > > >
> > > >
> > > > I will remove this unnecessary line.
> > > >
> > > > > > +       }
> > >
> > > After confirming the firmware part, I found that we use this field
> > > (tuning_data.va) to notify firmware if there is no tuning data from
> > > user.
> > >
> > > - frameparams.tuning_data.va is 0: use the default tuning data in
> > >                                    SCP, but we still need to pass
> > >                                    frameparams.tuning_data.pa because
> > >                                    the buffer contains some working
> > >                                    buffer required.
> > > - frameparams.tuning_data.va is not 0: the tuning data was passed from
> > >                                        the user
> > >
> > > Since we should not pass cpu addres to SCP, could I rename tuning_data.va
> > > as tuning_data.cookie, and write a constant value to indicate if SCP
> > > should use its internal default setting or not here?
> > >
> > > For example,
> > > /* SCP uses tuning data passed from userspace*/
> > > dip_work->frameparams.tuning_data.cookie = MTK_DIP_USER_TUNING_DATA;
> > >
> > > /* SCP uses internal tuning data */
> > > dip_work->frameparams.tuning_data.cookie = MTK_DIP_DEFAULT_TUNING_DATA;
> >
> > Perhaps we could just call it "present" and set to true or false?
> >
>
> Yes. I would like to use "present" here.
>
> Original:
>   struct img_addr {
>       u64 va; /* Used by Linux OS access */
>       u32 pa; /* Used by CM4 access */
>       u32 iova; /* Used by IOMMU HW access */
>   } __attribute__ ((__packed__));
>
>   struct img_ipi_frameparam {
>       u32 index;
>       u32 frame_no;
>       u64 timestamp;
>       u8 type;  /* enum mdp_stream_type */
>       u8 state;
>       u8 num_inputs;
>       u8 num_outputs;
>       u64 drv_data;
>       struct img_input inputs[IMG_MAX_HW_INPUTS];
>       struct img_output outputs[IMG_MAX_HW_OUTPUTS];
>       struct img_addr tuning_data;
>       struct img_addr subfrm_data;
>       struct img_sw_addr config_data;
>       struct img_sw_addr self_data;
>   } __attribute__ ((__packed__));
>
>
> Modified:
>   struct tuning_buf {
>       u8 present;

I'd make this u32 to keep the other fields aligned.

>       u32 pa;   /* Used by CM4 access */
>       u32 iova; /* Used by IOMMU HW access */
>   } __attribute__ ((__packed__));

Best regards,
Tomasz
