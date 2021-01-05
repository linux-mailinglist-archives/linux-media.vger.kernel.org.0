Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 171E92EABC0
	for <lists+linux-media@lfdr.de>; Tue,  5 Jan 2021 14:20:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730068AbhAENUj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Jan 2021 08:20:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727794AbhAENUi (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Jan 2021 08:20:38 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 323ECC061793
        for <linux-media@vger.kernel.org>; Tue,  5 Jan 2021 05:19:58 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id h205so72467971lfd.5
        for <linux-media@vger.kernel.org>; Tue, 05 Jan 2021 05:19:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=TEQRpiiOsNsCxymUU5I1SC6a0gUGJEle2qemadcBiq0=;
        b=iqGh8hcsqOc16yXtko6wkmo1YKWCuFS9gAR1au/+C0jmMZ1CxMwMNo7BkURu5cAieP
         0hzj2VDnRXoe7VtWUmqv4+q3YrOWrCTjY/Gsm8gFu7J9pq85yhdiuKUR9hFn3mxDa8hF
         by22psOlSPNAmBfm7y2SymJhI8gJ0+ex0y3bVjPW0cBa806SNHHEyzAoiewZcc1WGo1o
         sc321gqwQNw/EF+OF8BWJQEgqC5DlrhAZxba2mh7c/XCIXjFIdz5zlQBRQxllvW3lYPE
         FsRpYNbHLQ1C2XKtHhmUnypEuNr8slPSmM3bPGSY/k16gxMlIKhRONbVaEx/tzNrbiZK
         1Nlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=TEQRpiiOsNsCxymUU5I1SC6a0gUGJEle2qemadcBiq0=;
        b=G5K1Y+DxSm8tm0s9lMrtlK6tT1TulVIShTBnmcwOtAh7IUSVua/OY9QuOV4+6uiNBQ
         z93VbZfZu7f734NhRJt3bcELh+LR17raDi5yxaOxsqLz1sFg9Ou4XzIRDyl5yW01MEXy
         UnKlQH7MWB5GaT6xgzYxQI8iyhiKR1EKMVAgX4pBGlTtmlYVKLkQAUgXWgPZ9Uq93yM+
         95JVBi+T7ET9vPKcnS3d8VbRSyi8foa+fteilXTf2xWEN4O2aO6M23Fjt57FQqYO/QrP
         XHeXtCj5OZ5O43cnKd2Hw07hNXZ3PoeklqW46lHVeww7DDjd1pGm4UstHKGmFg9yjyEs
         krqQ==
X-Gm-Message-State: AOAM533C/DQhCEj3ePypFisDDKzw8fd/Bn81B+EOJ8SygfvljafRGswY
        otRzMkvUeGOKC88gPKgzYwQFjDaXTpbEEmrNryesABT+Ao7xCA==
X-Google-Smtp-Source: ABdhPJwqI8uUcnIlEj+GGBRuyh0bMYzBJb1ahwQ5W9xVqyROPXggfh0JNKyq+jeEE66IrE8qSIYsqPt+4lz5znnStCU=
X-Received: by 2002:a19:acd:: with SMTP id 196mr24676340lfk.539.1609852796670;
 Tue, 05 Jan 2021 05:19:56 -0800 (PST)
MIME-Version: 1.0
References: <CAOMZO5DTW_YgVgyXqtccxQUm0A2kLLVcw_EhfsN0kZ9s2hgt7Q@mail.gmail.com>
 <3c42e0cc-0e47-9e8e-993f-f67e9d2924ca@armadeus.com> <CAOMZO5AU2x_a0=UgJM598mAojY-QmgHW61KAo-ePBn08zNFGOA@mail.gmail.com>
 <CAOMZO5A_WgkOotkALDhfCjhRRxBJ6f6RmUS-yF_YcZV593JWGQ@mail.gmail.com> <d89a5263-6806-4290-4c24-b433a0b8fdeb@armadeus.com>
In-Reply-To: <d89a5263-6806-4290-4c24-b433a0b8fdeb@armadeus.com>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Tue, 5 Jan 2021 10:19:44 -0300
Message-ID: <CAOMZO5BvOH=wTxRufzGMSB+uwzzN_MpgbWvWvL6awdew6DjeOw@mail.gmail.com>
Subject: Re: imx6ull capture from OV5640
To:     =?UTF-8?Q?S=C3=A9bastien_Szymanski?= 
        <sebastien.szymanski@armadeus.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Martin Kepplinger <martin.kepplinger@puri.sm>,
        linux-media <linux-media@vger.kernel.org>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Julien Boibessot <julien.boibessot@armadeus.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi S=C3=A9bastien,

On Tue, Jan 5, 2021 at 6:49 AM S=C3=A9bastien Szymanski
<sebastien.szymanski@armadeus.com> wrote:

> I used the following gstreamer pipeline to stream on the framebuffer:
>
> gst-launch-1.0 v4l2src device=3D/dev/video1 ! v4l2convert ! fbdevsink

Thanks, this helps and now the pipeline starts and I do see the camera
image on the LCD.

I switched to the same 5.4 you used just to make sure we are in the
same codebase.

I am getting the wrong colors though. The captured image is too pinky.

Do you get the correct colors on your test?

Also, I had to describe like the polarities like this:

hsync-active =3D <0>;
vsync-active =3D <1>;
pclk-sample =3D <0>;

because if I used the same polarities from your patch, then the
pipeline does not start.

Thanks for your help!
