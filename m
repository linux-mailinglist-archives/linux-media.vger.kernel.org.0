Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C03152CF912
	for <lists+linux-media@lfdr.de>; Sat,  5 Dec 2020 03:45:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726122AbgLECpG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Dec 2020 21:45:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726242AbgLECpF (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 4 Dec 2020 21:45:05 -0500
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8692CC061A51
        for <linux-media@vger.kernel.org>; Fri,  4 Dec 2020 18:44:25 -0800 (PST)
Received: by mail-ej1-x642.google.com with SMTP id bo9so11411905ejb.13
        for <linux-media@vger.kernel.org>; Fri, 04 Dec 2020 18:44:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IUPu2DUBMRAu12DXRp3pTRDt+ZwJx6w5SlC/8VGie84=;
        b=X+/2zN4Bmhn0nBYGcOfIC1rXbVGY00KmZn0QEb9HMuQX8po0pu/eEMHACi+xSLRuqo
         ZOsLL2CFmQlq41ARU5CRPgrW4QGNlnOHjnOqaKqVHKw5Qad+wFsDkQOHVsXNY3sdWl+U
         qX07t+jEzroLTKWy2AtVuycW561wYPO9dugHU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IUPu2DUBMRAu12DXRp3pTRDt+ZwJx6w5SlC/8VGie84=;
        b=o6HMB0kgX8MSGxdkHUV1zZCSXmNJlCUSoTETpR73IXeX41RpnsOHf+T6HK/QewNJ62
         hhFe48noiwz1m+INoLFzC/2hO64rV35152ttmeVRInZXqZdfIyDAM4WHK4M9DG/Z4eNk
         w6BSBiERz1S/yJO7JJGs4ecWcPygkuyXZWPlQJU9WNEj1KtFO1kTFCgzQrfw7dxtjC/e
         y73J67q6NLalMILvXvK4ImcyKIUUs9PWIkbqn14z/ZvemSoLDKDy4yx4vDrGDSwsGYEj
         k5Iyu/VyQOxN5i7ElzuLqaAQkdscroqZcYSsprTY5IddhK8Nf+ZudrOkS9FrnD+Et6LC
         G7bw==
X-Gm-Message-State: AOAM532lViw1HbHx+OSAPTYsnRElpJc4R1oo3uv6ufsP8eHDw9qrUrCr
        Z5EV9NHjURcYt4b73eDOTMJ1enNlR4jXgA==
X-Google-Smtp-Source: ABdhPJxXHvkiQ+G/ma8k1tAX/5JR3bMhtGPshGtWzQy+j6KV8Ox+6WBQy4hYeUXD9WsaSbaFyvdO7Q==
X-Received: by 2002:a17:906:fb1a:: with SMTP id lz26mr9783631ejb.194.1607136263895;
        Fri, 04 Dec 2020 18:44:23 -0800 (PST)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com. [209.85.221.43])
        by smtp.gmail.com with ESMTPSA id t26sm4655412edt.69.2020.12.04.18.44.22
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Dec 2020 18:44:23 -0800 (PST)
Received: by mail-wr1-f43.google.com with SMTP id r3so7111445wrt.2
        for <linux-media@vger.kernel.org>; Fri, 04 Dec 2020 18:44:22 -0800 (PST)
X-Received: by 2002:a5d:4388:: with SMTP id i8mr8217348wrq.262.1607136262520;
 Fri, 04 Dec 2020 18:44:22 -0800 (PST)
MIME-Version: 1.0
References: <20201204100139.6216-1-stanimir.varbanov@linaro.org>
In-Reply-To: <20201204100139.6216-1-stanimir.varbanov@linaro.org>
From:   Fritz Koenig <frkoenig@chromium.org>
Date:   Fri, 4 Dec 2020 18:44:09 -0800
X-Gmail-Original-Message-ID: <CAMfZQbw1GjxHbCfY2XCCw=o410ziBZndCQizh6fX7LTkhOq-nw@mail.gmail.com>
Message-ID: <CAMfZQbw1GjxHbCfY2XCCw=o410ziBZndCQizh6fX7LTkhOq-nw@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] Venus encoder improvements
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-arm-msm@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        Dikshita Agarwal <dikshita@codeaurora.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Vikash Garodia <vgarodia@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Dec 4, 2020 at 2:03 AM Stanimir Varbanov
<stanimir.varbanov@linaro.org> wrote:
>
> Hello,
>
> Changes since v1:
>   * 1/4 - fixed error handling in hfi_session_deinit (Alex)
>         - keep venc_set_properties invocation from start_streaming (Dikshita)
>   * 2/4 - keep original mutex_lock (Alex)
>   * 3/4 - move msg queue inside if statement (Fritz)
>         - move rx_req setting before triggering soft interrupt (Alex)
>   * Add one more patch 4/4 to address comments for hfi_session_init
>     EINVAL return error code (Alex)
>
> The v1 can be found at [1].
>
> regards,
> Stan
>
> [1] https://www.spinics.net/lists/linux-media/msg181634.html
>
> Stanimir Varbanov (3):
>   venus: venc: Init the session only once in queue_setup
>   venus: Limit HFI sessions to the maximum supported
>   venus: hfi: Correct session init return error
>
> Vikash Garodia (1):
>   media: venus: request for interrupt from venus
>
>  drivers/media/platform/qcom/venus/core.h      |  1 +
>  drivers/media/platform/qcom/venus/hfi.c       | 18 +++-
>  .../media/platform/qcom/venus/hfi_parser.c    |  3 +
>  drivers/media/platform/qcom/venus/hfi_venus.c | 77 ++++++++++-------
>  drivers/media/platform/qcom/venus/vdec.c      |  2 +-
>  drivers/media/platform/qcom/venus/venc.c      | 85 ++++++++++++++-----
>  6 files changed, 127 insertions(+), 59 deletions(-)
>
> --
> 2.17.1
>

I haven't had a chance to review the code yet, I'll leave that for
early next week.  In the meantime I have tested the patches and found
them to be working well.

Tested-by: Fritz Koenig <frkoenig@chromium.org>
