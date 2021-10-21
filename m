Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D34E435CD6
	for <lists+linux-media@lfdr.de>; Thu, 21 Oct 2021 10:24:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231280AbhJUI1I (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Oct 2021 04:27:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231153AbhJUI1I (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Oct 2021 04:27:08 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 830CDC06161C
        for <linux-media@vger.kernel.org>; Thu, 21 Oct 2021 01:24:52 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id ec8so1226611edb.6
        for <linux-media@vger.kernel.org>; Thu, 21 Oct 2021 01:24:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uqsufeSAEfev4HZcSC6KlNe5oQzmLuc1VZ1/OR4w3ms=;
        b=IFv3bYYe+dMausA127MXyRbvkX5IGGO1XXB9WZBInD3iqHqcjsV5vIzazFTAun+f5D
         MWHX997r6LKpIbrihJO7KsgMvf7lCf12njEWxAC2KG/xkfNCYu2QI1llZ3r8yq7GLVQE
         ZhjxwInFnyN8f8RawNl9MCrfFsPm3XOeXoI24=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uqsufeSAEfev4HZcSC6KlNe5oQzmLuc1VZ1/OR4w3ms=;
        b=4m/97wGqcnciACPz/2CgsWl1NRy1xAHemeUJ31/WvH1/0QvqMVi78chBBYVlCMsDO9
         s8tPAqt+ydf95nAdIvcAurwBCro7f5PlNLFdablgViHC7axUIVCKWMzdb5T/bbjwzDFo
         Ick9yiKmZsMjw9oJzJce2hj2JM/YurJlDj260OtMXsD2lLkzisK8C7vYlP6CCEMwnrx/
         4HUlZ1OLq3Sg1rGyJrhuprVzmZc3dRxGZs7o3EvbeAKvE006I3bn96q5PpGCUfY/B20u
         htQ1tvgo4upkyLayrGWPLDk3k84tgwEkpLu/Ksmp+AYmYYghygTF9r3odJIWuzhY+JGH
         DAxg==
X-Gm-Message-State: AOAM531MdvYloZ3o02aYrc/4o41F/PC4XoJO5bR/Q1S7qv4+9L9tt9/0
        wbnOMyADxsups87pQvIxVj++J1T5pHPZpQUF
X-Google-Smtp-Source: ABdhPJzE2ETQ2KDumPXMUIEepoFNMJI8THrSUKWDug5a2Fm6iYdUfROuyyeZOxGaymMcQh/+cozq9Q==
X-Received: by 2002:a17:906:7632:: with SMTP id c18mr5917105ejn.317.1634804690811;
        Thu, 21 Oct 2021 01:24:50 -0700 (PDT)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com. [209.85.221.48])
        by smtp.gmail.com with ESMTPSA id y6sm2181320ejf.58.2021.10.21.01.24.50
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Oct 2021 01:24:50 -0700 (PDT)
Received: by mail-wr1-f48.google.com with SMTP id r18so260025wrg.6
        for <linux-media@vger.kernel.org>; Thu, 21 Oct 2021 01:24:50 -0700 (PDT)
X-Received: by 2002:a5d:4dd1:: with SMTP id f17mr5503238wru.226.1634804689623;
 Thu, 21 Oct 2021 01:24:49 -0700 (PDT)
MIME-Version: 1.0
References: <1632370218-5508-1-git-send-email-bingbu.cao@intel.com>
 <CAAFQd5BdXTYZDAQcyLVurqdjuT6fHdGpzQQ0c1NJ5y=81v7hcg@mail.gmail.com>
 <0309ef19-8411-ae6c-3304-0e180420baa5@linux.intel.com> <YWo+vtVy5dR4tmQD@pendragon.ideasonboard.com>
In-Reply-To: <YWo+vtVy5dR4tmQD@pendragon.ideasonboard.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Thu, 21 Oct 2021 17:24:38 +0900
X-Gmail-Original-Message-ID: <CAAFQd5DFUCeDK6SqO=dkMhX1PjG3MDdu0HHu1V=m0RbaPz-=EA@mail.gmail.com>
Message-ID: <CAAFQd5DFUCeDK6SqO=dkMhX1PjG3MDdu0HHu1V=m0RbaPz-=EA@mail.gmail.com>
Subject: Re: [PATCH] media: ipu3-cio2: Update high watermark to support higher
 data rate camera sensors
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Bingbu Cao <bingbu.cao@linux.intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>, linux-media@vger.kernel.org,
        sakari.ailus@linux.intel.com, tian.shu.qiu@intel.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, Oct 16, 2021 at 11:54 AM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Bingbu,
>
> On Thu, Oct 14, 2021 at 02:49:19PM +0800, Bingbu Cao wrote:
> > On 10/6/21 1:03 PM, Tomasz Figa wrote:
> > > On Thu, Sep 23, 2021 at 1:11 PM Bingbu Cao wrote:
> > >>
> > >> CIO2 worked well with most camera sensors so far, but CIO2 will meet SRAM
> > >> overflow when working with higher data rate camera sensors such as 13M@30fps.
> > >> We must set lower high watermark value to trigger the DRAM write to support
> > >> such camera sensors.
> > >>
> > >> Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
> > >> ---
> > >>  drivers/media/pci/intel/ipu3/ipu3-cio2.h | 2 +-
> > >>  1 file changed, 1 insertion(+), 1 deletion(-)
> > >>
> > >
> > > Thanks for the patch. Would this have any implications for other
> > > (lower) operating modes, such as increased power consumption, or it's
> > > harmless? If so, what's the reason we didn't use the value from the
> > > very beginning?
> >
> > Yes, we meet that the frame data corruption for some high data rate camera sensors like
> > imx258 (13M@30fps) with current watermark settings. The higher watermark potentially has
> > power concern as it  request DMA transfer more than before.
> >
> > To keep the old settings for low data rate camera sensor, I am thinking the rationality
> > to determine the HWM value based on the link_frequency? Apparently, it is not reliable
> > to determine by the format.
>
> It depends on the SRAM buffer size, on the image width, the horizontal
> blanking, and the link frequency. If you can store a full line of data,
> you'll have time during horizontal blanking to finish the DMA transfer,
> so you can trigger it later. I don't know how the hardware works exactly
> so I can't provide an exact formula (and I suppose you'll need to
> reserve some margin to account for other traffic to the DRAM).
>

