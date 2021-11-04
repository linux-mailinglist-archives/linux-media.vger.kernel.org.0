Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E9F6644515F
	for <lists+linux-media@lfdr.de>; Thu,  4 Nov 2021 10:54:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231210AbhKDJ5Q (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Nov 2021 05:57:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231230AbhKDJ5J (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 4 Nov 2021 05:57:09 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68B04C061714;
        Thu,  4 Nov 2021 02:54:31 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id r9-20020a7bc089000000b00332f4abf43fso4834578wmh.0;
        Thu, 04 Nov 2021 02:54:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:content-transfer-encoding:date:message-id:cc:subject
         :from:to:references:in-reply-to;
        bh=oHTAWE9lVMoAwQtLaYvjTaMeXqlGucHo27+Q2DYGkxw=;
        b=GkYHenrovoXmhVkDLCc3udGY5FhdJkmTUR8Oxr0T2AF2HiyIXaxvK8X42C8CzdsLwu
         4YvNiPk0k2yYYYz5mfdAsC/rvYRE0RgdiOnjS40RFtgJ4pZnSl77sTsOGmAZtvv6dbG7
         nB9i6w3OLQ/ZiX91IBAQLwDnCQHUhIXpdj5hAXKWFhgMbtEgLVq2Dv4Q6/uxLVGQEUF+
         VZPGCJyFUujJYifjT3hfKYXQX6DlFQ/V7aQahBcbERUP63vU8h+jexp8rOY+uCOjbM3N
         OEVgj2qA1CUjrFqdnqE6uE6OPtpJJgLzTCYGh/C+hMNiL+yigHCpGjC2FdmjhRx7/eYf
         rM+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:content-transfer-encoding:date
         :message-id:cc:subject:from:to:references:in-reply-to;
        bh=oHTAWE9lVMoAwQtLaYvjTaMeXqlGucHo27+Q2DYGkxw=;
        b=P8toRodd62XsThgsaJ/qviKWzGC8dFPeSLvdL2apLy5KOhm7VmKTyWhl2JLmiT0sHX
         ereVj1GTtQ60YZ2NFFg8Bk6M8rZTa9BXVA1tf70gYzXLAZE1D3MrL9nQYhuWC9bHqwr3
         x7PUNHrbcRZG+imgNoSW9enDWKMSoMRP9p0lHXQUsH/FmuKKJ0mmhYo8680zRps1MY5Q
         Ioap14n8ua/L1y1uKzkuwmFKf7dJA6zDiHj+1KLO5c071yhgEtlY3Txl08gueiy2SBCo
         TPBkp1tWOkM0VGNF5g7OGCnJdpNNBR8MQNUEA7NHpG8ub1Hbx55Oo3Z2rfSjk0mLhjxT
         gTmw==
X-Gm-Message-State: AOAM532cJRfQbooYvLraNbdqC+U44QxoZ8HP2/TFqZivnc264lhlD1cv
        SlErGRwdG3fm9UdSuGlQ7Go=
X-Google-Smtp-Source: ABdhPJy6G3ehTG5PdAZw4gu4lWgg9vt5MXxC4ljW6GnU/qrDV3NST2Shl01Z6NGTgsDwvs0sNq9p8w==
X-Received: by 2002:a05:600c:3b8f:: with SMTP id n15mr22638942wms.180.1636019669975;
        Thu, 04 Nov 2021 02:54:29 -0700 (PDT)
Received: from localhost (a109-49-33-111.cpe.netcabo.pt. [109.49.33.111])
        by smtp.gmail.com with ESMTPSA id p13sm8891761wmi.0.2021.11.04.02.54.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Nov 2021 02:54:29 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Thu, 04 Nov 2021 09:54:28 +0000
Message-Id: <CFGWKJVG6WGV.3HK06KA8BFY11@arch-thunder>
Cc:     "Laurent Pinchart" <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCHv3 4/4] media: imx: Use dedicated format handler for
 i.MX7/8
From:   "Rui Miguel Silva" <rmfrfs@gmail.com>
To:     "Philipp Zabel" <p.zabel@pengutronix.de>,
        "Dorota Czaplejewicz" <dorota.czaplejewicz@puri.sm>,
        "Steve Longerbeam" <slongerbeam@gmail.com>,
        "Mauro Carvalho Chehab" <mchehab@kernel.org>,
        "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
        "Shawn Guo" <shawnguo@kernel.org>,
        "Sascha Hauer" <s.hauer@pengutronix.de>,
        "Pengutronix Kernel Team" <kernel@pengutronix.de>,
        "Fabio Estevam" <festevam@gmail.com>,
        "NXP Linux Team" <linux-imx@nxp.com>,
        <linux-media@vger.kernel.org>, <linux-staging@lists.linux.dev>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <kernel@puri.sm>,
        <phone-devel@vger.kernel.org>
References: <20211019120047.827915-1-dorota.czaplejewicz@puri.sm>
 <20211019120047.827915-4-dorota.czaplejewicz@puri.sm>
 <092d8c2ba808a25efab579a6d7cc32846c482206.camel@pengutronix.de>
In-Reply-To: <092d8c2ba808a25efab579a6d7cc32846c482206.camel@pengutronix.de>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Philipp,
On Wed Nov 3, 2021 at 12:32 PM WET, Philipp Zabel wrote:

> On Tue, 2021-10-19 at 14:14 +0200, Dorota Czaplejewicz wrote:
> > This splits out a format handler which takes into account
> > the capabilities of the i.MX7/8 video device,
> > as opposed to the default handler compatible with both i.MX5/6 and i.MX=
7/8.
> >=20
> > Signed-off-by: Dorota Czaplejewicz <dorota.czaplejewicz@puri.sm>
>
> Cc: Rui & Laurent
>
> Looks sane to me, but I'd like someone with i.MX7/8 media experience to
> have a look at this.

Thanks for the CC, this really went off of my radar. I will try to
take a look at it, but one of the comments on the first patch:

"The use of `v4l2_fill_pixfmt` comes with the downside of breaking
10-bit Bayer formats, or at least until my other series gets accepted
(Subject: "media: Add 16-bit Bayer formats". Sorry, I don't have the
message id.)."

made me wonder if that series was already accepted? without it this
will break the warp7 setup.

------
Cheers,
     Rui
>
> Thread at
> https://lore.kernel.org/linux-media/20211019120047.827915-1-dorota.czaple=
jewicz@puri.sm/
>
> regards
> Philipp



