Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AD9E11A52F2
	for <lists+linux-media@lfdr.de>; Sat, 11 Apr 2020 18:51:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726107AbgDKQvM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 11 Apr 2020 12:51:12 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:35877 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726070AbgDKQvM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 11 Apr 2020 12:51:12 -0400
Received: by mail-ed1-f65.google.com with SMTP id i7so6221251edq.3
        for <linux-media@vger.kernel.org>; Sat, 11 Apr 2020 09:51:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QGitm4hT5vEdjQiE5cl7UrUlgnefjHBuKRIMEqTqvHA=;
        b=RliqBFQzoEAjd8CX8khA0cw5XcBzHfk+BTt+epEBgscM595HW+cm/dZNV/6lZ5L9jB
         3GdFXjLWWwCbANlaNANJ8wpoHMrmMeAcgkujZziHlKOh4PdU0cU+3V0GQSLvuIeEpEpR
         Tdyf4azJoO4IjjrV0FW7oDCrhZYbSOmFKxUYQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QGitm4hT5vEdjQiE5cl7UrUlgnefjHBuKRIMEqTqvHA=;
        b=l8xNKyAiA1odI/zi1A10tRpoOk+OmJLFzXEOisbEAs7OwoGMEDVkBUXc1swSgk00ew
         K3osF0luRt9PticdUSHW7iATiCbtlhVlv+aX6HQFwSyKM/CWlXcLagM1PFapFIR6kkRj
         pYlzMpLmLGHLblXIUO9gvyXTXYBcISGTqkUALjUjqJ8U8YrOvArBdzs2+YLbnjCHc3eq
         Qs0T2l9YQ09yD9ENac3eTNKPF47bavPrT/npcG8+MVG1hZQq3OXSZKCiC4jWjV82oH93
         bLCxzPgp/QiRvsh8X3m+d/uHWg/kuQJOx8YqtOXgB8SIH4TpZhWrqmClcToFjfh2Go8z
         ETLw==
X-Gm-Message-State: AGi0PuaIdQ+vLO4W5w7P7zPWxeI716juR4Sb70i5z0ssHIyDlRc/yJxc
        joA+gVVnH2VUBeMvjUnk8ZgEhmKg9pihcQ==
X-Google-Smtp-Source: APiQypJJDFDOvR5wx5BccJA5WD93sCjpQE5pS3F7Q8mP1IXUm02fTR6SqP51KT55b2z3mX3dY8eLDQ==
X-Received: by 2002:a17:907:2645:: with SMTP id ar5mr8889204ejc.75.1586623869735;
        Sat, 11 Apr 2020 09:51:09 -0700 (PDT)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com. [209.85.221.45])
        by smtp.gmail.com with ESMTPSA id m24sm594429edp.49.2020.04.11.09.51.08
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 11 Apr 2020 09:51:09 -0700 (PDT)
Received: by mail-wr1-f45.google.com with SMTP id x18so1297460wrq.2
        for <linux-media@vger.kernel.org>; Sat, 11 Apr 2020 09:51:08 -0700 (PDT)
X-Received: by 2002:adf:bb94:: with SMTP id q20mr11243341wrg.105.1586623868124;
 Sat, 11 Apr 2020 09:51:08 -0700 (PDT)
MIME-Version: 1.0
References: <20190301112400.24339-1-sakari.ailus@linux.intel.com> <20190301112400.24339-2-sakari.ailus@linux.intel.com>
In-Reply-To: <20190301112400.24339-2-sakari.ailus@linux.intel.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Sat, 11 Apr 2020 18:50:55 +0200
X-Gmail-Original-Message-ID: <CAAFQd5AZgXV-2isW7Ra=4fhJ6RE2_WA_DxGgjZy+3vGgGR2i3Q@mail.gmail.com>
Message-ID: <CAAFQd5AZgXV-2isW7Ra=4fhJ6RE2_WA_DxGgjZy+3vGgGR2i3Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] staging: imgu: Address a compiler warning on alignment
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Mani, Rajmohan" <rajmohan.mani@intel.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

