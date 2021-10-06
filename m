Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFB3F4234CF
	for <lists+linux-media@lfdr.de>; Wed,  6 Oct 2021 02:10:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236986AbhJFAMM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Oct 2021 20:12:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236855AbhJFAMM (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Oct 2021 20:12:12 -0400
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com [IPv6:2607:f8b0:4864:20::b35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCC6CC06174E
        for <linux-media@vger.kernel.org>; Tue,  5 Oct 2021 17:10:20 -0700 (PDT)
Received: by mail-yb1-xb35.google.com with SMTP id r1so1390037ybo.10
        for <linux-media@vger.kernel.org>; Tue, 05 Oct 2021 17:10:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=MzUhgXDxneM6K2IKWvz5CMtwEL90xumlqayJyxLdrxY=;
        b=Q94zXviMhYGqkMmQkJlho1KH6VSaBrnneKlRup2/QH5Kv+qmOcfsa9JvbSMQT2i+Sd
         PdmOR7KHFa5HPwAcZXrjapW7J1DTotXM3Exf41BhEGQjlyBJGA5z9GIl4ZCeyMVcxZ5Z
         RbFvrIk9fNvJCl1nf8OQz84/aUFle+29NG/NuukC+bfpeLBhYhLCpY3XXGPxYXnvPdN4
         Z8TY9yDZ/ziklsUlkPqozvb8mnHbGy3P+gc45dlUQEJDONFSGEYJE0WeJd5g7+IBZE4z
         d878GU5Df4ycGUd2fvra3r0JvtsdvsnJEWJS/jzocRB5x5/wny1nqT0imvtA66Yen3ij
         s1Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=MzUhgXDxneM6K2IKWvz5CMtwEL90xumlqayJyxLdrxY=;
        b=JAq8Z8f6RyWH4WUcszm4Patg5LBgLzaoJmcTo93Ct6KPL85z51eGyCpyaE7g3wljTC
         HWq01GWbUAPjL9TN4q7yr2VnjWGMtPRqEDkEggIWGfkhuUqsCIuVJDCcubHk/zQGCGKN
         IZ7QFzjC2yh/46v4Cw4q+FTfB3hj1bbG6HRFKavvFRfpAL7TxUZggUQjCVKpPcYliZ+W
         A42AxKEQe4aMZQxnL6zuZgahxqcAZZn/MBI5vwzQvd1ux9o0GZMsWYoGPyqptBobtF8l
         LcE9VEo3NO1pptUhg+QEqELhZeGFhKSKDPu1jFYESr42b5Ebb48fuuknAbJqDXEF4vYz
         tCJA==
X-Gm-Message-State: AOAM5315PCRrhtF0plfuRJWWO/uVHLqNFsGwp7bHlnkiGCOWWJGaFFLK
        KawIMsJaJnTxu1bQHErFmg1gcQ8+4pd1uPdUmROUwg==
X-Google-Smtp-Source: ABdhPJxAx+DmOAm2qwtR55Fg/JzgGWFLp1UkXv6faIIu08RFE/VbpEep7GKTqYuNpLTrN7M6g2LEPFRJdxmXOW6BG5k=
X-Received: by 2002:a5b:783:: with SMTP id b3mr24798040ybq.328.1633479019867;
 Tue, 05 Oct 2021 17:10:19 -0700 (PDT)
MIME-Version: 1.0
References: <m3lf39nfsq.fsf@t19.piap.pl>
In-Reply-To: <m3lf39nfsq.fsf@t19.piap.pl>
From:   Saravana Kannan <saravanak@google.com>
Date:   Tue, 5 Oct 2021 17:09:44 -0700
Message-ID: <CAGETcx_N7XYkzFPSuQdvWKk1o+Pzzg4HnzChE_4c_Bg_oOK3eA@mail.gmail.com>
Subject: Re: v5.15-rcX regression: video devices on i.MX6 are not created
To:     =?UTF-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Oct 4, 2021 at 5:19 AM Krzysztof Ha=C5=82asa <khalasa@piap.pl> wrot=
e:
>
> Hi Saravana et al.,
>
> FYI the patch: 6b2117ad65f1bca9ece6d4b1ee784b42701a2d86
>
> of: property: fw_devlink: Add support for "resets" and "pwms"
>
> Allows better tracking of dependencies between devices.
>
>  drivers/of/property.c | 4 ++++
>
> breaks v4l2 video devices on an i.MX6 CPU. The /dev/video* nodes are not
> created, and the drivers (async subdevicess) are "waiting":
>
> # cat /sys/kernel/debug/v4l2-async/pending_async_subdevices
>
> imx-media:
>  [fwnode] dev=3Dnil, node=3D/soc/ipu@2400000/port@0
>  [fwnode] dev=3Dnil, node=3D/soc/ipu@2400000/port@1
>  [fwnode] dev=3Dnil, node=3D/soc/ipu@2800000/port@0
>  [fwnode] dev=3Dnil, node=3D/soc/ipu@2800000/port@1
> imx6-mipi-csi2:
>  [fwnode] dev=3D0-0036, node=3D/soc/bus@2100000/i2c@21a0000/camera@36
> ipu2_csi1_mux:
> ipu1_csi0_mux:
>  [fwnode] dev=3D21dc000.mipi, node=3D/soc/bus@2100000/mipi@21dc000
>
> Reverting the patch (or commenting the "resets" out) fixes the problem:
>
> # cat /sys/kernel/debug/v4l2-async/pending_async_subdevices
> ipu2_csi1:
> ipu2_csi0:
> ipu1_csi1:
> ipu1_csi0:
> imx-media:
> imx6-mipi-csi2:
> ipu2_csi1_mux:
> ipu1_csi0_mux:
>
>
> What now?

Hi Krzysztof,

Can you give me the following details?

1. The dts file that corresponds to the device you are testing this on.
2. Output of <debugfs>/devices_deferred base on at least 5.15-rc4 (I
added more info there recently).

That should tell me all the info I need to debug this. In the end
it'll essentially boil down to a reset controller driver not using
device driver model to initialize the device and directly parsing the
node in some kind of initcall.

Thanks,
Saravana
> --
> Krzysztof "Chris" Ha=C5=82asa
>
> Sie=C4=87 Badawcza =C5=81ukasiewicz
> Przemys=C5=82owy Instytut Automatyki i Pomiar=C3=B3w PIAP
> Al. Jerozolimskie 202, 02-486 Warszawa
