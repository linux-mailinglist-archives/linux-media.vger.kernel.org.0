Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0CFA89AB1D
	for <lists+linux-media@lfdr.de>; Fri, 23 Aug 2019 11:08:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726256AbfHWJIS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 23 Aug 2019 05:08:18 -0400
Received: from ns.iliad.fr ([212.27.33.1]:58264 "EHLO ns.iliad.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725857AbfHWJIR (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 23 Aug 2019 05:08:17 -0400
Received: from ns.iliad.fr (localhost [127.0.0.1])
        by ns.iliad.fr (Postfix) with ESMTP id 8C9F3211DB;
        Fri, 23 Aug 2019 11:08:15 +0200 (CEST)
Received: from [192.168.108.37] (freebox.vlq16.iliad.fr [213.36.7.13])
        by ns.iliad.fr (Postfix) with ESMTP id 7E79921196;
        Fri, 23 Aug 2019 11:08:15 +0200 (CEST)
Subject: Re: [PATCH 6/7] media: don't do an unsigned int with a 31 bit shift
To:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
References: <4a411ba155eb062b6575aba0824123c840806c0b.1566502743.git.mchehab+samsung@kernel.org>
 <1a78a757b37d2628312e1d56d7a741ba89d42a91.1566502743.git.mchehab+samsung@kernel.org>
From:   Marc Gonzalez <marc.w.gonzalez@free.fr>
Cc:     linux-media <linux-media@vger.kernel.org>
Message-ID: <82b06099-f652-47e9-99b9-3bd3ec197a4e@free.fr>
Date:   Fri, 23 Aug 2019 11:08:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1a78a757b37d2628312e1d56d7a741ba89d42a91.1566502743.git.mchehab+samsung@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: ClamAV using ClamSMTP ; ns.iliad.fr ; Fri Aug 23 11:08:15 2019 +0200 (CEST)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 22/08/2019 21:39, Mauro Carvalho Chehab wrote:

> [PATCH 6/7] media: don't do an unsigned int with a 31 bit shift

s/unsigned int/signed int  ?

(See below as well.)

> Doing something like:
> 
> 	i32 foo = 1, bar;
> 
> 	bar = foo << 31;

For my information, why did you split the expression over two lines,
instead of just using 1 << 31 in the example above?
(Most of the cases fixed involve a literal 1)

I.e. why didn't you just say "1 << 31 has undefined behavior" ?

Maybe patch subject can also be changed to "Don't use 1 << foo" ?

> has an undefined behavior in C, as warned by cppcheck, as we're
> shifting a signed integer.

Not quite right. Shifting a signed integer is well-defined in some cases.
See paragraph 4 below. For example, 1 << 8 always resolves to 256.

    6.5.7 Bitwise shift operators

1   Syntax
             shift-expression:
                     additive-expression
                     shift-expression << additive-expression
                     shift-expression >> additive-expression

2   Constraints
    Each of the operands shall have integer type.

3   Semantics
    The integer promotions are performed on each of the operands. The type of the result is
    that of the promoted left operand. If the value of the right operand is negative or is
    greater than or equal to the width of the promoted left operand, the behavior is undefined.

4   The result of E1 << E2 is E1 left-shifted E2 bit positions; vacated bits are filled with
    zeros. If E1 has an unsigned type, the value of the result is E1 x 2^E2 , reduced modulo
    one more than the maximum value representable in the result type. If E1 has a signed
    type and non-negative value, and E1 x 2^E2 is representable in the result type, then that is
    the resulting value; otherwise, the behavior is undefined.

5   The result of E1 >> E2 is E1 right-shifted E2 bit positions. If E1 has an unsigned type
    or if E1 has a signed type and a non-negative value, the value of the result is the integral
    part of the quotient of E1 / 2^E2 . If E1 has a signed type and a negative value, the
    resulting value is implementation-defined.


> Instead, force the numbers to be unsigned, in order to solve this
> issue.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
> ---
>  drivers/media/dvb-frontends/cx24123.c           |  2 +-
>  drivers/media/pci/bt8xx/bttv-input.c            |  4 ++--
>  drivers/media/pci/cx18/cx18-ioctl.c             |  2 +-
>  drivers/media/pci/ivtv/ivtv-driver.c            |  2 +-
>  drivers/media/pci/ivtv/ivtv-ioctl.c             |  4 ++--
>  drivers/media/pci/solo6x10/solo6x10-gpio.c      |  6 +++---
>  drivers/media/platform/exynos4-is/mipi-csis.c   |  6 +++---
>  drivers/media/platform/fsl-viu.c                |  2 +-
>  drivers/media/platform/mx2_emmaprp.c            |  2 +-
>  drivers/media/platform/pxa_camera.c             |  4 ++--
>  drivers/media/platform/qcom/venus/core.c        |  2 +-
>  drivers/media/platform/s5p-jpeg/jpeg-regs.h     | 10 +++++-----
>  drivers/media/platform/s5p-mfc/s5p_mfc_opr_v5.c |  4 ++--
>  drivers/media/platform/s5p-mfc/s5p_mfc_opr_v6.c |  2 +-
>  drivers/media/radio/radio-gemtek.c              |  2 +-
>  drivers/media/usb/dvb-usb-v2/gl861.c            |  2 +-
>  drivers/media/usb/pvrusb2/pvrusb2-hdw.c         | 14 +++++++-------
>  drivers/media/usb/pvrusb2/pvrusb2-v4l2.c        |  4 ++--
>  drivers/media/v4l2-core/v4l2-ioctl.c            |  2 +-
>  19 files changed, 38 insertions(+), 38 deletions(-)
> 
> diff --git a/drivers/media/dvb-frontends/cx24123.c b/drivers/media/dvb-frontends/cx24123.c
> index ac519c3eff18..3d84ee17e54c 100644
> --- a/drivers/media/dvb-frontends/cx24123.c
> +++ b/drivers/media/dvb-frontends/cx24123.c
> @@ -431,7 +431,7 @@ static u32 cx24123_int_log2(u32 a, u32 b)
>  	u32 div = a / b;
>  	if (a % b >= b / 2)
>  		++div;
> -	if (div < (1 << 31)) {
> +	if (div < (1UL << 31)) {
>  		for (exp = 1; div > exp; nearest++)
>  			exp += exp;
>  	}

Did you pick unsigned long (rather than unsigned) because that's what is used
in the BIT macro? My concern is that UL is 64-bit wide on some platforms, and
when used in arithmetic expressions, compiler might generate worse code.

Regards.
