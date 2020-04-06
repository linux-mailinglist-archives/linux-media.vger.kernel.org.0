Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6017F19FBF6
	for <lists+linux-media@lfdr.de>; Mon,  6 Apr 2020 19:46:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726926AbgDFRqC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Apr 2020 13:46:02 -0400
Received: from mail-lj1-f179.google.com ([209.85.208.179]:37672 "EHLO
        mail-lj1-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726725AbgDFRqC (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Apr 2020 13:46:02 -0400
Received: by mail-lj1-f179.google.com with SMTP id r24so645935ljd.4
        for <linux-media@vger.kernel.org>; Mon, 06 Apr 2020 10:46:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5zkz5b+lyxxjz6HVM0h/ujZROWQ+qebFkYKKVxqEr+4=;
        b=c+HFV4+yTD2wAgZcQ/QIt1bgA5ruZ1u30ExEDWXwCeTXQHO+lomf3yAjtbaZk8biF2
         /J+f8P2CUvMvQ9TD1GVtC4fi/JpWOscKrZONQ+leoWcdYWxfCjRNWnRSDG+14KSu4j0K
         XsaynttW3sWA3h6B+PZsAToiUQrY50QF6twBO57Q7qwEA3wFt3DEhJ9wleZtwwb7s57O
         8JIIUFJd98DRxbCi1lHPziHRccr4qpea5lu+qDxmc04EoJI22igxj/BK3MSPkrLMElTl
         rD2R+ocb6a4cyBvZ+c5/KlB1ME46TFkJM5p9JOalCklXPU3gBpIgNRi2Jwl3eshjHj0f
         kiew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5zkz5b+lyxxjz6HVM0h/ujZROWQ+qebFkYKKVxqEr+4=;
        b=m045By2Fz5Ueguj6GjDQCwJPN/igZ/YOVtfIkLAm5UCUTHYfUh2kMo0uKLrOr48hlJ
         /TvwvHUM3tcHL22grcoDQqIxtzdZdxFTRGp3iA4H9GTx9lJTAzUFTDeOIXiSsLF47Agk
         vV07xPnN1faMKcDdmwrhZrk7+f3n6cmlusliGdeuSC5JQaJM4+8AEv8ZwYzKa2U+yutx
         Kptt39FwSfErrLEqFuW+AprN23t8ABqo1XlsEh0JXWBgYsn3U/OIOcz4eZprGN2SNMEN
         r8kiCpUIc4tojFdsfYRtDElY8vsbfSEPvKk4H/m9U7RrQ5tUQdygRBr9nhexsOrQ7HQK
         bqgA==
X-Gm-Message-State: AGi0PuYhHnPBHftkgyZe5bGB9LWcXy9Xhc3acrCcbMETaFrndD9b25Q4
        yy7FHgxUHnn4/mmsMoBPqQ9VAF0R+pTGO0WZCU4=
X-Google-Smtp-Source: APiQypLa6FiU6+1nppUvbZXVCJDmS91r/w0upZ3KjagBrTsE78D/LU7rxYOKPcYNTbpMDzun7OObIzeizf+9hG4TVkQ=
X-Received: by 2002:a2e:b4d1:: with SMTP id r17mr234815ljm.117.1586195159701;
 Mon, 06 Apr 2020 10:45:59 -0700 (PDT)
MIME-Version: 1.0
References: <CAOMZO5BQEHA-+pMmKzQj8kteNgMACYP==ezFdz_oYhJYFWKXSw@mail.gmail.com>
 <77add588-5756-8684-3e8f-0f46cbb2442b@gmail.com>
In-Reply-To: <77add588-5756-8684-3e8f-0f46cbb2442b@gmail.com>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Mon, 6 Apr 2020 14:46:22 -0300
Message-ID: <CAOMZO5C32M-JzCtfd7_=HtyfMqyqYd6adUEj1XRB6SYGoq0a0Q@mail.gmail.com>
Subject: Re: imx6: Cannot register mem2mem
To:     Steve Longerbeam <slongerbeam@gmail.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-media <linux-media@vger.kernel.org>,
        Tim Harvey <tharvey@gateworks.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Steve,

On Mon, Apr 6, 2020 at 2:36 PM Steve Longerbeam <slongerbeam@gmail.com> wrote:

> If you're sabresd does not have the OV5640 module attached, then probe
> won't complete.

Yes, correct.

The imx6qp sabresd I am using does not have the OV5640 cameras attached to it.

> Another option would be to disable the mipi-csi2 receiver in the device
> tree:
>
> --- a/arch/arm/boot/dts/imx6qdl-sabresd.dtsi
> +++ b/arch/arm/boot/dts/imx6qdl-sabresd.dtsi
> @@ -158,7 +158,7 @@
>   };
>
>   &mipi_csi {
> -       status = "okay";
> +       status = "disabled";

I tried this suggestion and then mem2mem is successfully probed.

Thanks for your clarification!
