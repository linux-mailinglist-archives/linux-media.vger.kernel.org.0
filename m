Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 03145318E24
	for <lists+linux-media@lfdr.de>; Thu, 11 Feb 2021 16:24:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230379AbhBKPVd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Feb 2021 10:21:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229746AbhBKPRm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Feb 2021 10:17:42 -0500
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5DFDC061756;
        Thu, 11 Feb 2021 07:15:57 -0800 (PST)
Received: by mail-wr1-x42e.google.com with SMTP id v15so4533264wrx.4;
        Thu, 11 Feb 2021 07:15:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lZHVApcCWyA/8G+Vaa9rcXK9Y7YUgpJhNCfsVhlO7KQ=;
        b=scBiQk60X2gk/6gUlWAr734kTE4d6HixZOdJe0nluaRgsNF0KbMoEnYQWoecNX+Aew
         Rk1ySdDI57G6Cwvv1ojZUqUjPmint5Ig96dNwjhPUzE7Z09YoNHt47YnLmzodhxVQzTM
         gfOXMIWD186OfkoaVqkD0zrkF3VjNRa7SjpOg8DMZM3IRB8S5+iB47hLGGIxaLgijyYb
         32sxHBVs2jMHBIvCU661T5GeXkG9xfAG4mpbYYpwc2wR/k2cQGS0LQm2a/lPGdvbTC1W
         soe3nmYE+NMKfmVR0tiwIgE6gdDNsfaVv2Nl33LiVsSx5y5mJ/5CegsN4ixo79DJ7eHB
         3+kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lZHVApcCWyA/8G+Vaa9rcXK9Y7YUgpJhNCfsVhlO7KQ=;
        b=osAAMdPecqmJazOLmOkv1OJY7ype/1SXt7rHJZF/DLZP/1nVvWHWp6Zvbt8V2B4Tu7
         7lC6WDrxFHDD4MEAJnpFLIBYxjbym5FgFg6DtNRMQAIbAYYkKkjrPqUlhoylY/XhT10a
         9FyTNBTabq51jkYXRrasLob0Z8GNuYdAB89EAyrcnnOrcYYJCgd7aFr2r1/3RN4hem10
         gqr0gP2HqKc4U/BP+lSYKxzO/VoYqg+nx26CmW8F8bCfVQet9mqpRG24YPeRi1wdoEHN
         2Ly7p3/7xdzttA5LRgP+kpVRfIH9af3wyNcK+4t7MSjfPv7BxcNmRnaIyUh3F8a8HH0c
         e6Ww==
X-Gm-Message-State: AOAM530xlAL5RqIjtHlyFdNSvq3jkEaEObog7hEtP5PMN/5dpSiMoRDj
        ibXgZU2Ef4PXVnGXx3hIkY9MmTME89hRlI8DNbY=
X-Google-Smtp-Source: ABdhPJzDHDfUuUKLh422HAass74bwzNGlcpsuleYmnUY24E/Nlt7GA4fbgJZPCUYCYhUSRlPsrFUuvOzJB9anw9UoU8=
X-Received: by 2002:adf:e511:: with SMTP id j17mr6388594wrm.251.1613056556298;
 Thu, 11 Feb 2021 07:15:56 -0800 (PST)
MIME-Version: 1.0
References: <20210203163348.30686-1-TheSven73@gmail.com> <804285cff81878a2c188d1b823182114f891ca38.camel@ndufresne.ca>
 <CAGngYiWt9Q4jWksiniC6vqUw29L3mOFuQpw7Dz_BK9Ye9FbQ1Q@mail.gmail.com> <20210211143233.GA1360@pengutronix.de>
In-Reply-To: <20210211143233.GA1360@pengutronix.de>
From:   Sven Van Asbroeck <thesven73@gmail.com>
Date:   Thu, 11 Feb 2021 10:15:45 -0500
Message-ID: <CAGngYiVKn8P6vPQK65rpVD2h4rD6vbjjTOpEP3nqt3kOiYxpkw@mail.gmail.com>
Subject: Re: [BUG REPORT] media: coda: mpeg4 decode corruption on i.MX6qp only
To:     Philipp Zabel <pza@pengutronix.de>
Cc:     Nicolas Dufresne <nicolas@ndufresne.ca>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Adrian Ratiu <adrian.ratiu@collabora.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        linux-media <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Philipp, thank you so much for looking into this, I really appreciate it !

