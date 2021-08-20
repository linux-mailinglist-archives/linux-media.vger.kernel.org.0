Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 692BD3F2D19
	for <lists+linux-media@lfdr.de>; Fri, 20 Aug 2021 15:25:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231796AbhHTN0e (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 20 Aug 2021 09:26:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229707AbhHTN0d (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 20 Aug 2021 09:26:33 -0400
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAB3BC061575
        for <linux-media@vger.kernel.org>; Fri, 20 Aug 2021 06:25:55 -0700 (PDT)
Received: by mail-pf1-x432.google.com with SMTP id 18so8605117pfh.9
        for <linux-media@vger.kernel.org>; Fri, 20 Aug 2021 06:25:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=D0yBQYj8kDGeryGAJ6TnsU0Ad7mB9G/mlfTiF5xNtPY=;
        b=iyQ2JabY+IUjJ7DeSIDaNi88Eycu1H1EM+p9GdQXZoe+3OYGbAnwMriIWnnwZfFRcl
         ulKIypR7Xbuzq/ZjeB8bPvBUFe4qzH7aP+BidAC/Wred3JosUPtfXWCQJJIn+Tmr0JTc
         GxwdwPAJCbfjozoFKEBuMnPPTeqjohpxVNlNsGPoJYnmn9R6+OwzbppoevrPB7C3biwh
         7Jq6B6f4YoZ6+6ZgQKUa9LFszkd9MbOl3ch/cIq566xKsK65Rj6pZXioO8E7pZQPGrhL
         +68Px97Wde++URaaDqhG8dOVqP6iIe/qpYmnLMXVvcM/PsM44zT0QWEe/3hq5/+iaL5i
         8OmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=D0yBQYj8kDGeryGAJ6TnsU0Ad7mB9G/mlfTiF5xNtPY=;
        b=p+a94UDgdTn3qPVIHTjovHbeZOo4hBEpvqYoKOZR4fvbCxDA6RKw0Msz+0TOHtt/0G
         GpZr9m0o8976wvYf6qCPMQ0Vbq3BLtlLPvqLvSN8l6+5JDFq4b3ZvzC5AAK/4Zspvdha
         HNCwUMYJR3eoQf+AfipCdOzlgrLtaTO0vkv9euDfWV0fyzQv0kpNcMboNlLWHTldooim
         dqTnBCoiPBEyGmxoygnKzW+URtZhvgGagVkMjTr9f3cz7sTF0HS85hX3F0uAUkTGp1Hz
         S+aMVBoYqQUevsGpkceoYFss28m+k5XJCvPAqzOCECP9OHrqx8x6UQ/z0sHhePhJwBEc
         hEEw==
X-Gm-Message-State: AOAM533+Hkwmgfs8yYCillF/bgnQI0Tw4bxft40f+fyX/bLaQro0/oTf
        0bzPnUeo1duEMfSnVEQNFAY8XvwYbM/MXPRsILM=
X-Google-Smtp-Source: ABdhPJwGWrRjz4R78+HR46dFKCi4RTIZfkTPh2+HgR+bPyOR2fw3sTEZ6SuJl8/K5V2a2lVJWHOUsb4QzXPnOs4AeeA=
X-Received: by 2002:a05:6a00:d41:b0:3e1:3316:2ef with SMTP id
 n1-20020a056a000d4100b003e1331602efmr20028910pfv.40.1629465954998; Fri, 20
 Aug 2021 06:25:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210414083022.25453-3-me@fabwu.ch> <20210712090326.7064-1-me@fabwu.ch>
 <20210820131207.GB3@paasikivi.fi.intel.com>
In-Reply-To: <20210820131207.GB3@paasikivi.fi.intel.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 20 Aug 2021 16:25:15 +0300
Message-ID: <CAHp75Vf=1aKx=SN60rGpUpgvXEryq9w1R7NRi0nCG49jWWzefg@mail.gmail.com>
Subject: Re: [PATCH v4] ipu3-cio2: Parse sensor orientation and rotation
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     =?UTF-8?Q?Fabian_W=C3=BCthrich?= <me@fabwu.ch>,
        linux-media@vger.kernel.org, Jacopo Mondi <jacopo@jmondi.org>,
        Dan Scally <djrscally@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Aug 20, 2021 at 4:12 PM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
> On Mon, Jul 12, 2021 at 11:03:26AM +0200, Fabian W=C3=BCthrich wrote:
> > The sensor orientation is read from the _PLC ACPI buffer and converted =
to a v4l2
> > format.
> >
> > The sensor rotation is read from the SSDB ACPI buffer and converted int=
o
> > degrees.
> >
> > Signed-off-by: Fabian W=C3=BCthrich <me@fabwu.ch>
> > Reviewed-by: Daniel Scally <djrscally@gmail.com>
> > Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
>
> It's in my tree now.

Do you know what's going on with
https://lore.kernel.org/linux-media/20210726084055.54887-1-andriy.shevchenk=
o@linux.intel.com/
?

--=20
With Best Regards,
Andy Shevchenko
