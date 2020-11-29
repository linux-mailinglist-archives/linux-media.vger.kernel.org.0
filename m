Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B42022C782E
	for <lists+linux-media@lfdr.de>; Sun, 29 Nov 2020 07:08:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726516AbgK2GG4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 29 Nov 2020 01:06:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726472AbgK2GGz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 29 Nov 2020 01:06:55 -0500
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B966C0613D4
        for <linux-media@vger.kernel.org>; Sat, 28 Nov 2020 22:06:15 -0800 (PST)
Received: by mail-ej1-x642.google.com with SMTP id x16so7205177ejj.7
        for <linux-media@vger.kernel.org>; Sat, 28 Nov 2020 22:06:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QH5AaLENJtnaVb0zakGwFRAJxR6ENRJ5wor2gNEi1WA=;
        b=XKnws3F/UYEV/6oLcu06/qaNXPqpi3KxhfKrP2qHWK8lJM35tOc6PztIQER6fPbes9
         RZVP4fmqf325TW4rO56DMa0tT8YOxmoCzwJlZ4BhlmXc4Le4raCWWXCMw/FuvhSrS+Wi
         /DaH8iD9CDFhWi+dIEljgHBpJK9EWtAmy6Ark=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QH5AaLENJtnaVb0zakGwFRAJxR6ENRJ5wor2gNEi1WA=;
        b=pYReYDhjj0qph9rDb0+VOz3Ebim7zAxyeg9ICm+FnuUK94t7RYKmwgziCYaL/UKc19
         vuog62CwIXHjdsmgOow41cc1a+HGyrhujXyufQmLv58R/8/9JQzml3+KrfU44FOc1RmI
         7qYQejWEb+44FgBY/5qGcZ/8AjlWoJYtNey/+mdbNqJ4Hn5QZZGBPp9YnhNemI1fgxB1
         RQ57kdFTbWDt85tPdpnlEsaQKYwMMvDVQRHirj4Sv7mj6VLLoNNWGcwSMT69acJc13UY
         ZAXwsv3URhNVPpvsAnhAQL4jCNP5q8lnPB+KMDjRPpNHxbOGcq9AS3C/WTMOXW6iZ/PO
         eQrw==
X-Gm-Message-State: AOAM5334h8IuALLTC9xotfnHGmmsD6TOIZVqhw6ueklpsf+X5zdTyHnO
        EuDpwY7RPhj5B6JSd0Oj81FCcmTKlIjU9A==
X-Google-Smtp-Source: ABdhPJzw8X+/iCYEnEf8Q5wC6knl+49UIsnMOvyJAqIY1NRCF+2QCGp8h9TJDCzul5Obwhqq1BJ5AA==
X-Received: by 2002:a17:906:77ce:: with SMTP id m14mr8472288ejn.10.1606629973560;
        Sat, 28 Nov 2020 22:06:13 -0800 (PST)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com. [209.85.221.54])
        by smtp.gmail.com with ESMTPSA id k3sm7053984ejd.36.2020.11.28.22.06.12
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 Nov 2020 22:06:12 -0800 (PST)
Received: by mail-wr1-f54.google.com with SMTP id i2so10608617wrs.4
        for <linux-media@vger.kernel.org>; Sat, 28 Nov 2020 22:06:12 -0800 (PST)
X-Received: by 2002:a5d:4388:: with SMTP id i8mr21310112wrq.262.1606629972421;
 Sat, 28 Nov 2020 22:06:12 -0800 (PST)
MIME-Version: 1.0
References: <20201111143755.24541-1-stanimir.varbanov@linaro.org> <20201111143755.24541-4-stanimir.varbanov@linaro.org>
In-Reply-To: <20201111143755.24541-4-stanimir.varbanov@linaro.org>
From:   Fritz Koenig <frkoenig@chromium.org>
Date:   Sat, 28 Nov 2020 22:05:59 -0800
X-Gmail-Original-Message-ID: <CAMfZQbxwcnk7Nx8MfDfCThDzpWX2zoXOCdLk_mNcht7T4ZVROw@mail.gmail.com>
Message-ID: <CAMfZQbxwcnk7Nx8MfDfCThDzpWX2zoXOCdLk_mNcht7T4ZVROw@mail.gmail.com>
Subject: Re: [PATCH v2 3/8] venus: hfi_cmds: Allow null buffer address on
 encoder input
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vikash Garodia <vgarodia@codeaurora.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Fritz Koenig <frkoenig@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Nov 11, 2020 at 6:38 AM Stanimir Varbanov
<stanimir.varbanov@linaro.org> wrote:
>
> Allow null buffer address for encoder input buffers. This will
> be used to send null input buffers to signal end-of-stream.
>
> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
> ---
>  drivers/media/platform/qcom/venus/hfi_cmds.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/qcom/venus/hfi_cmds.c b/drivers/media/platform/qcom/venus/hfi_cmds.c
> index 4f7565834469..2affaa2ed70f 100644
> --- a/drivers/media/platform/qcom/venus/hfi_cmds.c
> +++ b/drivers/media/platform/qcom/venus/hfi_cmds.c
> @@ -278,7 +278,7 @@ int pkt_session_etb_encoder(
>                 struct hfi_session_empty_buffer_uncompressed_plane0_pkt *pkt,
>                 void *cookie, struct hfi_frame_data *in_frame)
>  {
> -       if (!cookie || !in_frame->device_addr)
> +       if (!cookie)
>                 return -EINVAL;
>
>         pkt->shdr.hdr.size = sizeof(*pkt);
> --
> 2.17.1
>
Reviewed-by: Fritz Koenig <frkoenig@chromium.org>
