Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9FAF9187182
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2020 18:47:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731974AbgCPRrv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Mar 2020 13:47:51 -0400
Received: from mail-qk1-f170.google.com ([209.85.222.170]:36909 "EHLO
        mail-qk1-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730437AbgCPRrv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Mar 2020 13:47:51 -0400
Received: by mail-qk1-f170.google.com with SMTP id z25so22857943qkj.4
        for <linux-media@vger.kernel.org>; Mon, 16 Mar 2020 10:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=5+BCaggZdSe2B/f1CjdZ+FDm8B7V+iH1oe89kuDDQgc=;
        b=EWJWfK4TaPPKBLWwb/vGYxxoOGO7aTWUXSR1UDm62kTS9YZaV7iCslGBVuQD46I3kn
         bL4/3U3lHoj2VDAjFnusSufS2gqi+pIQACsMSoDGhRVWUbthyCuuz9pvcABMlTmhx4Wt
         RpJO1itDXVeCydZK1apZca3UrPnEscyo+SQefwGsr9XqxKtMmr1oLtL+a0j6IDgM6u5F
         9KXxEBWKhF0zbhWn/UxvIS04ykUkiN+f0zygAke1FwfVgeVpUpwh/UpBJOoIeQYr+NtW
         u6e3jFPVdBGcobPeQHOMAB0NTj0CODTb6jje2QnL/DRlNSKPLgjI2USqzK1auPXY7Yfm
         MRJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=5+BCaggZdSe2B/f1CjdZ+FDm8B7V+iH1oe89kuDDQgc=;
        b=DpRULDfgu5yL5NykskAv4gkWr4CZ9Thd4SlZKG4Ox1QtlWUDYJ82VzfiqnhFVvj1mj
         3wYQFY3bv5UzwGrd+eVzbaYQqbhHzhJWgjcTQpO5XRbxuEteX7SfvaxZGZfQL1j5oOxl
         bjRnLr+KnvIPpPcpdgS672ZVAAbwIAwN0yXxkmD//AtT3i4kPmL8c5G64Y73KD0JsYAf
         Q24CMxjAI3eTTRbr2yCP6Ec9K0rDNeBC86Gdv8K/s251xjf1KCtvacn8m7DnawWmIexP
         klU4K82ZQL7SGQVfG0lMmQgkKlK+kFgKi2c3r30WwSy1qTR4HfHK1KCoEVXb2vMUidLq
         3pNQ==
X-Gm-Message-State: ANhLgQ1Hv4xPVwgdMtPrDUY2jIb89JgcIoqRbyP31WY4ZuHY0+OAaRPs
        GYoffzrXxwfBygCbFhHPgnR2Ug==
X-Google-Smtp-Source: ADFU+vuaVM/vMtd1LaYuv9kcVUetbMIqDN80qsopK0oPISTMX6W7MtYjslwh+3Ue80F9DHgKGuF/Ag==
X-Received: by 2002:a37:b446:: with SMTP id d67mr890185qkf.162.1584380869146;
        Mon, 16 Mar 2020 10:47:49 -0700 (PDT)
Received: from skullcanyon ([192.222.193.21])
        by smtp.gmail.com with ESMTPSA id x37sm271787qtc.90.2020.03.16.10.47.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2020 10:47:48 -0700 (PDT)
Message-ID: <e154057cb14c40b20c1f808c06afe2ad32d04b4d.camel@ndufresne.ca>
Subject: Re: [RFC PATCH v4l-utils 0/1] Introduce the meson build system
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Ezequiel Garcia <ezequiel@collabora.com>
Cc:     linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>,
        Sean Young <sean@mess.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Date:   Mon, 16 Mar 2020 13:47:47 -0400
In-Reply-To: <20200316183011.5b0c34ac@coco.lan>
References: <20200315205421.28797-1-ezequiel@collabora.com>
         <20200316183011.5b0c34ac@coco.lan>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le lundi 16 mars 2020 à 18:30 +0100, Mauro Carvalho Chehab a écrit :
> Em Sun, 15 Mar 2020 17:54:20 -0300
> Ezequiel Garcia <ezequiel@collabora.com> escreveu:
> 
> > Here's a first step towards using meson:
> > 
> >     https://mesonbuild.com/
> > 
> > As you can see, this doesn't include all tools and libraries
> > (are there any libv4l1 users?), but otherwise tries to cover
> > as much as possible.
> > 
> > I'm sending this early patch, hoping to get some reviews
> > and possibly some testing.
> > 
> > Let me know what you think.
> 
> I fail to see why to change it. The autotools-based building system works,
> and we don't have any bug reports related to it.
> 
> Also, we're all familiar to it.
> 
> Changing to a new system will not only be extra work from our side, in
> order to learn how to use it, address any hidden bugs, etc, but also for
> distro developers as they'll need to change the build dependencies on
> their packages, as the building system will rely on different toolsets.

Be aware that hundreds of project have made that move already,
including very large projects. Distro maintainer knows the drill to
move forward. Overall it has been welcome as it reduces the build time
on their farm. For those using non-gcc compilers, it has been quite
positive as a lot of compiler specific hacks exist per-project with
autotools, some project get it right, some don't. With Meson this is
unified and solved once correctly.

As this library is always a deps of another project, the move to meson
also enables using it as subproject. This can greatly simplify making
dedicated build, it will notably make our life easier for CI
integration.

> 
> 
> 
> > Thanks,
> > 
> > Ezequiel Garcia (1):
> >   Add support for meson building
> > 
> >  gen-version.sh                      |  36 ++++++++++
> >  lib/libdvbv5/meson.build            |  87 ++++++++++++++++++++++
> >  lib/libv4l2/meson.build             |  43 +++++++++++
> >  lib/libv4lconvert/meson.build       |  79 ++++++++++++++++++++
> >  lib/meson.build                     |   6 ++
> >  meson.build                         | 108 ++++++++++++++++++++++++++++
> >  meson_options.txt                   |  19 +++++
> >  utils/cec-compliance/meson.build    |  39 ++++++++++
> >  utils/cec-ctl/meson.build           |  33 +++++++++
> >  utils/cec-follower/meson.build      |  35 +++++++++
> >  utils/gen_media_bus_format_codes.sh |   7 ++
> >  utils/gen_media_bus_format_names.sh |   7 ++
> >  utils/ir-ctl/meson.build            |  30 ++++++++
> >  utils/libcecutil/meson.build        |  46 ++++++++++++
> >  utils/media-ctl/meson.build         |  35 +++++++++
> >  utils/meson.build                   |  32 +++++++++
> >  utils/v4l2-compliance/meson.build   |  52 ++++++++++++++
> >  utils/v4l2-ctl/meson.build          |  65 +++++++++++++++++
> >  version.h.in                        |   1 +
> >  19 files changed, 760 insertions(+)
> >  create mode 100755 gen-version.sh
> >  create mode 100644 lib/libdvbv5/meson.build
> >  create mode 100644 lib/libv4l2/meson.build
> >  create mode 100644 lib/libv4lconvert/meson.build
> >  create mode 100644 lib/meson.build
> >  create mode 100644 meson.build
> >  create mode 100644 meson_options.txt
> >  create mode 100644 utils/cec-compliance/meson.build
> >  create mode 100644 utils/cec-ctl/meson.build
> >  create mode 100644 utils/cec-follower/meson.build
> >  create mode 100644 utils/gen_media_bus_format_codes.sh
> >  create mode 100644 utils/gen_media_bus_format_names.sh
> >  create mode 100644 utils/ir-ctl/meson.build
> >  create mode 100644 utils/libcecutil/meson.build
> >  create mode 100644 utils/media-ctl/meson.build
> >  create mode 100644 utils/meson.build
> >  create mode 100644 utils/v4l2-compliance/meson.build
> >  create mode 100644 utils/v4l2-ctl/meson.build
> >  create mode 100644 version.h.in
> > 
> 
> 
> Thanks,
> Mauro