On Thu, Feb 11, 2021 at 9:32 AM Philipp Zabel <pza@pengutronix.de> wrote:
>
> Another thing that might help to identify who is writing where might be to
> clear the whole OCRAM region and dump it after running only decode or only
> PRE/PRG scanout, for example:

Great idea, I will try that out. This might take a few days. I am also
dealing with higher priority issues,

>
> Could you check /sys/kernel/debug/dri/?/state while running the error case?

dri state in non-error case:
============================

# cat state
plane[31]: plane-0
        crtc=(null)
        fb=0
        crtc-pos=0x0+0+0
        src-pos=0.000000x0.000000+0.000000+0.000000
        rotation=1
        normalized-zpos=0
        color-encoding=ITU-R BT.601 YCbCr
        color-range=YCbCr limited range
plane[35]: plane-1
        crtc=(null)
        fb=0
        crtc-pos=0x0+0+0
        src-pos=0.000000x0.000000+0.000000+0.000000
        rotation=1
        normalized-zpos=1
        color-encoding=ITU-R BT.601 YCbCr
        color-range=YCbCr limited range
plane[38]: plane-2
        crtc=(null)
        fb=0
        crtc-pos=0x0+0+0
        src-pos=0.000000x0.000000+0.000000+0.000000
        rotation=1
        normalized-zpos=0
        color-encoding=ITU-R BT.601 YCbCr
        color-range=YCbCr limited range
plane[42]: plane-3
        crtc=crtc-2
        fb=59
                allocated by = X
                refcount=2
                format=XR24 little-endian (0x34325258)
                modifier=0x0
                size=1280x1088
                layers:
                        size[0]=1280x1088
                        pitch[0]=5120
                        offset[0]=0
                        obj[0]:
                                name=2
                                refcount=4
                                start=000105e4
                                size=5570560
                                imported=no
                                paddr=0xee800000
                                vaddr=78a02004
        crtc-pos=1280x800+0+0
        src-pos=1280.000000x800.000000+0.000000+0.000000
        rotation=1
        normalized-zpos=0
        color-encoding=ITU-R BT.601 YCbCr
        color-range=YCbCr limited range
plane[46]: plane-4
        crtc=(null)
        fb=0
        crtc-pos=0x0+0+0
        src-pos=0.000000x0.000000+0.000000+0.000000
        rotation=1
        normalized-zpos=1
        color-encoding=ITU-R BT.601 YCbCr
        color-range=YCbCr limited range
plane[49]: plane-5
        crtc=(null)
        fb=0
        crtc-pos=0x0+0+0
        src-pos=0.000000x0.000000+0.000000+0.000000
        rotation=1
        normalized-zpos=0
        color-encoding=ITU-R BT.601 YCbCr
        color-range=YCbCr limited range
crtc[34]: crtc-0
        enable=0
        active=0
        self_refresh_active=0
        planes_changed=0
        mode_changed=0
        active_changed=0
        connectors_changed=0
        color_mgmt_changed=0
        plane_mask=0
        connector_mask=0
        encoder_mask=0
        mode: "": 0 0 0 0 0 0 0 0 0 0 0x0 0x0
crtc[41]: crtc-1
        enable=0
        active=0
        self_refresh_active=0
        planes_changed=0
        mode_changed=0
        active_changed=0
        connectors_changed=0
        color_mgmt_changed=0
        plane_mask=0
        connector_mask=0
        encoder_mask=0
        mode: "": 0 0 0 0 0 0 0 0 0 0 0x0 0x0
crtc[45]: crtc-2
        enable=1
        active=1
        self_refresh_active=0
        planes_changed=0
        mode_changed=0
        active_changed=0
        connectors_changed=0
        color_mgmt_changed=0
        plane_mask=8
        connector_mask=2
        encoder_mask=2
        mode: "": 60 67880 1280 1344 1345 1350 800 838 839 841 0x0 0x0
crtc[52]: crtc-3
        enable=0
        active=0
        self_refresh_active=0
        planes_changed=0
        mode_changed=0
        active_changed=0
        connectors_changed=0
        color_mgmt_changed=0
        plane_mask=0
        connector_mask=0
        encoder_mask=0
        mode: "": 0 0 0 0 0 0 0 0 0 0 0x0 0x0
