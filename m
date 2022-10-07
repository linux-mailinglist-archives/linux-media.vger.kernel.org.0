Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B63F15F805D
	for <lists+linux-media@lfdr.de>; Fri,  7 Oct 2022 23:58:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229620AbiJGV6i (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 7 Oct 2022 17:58:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229540AbiJGV6g (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 7 Oct 2022 17:58:36 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C44512791B
        for <linux-media@vger.kernel.org>; Fri,  7 Oct 2022 14:58:35 -0700 (PDT)
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2B996BBE;
        Fri,  7 Oct 2022 23:58:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1665179913;
        bh=B+tgD0d9hnFdJqtHd52gziG93js5wvTkUJtdRrIpsxU=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=glFxqQmK9VtnP7DvY66cNCPmNz/x9bD3dK/g/Pypq+5DKtT7jVIOdduwuh5guWs9X
         TQKZbiHhYRernU2b3knHxSP2Wf1KAb7P5aKlcJkGQcMH3l4FTDOqHAe7Q2JKPT00V7
         X6BGum3ROaR4N6Ts8/8xwDxHuF58/P1T1vF97tOQ=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220422192031.24895-1-devendra.tewari@gmail.com>
References: <20220422192031.24895-1-devendra.tewari@gmail.com>
Subject: Re: [PATCH] videodev2.h: apply packed attribute to union
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Devendra Tewari <devendra.tewari@gmail.com>
To:     Devendra Tewari <devendra.tewari@gmail.com>,
        linux-media@vger.kernel.org
Date:   Fri, 07 Oct 2022 22:58:31 +0100
Message-ID: <166517991147.1077487.14561113854570206898@Monstersaurus>
User-Agent: alot/0.10
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Devendra,

Quoting Devendra Tewari (2022-04-22 20:20:31)
> Fixes clang warning: field within 'v4l2_ext_control' is less than

Can you detail which version of clang this occurs with? Have you tried
more than one version?


> 'v4l2_ext_control::(anonymous union
>=20
> Signed-off-by: Devendra Tewari <devendra.tewari@gmail.com>
> ---
>  include/uapi/linux/videodev2.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev=
2.h
> index 3768a0a80830..767c52c722cd 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -1765,7 +1765,7 @@ struct v4l2_ext_control {
>                 struct v4l2_ctrl_vp9_compressed_hdr __user *p_vp9_compres=
sed_hdr_probs;
>                 struct v4l2_ctrl_vp9_frame __user *p_vp9_frame;
>                 void __user *ptr;
> -       };
> +       } __attribute__ ((packed));

This is a curious fix. It's applying a packed attribute to the union,
which I presume means that it's then applying the packed attribute to
any item in the union.

The items are all either: __s32, __s64, values - or pointers.

While applying this attribute here may fix the compiler warning, I'm not
sure it's clear why this is required. This file also has other
locations where a union inside a packed struct is not marked as packed.
Should all unions be marked with the attribute?

Is there any more context from the compiler warning beyond what is
reported above?

--
Kieran


>  } __attribute__ ((packed));
> =20
>  struct v4l2_ext_controls {
> --=20
> 2.25.1
>
