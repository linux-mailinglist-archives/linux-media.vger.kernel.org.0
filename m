Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 95E02DAA2D
	for <lists+linux-media@lfdr.de>; Thu, 17 Oct 2019 12:40:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2408920AbfJQKkX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Oct 2019 06:40:23 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:38425 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389582AbfJQKkX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Oct 2019 06:40:23 -0400
Received: by mail-wr1-f68.google.com with SMTP id o15so1327266wru.5
        for <linux-media@vger.kernel.org>; Thu, 17 Oct 2019 03:40:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4/6DDVX5d7vla6YdRzzXi4A/aTsU47xXCqt0sHgvNJI=;
        b=b7uU5/qVvchaiINd/RS0pySCibpjekZMTg/nCw+/HXBI9+Pgl7stu+UXnaTclMwT2c
         1eSJ6U8y/kb8M1WgcPZOLSTv6OXOcO25YZcQZG2grBznUUDslBfqnFr9Jlw/4MLtKFPD
         7aA7N4g/X4vxA9wQOr6VyDwq4TihE4t4c4sDW44y7O4yXnVgH1sLhn5Nja2QNct+rj3F
         K0z8IIOiatmGjZycmkdmpMbojJoje8yEnfzRdaJDKnTCTvw9HSQesdS7n8mrM7dn7Kmb
         tP7FGCYPvfvjF2uD16kWYro16YyetybjigpBNCUbWxJHvm5vKma38U0cAvyntr+HK2Ot
         qQ1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4/6DDVX5d7vla6YdRzzXi4A/aTsU47xXCqt0sHgvNJI=;
        b=dj/lot9WzPVC8v2eXC1+TMBWCcuhq54oYxNDDQqqR0OxLcv5RyZymfS6RkL4Lok3fS
         uKTs/dXMIRD8LZ1t5oilxNB0jzqCUxJRuuBid+5ZtsRu8s7hO9Dyawph/dG31pkRJG/R
         qG3rEnaQFlhQzOxtOcSasOlZHuPDRAnpDvx/ARdqDKbDaGDp6I19PZHFyR1BSPPswaJf
         ZSE3BSnAkOu3aLayDAwHCVPjSL9BTKFnm3YhKomviAuaOaI++hHR2e9V04c+DNOlq2Wn
         cOD1gUBkkzbsCBg7q3GQOyIJIAH2Qtdfc2QvEqx6kG1Gg2RlV9aX+hNv231yExnVBT08
         ieAQ==
X-Gm-Message-State: APjAAAV2NQV06tTa+VOjZBOFMzwg4S0bOUkJaPADWQl0b4Uv4sh2fjub
        kv9tOP2tEH4jqveqOG8WAYYVBi0t3umFEOKxCLvKew==
X-Google-Smtp-Source: APXvYqyC2edEc9qfn+I1WvpyzxwBarwmlWbf4ewvcSmG/uzwfHbxRt8+59/qqTKVy660i6Wd6+svULPi91Gp2L9gNog=
X-Received: by 2002:adf:dd8b:: with SMTP id x11mr2393112wrl.113.1571308820493;
 Thu, 17 Oct 2019 03:40:20 -0700 (PDT)
MIME-Version: 1.0
References: <20191011103902.3145-1-wuxy@bitland.com.cn>
In-Reply-To: <20191011103902.3145-1-wuxy@bitland.com.cn>
From:   Tomasz Figa <tfiga@google.com>
Date:   Thu, 17 Oct 2019 19:40:08 +0900
Message-ID: <CAAFQd5Btb22tdJD74bmwYqaCYukeoX=aRUdoobpBdXX1W67LdQ@mail.gmail.com>
Subject: Re: [PATCH] media: ov5695: enable vsync pin output
To:     wuxy@bitland.com.cn
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        dongchun.zhu@mediatek.corp-partner.google.com,
        Nicolas Boichat <drinkcat@google.com>,
        wuxy <wuxy@bitland.corp-partner.google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Xingyu,

On Fri, Oct 11, 2019 at 7:39 PM <wuxy@bitland.com.cn> wrote:
>
> From: wuxy <wuxy@bitland.corp-partner.google.com>
>

Thanks for the patch! Please see my comments inline.

> For Kukui project, the ov5695 vsync signal needs to
> be set to output,from ov5695 datasheet,the related
> register control methods as follows:
>
> 0x3002 Bit[7] FISIN/VSYNC output enable
> 0x3010 Bit[7] enable FISIN/VSYNC as GPIO controlled by register
> 0x3008 Bit[7] register control FISIN/VSYNC output
>
> TEST= boot to shell
>
> Signed-off-by: Xingyu Wu <wuxy@bitland.corp-partner.google.com>
> ---
>  drivers/media/i2c/ov5695.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/media/i2c/ov5695.c b/drivers/media/i2c/ov5695.c
> index 34b7046d9702..71f0eae6037b 100644
> --- a/drivers/media/i2c/ov5695.c
> +++ b/drivers/media/i2c/ov5695.c
> @@ -300,6 +300,9 @@ static const struct regval ov5695_global_regs[] = {
>   * mipi_datarate per lane 840Mbps
>   */
>  static const struct regval ov5695_2592x1944_regs[] = {
> +       {0x3002, 0x80},

The original value of 0xa1 that was in ov5695_global_regs[], has the
0x80 bit set already.

> +       {0x3008, 0x80},
> +       {0x3010, 0x80},

Doesn't this configure the pin to an always-1 output GPIO? I believe
the correct settings for both bits should be 0 and 0 for the pin to be
driven by the hardware vsync generator.

Best regards,
Tomasz