On Fri, Mar 1, 2019 at 12:24 PM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
>
> Address a compiler warnings on alignment of struct ipu3_uapi_awb_fr_config_s
> by adding __attribute__((aligned(32))) to a struct member of that type as
> well.
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Tested-by: Rajmohan Mani <rajmohan.mani@intel.com>
> ---
>  drivers/staging/media/ipu3/include/intel-ipu3.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/staging/media/ipu3/include/intel-ipu3.h b/drivers/staging/media/ipu3/include/intel-ipu3.h
> index eb6f52aca9929..4a0e97b0cfd2b 100644
> --- a/drivers/staging/media/ipu3/include/intel-ipu3.h
> +++ b/drivers/staging/media/ipu3/include/intel-ipu3.h
> @@ -2472,7 +2472,7 @@ struct ipu3_uapi_acc_param {
>         struct ipu3_uapi_yuvp1_yds_config yds2 __attribute__((aligned(32)));
>         struct ipu3_uapi_yuvp2_tcc_static_config tcc __attribute__((aligned(32)));
>         struct ipu3_uapi_anr_config anr;
> -       struct ipu3_uapi_awb_fr_config_s awb_fr;
> +       struct ipu3_uapi_awb_fr_config_s awb_fr __attribute__((aligned(32)));
>         struct ipu3_uapi_ae_config ae;
>         struct ipu3_uapi_af_config_s af;
>         struct ipu3_uapi_awb_config awb;
> --
> 2.11.0
>

I don't know how this patch was tested, but for me it breaks the
layout of the ipu3_uapi_acc_param struct. The result is that awb_fr is
moved from offset 37656 to 36768 and so everything else is shifted
too. The end result is "set parameters failed" when the userspace
tries to queue a parameter buffer.

To be honest, I don't like how alignments are used to define the ABI
layout. Since these are definitions specified by the IMGU firmware,
I'd suggest removing any compiler alignments, making all the structs
packed and adding explicit padding in terms of u8 arrays, which is the
proper way to enforce a specific binary layout.

Following is the relevant snippet from a diff of pahole output before
and after this patch:

--- pahole.good      2020-04-11 16:40:18.706133867 +0000
+++ pahole.bad      2020-04-11 16:29:48.513110117 +0000
@@ -7353,29 +7349,27 @@ // struct ipu3_uapi_acc_param {
        struct ipu3_uapi_anr_config anr;                 /* 36020   736 */

        /* XXX last struct has 24 bytes of padding */
+       /* XXX 12 bytes hole, try to pack */

-       /* --- cacheline 574 boundary (36736 bytes) was 20 bytes ago --- */
-       struct ipu3_uapi_awb_fr_config_s awb_fr
__attribute__((__aligned__(32))); /* 36756    32 */
-       struct ipu3_uapi_ae_config ae;                   /* 36788   480 */
+       /* --- cacheline 574 boundary (36736 bytes) was 32 bytes ago --- */
+       struct ipu3_uapi_awb_fr_config_s awb_fr
__attribute__((__aligned__(32))); /* 36768    32 */
+       /* --- cacheline 575 boundary (36800 bytes) --- */
+       struct ipu3_uapi_ae_config ae;                   /* 36800   480 */

        /* XXX last struct has 24 bytes of padding */

-       /* --- cacheline 582 boundary (37248 bytes) was 20 bytes ago --- */
-       struct ipu3_uapi_af_config_s af;                 /* 37268    96 */
+       /* --- cacheline 582 boundary (37248 bytes) was 32 bytes ago --- */
+       struct ipu3_uapi_af_config_s af;                 /* 37280    96 */

        /* XXX last struct has 20 bytes of padding */

-       /* --- cacheline 583 boundary (37312 bytes) was 52 bytes ago --- */
-       struct ipu3_uapi_awb_config awb;                 /* 37364    32 */
-
-       /* Force padding: */
-       struct ipu3_uapi_awb_config :256;
+       /* --- cacheline 584 boundary (37376 bytes) --- */
+       struct ipu3_uapi_awb_config awb;                 /* 37376    32 */

        /* size: 37408, cachelines: 585, members: 21 */
-       /* sum members: 37152, holes: 13, sum holes: 244 */
-       /* padding: 12 */
+       /* sum members: 37152, holes: 14, sum holes: 256 */
        /* paddings: 3, sum paddings: 68 */
-       /* forced alignments: 16, forced holes: 13, sum forced holes: 244 */
+       /* forced alignments: 16, forced holes: 14, sum forced holes: 256 */
        /* last cacheline: 32 bytes */
 };

Best regards,
Tomasz
