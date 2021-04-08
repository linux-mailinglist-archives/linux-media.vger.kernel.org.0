Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 25B34357CF5
	for <lists+linux-media@lfdr.de>; Thu,  8 Apr 2021 09:06:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229819AbhDHHGV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Apr 2021 03:06:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229790AbhDHHGU (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 8 Apr 2021 03:06:20 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DECDBC061761
        for <linux-media@vger.kernel.org>; Thu,  8 Apr 2021 00:06:09 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id g17so331829edm.6
        for <linux-media@vger.kernel.org>; Thu, 08 Apr 2021 00:06:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=z4Gitq6pVFDGPa5UrDIJQObnLNdxwY706RuaVL/8cJQ=;
        b=Rq/AVPm1jCL9qyyHKxT5usmTELeBq1QBK7S0jE9FhIpcOnkmIE1MFYUSaaLB+fbeG4
         woViT2OkK6JUUf3A2pifrsX5TFDVEZfZya+OSIC/IKAg4osGnjzTTNPpvYzlhqNEJGTc
         CyQuygiOyddbOLcV9fNt8j8cWcoY5jPX7ERVGHmcm4UIxIqYaDrUz/IJFIT1ktLpb4rd
         dhA3O4NnNSbVMZrBVtPWqo2gxWeYgW/qSBaWA8dFh8D4M8VVcD4zXhwnNPoFZ1JuOnq0
         a1nKocWIAJawxgrF7mtFwTlMC+n6jAdNlz5Tl3pqZOd3kKWkQc0WWuZq0v4zfd9PMsx9
         xj/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=z4Gitq6pVFDGPa5UrDIJQObnLNdxwY706RuaVL/8cJQ=;
        b=q+zC8E1bd8Rpwi5bQxJBBs6h6CCNTzRmmKBf2GRxa+1yDd+nlyuTpMFt0iH/1y5wX2
         klCCcwiPJBhOqE4/w8TFZf8iILR5Ol2Of/qydWtSCspFn5aOJWX56cJ6ovgLD63E75SN
         S0Uk46Q33Bkqv21qXrsyCTyBQK4KHqiuLcdzi51Iqc5VaAEcMU1w2774XcJ6ZMD6Gmc9
         JR/f2mtWMT1FHxDZoI4m5iBXSc5jnS0Z9Xlu0xZc2RD8F7MBwlqBVmQ1tcNl2TD+ICyB
         /QLEfe/YjDZgQI/m8tHZh5b3E64yRD+NVnRax3zyJTp99r915qf+CUFZPEOFbZW+dgMg
         qPDg==
X-Gm-Message-State: AOAM532As3lhdcZN9AnxkyR/zkf94S+ef2alwRJjXCqCJAn4MLWL/jIz
        eN/8+JFO2uojX99Yxvourf1SCg==
X-Google-Smtp-Source: ABdhPJxnL59ZtT6Iah9N++cMUYV0rXC755tzrsh7H6THlQikyo2EcZ08HAyhG/iIV512tuxRYVlbrA==
X-Received: by 2002:a05:6402:4d1:: with SMTP id n17mr9243636edw.118.1617865568643;
        Thu, 08 Apr 2021 00:06:08 -0700 (PDT)
Received: from dell ([91.110.221.215])
        by smtp.gmail.com with ESMTPSA id q16sm13810809ejd.15.2021.04.08.00.06.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 00:06:08 -0700 (PDT)
Date:   Thu, 8 Apr 2021 08:06:05 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     lkml <linux-kernel@vger.kernel.org>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Anssi Hannula <anssi.hannula@gmail.com>,
        Bruno =?iso-8859-1?Q?Pr=E9mont?= <bonbons@linux-vserver.org>,
        Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        Daniel Drubin <daniel.drubin@intel.com>,
        Dario Pagani <dario.pagani.146+linuxk@gmail.com>,
        dri-devel@lists.freedesktop.org,
        Henrik Rydberg <rydberg@bitmath.org>,
        Jiri Kosina <jikos@kernel.org>,
        Jonathan Cameron <jic23@kernel.org>,
        Kai-Heng Feng <kai.heng.feng@canonical.com>,
        Kim Kuparinen <kimi.h.kuparinen@gmail.com>,
        Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
        linaro-mm-sig@lists.linaro.org,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-iio <linux-iio@vger.kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        linux-media@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        Linux USB Mailing List <linux-usb@vger.kernel.org>,
        Lopez Casado <nlopezcasad@logitech.com>,
        "L. Vinyard, Jr" <rvinyard@cs.nmsu.edu>,
        Masaki Ota <masaki.ota@jp.alps.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        message to <vojtech@ucw.cz>,
        Michael Haboustak <mike-@cinci.rr.com>,
        Rushikesh S Kadam <rushikesh.s.kadam@intel.com>,
        Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <uwe@kleine-koenig.org>,
        Vojtech Pavlik <vojtech@suse.cz>,
        Zhang Lixu <lixu.zhang@intel.com>
Subject: Re: [RESEND 00/25] Rid W=1 warnings from HID
Message-ID: <20210408070605.GC2961413@dell>
References: <20210326143458.508959-1-lee.jones@linaro.org>
 <20210406085605.GS2916463@dell>
 <CAO-hwJ+5Vd6jC2+0pfHLOw3opdXzKoc9pUWzxmBVhSvQvNWMsQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAO-hwJ+5Vd6jC2+0pfHLOw3opdXzKoc9pUWzxmBVhSvQvNWMsQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 07 Apr 2021, Benjamin Tissoires wrote:

> On Tue, Apr 6, 2021 at 10:56 AM Lee Jones <lee.jones@linaro.org> wrote:
> >
> > On Fri, 26 Mar 2021, Lee Jones wrote:
> >
> > > This set is part of a larger effort attempting to clean-up W=1
> > > kernel builds, which are currently overwhelmingly riddled with
> > > niggly little warnings.
> > >
> > > Lee Jones (25):
> > >   HID: intel-ish-hid: Remove unused variable 'err'
> > >   HID: ishtp-hid-client: Move variable to where it's actually used
> > >   HID: intel-ish-hid: pci-ish: Remove unused variable 'ret'
> > >   HID: intel-ish: Supply some missing param descriptions
> > >   HID: intel-ish: Fix a naming disparity and a formatting error
> > >   HID: usbhid: Repair a formatting issue in a struct description
> > >   HID: intel-ish-hid: Fix a little doc-rot
> > >   HID: usbhid: hid-pidff: Demote a couple kernel-doc abuses
> > >   HID: hid-alps: Correct struct misnaming
> > >   HID: intel-ish-hid: Fix potential copy/paste error
> > >   HID: hid-core: Fix incorrect function name in header
> > >   HID: intel-ish-hid: ipc: Correct fw_reset_work_fn() function name in
> > >     header
> > >   HID: ishtp-hid-client: Fix incorrect function name report_bad_packet()
> > >   HID: hid-kye: Fix incorrect function name for kye_tablet_enable()
> > >   HID: hid-picolcd_core: Remove unused variable 'ret'
> > >   HID: hid-logitech-hidpp: Fix conformant kernel-doc header and demote
> > >     abuses
> > >   HID: hid-uclogic-rdesc: Kernel-doc is for functions and structs
> > >   HID: hid-thrustmaster: Demote a bunch of kernel-doc abuses
> > >   HID: hid-uclogic-params: Ensure function names are present and correct
> > >     in kernel-doc headers
> > >   HID: hid-sensor-custom: Remove unused variable 'ret'
> > >   HID: wacom_sys: Demote kernel-doc abuse
> > >   HID: hid-sensor-hub: Remove unused struct member 'quirks'
> > >   HID: hid-sensor-hub: Move 'hsdev' description to correct struct
> > >     definition
> > >   HID: intel-ish-hid: ishtp-fw-loader: Fix a bunch of formatting issues
> > >   HID: ishtp-hid-client: Fix 'suggest-attribute=format' compiler warning
> >
> > These have been on the list for a couple of weeks now.
> >
> > Is there anything I can do to help expedite their merge?
> >
> > I'm concerned since -rc6 has just been released.
> 
> Sorry for the delay.
> 
> I am currently queuing them locally and running a few tests on them. I
> don't expect anything to happen, but better be safe than anything.
> 
> FWIW, I am splitting the series in 3:
> - 11 patches for intel ish are going to be queued in for-5.13/intel-ish
> - the thrustmaster one in for-5.13/thrustmaster
> - the rest (13 patches) will be sent in for-5.13/warnings.

Sounds good to me.  Thanks Benjamin.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
