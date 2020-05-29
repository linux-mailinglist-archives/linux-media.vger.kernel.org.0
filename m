Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B76C1E75C6
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2020 08:10:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725790AbgE2GKY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 29 May 2020 02:10:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725601AbgE2GKY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 29 May 2020 02:10:24 -0400
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com [IPv6:2607:f8b0:4864:20::b32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC71EC08C5C8
        for <linux-media@vger.kernel.org>; Thu, 28 May 2020 23:10:23 -0700 (PDT)
Received: by mail-yb1-xb32.google.com with SMTP id s7so588987ybo.9
        for <linux-media@vger.kernel.org>; Thu, 28 May 2020 23:10:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=P2nBGdPlsWRCWwz9C54BrqMhSnzVHF9pPpLpGAMC3UU=;
        b=O8lfgxkjb5WR31oIufsKmCgR0RXJD0+bBpmHJoOsGxw7evXX1GYYvx6gjpXXq/VVs/
         zg169dlblh4WbfJVT3QgVQ0BoduCOGUpZu8kBzC0BMDKv2L/NONRMsgkLCgTYrJ6ttbu
         wBJkHHw6+/hfmz6+UMgrJ19lMQDBVcOZ0oX+lPL9th15Mfn/MUpL3ruNOIi7JDk090In
         YTNXnLQ62K+wyGB7Nfl9wp8cPXWYf2cVtR976UsVbI/ZJbmqt33kisZ4ouKAiGzcj7Tu
         ohyiB/c1stAtRiJ+7q+xWoTIiHx6YXowHh/gwV6Ta9Fg6iEavCBgZv9VZPp3k5hT0Zn7
         c1hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=P2nBGdPlsWRCWwz9C54BrqMhSnzVHF9pPpLpGAMC3UU=;
        b=iRq+uSRbM+Jk2JJLpb/6B7NLqeua1a57t/0py5gkqGqzoK0z4RrNnjRnchbBXvkyJe
         AbEFtF95T6A4JX2iUsToHkI2c3Tff1zKUPgpDm267m7a7RNEejvCKGwyzlfuJ6wUUhIf
         ClO2AY8C448Fi0LWMHj9vcGhFGeNMd39GN5iDkcVezs2mv+ScT/ak06xKq2VUF+0IfK7
         gz6f0F+6H+LvEaTv6iMUIQT1iwuxs72LTafftEktifJyVzjHlsc3UktPoJlRePEgWTF9
         th+/HaR8ZJ6qTWaALP3e7NFO7dJ03s3WScuW8c3X/PXLwKMk3NWqvGr1Ri836x/c92Do
         o8Vg==
X-Gm-Message-State: AOAM533w++Xq5zkHQRqud2c+UPKw+B8W9UXjeDQf2xrae3GIAiQGURJl
        TDdAIZoubpbVs8zbPCy+alpYizL8nT04o4LzUtfcR/R3
X-Google-Smtp-Source: ABdhPJz2Uo8OrbmMgdMlGpmHGp+6cso/2EXGuVofumuIcendMf7zvOHKG9MNc/X4vCTynXfldSDdgB3Pyi2z5THqJ7I=
X-Received: by 2002:a25:ba8f:: with SMTP id s15mr10984024ybg.34.1590732622543;
 Thu, 28 May 2020 23:10:22 -0700 (PDT)
MIME-Version: 1.0
References: <20200529030012.254592-1-jnchase@google.com> <20200529030012.254592-3-jnchase@google.com>
 <CALTkaQ2OR+bc2QGeucA5aP3SiM5HLnx5=DoZQ51E_1d99Hb5Uw@mail.gmail.com>
In-Reply-To: <CALTkaQ2OR+bc2QGeucA5aP3SiM5HLnx5=DoZQ51E_1d99Hb5Uw@mail.gmail.com>
From:   Jeff Chase <jnchase@google.com>
Date:   Fri, 29 May 2020 02:10:11 -0400
Message-ID: <CALTkaQ0NLgjS7H7De=7jy9jRG1xMFSbzdmxrFNerNU+o1rRzpg@mail.gmail.com>
Subject: Fwd: [PATCH v3 2/2] media: cec: i2c: ch7322: Add ch7322 CEC
 controller driver
To:     linux-media@vger.kernel.org
Cc:     mchehab@kernel.org, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        robh+dt@kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

(Resending as plain text, sorry)

> +static int ch7322_cec_adap_enable(struct cec_adapter *adap, bool enable)
> +{
> +       struct ch7322 *ch7322 = cec_get_drvdata(adap);
> +       int ret;
> +
> +       if (enable)
> +               ret = ch7322_unmask_interrupt(ch7322);
> +       else
> +               ret = ch7322_mask_interrupt(ch7322);
> +
> +       return ret;
> +}
> +

I just realized that doing this here is broken -- the driver depends
on the interrupt to detect when the physical address changes. I could
mask only the tx/rx interrupt here instead but that is starting to
feel a bit pointless.

I haven't looked into the cec notifier mechanism yet but would it be
better to try to use that instead if possible and just ignore this
device's physical address detection? Then I could do more of a proper
reset in this enable op. But I'm not sure if I can properly associate
the device with an HDMI port on my platform unless I make some changes
to coreboot.

Thanks,
Jeff
