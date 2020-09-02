Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD7C125B146
	for <lists+linux-media@lfdr.de>; Wed,  2 Sep 2020 18:18:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728660AbgIBQRa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Sep 2020 12:17:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727048AbgIBQRZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Sep 2020 12:17:25 -0400
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDA76C061244
        for <linux-media@vger.kernel.org>; Wed,  2 Sep 2020 09:17:24 -0700 (PDT)
Received: by mail-ej1-x642.google.com with SMTP id z22so7471922ejl.7
        for <linux-media@vger.kernel.org>; Wed, 02 Sep 2020 09:17:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=p+VjSP7tWh9A7Uo1/vh88a9JUwYsjFZ9oMpqJyM2gdY=;
        b=MPFeFxv4rz28exekZb65X+RzUZbSJI6wj3xc5X+1ubXwzX2F32DFftTcr+fFuEvoHn
         3h3ncpRSXJUD9WxPpbJs29Zh2PBe9OGw4RV80EEL4sJsfWNjwnrM80cUbv4MXaEt+yLn
         +/arP/dsNH9bw+n5vMFzeXJsdQBr+gJdw7KZk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=p+VjSP7tWh9A7Uo1/vh88a9JUwYsjFZ9oMpqJyM2gdY=;
        b=qPwmX6NtB966CFzfmNTeTI3k1b5J8LCL+PbPPLKOhq1gJY4jRaD0HQ/08p2j92pB6Z
         gIJi+9VGktOETk7kAdznvRmd+qKQ6IRtLQd/xFKJdu0Y/YnmT2xGmOre/SRqBFYDO8zQ
         Udn/mu69xi2S3bz3ZmZtgdPvb61fv0ozPJzX8bg91R4pR75BEzzk/j3sttf01fe8mYTl
         qOa1hmR6H9W7QmY3Io6Ta5b95XqgfUG4J3qecoZTNbl2VbVve8QeLBtl6IbP5Gezqbu1
         yMOFBNZtnSwy/+gznAWGQpckLco03g2BkLTB7OnEqm4je2WgNxktRhkYnBBU23I2U42Z
         lDfg==
X-Gm-Message-State: AOAM530TglzYkOWyGD5lZJH4ySF0VgUj32iWl5mkMdvgKXeJOCrZQ3Wq
        RB023clBnEo4jKAopQSbskBDFlF/X/sH9g==
X-Google-Smtp-Source: ABdhPJw4i5qRFpU9ruh94Z6LSarqddY1di/dZaV6skpHwiuFFUmzT+gRF0vs5hJL56il5PHjpFK76A==
X-Received: by 2002:a17:906:f1d5:: with SMTP id gx21mr721116ejb.165.1599063442646;
        Wed, 02 Sep 2020 09:17:22 -0700 (PDT)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com. [209.85.221.48])
        by smtp.gmail.com with ESMTPSA id s18sm4907976ejd.54.2020.09.02.09.17.19
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2020 09:17:20 -0700 (PDT)
Received: by mail-wr1-f48.google.com with SMTP id k15so5863611wrn.10
        for <linux-media@vger.kernel.org>; Wed, 02 Sep 2020 09:17:19 -0700 (PDT)
X-Received: by 2002:adf:d0cb:: with SMTP id z11mr6506581wrh.192.1599063439238;
 Wed, 02 Sep 2020 09:17:19 -0700 (PDT)
MIME-Version: 1.0
References: <1597380295-6297-1-git-send-email-wuxy@bitland.com.cn>
 <20200831180211.GQ31019@paasikivi.fi.intel.com> <tencent_0189E021005C2124231E353A@qq.com>
