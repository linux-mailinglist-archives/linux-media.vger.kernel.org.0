Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45CCF242FAE
	for <lists+linux-media@lfdr.de>; Wed, 12 Aug 2020 21:53:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726554AbgHLTxh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 12 Aug 2020 15:53:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726512AbgHLTxg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 12 Aug 2020 15:53:36 -0400
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1620C061383
        for <linux-media@vger.kernel.org>; Wed, 12 Aug 2020 12:53:36 -0700 (PDT)
Received: by mail-ed1-x544.google.com with SMTP id cq28so2438811edb.10
        for <linux-media@vger.kernel.org>; Wed, 12 Aug 2020 12:53:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KeHj53XMBINGL4etPeM9zvlXteplHP2uLKEdSm5piPY=;
        b=iqw0mGRu2Ncc74g9405ZKQiLikZ1OY96GYJR4w1gywIyufCki56HyL0AxkOEHsA5rt
         kVSpl2Zq402qEEnu3O+zrJKF3t8TWLkwLbUrfxVWqMYnTKSpbwLOLUAIGloZli2hDGuk
         m1wGNKGosz53kwcc3bnkflO0rQyRGfW+7ECxy0bQiguSC6PbGiZMQG9iYxDfdMz7pLML
         hYuaWCXi9KxNNh0H8Rbkm8t8Znd3nge2ig9k/oYif2XnFP0Ai9ZE2ZTSrj1+zL9vi/Fp
         0YJgi0xYg9/0qk5kXBEXeeOjmRaf12+yNpXe3h1BQgT2anCm2/QBWNaD/NSxq1YaIYrs
         c5nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KeHj53XMBINGL4etPeM9zvlXteplHP2uLKEdSm5piPY=;
        b=g+02Z6cU0qeVJE2CQM6N6GH8l3GlwH32tveoRF1VtK2JKDcKWyGdLnMpx9JK1pswAn
         mGjH62Jo+NUJRm+Bc7Oj1T4xiigxOChaxEqY0/EnDfoOwzg8Kjie4VqWWAmf0nGzWYxL
         FlxloNfl71qib8A1QyxFVCR2VK+ndp+0Cnw8FPz6mufo1caQlQnrqhRRrvTlmEcWXO6U
         kZz2c3/e9x0kIQdvWPdH8/7MXmxuv6Zkf1AL3wHGz3N50/0FgIEvEWzXQfgCtcSFGYs9
         lRKOLl9Rjrd3cJ36k7NEdLUX1dXX1ZSm4ipeYig170ivGTw8eUL3AdbUcdhNYliAIh4W
         BNRA==
X-Gm-Message-State: AOAM532C8rCcOFnkk1SD6qjmkUtcIV7YGz8lQln/o5FYPoUf6S8nphoJ
        q3bh0UDr36ZkzUeMxzzCr5/1Vjflmsw0qkXFqfsouevs2Lk=
X-Google-Smtp-Source: ABdhPJzHZF6Kghrc9rvmDXvqXB6gS7NmJX9xIx0FUm8bpXjsaqzWHmQpvq4eBRc+v/UQkJ6K/AhLwe4eBbv3vRu1p5w=
X-Received: by 2002:a50:fb10:: with SMTP id d16mr1565290edq.134.1597262015376;
 Wed, 12 Aug 2020 12:53:35 -0700 (PDT)
MIME-Version: 1.0
References: <60cb280b-fb2a-86f6-aefb-cc12386b3adf@xs4all.nl>
In-Reply-To: <60cb280b-fb2a-86f6-aefb-cc12386b3adf@xs4all.nl>
From:   Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date:   Wed, 12 Aug 2020 16:53:24 -0300
Message-ID: <CAAEAJfBAgpXpe7XR-y7uMLT2-O69+M+6Ri06zhum79VHUf+d_A@mail.gmail.com>
Subject: Re: [PATCH for v5.8] vicodec: add missing v4l2_ctrl_request_hdl_put()
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 12 Aug 2020 at 07:30, Hans Verkuil <hverkuil@xs4all.nl> wrote:
>
> The check for a required control in the request was missing a call to
> v4l2_ctrl_request_hdl_put(), so the control request object was never
> released.
>
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Fixes: 997deb811bf5 ("media: vicodec: Add support for stateless decoder.")

Reviewed-by: Ezequiel Garcia <ezequiel@collabora.com>

Seems there's a similar leak in cedrus_request_validate error path,
when v4l2_ctrl_request_hdl_ctrl_find fails.

Cheers,
Ezequiel

> ---
> diff --git a/drivers/media/test-drivers/vicodec/vicodec-core.c b/drivers/media/test-drivers/vicodec/vicodec-core.c
> index 8941d73f6611..71928e30dae8 100644
> --- a/drivers/media/test-drivers/vicodec/vicodec-core.c
> +++ b/drivers/media/test-drivers/vicodec/vicodec-core.c
> @@ -1994,6 +1994,7 @@ static int vicodec_request_validate(struct media_request *req)
>         }
>         ctrl = v4l2_ctrl_request_hdl_ctrl_find(hdl,
>                                                vicodec_ctrl_stateless_state.id);
> +       v4l2_ctrl_request_hdl_put(hdl);
>         if (!ctrl) {
>                 v4l2_info(&ctx->dev->v4l2_dev,
>                           "Missing required codec control\n");
