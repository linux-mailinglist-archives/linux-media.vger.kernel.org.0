Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9D5127A4384
	for <lists+linux-media@lfdr.de>; Mon, 18 Sep 2023 09:52:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240236AbjIRHw2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 18 Sep 2023 03:52:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240449AbjIRHv6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 18 Sep 2023 03:51:58 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA1BF30F6
        for <linux-media@vger.kernel.org>; Mon, 18 Sep 2023 00:50:11 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D74EC43391
        for <linux-media@vger.kernel.org>; Mon, 18 Sep 2023 07:49:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1695023385;
        bh=jBdjb5xIVwJx5OfvSS8rbLhNkUfsY5Qy4gjPpywnZ0Y=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=l4VXvn+Bwp5Rc8M0x8naCrisBaKizlCec2H3nBRTik9Qbizg1KqMsmEieJ9X67pFC
         iKsjpm33sU/PBOxxZYZnmd5rJMmq8fqN1a2RX5NgSsn1G2TXFmebz8Soev2UZnWTDt
         mfKYt4WUDneiuqvRDDerI3BvDKnUNYJFSBtB08Hy1X9cMVDlvKXrmutIErPCVm0imI
         +s0hfkzjTtrPCTUEo/BKF6RuEa9jADhcz4buagr1umPvHEYa+ChU//vqa5in21a15P
         WPzO2e7qk8M7TNHgsugrSi1p/txYK9+0iACEN5OaF1mTatItwlbIl0LIkYC4x0lKj6
         I5QxDF12ZvVUg==
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-49441300156so2791723e0c.0
        for <linux-media@vger.kernel.org>; Mon, 18 Sep 2023 00:49:45 -0700 (PDT)
X-Gm-Message-State: AOJu0Yx4mLydFdSqc7NM0xrI5GJca1Dvlk+XK7bKEr55rAgKUC+WwITG
        t023VzZQy12K9FRGAgJ+ofJvdMwOXEQ9DuCkcVg=
X-Google-Smtp-Source: AGHT+IHdlhuMD/GPoRZEZK33lfKb2uGmwE5P0kVPJEZyfY0pwde5DE4GxU5St4y1dEuVNvVTRF31mvVDGYUZX810Ieo=
X-Received: by 2002:a05:6122:320e:b0:493:7ce8:9851 with SMTP id
 ci14-20020a056122320e00b004937ce89851mr6532190vkb.8.1695023384147; Mon, 18
 Sep 2023 00:49:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230914181704.4811-1-laurent.pinchart@ideasonboard.com> <20230914181704.4811-2-laurent.pinchart@ideasonboard.com>
In-Reply-To: <20230914181704.4811-2-laurent.pinchart@ideasonboard.com>
From:   Ricardo Ribalda Delgado <ribalda@kernel.org>
Date:   Mon, 18 Sep 2023 09:49:27 +0200
X-Gmail-Original-Message-ID: <CAPybu_0mYSPHwi2qQ-bCEJWwDE4rCqBg0WJ5veA1GPbVjTnz+w@mail.gmail.com>
Message-ID: <CAPybu_0mYSPHwi2qQ-bCEJWwDE4rCqBg0WJ5veA1GPbVjTnz+w@mail.gmail.com>
Subject: Re: [PATCH 01/57] media: v4l2-subdev: Document .s_stream() operation requirements
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Sakari Ailus <sakari.ailus@iki.fi>,
        Martin Kepplinger <martink@posteo.de>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        "Paul J. Murphy" <paul.j.murphy@intel.com>,
        Daniele Alessandrelli <daniele.alessandrelli@intel.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Jimmy Su <jimmy.su@intel.com>,
        Jason Chen <jason.z.chen@intel.com>,
        Arec Kao <arec.kao@intel.com>,
        Shunqian Zheng <zhengsq@rock-chips.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Mikhail Rudenko <mike.rudenko@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent

On Thu, Sep 14, 2023 at 8:16=E2=80=AFPM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> The subdev .s_stream() operation must not be called to start an already
> started subdev, or stop an already stopped one. This requirement has
> never been formally documented. Fix it.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  include/media/v4l2-subdev.h | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> index d9fca929c10b..282914ea9d45 100644
> --- a/include/media/v4l2-subdev.h
> +++ b/include/media/v4l2-subdev.h
> @@ -446,7 +446,9 @@ enum v4l2_subdev_pre_streamon_flags {
>   * @s_stream: start (enabled =3D=3D 1) or stop (enabled =3D=3D 0) stream=
ing on the
>   *     sub-device. Failure on stop will remove any resources acquired in
>   *     streaming start, while the error code is still returned by the dr=
iver.
> - *     Also see call_s_stream wrapper in v4l2-subdev.c.
> + *     The caller shall track the subdev state, and refrain from startin=
g or

What about

s/refrain/ shall not/ ?

I refrain (and fail) from eating chocolate, but I shall not eat rat poison =
:P

> + *     stopping an already started or stopped subdev. AAlso see call_s_s=
tream
> + *     wrapper in v4l2-subdev.c.

s/AAlso/Also/

>   *
>   * @g_pixelaspect: callback to return the pixelaspect ratio.
>   *
> --
> Regards,
>
> Laurent Pinchart
>
