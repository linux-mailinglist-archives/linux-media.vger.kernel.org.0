Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4D9D92011E
	for <lists+linux-media@lfdr.de>; Thu, 16 May 2019 10:15:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726429AbfEPIPV convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Thu, 16 May 2019 04:15:21 -0400
Received: from mail-ua1-f66.google.com ([209.85.222.66]:41133 "EHLO
        mail-ua1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726272AbfEPIPV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 May 2019 04:15:21 -0400
Received: by mail-ua1-f66.google.com with SMTP id s30so944473uas.8;
        Thu, 16 May 2019 01:15:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=lMqMzp64eqAi/eeBR+JyTcWDIbdC9+XvI/n8NU7n5QM=;
        b=R4evRx+vYbqG/JQhJwd9T+3XWOXmGhlLY+ulPp5q9JSjtU2zUsEMOyPdojVfTu+gea
         WQGgcOgUTW8vrazVez2+zVD19Yiiv8ux3WcfjMxZnuhAq2hlAKsFztH6kxR5PBodfdyY
         372twh3xIZruMF0ysOLh5fSwvA4VUOQj6fC1gJc/ky8eS3gtFCQmXEPTeO7UBnDhHH+q
         +jpvWRl3k/veYT2pXO403oDFzS8mooCWRsVzf6cVgSIZrOY71MOacZolbY4qBk73bpD1
         qme0vwbIAn+VCzKi53Hj7dsEK7vwL/xKoB5iZXEz0xXm5cAMiQBOlSMnTC3GMcOCFcxn
         4cHg==
X-Gm-Message-State: APjAAAXeqw3ZDlKCuTYYITjJogPIZvJ2YIshAhSXnWrmCxn/fcky/XGk
        Vwjro1tkMau6XSysvzgRm5KS7ZmCgmeV7vkP90Y=
X-Google-Smtp-Source: APXvYqyBSEvN0lTCRcoclXAhwnpFbOFF6HXKE7zOSyJfEtKUvw9b6UvPuUatKHUACZgqu0Ig5ler61UMIdo5veArT7o=
X-Received: by 2002:ab0:5a07:: with SMTP id l7mr15977823uad.78.1557994520321;
 Thu, 16 May 2019 01:15:20 -0700 (PDT)
MIME-Version: 1.0
References: <20190516003538.32172-1-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20190516003538.32172-1-niklas.soderlund+renesas@ragnatech.se>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 16 May 2019 10:15:08 +0200
Message-ID: <CAMuHMdX_Dt92cExbWSdSkWd01b0Jp76Sb4u_fcEm9E-hOAMPCQ@mail.gmail.com>
Subject: Re: [PATCH] rcar-csi2: Fix coccinelle warning for PTR_ERR_OR_ZERO()
To:     =?UTF-8?Q?Niklas_S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        kbuild test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, May 16, 2019 at 3:50 AM Niklas Söderlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> Use the PTR_ERR_OR_ZERO() macro instead of construct:
>
>     if (IS_ERR(foo))
>         return PTR_ERR(foo);
>
>     return 0;
>
> Reported-by: kbuild test robot <lkp@intel.com>
> Fixes: 3ae854cafd76 ("rcar-csi2: Use standby mode instead of resetting")
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