Yes, it would be good to have a formula. It doesn't have to be exact
if it would make it overly complex, just care should be taken so that
it doesn't undershoot, as it would cause overflows.

> > >> diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2.h b/drivers/media/pci/intel/ipu3/ipu3-cio2.h
> > >> index 3806d7f04d69..fde80d48533b 100644
> > >> --- a/drivers/media/pci/intel/ipu3/ipu3-cio2.h
> > >> +++ b/drivers/media/pci/intel/ipu3/ipu3-cio2.h
> > >> @@ -181,7 +181,7 @@ struct pci_dev;
> > >>  #define CIO2_PBM_WMCTRL1_MID1_2CK      (16 << CIO2_PBM_WMCTRL1_MID1_2CK_SHIFT)
> > >>  #define CIO2_PBM_WMCTRL1_MID2_2CK      (21 << CIO2_PBM_WMCTRL1_MID2_2CK_SHIFT)
> > >>  #define CIO2_REG_PBM_WMCTRL2                           0x1468
> > >> -#define CIO2_PBM_WMCTRL2_HWM_2CK                       40U
> > >> +#define CIO2_PBM_WMCTRL2_HWM_2CK                       30U
> > >>  #define CIO2_PBM_WMCTRL2_HWM_2CK_SHIFT                 0U
> > >>  #define CIO2_PBM_WMCTRL2_LWM_2CK                       22U
> > >>  #define CIO2_PBM_WMCTRL2_LWM_2CK_SHIFT                 8U
>
> --
> Regards,
>
> Laurent Pinchart
