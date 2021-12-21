Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A717347C324
	for <lists+linux-media@lfdr.de>; Tue, 21 Dec 2021 16:39:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234659AbhLUPjk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Dec 2021 10:39:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233125AbhLUPjj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Dec 2021 10:39:39 -0500
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 728B9C061574
        for <linux-media@vger.kernel.org>; Tue, 21 Dec 2021 07:39:39 -0800 (PST)
Received: by mail-ed1-x535.google.com with SMTP id y13so53561513edd.13
        for <linux-media@vger.kernel.org>; Tue, 21 Dec 2021 07:39:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uSqWNkHxbVwKCbDHC8yN7zuqOQ59lZe9HAWIQq3Vxck=;
        b=JbuVzx9BqufnHCKfRXraovVupj/FC+CBviF/LLdZ6MZWhoNK2DCnhO7DBoE3LVLBjF
         Q0mcoxLCqz2ssGUgc7ey+1wf2SzonyZerdhTmPbAzGaWxmPaBsjQ7QZeXC4qLnulBpru
         +zp850nAUvRIDEANIQW84c0Iv+t43SgvbaaSm/D8/S5W6kyxo7vNVnUC2XDpJIqugtWI
         q4ePENactm2GnXwWgzSwkgkhFZoUtIW4Q2bYsXFG5nJb/GeWdwuF4MGgV4X41MtDsfiD
         zcRVORFyw32zVGHj2LlxyPV4EhWDckXyaMDdXRJyBg2ZJCSErp2TG9XOwsGfXGQFCjnm
         +AfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uSqWNkHxbVwKCbDHC8yN7zuqOQ59lZe9HAWIQq3Vxck=;
        b=ByVMjXjVLzz3Q1v//9tiAbtssqe0H9CycMmSf+q50AuMj3Q4WQXanIygiR6Eo/Um80
         28HRgyOS4fV1J6nsUorYloRgHf8YDeNeiJuDuH7YyvsdFi5JfkHRBVtga6krkjvCJadd
         dfrjaf+zM20sZSX84rOI1LdV1bJmZuDffGbGma8+rp+I5GvXc2W56txXW0r4QD52kSc0
         /fYXTkzYdSliYnrJZz6AfL/oKZifUtwW+LZO8r+2HQCSVE58am/znvsE8P/8/97Y4Ql1
         KgAB6mevsZEC5WJp+EgOMdWX7pdqn2ogj5Ciz4i98VEgZgh2wbA+gI+NbSIEEtvJquQg
         P0Vg==
X-Gm-Message-State: AOAM532UBBatqGf2YDKuxNHaSIhp2mvNUEUMzK4v7+1sYS1SmbUHKmLN
        yYSOV3iNMZKSk/LPWe5CYs5gzfa8DnzNzmWtNkXWLQ==
X-Google-Smtp-Source: ABdhPJy03PRylskn2yDhgwNfF4XVE3q4LGy/AIaCadb6RXhONO7P2mFQh/4YJFdQXmhvc4/cVW6NYUNaGSGELAtzoJk=
X-Received: by 2002:a05:6402:22f9:: with SMTP id dn25mr3812567edb.403.1640101177757;
 Tue, 21 Dec 2021 07:39:37 -0800 (PST)
MIME-Version: 1.0
References: <20211221095326.383055-1-zhuohao@chromium.org>
In-Reply-To: <20211221095326.383055-1-zhuohao@chromium.org>
From:   Guenter Roeck <groeck@google.com>
Date:   Tue, 21 Dec 2021 07:39:26 -0800
Message-ID: <CABXOdTc46PUFYgt3dRGAk2N7Vf1=7jm763G=pXUMMJE_MCSVRw@mail.gmail.com>
Subject: Re: [PATCH v2] media: platform: Add brask to the match table
To:     Zhuohao Lee <zhuohao@chromium.org>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Benson Leung <bleung@chromium.org>,
        Guenter Roeck <groeck@chromium.org>,
        Alex Levin <levinale@chromium.org>,
        linux-media@vger.kernel.org,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Dec 21, 2021 at 1:53 AM Zhuohao Lee <zhuohao@chromium.org> wrote:
>
> The Google Brask device uses the same approach as the Google Fizz
> which enables the HDMI CEC via the cros-ec-cec driver.
>
> Signed-off-by: Zhuohao Lee <zhuohao@chromium.org>

Reviewed-by: Guenter Roeck <groeck@chromium.org>

> ---

Side note: Change log goes here. Don't expect maintainers to know what
changed in v2.

>  drivers/media/cec/platform/cros-ec/cros-ec-cec.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/media/cec/platform/cros-ec/cros-ec-cec.c b/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
> index 2d95e16cd248..8c8d8fc5e63e 100644
> --- a/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
> +++ b/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
> @@ -215,6 +215,8 @@ struct cec_dmi_match {
>  static const struct cec_dmi_match cec_dmi_match_table[] = {
>         /* Google Fizz */
>         { "Google", "Fizz", "0000:00:02.0", "Port B" },
> +       /* Google Brask */
> +       { "Google", "Brask", "0000:00:02.0", "Port B" },
>  };
>
>  static struct device *cros_ec_cec_find_hdmi_dev(struct device *dev,
> --
> 2.34.1.307.g9b7440fafd-goog
>