In-Reply-To: <tencent_0189E021005C2124231E353A@qq.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Wed, 2 Sep 2020 18:17:00 +0200
X-Gmail-Original-Message-ID: <CAAFQd5AQ7nmOqTrGOtmqAk9PHGdypzBb3woG1QS45bO8yfaVJQ@mail.gmail.com>
Message-ID: <CAAFQd5AQ7nmOqTrGOtmqAk9PHGdypzBb3woG1QS45bO8yfaVJQ@mail.gmail.com>
Subject: Re: [PATCH V3] Add GalaxyCore image sensor driver
To:     =?UTF-8?B?5ZC05YW06IKyQjAxNzc5?= <wuxy@bitland.com.cn>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        mchehab <mchehab@kernel.org>, "robh+dt" <robh+dt@kernel.org>,
        davem <davem@davemloft.net>, "shawnx.tu" <shawnx.tu@intel.com>,
        hverkuil-cisco <hverkuil-cisco@xs4all.nl>,
        "dave.stevenson" <dave.stevenson@raspberrypi.com>,
        "manivannan.sadhasivam" <manivannan.sadhasivam@linaro.org>,
        "bingbu.cao" <bingbu.cao@intel.com>,
        drinkcat <drinkcat@chromium.org>,
        linux-media <linux-media@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        "dongchun.zhu" <dongchun.zhu@mediatek.com>,
        "sj.huang" <sj.huang@mediatek.com>,
        darfur_liu <darfur_liu@gcoreinc.com>,
        "hao.he7" <hao.he7@gmail.com>, "hao.he" <hao.he@bitland.com.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi everyone,

On Tue, Sep 1, 2020 at 7:19 AM =E5=90=B4=E5=85=B4=E8=82=B2B01779 <wuxy@bitl=
and.com.cn> wrote:
>
> Hi Sakari,
>
> It seems the e-mails you're sending do not end up to LMML nor kernel.org
> Patchwork.
>  =3D=3D=3D>It looks like we need to fix this before patch can land in pat=
chwork.
>

FYI, I'll take care of addressing the comments to v3 and posting v4 to the =
list.

PS. Please use plain text only messages when communicating with the
mailing lists as HTML emails are often blocked. Please also use bottom
posting. More guidance can be found at [1] (the specific question the
link points to and other questions too).

[1] http://vger.kernel.org/lkml/#s3-9

Best regards,
Tomasz

> Thanks.
>
> ------------------ Original ------------------
> From:  "Sakari Ailus"<sakari.ailus@linux.intel.com>;
> Date:  Tue, Sep 1, 2020 02:02 AM
> To:  "Xingyu Wu"<wuxy@bitland.com.cn>;
> Cc:  "mchehab"<mchehab@kernel.org>; "robh+dt"<robh+dt@kernel.org>; "davem=
"<davem@davemloft.net>; "shawnx.tu"<shawnx.tu@intel.com>; "hverkuil-cisco"<=
hverkuil-cisco@xs4all.nl>; "dave.stevenson"<dave.stevenson@raspberrypi.com>=
; "manivannan.sadhasivam"<manivannan.sadhasivam@linaro.org>; "bingbu.cao"<b=
ingbu.cao@intel.com>; "tfiga"<tfiga@chromium.org>; "drinkcat"<drinkcat@chro=
mium.org>; "linux-media"<linux-media@vger.kernel.org>; "linux-kernel"<linux=
-kernel@vger.kernel.org>; "devicetree"<devicetree@vger.kernel.org>; "dongch=
un.zhu"<dongchun.zhu@mediatek.com>; "sj.huang"<sj.huang@mediatek.com>; "dar=
fur_liu"<darfur_liu@gcoreinc.com>; "hao.he7"<hao.he7@gmail.com>; "hao.he"<h=
ao.he@bitland.com.cn>;
> Subject:  Re: [PATCH V3] Add GalaxyCore image sensor driver
>
> Hi Xingyu,
>
> On Fri, Aug 14, 2020 at 12:44:51PM +0800, Xingyu Wu wrote:
> > This patch series add GalaxyCore GC5035 image sensor driver.
> >
> > Change in v3:
> > 1.Optimize gc5035 driver.
> > 2.Redescibe reset-gpio in documentation.
>
> It seems the e-mails you're sending do not end up to LMML nor kernel.org
> Patchwork.
>
> I'm not sure why, but that needs to be fixed.
>
> --
> Kind regards,
>
> Sakari Ailus