connector[54]: HDMI-A-1
        crtc=(null)
        self_refresh_aware=0
connector[57]: LVDS-1
        crtc=crtc-2
        self_refresh_aware=0

dri state in error case:
========================
# cat state
plane[31]: plane-0
        crtc=(null)
        fb=0
        crtc-pos=0x0+0+0
        src-pos=0.000000x0.000000+0.000000+0.000000
        rotation=1
        normalized-zpos=0
        color-encoding=ITU-R BT.601 YCbCr
        color-range=YCbCr limited range
plane[35]: plane-1
        crtc=(null)
        fb=0
        crtc-pos=0x0+0+0
        src-pos=0.000000x0.000000+0.000000+0.000000
        rotation=1
        normalized-zpos=1
        color-encoding=ITU-R BT.601 YCbCr
        color-range=YCbCr limited range
plane[38]: plane-2
        crtc=(null)
        fb=0
        crtc-pos=0x0+0+0
        src-pos=0.000000x0.000000+0.000000+0.000000
        rotation=1
        normalized-zpos=0
        color-encoding=ITU-R BT.601 YCbCr
        color-range=YCbCr limited range
plane[42]: plane-3
        crtc=crtc-2
        fb=60
                allocated by = X
                refcount=2
                format=XR24 little-endian (0x34325258)
                modifier=0x0
                size=3000x1088
                layers:
                        size[0]=3000x1088
                        pitch[0]=12000
                        offset[0]=0
                        obj[0]:
                                name=1
                                refcount=4
                                start=00010b34
                                size=13058048
                                imported=no
                                paddr=0xeee00000
                                vaddr=37dd5aa6
        crtc-pos=1280x800+0+0
        src-pos=1280.000000x800.000000+0.000000+0.000000
        rotation=1
        normalized-zpos=0
        color-encoding=ITU-R BT.601 YCbCr
        color-range=YCbCr limited range
plane[46]: plane-4
        crtc=(null)
        fb=0
        crtc-pos=0x0+0+0
        src-pos=0.000000x0.000000+0.000000+0.000000
        rotation=1
        normalized-zpos=1
        color-encoding=ITU-R BT.601 YCbCr
        color-range=YCbCr limited range
plane[49]: plane-5
        crtc=(null)
        fb=0
        crtc-pos=0x0+0+0
        src-pos=0.000000x0.000000+0.000000+0.000000
        rotation=1
        normalized-zpos=0
        color-encoding=ITU-R BT.601 YCbCr
        color-range=YCbCr limited range
crtc[34]: crtc-0
        enable=0
        active=0
        self_refresh_active=0
        planes_changed=0
        mode_changed=0
        active_changed=0
        connectors_changed=0
        color_mgmt_changed=0
        plane_mask=0
        connector_mask=0
        encoder_mask=0
        mode: "": 0 0 0 0 0 0 0 0 0 0 0x0 0x0
crtc[41]: crtc-1
        enable=0
        active=0
        self_refresh_active=0
        planes_changed=0
        mode_changed=0
        active_changed=0
        connectors_changed=0
        color_mgmt_changed=0
        plane_mask=0
        connector_mask=0
        encoder_mask=0
        mode: "": 0 0 0 0 0 0 0 0 0 0 0x0 0x0
crtc[45]: crtc-2
        enable=1
        active=1
        self_refresh_active=0
        planes_changed=0
        mode_changed=0
        active_changed=0
        connectors_changed=0
        color_mgmt_changed=0
        plane_mask=8
        connector_mask=2
        encoder_mask=2
        mode: "": 60 67880 1280 1344 1345 1350 800 838 839 841 0x0 0x0
crtc[52]: crtc-3
        enable=0
        active=0
        self_refresh_active=0
        planes_changed=0
        mode_changed=0
        active_changed=0
        connectors_changed=0
        color_mgmt_changed=0
        plane_mask=0
        connector_mask=0
        encoder_mask=0
        mode: "": 0 0 0 0 0 0 0 0 0 0 0x0 0x0
connector[54]: HDMI-A-1
        crtc=(null)
        self_refresh_aware=0
connector[57]: LVDS-1
        crtc=crtc-2
        self_refresh_aware=0
