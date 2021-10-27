Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B77443CCAF
	for <lists+linux-media@lfdr.de>; Wed, 27 Oct 2021 16:47:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239121AbhJ0OuB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 27 Oct 2021 10:50:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242593AbhJ0Ot5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 27 Oct 2021 10:49:57 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83228C061220;
        Wed, 27 Oct 2021 07:47:30 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id y1so2146741plk.10;
        Wed, 27 Oct 2021 07:47:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=lwlbNb/hnAsSj4Fw3uLYHCdh/oeM8y36vcLe41vaz24=;
        b=BSxVFJuO4wogI5388fLA+7diesSil0jjhTE1fe2L15X8cCvM1Tksi8E+gLiVDRLNb6
         2NTVuw41q85+ZXc2FpAuF3CWSXWRFvyezH+tawKYuy3/IdGTHPxkAoMCRyfrHk5dsrlQ
         QATVSWlhp+ylznWYyD92Rai9snGHItrQfbFEqP7+OBq6kgsdfu2D0SMY83NULEPO+0Bc
         ogyLM3bjNLhwg1y2Hh91QAfkoRR9cs3sQVfTjcnv6EWz00C0hfspYklMft/8Qo6UQo/8
         6Kf2BouZ4SV4ktp2aQUWWjC/MAZLAln10ewCPJe4524H+H8iOfKZbd/ZCJp/afX2s2CJ
         JEww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=lwlbNb/hnAsSj4Fw3uLYHCdh/oeM8y36vcLe41vaz24=;
        b=4jCXc3hBmyu1iiw/hfn+MCph4kqKPPttjnasLXOFtD13p49rhnkNMK780XYCuOgkS8
         pBY7NPP94bGbFulzGeIwqsSMsbcfasShKSe6XN1CJBSwXUWOjfslsFPUvxf0FT5s7iWN
         GJOswns7IpdaFgR7po11lm9bOR98XoYRyNYU5s9H2DEKKWcPTvVLxaDumpUj1VAxcVe0
         HhYXZtgh5YunHUIDJJwMyKL8980Ut5cpAgHI3Z5utz4qM+x+HN6VWq/7M3fMwPLJXLXb
         wg5XFEKM15bv/JvxcWGPp3J6kc/ZY2qRR/3azDDOh/RhzlK9na59W5Ji3lzG4aGCV3Mn
         QpoQ==
X-Gm-Message-State: AOAM531dNKSRmSE8vwVRK2tnvVUSLwaVDSpfdXHjXIc951f3gh86aDRH
        rLko4Z61jBBcZXXu3kaRjaXKXdnNjKOxQQ==
X-Google-Smtp-Source: ABdhPJx3fS7xrs/h1GEIYEXmzmu5WnYNNlILHR6Cn+HhLQ78zGw0mAK4NC2/O61WQ01JA9wSUJpGRw==
X-Received: by 2002:a17:903:245:b0:13f:7872:9382 with SMTP id j5-20020a170903024500b0013f78729382mr28410973plh.26.1635346049688;
        Wed, 27 Oct 2021 07:47:29 -0700 (PDT)
Received: from ?IPv6:2400:4052:6980:3800:dba7:2b1f:3f26:a5ec? ([2400:4052:6980:3800:dba7:2b1f:3f26:a5ec])
        by smtp.gmail.com with ESMTPSA id p16sm71789pgd.78.2021.10.27.07.47.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Oct 2021 07:47:29 -0700 (PDT)
Message-ID: <096e953682fed458d438d1cde57371d7358b5d7b.camel@gmail.com>
Subject: Re: [PATCH 16/17] [NOT-FOR-MERGE] media: atomsip: pci: add DMI
 match for Microsoft Surface 3 with broken DMI (OEMB)
From:   Tsuchiya Yuto <kitakar@gmail.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Patrik Gfeller <patrik.gfeller@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Aniket Bhattacharyea <aniketmail669@gmail.com>,
        Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>,
        Yang Yingliang <yangyingliang@huawei.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Alan <alan@linux.intel.com>,
        Dinghao Liu <dinghao.liu@zju.edu.cn>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org
Date:   Wed, 27 Oct 2021 23:47:24 +0900
In-Reply-To: <a2aa76c3-a8bb-99ef-9f5a-e62cc503a1e2@redhat.com>
References: <20211017161958.44351-1-kitakar@gmail.com>
         <20211017161958.44351-17-kitakar@gmail.com>
         <71b5b886-2ca1-27a9-6776-b3bcc430e5ed@redhat.com>
         <ace1264d7254f7159865602614d70caf7ff4b609.camel@gmail.com>
         <a2aa76c3-a8bb-99ef-9f5a-e62cc503a1e2@redhat.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 2021-10-21 at 20:46 +0200, Hans de Goede wrote:
