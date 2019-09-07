Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ACD00AC442
	for <lists+linux-media@lfdr.de>; Sat,  7 Sep 2019 05:51:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389580AbfIGDvl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Sep 2019 23:51:41 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:40974 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733303AbfIGDvl (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 6 Sep 2019 23:51:41 -0400
Received: by mail-ed1-f67.google.com with SMTP id z9so8363117edq.8
        for <linux-media@vger.kernel.org>; Fri, 06 Sep 2019 20:51:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Z8g/yuEAbsV3RHz2NFoSIRvhRhOGryUeAZNMBK0KH30=;
        b=a+4E7MF06twSs/byvYx7TYHU2ZXGvTdd/OretEjRgUWdyZOpoUAB4C/xMHxHRG1sxr
         IothwulEFXzhDLIrDy6sZJcxPDDPL3B4Oc1/8ym/YU4fmlo/qep0VnTLwg8apEOcikaw
         CUwEUXBXVrl6aIAN1UqMhm3tqqogBokpZg6j4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Z8g/yuEAbsV3RHz2NFoSIRvhRhOGryUeAZNMBK0KH30=;
        b=tIMQtCMNxWAJ+467kXShjaiMEGylsQCSX/4UosBNxEglLR+sYz58Zu8xLZOZVLfPT8
         Wda91IVYXVQGUfUK+NuTAz+4dXEKE/tNx4BpEM41Tsk8XcdxGlzmwulpAVlp+NzyA1L3
         j8W/5p6asE3hNjO796TZMPp4Ys/nW/ubEG2JftiEuDL3mfP4iZoFQkzxQchJ+NQLf+TC
         d/KEGYZGIx+FapphSBp13SSUJ3B39cYaNB6IZKYm3DMJIAfKTm21c4VOoXaoR+mdYLkh
         KsbyTy5Fn2MdKB5zB94uJus10fa0791ARabmM7uJCqAsc4DVxiwUx7f5g0hPWrgQ5+sk
         VYQw==
X-Gm-Message-State: APjAAAXjR76ezdX2Tbfj3NxmmPK2V6KKX20etJv0ct6ZXyBaX5mXkey9
        1cDhE6byhyc3vIMMzCzUALwYwIaqEw9GbA==
X-Google-Smtp-Source: APXvYqxr16g8RzvR/uKLMbo/Ct6tu6qRFRWNAViELHautDV2+gXGJHRgxUzj3KDllhhVzbtzJUloYg==
X-Received: by 2002:a17:906:4e12:: with SMTP id z18mr10410689eju.187.1567828299105;
        Fri, 06 Sep 2019 20:51:39 -0700 (PDT)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com. [209.85.128.49])
        by smtp.gmail.com with ESMTPSA id g11sm1349526edu.4.2019.09.06.20.51.37
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Sep 2019 20:51:37 -0700 (PDT)
Received: by mail-wm1-f49.google.com with SMTP id g207so8327516wmg.5
        for <linux-media@vger.kernel.org>; Fri, 06 Sep 2019 20:51:37 -0700 (PDT)
X-Received: by 2002:a1c:c104:: with SMTP id r4mr4712727wmf.64.1567828296905;
 Fri, 06 Sep 2019 20:51:36 -0700 (PDT)
MIME-Version: 1.0
References: <20190819034331.13098-1-dongchun.zhu@mediatek.com>
 <20190819034331.13098-3-dongchun.zhu@mediatek.com> <20190819083009.GC6133@paasikivi.fi.intel.com>
 <1567676465.21623.100.camel@mhfsdcap03> <20190905104546.GA5475@paasikivi.fi.intel.com>
 <CAAFQd5Bh-11D9RR9WVH5A3DbXZoxWhbMhXSNKUV25mempMi+ag@mail.gmail.com>
 <20190905160512.GG5475@paasikivi.fi.intel.com> <CANMq1KDVMGkeBvu1nO5WHopWwec9mxHfhmLmX2BzvaYVLzxoXw@mail.gmail.com>
 <1567733585.21623.163.camel@mhfsdcap03>
In-Reply-To: <1567733585.21623.163.camel@mhfsdcap03>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Sat, 7 Sep 2019 12:51:23 +0900
X-Gmail-Original-Message-ID: <CAAFQd5AjF491heU7BJTnsB-OsZp2LnYeAFArnEqWcNRPXykKrQ@mail.gmail.com>
Message-ID: <CAAFQd5AjF491heU7BJTnsB-OsZp2LnYeAFArnEqWcNRPXykKrQ@mail.gmail.com>
Subject: Re: [V3, 2/2] media: i2c: Add Omnivision OV02A10 camera sensor driver
To:     Dongchun Zhu <dongchun.zhu@mediatek.com>
Cc:     Nicolas Boichat <drinkcat@chromium.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Cao Bing Bu <bingbu.cao@intel.com>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <linux-arm-kernel@lists.infradead.org>,
        Sj Huang <sj.huang@mediatek.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        devicetree@vger.kernel.org, Louis Kuo <louis.kuo@mediatek.com>,
        shengnan.wang@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Sep 6, 2019 at 10:33 AM Dongchun Zhu <dongchun.zhu@mediatek.com> wrote:
>
> On Fri, 2019-09-06 at 06:58 +0800, Nicolas Boichat wrote:
> > On Fri, Sep 6, 2019 at 12:05 AM Sakari Ailus
> > <sakari.ailus@linux.intel.com> wrote:
> > >
> > > On Thu, Sep 05, 2019 at 07:53:37PM +0900, Tomasz Figa wrote:
> > > > On Thu, Sep 5, 2019 at 7:45 PM Sakari Ailus
> > > > <sakari.ailus@linux.intel.com> wrote:
> > > > >
> > > > > Hi Dongchun,
> > > > >
> > > > > On Thu, Sep 05, 2019 at 05:41:05PM +0800, Dongchun Zhu wrote:
> > > > >
> > > > > ...
> > > > >
> > > > > > > > + ret = regulator_bulk_enable(OV02A10_NUM_SUPPLIES, ov02a10->supplies);
> > > > > > > > + if (ret < 0) {
> > > > > > > > +         dev_err(dev, "Failed to enable regulators\n");
> > > > > > > > +         goto disable_clk;
> > > > > > > > + }
> > > > > > > > + msleep_range(7);
> > > > > > >
> > > > > > > This has some potential of clashing with more generic functions in the
> > > > > > > future. Please use usleep_range directly, or msleep.
> > > > > > >
> > > > > >
> > > > > > Did you mean using usleep_range(7*1000, 8*1000), as used in patch v1?
> > > > > > https://patchwork.kernel.org/patch/10957225/
> > > > >
> > > > > Yes, please.
> > > >
> > > > Why not just msleep()?
> > >
> > > msleep() is usually less accurate. I'm not sure it makes a big different in
> > > this case. Perhaps, if someone wants that the sensor is powered on and
> > > streaming as soon as possible.
> >
> > https://elixir.bootlin.com/linux/latest/source/Documentation/timers/timers-howto.txt#L70
> >
> > Use usleep_range for delays up to 20ms (at least that's what the
> > documentation (still) says?)
> >
>
> Thank you for your clarifications.
> From the doc,
> "msleep(1~20) may not do what the caller intends, and
> will often sleep longer (~20 ms actual sleep for any
> value given in the 1~20ms range). In many cases this
> is not the desired behavior."
>
> So, it is supposed to use usleep_range in shorter sleep case,
> such as 5ms.

Thanks for double checking. usleep_range() sounds good then. Sorry for
the noise.

Best regards,
Tomasz
