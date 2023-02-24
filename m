Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CAFD36A211D
	for <lists+linux-media@lfdr.de>; Fri, 24 Feb 2023 19:04:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229584AbjBXSE2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Feb 2023 13:04:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229520AbjBXSE1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Feb 2023 13:04:27 -0500
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com [IPv6:2607:f8b0:4864:20::82b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3094B23651
        for <linux-media@vger.kernel.org>; Fri, 24 Feb 2023 10:04:22 -0800 (PST)
Received: by mail-qt1-x82b.google.com with SMTP id w23so261509qtn.6
        for <linux-media@vger.kernel.org>; Fri, 24 Feb 2023 10:04:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20210112.gappssmtp.com; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bx+u2jxrWIooKnQnvTZMZQOT03vWJmrOO/mxGamlw3I=;
        b=utHnK7ViPP8IIEMHObTiU24gYW/MdqOknk0TZGMMqe+MBZkuxxrPwWGvEQOQ3WKiXl
         1ecUu88H5F0OMaoNuQE7mMfPSTGxvhmmUgxY/+2FDoEsa+rr2At1AgdWG+DkFkxCfOGI
         kOxKKkb9TKqyfCRMHWj8d1CLflc+R4Pd+Qd6YLmhJVM15PLw447nfz6jmmPH1ILsk7B6
         6vlteR2wbCnMpkF87b3Hbub4MN27ew2LIZoD0+DGaJ/uGTSxCi414BU7HfltKntrXx5U
         Qh9VadxG2t1xlCRTzAZhjIJTZw6yG0w5yIgzLztWMadyo/azZBavhFPA0vfJ5pp7cdO9
         xbKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bx+u2jxrWIooKnQnvTZMZQOT03vWJmrOO/mxGamlw3I=;
        b=xKt9S3RJS/qMZRXbjoL2WboUcy1hUKBitffer4hXP98uYStpdl1fOa8LL0HTbb85q+
         WB+h7NjukNllXPmyhpjYp+OJZH+Ajp36gsxJ6+cHbmS03RtHPhb0uhDin5o4WjXGnA23
         tXUO7+vQo5kHDMc0z74y41g19SX1iNQmPK+c5m4DqywN0AIG4qBVGkEAK6uVx5Z748KC
         JjfQ2016CzK4lc+uUWxk2RgEH9gWGu2saDN+qtsr0MB/NOXBnJhzepYYcFYY8GH5ePjz
         hVbgi9EfHPiabjfzMS++It0USoGo11kAcQZ4MymzAg/LPQ02Pm1BG0diF+6fupmkqxxp
         pabA==
X-Gm-Message-State: AO0yUKUS8SFSpqAmxu8kUzVmFyjEWF7ARGLxfCtOypHmRCpKO4qP+tYg
        m/X7S75fWpsnLzzZi5s0YHCe2A==
X-Google-Smtp-Source: AK7set+TXLmLNmj6/nIcApT0F8hLwTPkJ+w+ozZOWX5Ybz7cB63TJJ5jCW2UtLCAXLfgr82GUPX+Yw==
X-Received: by 2002:a05:622a:410:b0:3bf:b950:f684 with SMTP id n16-20020a05622a041000b003bfb950f684mr6552067qtx.53.1677261861259;
        Fri, 24 Feb 2023 10:04:21 -0800 (PST)
Received: from nicolas-tpx395.localdomain (192-222-136-102.qc.cable.ebox.net. [192.222.136.102])
        by smtp.gmail.com with ESMTPSA id t41-20020a05622a182900b003bfad864e81sm4791266qtc.69.2023.02.24.10.04.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Feb 2023 10:04:20 -0800 (PST)
Message-ID: <f4becff94466ca364dc1408f7491de131a36f0c3.camel@ndufresne.ca>
Subject: Re: [PATCH v3 2/7] media: Add Y210, Y212 and Y216 formats
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Ming Qian <ming.qian@nxp.com>
Date:   Fri, 24 Feb 2023 13:04:19 -0500
In-Reply-To: <029a92fa-d1e0-54da-76b9-a6e1dd65298e@ideasonboard.com>
References: <20221221092448.741294-1-tomi.valkeinen+renesas@ideasonboard.com>
         <20221221092448.741294-3-tomi.valkeinen+renesas@ideasonboard.com>
         <691e89bd57907c96cbb8e922cb12b1264b31d471.camel@ndufresne.ca>
         <029a92fa-d1e0-54da-76b9-a6e1dd65298e@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37) 
MIME-Version: 1.0
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le jeudi 23 f=C3=A9vrier 2023 =C3=A0 15:10 +0200, Tomi Valkeinen a =C3=A9cr=
it=C2=A0:
> Hi,
>=20
> On 22/02/2023 17:28, Nicolas Dufresne wrote:
> > Hi Tomi,
> >=20
> > Le mercredi 21 d=C3=A9cembre 2022 =C3=A0 11:24 +0200, Tomi Valkeinen a =
=C3=A9crit=C2=A0:
> > > Add Y210, Y212 and Y216 formats.
> > >=20
> > > Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.co=
m>
> > > ---
> > >   .../media/v4l/pixfmt-packed-yuv.rst           | 49 ++++++++++++++++=
++-
> > >   drivers/media/v4l2-core/v4l2-ioctl.c          |  3 ++
> > >   include/uapi/linux/videodev2.h                |  8 +++
> > >   3 files changed, 58 insertions(+), 2 deletions(-)
> >=20
> > It seems you omitted to update v4l2-common.c, Ming Qian had made a supl=
icated
> > commit for this, I'll ask him if he can keep the -common changes you fo=
rgot.
>=20
> Ah, I wasn't aware of the format list in that file.
>=20
> I think you refer to the "media: imx-jpeg: Add support for 12 bit=20
> extended jpeg" series. Yes, I'm fine if he can add the -common changes=
=20
> there, but I can also send a separate patch. In fact, maybe a separate=
=20
> fix patch is better, so that we can have it merged in the early 6.3 rcs.

I don't think we need to worry about backporting this though. I simply care=
 that
we keep updating -common and encourage using it. The goal of this lib is to
provide a common set of helpers to do calculate format related information.=
 You
don't have to use it at any cost. Allocation is often the cause of memory
corruption issues, and is a very recurrent thing we have to debug and fix.

This was also discussed on IRC yesterday, for Renesas driver, "just porting=
 it"
to use that could mean duplicating the lookup, as Renesas driver also needs=
 its
own map to get the HW specific formats and other information. This looks li=
ke a
valid use case to me, and is definitely something -common could improve on.

Nicolas