> Hi,
> 
> On 10/21/21 11:46, Tsuchiya Yuto wrote:
> > On Mon, 2021-10-18 at 09:56 +0200, Hans de Goede wrote:
> > > Hi,
> > > 
> > > On 10/17/21 18:19, Tsuchiya Yuto wrote:
> > > > This commit is added for Surface 3 with broken DMI table. HACK-ish.
> > > > Not intended for upstreaming. Thus, NOT-FOR-MERGE. But, if someone
> > > > knows a nicer way to address this, comments are welcome...
> > > > 
> > > > > 8-----------------------------------------------------------------8<
> > > > 
> > > > On some Microsoft Surface 3, the DMI table gets corrupted for unknown
> > > > reasons and breaks existing DMI matching used for device-specific quirks.
> > > > 
> > > > This commit adds the (broken) DMI data into dmi_system_id tables used
> > > > for quirks so that the driver can enable quirks even on the affected
> > > > systems.
> > > > 
> > > > On affected systems, the DMI data will look like this:
> > > > 
> > > >         $ grep . /sys/devices/virtual/dmi/id/{bios_vendor,board_name,board_vendor,\
> > > >         chassis_vendor,product_name,sys_vendor}
> > > >         /sys/devices/virtual/dmi/id/bios_vendor:American Megatrends Inc.
> > > >         /sys/devices/virtual/dmi/id/board_name:OEMB
> > > >         /sys/devices/virtual/dmi/id/board_vendor:OEMB
> > > >         /sys/devices/virtual/dmi/id/chassis_vendor:OEMB
> > > >         /sys/devices/virtual/dmi/id/product_name:OEMB
> > > >         /sys/devices/virtual/dmi/id/sys_vendor:OEMB
> > > 
> > > I wonder what the bios_date field contains ? Typically when the DMI strings
> > > are no good (e.g. often they contain "Default String" or "To be filled by OEM")
> > > we add a check on the bios-date, which together with the broken strings is
> > > considered unique enough to still allow a match with broken strings in the
> > > kernel.
> > 
> > Thank you so much for the comment :-)
> > 
> > Here is the full output of "/sys/devices/virtual/dmi/id/*" (not showing
> > files that need root permission to read):
> > 
> >         $ grep . /sys/devices/virtual/dmi/id/*
> >         /sys/devices/virtual/dmi/id/bios_date:03/09/2015
> >         /sys/devices/virtual/dmi/id/bios_release:5.6
> >         /sys/devices/virtual/dmi/id/bios_vendor:American Megatrends Inc.
> >         /sys/devices/virtual/dmi/id/bios_version:1.51116.238
> 
> Interesting, this is the latest BIOS from july 2019 according to:
> https://support.microsoft.com/en-us/surface/surface-3-update-history-5d86a7bc-03f7-2d27-d858-e90ce637fb52
> yet the date is still set to 03/09/2015.

Yeah, I'm a little bit confused about this.

> I just checked and the BIOS with not corrupted DMI strings also keeps
> the date at 03/09/2015 in BIOS updates.
> 
> So the date is correct, and together with matching a coupleof the OEMB-s
> (which I've never seen anywhere else either) this should be plenty
> unique.
> 
> So this not only allows adding this mathc to atomisp, but also to fix
> sound + wmi on bad DMI data OEMB Surface 3-s, by updating this patch:
> 
> https://github.com/linux-surface/linux-surface/blob/2fb7e9ae91350098db9a280277f424272816a9ab/patches/5.5/0003-surface3-oemb.patch
> 
> To include the BIOS-date match and then submitting this upstream
> (as 2 separate patches please).
> 
> Tsuchiya, I take it that your Surface 3 has the OEMB issue, so you
> can actually test this ?

Yes, my surface3 is also affected and I can test this.

> If you can prepare 2 patches for the sound + wmi then; and submit
> them upstream that would be great. Please Cc me on both patches.

Thank you for the suggestion, but I started having a mixed feeling about
sending this kind of patches... This "OEMB" issue is not a design by
manufacturers, but simply just it got broken after something (maybe a
force power off?). On the other hand, I know there are also indeed some
people affected by this issue other than me...

If possible, I rather want to fix this broken DMI table, but I couldn't
find the way until now though.

But again, thank you for the suggestion. I'll consider sending the
patches when I gave up fixing it...



<Below is completely off topic from atomisp>

I think some useful BIOS option might be just hidden. So, I'd like to
try this way. I already find the string "Restore Defaults" using
uefitool/ifrextract:

    0x13429 	Form: Save & Exit, FormId: 0x2719 {01 86 19 27 4C 00}
    [...]
    0x134E0 		Suppress If {0A 82}
    0x134E2 			QuestionId: 0x1C3 equals value 0x5 {12 06 C3 01 05 00}
    0x134E8 			Ref: Restore Defaults, VarStoreInfo (VarOffset/VarName): 0xFFFF, VarStore: 0x0, QuestionId: 0x1BC, FormId: 0x2719 {0F 0F 5B 00 5C 00 BC 01 00 00 FF FF 00 19 27}
    0x134F7 		End If {29 02}
    [...]

I currently don't know how I can call this. I want to try this way when
I have some time...

Regards,
Tsuchiya Yuto


