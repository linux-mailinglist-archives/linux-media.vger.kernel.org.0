Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1C82F142127
	for <lists+linux-media@lfdr.de>; Mon, 20 Jan 2020 01:58:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728911AbgATA6H (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 19 Jan 2020 19:58:07 -0500
Received: from mail-ua1-f66.google.com ([209.85.222.66]:43286 "EHLO
        mail-ua1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728895AbgATA6H (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 19 Jan 2020 19:58:07 -0500
Received: by mail-ua1-f66.google.com with SMTP id o42so10884521uad.10
        for <linux-media@vger.kernel.org>; Sun, 19 Jan 2020 16:58:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KaojyHcqWI4LJpzN8M6IdyMUjveEL4lea69EXS7aAzs=;
        b=TbRKmBIWG9gzQtuedwlP+NAdCuVOPMwr4AgFPjLRnaQJoK6F5QijFrUewj9k5umKde
         4fi5SBgG3hPW2eNtfEgKuTeugKgTSrZ3D6uQFyGjrGSr+XayIbX2E4Li9dtvymF8z509
         QV/RsYLZuzmn6mwaz+ypChXqSqoO2wGdSNjx9Oh+RFG3lNWd38BuNRpTlfigqw9ix10Q
         CgftWg1Fi/uSg4O1XeY9uxDXs6bBpnm7NafivdSf5iKbp9G3IdG9mEl4GUL33Q5B3zwE
         VkBT4BPdu23kkwsnmB7Uvs6G/FEr/gdd7x7QlF3s1YK7uFM9tPuX0pKht8SkK16SrWRB
         qjEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KaojyHcqWI4LJpzN8M6IdyMUjveEL4lea69EXS7aAzs=;
        b=ny0G2tQxhmwkw79fJ9zmVInlpBY4ByO3vOsZsHdF316Zx0bE4f982E8/lhxA9ba/tR
         AAelOUDFK4t39PNGg/X5XVSCCDl8h2quyEoMo0lQ8hzXkgBHd5h2FhJKNZOOy/UF2T+B
         3BNPUqxfe7wjvelsgE4zgkbpjbNMGUsdRkiRVYiLd4kpVHdiZIVT1fRdTKsm8yeVaEPe
         gIy8HFpCNvtf0Br/4AzSC8VYJVtWmTqIUDzpPz3rvwAl5TXhq3+gHnJnugyjyRx/JuWk
         WkQbX5O7cC5h30Jq1WE1jlsb0PcCRdNN1DS3F4TsUx+6lveOgm0jF0liochKI4d0tZ8b
         N6KA==
X-Gm-Message-State: APjAAAXOxGqZcF7g1QrZ5tg428wxsRgqUJuzQ4Hi+pHRPi1Ne1Vd5xDs
        +dvVt3xYYEk0OI6C7k0p1zIlpZ6ZZL2i+0BEfgZRfwUP
X-Google-Smtp-Source: APXvYqyAbYCaa7aB/HrUR4aFjQUKMk1M/4wODTR62A8xNfIH0fruYoGz839aiMKFxDkqyEs3nNlTnvB04qVmopP597Q=
X-Received: by 2002:ab0:20a:: with SMTP id 10mr27216203uas.19.1579481886542;
 Sun, 19 Jan 2020 16:58:06 -0800 (PST)
MIME-Version: 1.0
References: <20200119123434.17567-1-dafna.hirschfeld@collabora.com>
In-Reply-To: <20200119123434.17567-1-dafna.hirschfeld@collabora.com>
From:   Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date:   Sun, 19 Jan 2020 21:57:55 -0300
Message-ID: <CAAEAJfBn1E10HJ+kEj5dfeE9fvscUQk3D-m0VBR9BS8cpH-Ztw@mail.gmail.com>
Subject: Re: [PATCH v4] media: vimc: streamer: if kthread_stop fails, ignore
 the error
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc:     linux-media <linux-media@vger.kernel.org>,
        Helen Koike <helen.koike@collabora.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        skhan@linuxfoundation.org, Hans Verkuil <hverkuil@xs4all.nl>,
        kernel@collabora.com, Dafna Hirschfeld <dafna3@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dafna,

Thanks for the patch.

On Sun, 19 Jan 2020 at 09:34, Dafna Hirschfeld
<dafna.hirschfeld@collabora.com> wrote:
>
> Ignore errors returned from kthread_stop since the
> vimc subdevices should still be notified that
> streaming stopped so they can release the memory for
> the streaming, and also kthread should be set to NULL.
> kthread_stop can return -EINTR in case the thread
> did not yet run. This can happen if userspace calls
> streamon and streamoff right after.
>
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> ---
> Changes from v3: change the comment to explain when kthread fails
>

Please keep all the history here, so we'd see the changes
done to v1, v2, v3.

>  drivers/media/platform/vimc/vimc-streamer.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/media/platform/vimc/vimc-streamer.c b/drivers/media/platform/vimc/vimc-streamer.c
> index cd6b55433c9e..26ec81b265c4 100644
> --- a/drivers/media/platform/vimc/vimc-streamer.c
> +++ b/drivers/media/platform/vimc/vimc-streamer.c
> @@ -215,9 +215,15 @@ int vimc_streamer_s_stream(struct vimc_stream *stream,
>                         return 0;
>
>                 ret = kthread_stop(stream->kthread);
> -               if (ret)
> -                       return ret;
>
> +               /*
> +                * kthread_stop returns -EINTR in cases when streamon was
> +                * immediately followed by streamoff, and the thread didn't had
> +                * a chance to run. Ignore errors to stop the stream in the
> +                * pipeline.
> +                */
> +               if (ret)
> +                       dev_warn(ved->dev, "kthread_stop returned '%d'\n", ret);

Is this situation serious enough to deserve warning the user?
If not, perhaps dev_dbg would be better.

Regards,
Ezequiel
