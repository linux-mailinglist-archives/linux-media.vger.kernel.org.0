Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9CF792B1E71
	for <lists+linux-media@lfdr.de>; Fri, 13 Nov 2020 16:19:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726437AbgKMPTT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Nov 2020 10:19:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726336AbgKMPTS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Nov 2020 10:19:18 -0500
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com [IPv6:2607:f8b0:4864:20::d29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2B18C0613D1;
        Fri, 13 Nov 2020 07:19:18 -0800 (PST)
Received: by mail-io1-xd29.google.com with SMTP id m13so10090222ioq.9;
        Fri, 13 Nov 2020 07:19:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bqRrT6n4Vt1rS9HMAlB35cwH9rz6tcyPRQ27xyoMdUQ=;
        b=XQGBaBOSBVueXzyy7FaPrYWdq0ubcfRoz7ooPOP3IY0J25h/knA7nN0MRWA63MOsB8
         QeqS6PfZft0QkNHlRByM0djLMXG/8NLDrHTHL0ik9wx0jhD2JuCiCT1hmH03CwqDkdY/
         XvrFAPFStX265jOxEAVijm1w8nxdUYaZo7FUk5U7uo1p2PJWevYSsoZmHmzIuyhm5Zpd
         K9TS87ZPq1mibZpT9ZbmQJltnqoA+MWqByjDJA6oMePcbzd1gGB+bj35Baj/Qwg5Nz11
         xUYcPsumR+fBIM7yzUQrBij7X4oG1iCwM/mkvZxBKk/3+PB6znn2QpicwBTOezF3BlxF
         7VvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bqRrT6n4Vt1rS9HMAlB35cwH9rz6tcyPRQ27xyoMdUQ=;
        b=cSvIdaOhYPKmoxD368yOXN8F5l/BkN1KmbYT1oZK4n/rHGPJSNtWBdFayqrh0L1LbP
         g41GvCaB3e0KYUD4ey41Oba0v0qTihhVbCl4baVBr8wjP974hw8jH3EXDJ1wkqZbYuvU
         29Zsi0wP9sZu7kjuyaohAeBZ6pka6iYQE0rJlAw6q0ejBkFm6ME09kIbylPoZfJqzKrK
         M3CDP74DewtRrlJSv4AmPBS76pzPkV59vTi3Ezb411Q+hctFkMJ7yrtRHxAUL2IwcbbW
         Ko7DdmBYp7Wo8qbefCQ9Wm2DFHc4vnDDK0SFmr1GHc+9FDLpq8f885d/l+8qjnfOECPj
         YBcg==
X-Gm-Message-State: AOAM533IiXE//oRiMVRy834K9U8mNIY08VVRaJamXkZ7jSNGtjoHY0Ut
        moY7zWnBq3+g2DS69rZVjIov3sKMB9ARkHfvZd0=
X-Google-Smtp-Source: ABdhPJxELH4sk5PYBwRPvCMwn4LRdM8KnpuDJ+4GNlMXPaICm/hjFKFxDXitRZ3K4SAEsvuj64lghL1DAcr7a8/Sl4w=
X-Received: by 2002:a6b:f816:: with SMTP id o22mr189015ioh.101.1605280756142;
 Fri, 13 Nov 2020 07:19:16 -0800 (PST)
MIME-Version: 1.0
References: <c1bcb5eedc160e99d65576d431816a41@codeaurora.org>
In-Reply-To: <c1bcb5eedc160e99d65576d431816a41@codeaurora.org>
From:   Josh Boyer <jwboyer@gmail.com>
Date:   Fri, 13 Nov 2020 10:19:05 -0500
Message-ID: <CA+5PVA5eWkyWuG6ehcfsO=h_LSOzyOpdB_d3=y0O6m+jeeobEg@mail.gmail.com>
Subject: Re: Update venus firmware files for v5.4
To:     asitshah@codeaurora.org
Cc:     Linux Firmware <linux-firmware@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-media-owner@vger.kernel.org, vgarodia@codeaurora.org,
        dikshita@codeaurora.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Pulled and pushed out.

josh

On Fri, Nov 6, 2020 at 12:10 AM <asitshah@codeaurora.org> wrote:
>
> Hi Team,
>
> Please include updated Venus Firmware bins for v5.4.
>
> Snapshot of pull request is as below, let me know if anything is
> missing.
>
> >>>>>>
>
> The following changes since commit
> dae4b4cd084102cd49c37aa8b579b208028ab025:
>
>    Merge branch 'v1.1.5' of
> https://github.com/irui-wang/linux_fw_vpu_v1.1.5 into main (2020-10-23
> 08:10:37 -0400)
>
> are available in the git repository at:
>
>    https://github.com/shahasit/video-linux-firmware/tree/master
>
> for you to fetch changes up to 8a46c32a26b3f22835543b158877aa0b0e01e8d6:
>
>    qcom : updated venus firmware files for v5.4 (2020-11-06 10:33:37
> +0530)
>
> ----------------------------------------------------------------
> Asit Shah (1):
>        qcom : updated venus firmware files for v5.4
>
>   qcom/venus-5.4/venus.b00 | Bin 212 -> 212 bytes
>   qcom/venus-5.4/venus.b01 | Bin 6808 -> 6808 bytes
>   qcom/venus-5.4/venus.b02 | Bin 873100 -> 873680 bytes
>   qcom/venus-5.4/venus.b03 | Bin 33792 -> 33792 bytes
>   qcom/venus-5.4/venus.mbn | Bin 919212 -> 919792 bytes
>   qcom/venus-5.4/venus.mdt | Bin 7020 -> 7020 bytes
>   6 files changed, 0 insertions(+), 0 deletions(-)
>
> <<<<<<
>
> Regards,
> Asit
