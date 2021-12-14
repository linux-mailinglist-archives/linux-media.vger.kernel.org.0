Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B013747404D
	for <lists+linux-media@lfdr.de>; Tue, 14 Dec 2021 11:21:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232977AbhLNKVI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Dec 2021 05:21:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232979AbhLNKVH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Dec 2021 05:21:07 -0500
Received: from mail-vk1-xa29.google.com (mail-vk1-xa29.google.com [IPv6:2607:f8b0:4864:20::a29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F83BC061574
        for <linux-media@vger.kernel.org>; Tue, 14 Dec 2021 02:21:07 -0800 (PST)
Received: by mail-vk1-xa29.google.com with SMTP id 84so12140836vkc.6
        for <linux-media@vger.kernel.org>; Tue, 14 Dec 2021 02:21:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Y8Fa8Kszo3XIjbu8l4Yejv1uFgZJe7E3nSQeyvq6bbo=;
        b=py1sUqVwM/zL1uOqW3ziX5MlFaF3wX/LlJtZAsVED87EbZZyaR64ZcwuZYOtL9AtFl
         FD4BwC5lejvgg1ipZnhfWvxVDudxpjvVo8DrUoWoRAC0hXMbnHW64awwlGact2kBJsaQ
         Ox8c3ZjNnXRiFEJiTaywNqyUo1i76zEcIRn+g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Y8Fa8Kszo3XIjbu8l4Yejv1uFgZJe7E3nSQeyvq6bbo=;
        b=iF3OdDeezLQ+l4TUdxkEC/ou5AlMx3gZ/tKNwpyTFSXCGGazFRDZMtTCa3WKA+FW6Q
         qtjTIC7sHN2lb593I/RJocCNr6GZQsXN/yBICaHGi3lIZLERPhxGwPpXpnNMkkuzlnUv
         s9EWg7Sksnt3SOYw0wLwDSuyhFR/huJ6HjwcaOqaW/2QNDu4AxrmpX1i94rme19DY0ME
         zVZgFt8CdlHAalTehSstmxdhveJBZmxyK0d3sz0SPbJwb3i7P3bpLQHP+D/ygAjWFamg
         uGfTxGHc37vjUl5iSJUtmipGwJiXc7flbQJmoZWc2Mrn+hJ9WBR3PPCBx52WOIhNKnah
         UEXQ==
X-Gm-Message-State: AOAM530gxxXjYybx8hdI0wahomBmonIahjM5DDRftaovtwAE2vKKUltq
        tdd5TIvk8yirHC4SFE4qx1ePNfHCCaQxYa+okja51Q==
X-Google-Smtp-Source: ABdhPJztx268YvgATu/AlJUf2NurU4d2rYV2fPqGq1H/pVe9eAFZMQbAxLg7sQXz7OUEhJJKrHMM/DGcQx5SZvP0444=
X-Received: by 2002:a1f:5f94:: with SMTP id t142mr4620765vkb.34.1639477266564;
 Tue, 14 Dec 2021 02:21:06 -0800 (PST)
MIME-Version: 1.0
References: <20211201175613.13710-1-dafna.hirschfeld@collabora.com>
 <20211201175613.13710-2-dafna.hirschfeld@collabora.com> <CAFr9PX=6Pd1Rg=wJvpuX6WX63L=iAnwPA24e59An3Kac5f_vzA@mail.gmail.com>
 <cdd9b485-364f-c6bd-776f-a0ca2d260762@collabora.com> <e9905774-a994-6311-7b53-b40588d4f6ec@collabora.com>
In-Reply-To: <e9905774-a994-6311-7b53-b40588d4f6ec@collabora.com>
From:   Daniel Palmer <daniel@0x0f.com>
Date:   Tue, 14 Dec 2021 19:20:55 +0900
Message-ID: <CAFr9PXnnGc1TUQBeW8JW9qGewhU99gmRbvzZEsZaDmr12jMg0A@mail.gmail.com>
Subject: Re: [PATCH v4 1/6] staging: media: wave5: Add vpuapi layer
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc:     "open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)" 
        <linux-media@vger.kernel.org>,
        Robert Beckett <bob.beckett@collabora.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>,
        open list <linux-kernel@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        hverkuil@xs4all.nl, kernel@collabora.com, dafna3@gmail.com,
        kiril.bicevski@collabora.com,
        Nas Chung <nas.chung@chipsnmedia.com>,
        lafley.kim@chipsnmedia.com, scott.woo@chipsnmedia.com,
        olivier.crete@collabora.com, dan.carpenter@oracle.com,
        Randy Dunlap <rdunlap@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dafna,

On Tue, 14 Dec 2021 at 16:48, Dafna Hirschfeld
<dafna.hirschfeld@collabora.com> wrote:
> >>> +static int wave5_wait_bus_busy(struct vpu_device *vpu_dev, int timeout, unsigned int addr)
> >>> +{
> >>> +       u32 gdi_status_check_value = 0x3f;
> >>> +       u32 data;
> >>> +
> >>> +       if (vpu_dev->product_code == WAVE521C_CODE ||
> >>> +           vpu_dev->product_code == WAVE521_CODE ||
> >>> +        vpu_dev->product_code == WAVE521E1_CODE)
> >>> +               gdi_status_check_value = 0x00ff1f3f;
> >>> +
> >>> +       return read_poll_timeout(wave5_vdi_read_register, data, data == gdi_status_check_value,
> >>> +                                0, timeout * 1000, false, vpu_dev, addr);
> >>> +}
> >>> +
> >>
> >> This looks like it should be s/wave5_vdi_read_register/wave5_read_register/.
> >> For wave511 addr passed in here is 0x8e14 so well outside of what is
> >> directly accessible.
> >
> > Hi, I didn't understand this explanation. I see that
> > wave5_read_register eventually calls 'wave5_vdi_read_register'.
> > Could you please explain in more detail why you think
> > calling wave5_vdi_read_register is wrong?

Mainly because the address accessed 0x8e14 but on my machine the
directly accessible registers end at 0x800.

> hi, I see know that those backbone address are indeed not read and written directly but
> the address should be first written to a regsiter W5_VPU_FIO_CTRL_ADDR,
> and then the content is returned from W5_VPU_FIO_DATA.

I think so. But as I can't get this driver to fully work yet I can
only say I think so.

Cheers,

Daniel
