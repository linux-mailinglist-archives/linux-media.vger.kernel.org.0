Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0486B359E4E
	for <lists+linux-media@lfdr.de>; Fri,  9 Apr 2021 14:07:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233505AbhDIMHh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Apr 2021 08:07:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233153AbhDIMHg (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 9 Apr 2021 08:07:36 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8D24C061760
        for <linux-media@vger.kernel.org>; Fri,  9 Apr 2021 05:07:22 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id e14so8249360ejz.11
        for <linux-media@vger.kernel.org>; Fri, 09 Apr 2021 05:07:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kynesim-co-uk.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:references:in-reply-to
         :user-agent:mime-version:content-transfer-encoding;
        bh=+vHAutx7QY0SAvbTsv6XcLOGbVnoEWbujg5ue5qWKRQ=;
        b=mo86XUkb7WMOoVEW1eEpHAm1oAY6RvU6qMCBAXNo6c8EJtPhhySO32W95YgoqvbKsH
         CbFjFS6U6PB7ZuCuSvwYcqHEi1lfgy9XNObSvOhMNKCaVZW9PmBr/cxpSDguItEaYrig
         UWqm3vvGtwi9K2q+DqgYbxTlg+SQTHKeEgBjTiI8ZszQLRb8M0meOgo31cIiv0hWiRKK
         mfBHDfaAgmH259OuRJ8k+0ObgaO4XYPrnWBmdCuSLob8IpVNGqVJuuPbSkQFT2PIAO2G
         GcRbDB38pPuixUT17+Ybzt6nulOaE45/13ei0vt8R/yRLhtxEav903Dq0y59++iorNmg
         VGFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:references
         :in-reply-to:user-agent:mime-version:content-transfer-encoding;
        bh=+vHAutx7QY0SAvbTsv6XcLOGbVnoEWbujg5ue5qWKRQ=;
        b=CE/XVdg2Cj/0Jkq+f9On3P4A5gKhrcGcW410E83MSf90RlP78OKb5rH2KhItyUdFSl
         hdfHgpZ+MHRmkfM+OqdL8wkMDOqT3wq9vNEGD0nc/hY4A8mlY5n+FSLBsu42FcHge2iu
         otteOempSOS45cycWo8tpHc8wSIIEhvcZQ/ounAA395gEkTjyaoXNogAs8NdOb0Fcwes
         Hb7H+ozWNEUv9N7jmM+ZJSEtV9dwiR4z2TeiL++3kg9KZvdoOcLtsgIetesXci77o7sB
         HvFfrWeB0WHjYB+T+TW1ueMCmVq359t6oQQjCt2QsK7tgbolFa5mgoOW6e6klROdeXjc
         RgZw==
X-Gm-Message-State: AOAM531yugOTJqHsWXDbtRdd8z0mezVjxKDsOqyquPKmzfATEJr6/TiE
        XnCYDhv6JLLI3SQidw6heg6LL7h/glnetKgg
X-Google-Smtp-Source: ABdhPJw6FC9aoiVJ+D9tk5B1jiLg4FBUeMDCzqNwOb2LdqyMKnU3bWud5RlGOV8u7Iq+8MLAgT/Trg==
X-Received: by 2002:a17:906:1351:: with SMTP id x17mr16130133ejb.242.1617970041565;
        Fri, 09 Apr 2021 05:07:21 -0700 (PDT)
Received: from CTHALPA.outer.uphall.net (cpc1-cmbg20-2-0-cust759.5-4.cable.virginm.net. [86.21.218.248])
        by smtp.gmail.com with ESMTPSA id g25sm1307429edp.95.2021.04.09.05.07.20
        (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
        Fri, 09 Apr 2021 05:07:21 -0700 (PDT)
From:   John Cox <jc@kynesim.co.uk>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org
Subject: Re: [RFC] media: v4l2: Variable length controls (for h265 slice headers)
Date:   Fri, 09 Apr 2021 13:07:21 +0100
Message-ID: <16g07g50tol5128laqq557i8tfca3i2mbd@4ax.com>
References: <o8sj5g9fq0jkganestl771ld2dqrp2fqu7@4ax.com> <8ff86418-5fa3-e1ae-51e4-b10788be7991@xs4all.nl>
In-Reply-To: <8ff86418-5fa3-e1ae-51e4-b10788be7991@xs4all.nl>
User-Agent: ForteAgent/8.00.32.1272
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans

Thanks for looking at this

>Hi John,
>
>On 23/03/2021 15:12, John Cox wrote:
>> Hi all
>>=20
>> I am developing a H265 V4L2 stateless decoder. After some
>> experimentation it looks like the best way to achieve performance =
would
>> be to submit bitstream data for an entire frame in a single buffer =
with
>> an array of slice headers that point into it. The number of slices in =
a
>> frame can be very variable, often there will be just one, in nearly =
all
>> cases there will be less than 16 but the worst case could be hundreds
>> (actually theoretically it could be thousands but I'm prepared to, and
>> it is probably sensible to, reject any stream that looks like this).
>>=20
>> Given the large range of possible array sizes a (large) fixed length
>> array is very wasteful and probably slow in nearly all cases. As it
>> stands V4L2 has no variable length structure so there is a problem =
here.
>> My experience with v4l2 controls in minimal so trying to add a =
variable
>> length array control myself seems brave.  Luckily (in other channels) =
I
>> was told "Hans offered multiple times to implement variable array
>> controls himself, he just needs someone to send an RFC with details on
>> what's needed." so here I am.
>>=20
>> So as a suggestion for the interface:
>>=20
>> From the user point of view:
>>=20
>> Only the last dimension of the array can be dynamic (like a C array =
"int
>> a[10][15][];")  Otherwise we add a lot of complexity.
>
>I would limit this to single dimensional arrays for now.
>
>I think it is the first (not the last) dimension that can be dynamic: if
>you want 8 3x3 matrices, then you would set dims to [8][3][3]. So a =
variable
>length array of 3x3 matrices would have the first dimension as the =
variable
>one.

I would like to say that you have spotted my deliberate mistake, but no
- I was just wrong and you are right.

>>=20
>> VIDIOC_S_EXT_CTRLS
>> In v4l2_ext_control the user can pass in any size that is a multiple =
of
>> the element size.  If greater than the max then .size is set to the =
max
>> by the ioctl on return.
>>=20
>> VIDIOC_G_EXT_CTRLS
>> On entry .size contains the buffer size to receive the values and on
>> return it contains the size actually wanted - if the buffer can =
contain
>> the data then it is also the number filled in.
>>=20
>> VIDIOC_QUERY_EXT_CTRLS
>> Add a flag to indicate variable length and either use =
.maximum/.minimum
>> or some of the currently reserved structure to give max/min sizes
>
>dims[0] can set the maximum size of the array.

Sounds good and has obvious extensions for (later) multi-dimensional
stuff.

>> From the driver point of view - frankly anything will do as long as I
>> can find out how many headers I have. I think it is probably a good =
idea
>> to dynamically allocate the storage for such an array rather than =
having
>> a fixed size block on the end of the ctrl structure to avoid =
unnecessary
>> overallocation.
>
>The hevc slice structures are quite large, so it definitely has to be a
>dynamic allocation.
>
>>=20
>> I imagine that I've missed many important details in the sketch above,
>> but probably good to start the discussion and Hans, am I trying to =
take
>> you up on an offer you didn't actually make?
>
>So the uAPI part is fairly simple, the biggest problem is in the =
internal
>implementation. As the control framework becomes ever more complex (esp.
>with the requests support) it is getting harder and harder to add new =
features.
>
>I think that this might be a good time to start refactoring code, but =
for
>that I also need to add better testing in v4l2-compliance of esp. =
requests.
>
>It will also make it more time consuming, but I don't feel comfortable
>to continue hacking on the code without doing a cleanup first.

I look forward to our brave new cleaner dynamic world :-)

Many thanks

John Cox
