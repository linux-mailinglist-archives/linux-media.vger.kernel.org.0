Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7E513565A62
	for <lists+linux-media@lfdr.de>; Mon,  4 Jul 2022 17:53:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234362AbiGDPw6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 Jul 2022 11:52:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233644AbiGDPw5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 4 Jul 2022 11:52:57 -0400
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com [IPv6:2607:f8b0:4864:20::735])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7CAE5585
        for <linux-media@vger.kernel.org>; Mon,  4 Jul 2022 08:52:56 -0700 (PDT)
Received: by mail-qk1-x735.google.com with SMTP id k20so7054012qkj.1
        for <linux-media@vger.kernel.org>; Mon, 04 Jul 2022 08:52:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20210112.gappssmtp.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=kkQHz0ww2YIQVgHTYO/Cd9qN+mZ6MqLTHtoC/Ua9CeY=;
        b=ehC1GyWqhnzkt9U0tqD6vVyGrcf56JWE7mryGu6QPm6FIcy5fJx4gqLCQNjLM6yGuC
         X+ARQkvMHpvIw019++6sbedvfDIw7MMZh0HOMSQFVUrT9O75aF7VMHLxjUwSmhPw7Kt5
         67WpLmcBVjC00M9zuwdRwFF8hbZVsig/KxvRc1GgRGwvHu+BihBn4FPrHU/0fMMc8NSJ
         yQ0FjQfshGdL85pQogx/1nhSPDWezITV4udAUiZjQV2AEgFJyXXNsd2h6f7l3bCdQcEn
         nSwIQ+8S+yZAgzKqZyrUAqtY163R0tk93E6LuncfSRoBDtynJO0FUScgwq3cdHqkbXEJ
         vrAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=kkQHz0ww2YIQVgHTYO/Cd9qN+mZ6MqLTHtoC/Ua9CeY=;
        b=uHk2EzKH2FyrexsUkvM9V9S7zaDr4mQ/WkNtvqcXYGhO7w1RqyYvtc0M7c1/K2y2+5
         GuQmCnxyfo968IaPWdRplROdYofm+nle9scqDbkUcRr5RmitFVK2G4EyKb/Yw0W4dmRh
         qomIUvKxzEjLmkMIMQZsLZqOiZ/PveGYGAE/UuHl5xIAQnnpBZx1S50P71MJqK8fqHEM
         ZxGD7uPpVmDzLQluMyTcBDSFz4LkIucG65AhgJn0FNIIvP+0Frr9NGyhddMS9iImMQZW
         J+BBJ9E813f82wG0zdEukJVsKWxOhnXsBMvlyX4iUv45+QUIvOrziwfsQEqWaANavHsJ
         J8pg==
X-Gm-Message-State: AJIora/kC2s6VmfJk1GHOu4fRUtSXrV7l81JfSENIcpxZNoD0YcOEP7p
        pMDzb9EIv6z5YGQHt59rnGaUIg==
X-Google-Smtp-Source: AGRyM1uq3pWuIbn7d6DZOlNB7cr29HzHN90LvHKoA9KKvyhygy9ZnVvJIXP/h9QMa15vgHtdujUV6Q==
X-Received: by 2002:ae9:ec19:0:b0:6ae:e43b:80ff with SMTP id h25-20020ae9ec19000000b006aee43b80ffmr20513084qkg.324.1656949975812;
        Mon, 04 Jul 2022 08:52:55 -0700 (PDT)
Received: from nicolas-tpx395.localdomain (mtl.collabora.ca. [66.171.169.34])
        by smtp.gmail.com with ESMTPSA id do56-20020a05620a2b3800b006a684c87f4bsm9808338qkb.68.2022.07.04.08.52.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Jul 2022 08:52:55 -0700 (PDT)
Message-ID: <a834a00ba3c4fa8a08290c55d264307fdcf6fabd.camel@ndufresne.ca>
Subject: Re: [PATCH] media: videobuf2: add V4L2_BUF_FLAG_CODECCONFIG flag
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Ming Qian <ming.qian@nxp.com>, mchehab@kernel.org,
        hverkuil-cisco@xs4all.nl
Cc:     shawnguo@kernel.org, robh+dt@kernel.org, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Date:   Mon, 04 Jul 2022 11:52:54 -0400
In-Reply-To: <20220628021909.14620-1-ming.qian@nxp.com>
References: <20220628021909.14620-1-ming.qian@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.2 (3.44.2-1.fc36) 
MIME-Version: 1.0
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le mardi 28 juin 2022 =C3=A0 10:19 +0800, Ming Qian a =C3=A9crit=C2=A0:
> By setting the V4L2_BUF_FLAG_CODECCONFIG flag,
> user-space should be able to hint decoder
> the vb2 only contains codec config header,
> but does not contain any frame data.
> It's only used for parsing header, and can't be decoded.

This is copied from OMX specification. I think we we import this, we should=
 at
least refer to the original.

>=20
> Current, it's usually used by android.
>=20
> Signed-off-by: Ming Qian <ming.qian@nxp.com>
> ---
>  Documentation/userspace-api/media/v4l/buffer.rst | 9 +++++++++
>  include/uapi/linux/videodev2.h                   | 2 ++
>  2 files changed, 11 insertions(+)
>=20
> diff --git a/Documentation/userspace-api/media/v4l/buffer.rst b/Documenta=
tion/userspace-api/media/v4l/buffer.rst
> index 4638ec64db00..acdc4556f4f4 100644
> --- a/Documentation/userspace-api/media/v4l/buffer.rst
> +++ b/Documentation/userspace-api/media/v4l/buffer.rst
> @@ -607,6 +607,15 @@ Buffer Flags
>  	the format. Any subsequent call to the
>  	:ref:`VIDIOC_DQBUF <VIDIOC_QBUF>` ioctl will not block anymore,
>  	but return an ``EPIPE`` error code.
> +    * .. _`V4L2-BUF-FLAG-CODECCONFIG`:
> +
> +      - ``V4L2_BUF_FLAG_CODECCONFIG``
> +      - 0x00200000
> +      - This flag may be set when the buffer only contains codec config
> +    header, but does not contain any frame data. Usually the codec confi=
g
> +    header is merged to the next idr frame, with the flag
> +    ``V4L2_BUF_FLAG_KEYFRAME``, but there is still some scenes that will
> +    split the header and queue it separately.

I think the documentation is clear. Now, if a driver uses this, will existi=
ng
userland (perhaps good to check GStreamer, FFMPEG and Chromium ?) will brea=
k ?
So we need existing driver to do this when flagged to, and just copy/append=
 when
the userland didn't opt-in that feature ?

>      * .. _`V4L2-BUF-FLAG-REQUEST-FD`:
> =20
>        - ``V4L2_BUF_FLAG_REQUEST_FD``
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev=
2.h
> index 5311ac4fde35..8708ef257710 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -1131,6 +1131,8 @@ static inline __u64 v4l2_timeval_to_ns(const struct=
 timeval *tv)
>  #define V4L2_BUF_FLAG_TSTAMP_SRC_SOE		0x00010000
>  /* mem2mem encoder/decoder */
>  #define V4L2_BUF_FLAG_LAST			0x00100000
> +/* Buffer only contains codec header */
> +#define V4L2_BUF_FLAG_CODECCONFIG		0x00200000
>  /* request_fd is valid */
>  #define V4L2_BUF_FLAG_REQUEST_FD		0x00800000
> =20

