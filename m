Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 588BA439E7B
	for <lists+linux-media@lfdr.de>; Mon, 25 Oct 2021 20:25:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233217AbhJYS2Q (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 25 Oct 2021 14:28:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233390AbhJYS2M (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 Oct 2021 14:28:12 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EA1FC061745
        for <linux-media@vger.kernel.org>; Mon, 25 Oct 2021 11:25:50 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id a16so13211069wrh.12
        for <linux-media@vger.kernel.org>; Mon, 25 Oct 2021 11:25:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=9HKZ3WHs39Ll1KFWQ7mEVgrxMfllF9VNmXJhWSD6zbg=;
        b=eGWi6BKNAikOTbSn81Sa7AREWjMIxOWCW6giZfRNlMcPV+2EmLigPFn+O2Z62O0sYa
         iV0pfEifAhHfWukClZSiKZWUtW6KfA7KRV1ZDicdiR3B8Sti9c4fE1nIPwnUH2j2+yy7
         CgbPrMSi7sMfeIugSlIidXNRbM0IBSpjeIFgbji9Hlzij/fQbDLUW6hA78f7gB7wW0sh
         hdnUjbbgGjOghJEuveE8BUrJhuo37fkdHCNOCAypzkv6cD2ED+omeKUvRLDqTFZ9dh6M
         fECVzVUsc+MnoY5NLk4U5AI8Mgr9mJEWB5ALlZ9FiHJ7gBZ6yAXbyhgvuYQRMS/29qp6
         LSTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=9HKZ3WHs39Ll1KFWQ7mEVgrxMfllF9VNmXJhWSD6zbg=;
        b=Orrciip3PHn0Pl4Nr/Ua3VHGIXJdx66jP6PYHOCbtQKgMZ0LgXRHER0Qu2CJWEWDlL
         Rn3amEyEQMVWJN/nuLa5k0txtAs8aX7QR5mt+yj2KoiBGp9VAbB2bC5wHeU93RG9zB6Q
         2bQBNUTcvujsYTFTZFRX2FZmzptjJKEIP/eeSClnvnf67KMjep2iTowOEEiqfBXJ25nq
         IHmkC4iRTfXrjJmEEYcpuqqg53D5XaDoWbEZf7CQN1qr2xZrRsXPA18YqodtfIhZP1op
         ZecC+d1tOLzosRA6SxOTxz0FpBM5H9mmIT/Kv1OAJ2mao4Pgb8OFJx4aav86H7BAlNZW
         +WBA==
X-Gm-Message-State: AOAM530b2H++yisipOCmGgncIap49y03RsuyEvQlErciCZKyXiZwNfq+
        khGQXaUYfkaDOQ1ZtOqEKDh1Qg==
X-Google-Smtp-Source: ABdhPJwsdj/Ufj88FsRkYCdm3EHNUiDfxilc2w021XdzcMTc2/IYksh4yPlv764YLumxYKv43oMz1A==
X-Received: by 2002:adf:f9d2:: with SMTP id w18mr12644602wrr.86.1635186348799;
        Mon, 25 Oct 2021 11:25:48 -0700 (PDT)
Received: from Red ([2a01:cb1d:3d5:a100:264b:feff:fe03:2806])
        by smtp.googlemail.com with ESMTPSA id l1sm7730050wrb.73.2021.10.25.11.25.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Oct 2021 11:25:48 -0700 (PDT)
Date:   Mon, 25 Oct 2021 20:25:46 +0200
From:   LABBE Corentin <clabbe@baylibre.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     mchehab@kernel.org, gregkh@linuxfoundation.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, mjpeg-users@lists.sourceforge.net
Subject: Re: [PATCH v2 00/10] staging: media: zoran: fusion in one module
Message-ID: <YXb2quNLuUTKtjux@Red>
References: <20211013185812.590931-1-clabbe@baylibre.com>
 <da925d73-fdf0-3962-3841-a1dd53b5c5dd@xs4all.nl>
 <YXa9WGs7ewyaHmI9@Red>
 <71b72175-538e-87e4-d662-e59fd4131a43@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <71b72175-538e-87e4-d662-e59fd4131a43@xs4all.nl>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le Mon, Oct 25, 2021 at 05:13:04PM +0200, Hans Verkuil a écrit :
> On 25/10/2021 16:21, LABBE Corentin wrote:
> > Le Mon, Oct 25, 2021 at 02:45:02PM +0200, Hans Verkuil a écrit :
> >> Hi Corentin,
> >>
> >> On 13/10/2021 20:58, Corentin Labbe wrote:
> >>> Hello
> >>>
> >>> The main change of this serie is to fusion all zoran related modules in
> >>> one.
> >>> This fixes the load order problem when everything is built-in.
> >>>
> >>> Regards
> >>>
> >>> Changes since v1:
> >>> - add missing debugfs cleaning
> >>> - clean some remaining module_get/put functions which made impossible to
> >>>   remove the zoran module
> >>> - added the two latest patchs
> >>
> >> Something weird is wrong with this series. I have a DC30, but loading this with:
> >>
> >> modprobe zr36067 card=3
> >>
> >> results in this error message in the kernel log:
> >>
> >> [   58.645557] zr36067: module is from the staging directory, the quality is unknown, you have been warned.
> >> [   58.646658] zr36067 0000:03:00.0: Zoran MJPEG board driver version 0.10.1
> >> [   58.646793] zr36067 0000:03:00.0: Zoran ZR36057 (rev 1), irq: 18, memory: 0xf4000000
> >> [   58.648821] zr36067 0000:03:00.0: Initializing i2c bus...
> >> [   58.662420] vpx3220 22-0047: vpx3216b found @ 0x8e (DC30[0])
> >> [   58.737445] zr36067 0000:03:00.0: Fail to get encoder
> >>
> >> This works before, so why this is now failing is not clear to me.
> >>
> >> It does work with 'card=0', but I really have a DC30.
> >>
> >> If I test with 'card=0' then the rmmod issue is now solved.
> > 
> > Everything normal, since card 0 does not have encoder.
> > Could you check that adv7175 is compiled ?
> 
> Yes, and it loaded as well (I see it with lsmod).
> 
> However, there is no adv7175 on my board, instead it appears to have an ITT MSE3000.
> There is no driver for this one (and I don't even think it is an i2c device), so
> I suspect that before the driver just continued without encoder support, whereas now
> it fails when it can't load the encoder.
> 
> Could that be the reason? In the absence of an encoder, I think it should just
> continue, esp. since the driver doesn't use the encoder anyway.
> 

So probably the card list is wrong against DC30.
I checked high resolution photo of DC30 on internet, and it confirms the fact that DC30 does not have adv7175.

Since DC30 and DC30+ are identical in the card list, perhaps it is a very old copy/paste error.

So I will add a patch removing adv7175 from DC30.

Thanks for the report
Regards
