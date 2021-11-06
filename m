Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8883E446FE6
	for <lists+linux-media@lfdr.de>; Sat,  6 Nov 2021 19:40:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231560AbhKFSmz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 6 Nov 2021 14:42:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229774AbhKFSmz (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 6 Nov 2021 14:42:55 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79ADAC061570
        for <linux-media@vger.kernel.org>; Sat,  6 Nov 2021 11:40:13 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id j21so44872239edt.11
        for <linux-media@vger.kernel.org>; Sat, 06 Nov 2021 11:40:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GCgFfhtXVgNBXIqk9OVgPMU35MsxnNsdqeQ1ofm4KxA=;
        b=p85m9S6syVRMMQKpEMM1fdRVA56p4I0t8SesjHA03nm0zg5vduW4wjynx6opFjvSx6
         F7feBjT0OySTWE+CD0SV2lVdKEHJW7VTA8Knjw2racFjHdlUuWyRv6zWzF6ddieZmEnj
         m3h8WXarvVJXU8E3/m+GAbRExXi5o/7/24HEDQCR3lWJ10IqY4LqyCX+0qwuMpL0ANia
         z6fS/98mg2itGsJrFq3kRgOMMBJUpJmnxS9gf9o722oY50Xw/e7azc0Vv44bwlqYu5DM
         lpLpqp/Q4Pbv16zOqeGX+RUxCaVeNLboOD6CiDlafB5pQpqg/jjghzgxisX7SXxie1S5
         ps2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GCgFfhtXVgNBXIqk9OVgPMU35MsxnNsdqeQ1ofm4KxA=;
        b=hvBgWEOK8IV2WNxg44gXWr8wjQlDudK1rEp5Ixzb5DuO7AhZndPShwaVtTa7KN3Izg
         Gd5UQ87jdStJCQxNLIXErYiTfbY/HphNbrm0TpWy7Wc4sciRkNT6QV7k/vTWqmpUhaXW
         SNNFG5mJJq6DnCDEhiZz+T2mFC2dPDmdAtXV2IKRl25FGkrIQWJiJcRMfKsclVpz/n4V
         2257S2HzptU6RIc1jbOj+th9ahdw4GpIthlpn4nLA4akfEbiZxVuVCXcyUyz1hUAvsl+
         0eqO4ZjuzxeniBz1FTL2K9o7/7tKzJusFL31mlHVbZJXYehvZeFPSDYCNipPONzO541j
         N65g==
X-Gm-Message-State: AOAM5320gyqFiCEHaV/HrW4irLso/zQiq88c0MiO2BkUB/n47nSoL/bF
        Q1NLRrRPmi01KX0bRo2zBKycU6i+1REoJjKoZpCksYDev5Q=
X-Google-Smtp-Source: ABdhPJyz9ZsK8Ob0unh5UnIOQUNIWw8aDVCiszEeghIVcz0xzmkFKsU9SgX5VNeQ8NjGlN65ShGhRISxa1KUi4g22VA=
X-Received: by 2002:a17:906:6a0a:: with SMTP id qw10mr56737971ejc.141.1636224012026;
 Sat, 06 Nov 2021 11:40:12 -0700 (PDT)
MIME-Version: 1.0
References: <e2312277-f967-7d3f-5ce9-fbb197d35fd6@gmail.com>
 <3b61bb2d-1136-cf35-ba7a-724da9642855@gmail.com> <418dc16a-2a03-7604-a8e2-31c5ddfcf436@redhat.com>
 <58dabc46-211c-844d-3ed3-fd2411936d6d@gmail.com> <8d0470d3-7356-b476-6807-5c8606ee3545@redhat.com>
 <YYQi+zpAxPDvdCHx@smile.fi.intel.com> <3e2a32c3-1e42-a510-6010-6be07bdd101d@redhat.com>
In-Reply-To: <3e2a32c3-1e42-a510-6010-6be07bdd101d@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sat, 6 Nov 2021 20:39:35 +0200
Message-ID: <CAHp75VeEvG962nrbs1ZnZTypzJCYXPHkk+EHqk=qm+7UnwrYvw@mail.gmail.com>
Subject: Re: Fwd: Surface Go VCM type (was: Need to pass acpi_enforce_resources=lax
 on the Surface Go (version1))
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kate Hsuan <hpa@redhat.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        libcamera-devel@lists.libcamera.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, Nov 6, 2021 at 8:15 PM Hans de Goede <hdegoede@redhat.com> wrote:
> On 11/4/21 19:14, Andy Shevchenko wrote:
> > On Thu, Nov 04, 2021 at 03:49:48PM +0100, Hans de Goede wrote:
> >> On 11/2/21 00:43, Daniel Scally wrote:

...

> >>              dmi_first_match(++match);
> >
> > Not sure I understood the purpose of the call.
>
> You are right , that should have a "match = " in front of it, but
> I actually like this form found else where better:
>
>         for (match = dmi_first_match(int3472_tps68470_board_data_table);
>              match;
>              match = dmi_first_match(match + 1)) {
>
> That IMHO makes the whole code a lot clearer, so I'll switch to that for
> the next version, thank you for catching this.

I'm very glad that you read my mind!
I was too modest to express the same proposal as you do just above. Go for it!

-- 
With Best Regards,
Andy Shevchenko
