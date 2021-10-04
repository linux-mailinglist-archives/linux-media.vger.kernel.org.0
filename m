Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 53FF642098E
	for <lists+linux-media@lfdr.de>; Mon,  4 Oct 2021 12:56:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232438AbhJDK5t (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 Oct 2021 06:57:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231167AbhJDK5s (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 4 Oct 2021 06:57:48 -0400
Received: from lb1-smtp-cloud9.xs4all.net (lb1-smtp-cloud9.xs4all.net [IPv6:2001:888:0:108::1c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5238C061745;
        Mon,  4 Oct 2021 03:55:58 -0700 (PDT)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id XLdQmgyEhk4mTXLdTm9JxD; Mon, 04 Oct 2021 12:55:56 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1633344956; bh=t303QSdfTKzaG3cHjlA1aT3kiRKmACQ1ZBJh3qWn+TI=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=vSuZ6ZptvM8eQSDyD3scRSTCIgegoI6c8KYAGibXO3ctpOSb+v0sstF9kBx3keOxK
         sF2yRiWpBZmbwPTPuhYLOvVP7EzVD+yruk4nFJEPdrDKqzDRC83GJVDta0YYjOZ3Qe
         qMiXOM9mDAV3sDx0D0ujgy1RVDKpqUXQ3/KztHpkfbTn/S0/4TjnxVAXXCvcCwIeAo
         uNIA1li0aMaRA29URVHH4oD6YqKysBvcYUYfkBgkT2uCutyUnJMcquJqsl9umoD4eM
         9fBXIgv4pwhWhYv/EtUfgCfB9v+jT7eaWMbTjwxPmacGtXFhFVknMMlQdCBo3+NZSh
         McxxsqMwkdVwQ==
Subject: Re: [PATCH] media: gspca/gl860-mi1320: avoid -Wstring-concatenation
 warning
To:     Arnd Bergmann <arnd@kernel.org>,
        Olivier Lorin <o.lorin@laposte.net>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>
Cc:     Arnd Bergmann <arnd@arndb.de>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, llvm@lists.linux.dev
References: <20210927122024.941874-1-arnd@kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <ea4cbdd2-3f78-7bc6-d378-b9edb14ce80d@xs4all.nl>
Date:   Mon, 4 Oct 2021 12:55:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20210927122024.941874-1-arnd@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfD3NrMulHZoSYEcurEIz5qTyVrIeGd6zPKAmEBjsKdlJmE1577mBBokUmG7W00P5nd77TMhY3EGm5fYZBkzzcsQVDIFRjjAVMYO0D0Au3obyaqnaqn5+
 FEZRZSWKf0/bxBu9svaJExQda0bpRngdcRlzV4dcP6fx70L8TXB7wGCjgy3AOXG22uyAVS2/Nw8djGu/upNvXkiXHLsTc3OzRPwMleFcWmNaLRDsfDYDS3ss
 9TW0Q8Rw1fQ0xgNnfwpBO2d14gMfN3CxkeX0/hfuMTB3Guj6h/yFOfG6TjAEb6jmvc4NxOnjNIdLr+6RZ3vXVTwLySbRbP6JfOTQLSwaFVABNwfQun3eM5BX
 IlGZ8J9l6L6FGgb7BsAsiPPIxkGOx+AbpcGJavfe7ybP403hp3qCZozsfAN6EgkHATRt31wE6ZNRKgOCwUw498JLetslCQ==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Arnd,

On 27/09/2021 14:20, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Newer clang versions are suspicious of definitions that mix concatenated
> strings with comma-separated arrays of strings, this has found real bugs
> elsewhere, but this seems to be a false positive:
> 
> drivers/media/usb/gspca/gl860/gl860-mi1320.c:62:37: error: suspicious concatenation of string literals in an array initialization; did you mean to separate the elements with a comma? [-Werror,-Wstring-concatenation]
>         "\xd3\x02\xd4\x28\xd5\x01\xd0\x02" "\xd1\x18\xd2\xc1"
>                                            ^
>                                           ,
> drivers/media/usb/gspca/gl860/gl860-mi1320.c:62:2: note: place parentheses around the string literal to silence warning
>         "\xd3\x02\xd4\x28\xd5\x01\xd0\x02" "\xd1\x18\xd2\xc1"
> 
> Use the extra parentheses as suggested in the warning message.

I noticed that gl860-ov9655.c uses the same construct, doesn't that produce the
same warning?

Also, does clang only warn about 'static u8 *tbl[]' initializers, or also
for 'static u8 *tbl' initializers (i.e. not a pointer array) with the same
string concatenation?

I made a patch that replaces these ugly hex strings with compound initializers:

static u8 *tbl_640[] = {
        (u8[]){
                0x0d, 0x80, 0xf1, 0x08, 0x03, 0x04, 0xf1, 0x04,
                0x04, 0x05, 0xf1, 0x02, 0x07, 0x01, 0xf1, 0x7c,
                0x08, 0x00, 0xf1, 0x0e, 0x21, 0x80, 0xf1, 0x00,
                0x0d, 0x00, 0xf1, 0x08, 0xf0, 0x00, 0xf1, 0x01,
                0x34, 0x10, 0xf1, 0x10, 0x3a, 0x43, 0xf1, 0x00,
                0xa6, 0x05, 0xf1, 0x02, 0xa9, 0x04, 0xf1, 0x04,
                0xa7, 0x02, 0xf1, 0x81, 0xaa, 0x01, 0xf1, 0xe2,
                0xae, 0x0c, 0xf1, 0x09
        }, (u8[]){
                0xf0, 0x00, 0xf1, 0x02, 0x39, 0x03, 0xf1, 0xfc,
                0x3b, 0x04, 0xf1, 0x04, 0x57, 0x01, 0xf1, 0xb6,
                0x58, 0x02, 0xf1, 0x0d, 0x5c, 0x1f, 0xf1, 0x19,
                0x5d, 0x24, 0xf1, 0x1e, 0x64, 0x5e, 0xf1, 0x1c,
                0xd2, 0x00, 0xf1, 0x00, 0xcb, 0x00, 0xf1, 0x01
        }, (u8[]){
                0xd3, 0x02, 0xd4, 0x10, 0xd5, 0x81, 0xd0, 0x02,
                0xd1, 0x08, 0xd2, 0xe1
        }
};

but it clang also warns about 'static u8 *tbl' multi-string initializers,
then it would make sense to replace all these hex-strings. It's rather
ugly.

Regards,

	Hans

> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/media/usb/gspca/gl860/gl860-mi1320.c | 24 ++++++++++----------
>  1 file changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/media/usb/gspca/gl860/gl860-mi1320.c b/drivers/media/usb/gspca/gl860/gl860-mi1320.c
> index 0749fe13160f..1253eb145c99 100644
> --- a/drivers/media/usb/gspca/gl860/gl860-mi1320.c
> +++ b/drivers/media/usb/gspca/gl860/gl860-mi1320.c
> @@ -49,44 +49,44 @@ static struct validx tbl_post_unset_alt[] = {
>  	{0x0061, 0x0000}, {0x0068, 0x000d},
>  };
>  
> -static u8 *tbl_1280[] = {
> +static u8 *tbl_1280[] = {(
>  	"\x0d\x80\xf1\x08\x03\x04\xf1\x00" "\x04\x05\xf1\x02\x05\x00\xf1\xf1"
>  	"\x06\x00\xf1\x0d\x20\x01\xf1\x00" "\x21\x84\xf1\x00\x0d\x00\xf1\x08"
>  	"\xf0\x00\xf1\x01\x34\x00\xf1\x00" "\x9b\x43\xf1\x00\xa6\x05\xf1\x00"
>  	"\xa9\x04\xf1\x00\xa1\x05\xf1\x00" "\xa4\x04\xf1\x00\xae\x0a\xf1\x08"
> -	,
> +	), (
>  	"\xf0\x00\xf1\x02\x3a\x05\xf1\xf1" "\x3c\x05\xf1\xf1\x59\x01\xf1\x47"
>  	"\x5a\x01\xf1\x88\x5c\x0a\xf1\x06" "\x5d\x0e\xf1\x0a\x64\x5e\xf1\x1c"
>  	"\xd2\x00\xf1\xcf\xcb\x00\xf1\x01"
> -	,
> +	), (
>  	"\xd3\x02\xd4\x28\xd5\x01\xd0\x02" "\xd1\x18\xd2\xc1"
> -};
> +)};
>  
> -static u8 *tbl_800[] = {
> +static u8 *tbl_800[] = { (
>  	"\x0d\x80\xf1\x08\x03\x03\xf1\xc0" "\x04\x05\xf1\x02\x05\x00\xf1\xf1"
>  	"\x06\x00\xf1\x0d\x20\x01\xf1\x00" "\x21\x84\xf1\x00\x0d\x00\xf1\x08"
>  	"\xf0\x00\xf1\x01\x34\x00\xf1\x00" "\x9b\x43\xf1\x00\xa6\x05\xf1\x00"
>  	"\xa9\x03\xf1\xc0\xa1\x03\xf1\x20" "\xa4\x02\xf1\x5a\xae\x0a\xf1\x08"
> -	,
> +	), (
>  	"\xf0\x00\xf1\x02\x3a\x05\xf1\xf1" "\x3c\x05\xf1\xf1\x59\x01\xf1\x47"
>  	"\x5a\x01\xf1\x88\x5c\x0a\xf1\x06" "\x5d\x0e\xf1\x0a\x64\x5e\xf1\x1c"
>  	"\xd2\x00\xf1\xcf\xcb\x00\xf1\x01"
> -	,
> +	), (
>  	"\xd3\x02\xd4\x18\xd5\x21\xd0\x02" "\xd1\x10\xd2\x59"
> -};
> +)};
>  
> -static u8 *tbl_640[] = {
> +static u8 *tbl_640[] = {(
>  	"\x0d\x80\xf1\x08\x03\x04\xf1\x04" "\x04\x05\xf1\x02\x07\x01\xf1\x7c"
>  	"\x08\x00\xf1\x0e\x21\x80\xf1\x00" "\x0d\x00\xf1\x08\xf0\x00\xf1\x01"
>  	"\x34\x10\xf1\x10\x3a\x43\xf1\x00" "\xa6\x05\xf1\x02\xa9\x04\xf1\x04"
>  	"\xa7\x02\xf1\x81\xaa\x01\xf1\xe2" "\xae\x0c\xf1\x09"
> -	,
> +	), (
>  	"\xf0\x00\xf1\x02\x39\x03\xf1\xfc" "\x3b\x04\xf1\x04\x57\x01\xf1\xb6"
>  	"\x58\x02\xf1\x0d\x5c\x1f\xf1\x19" "\x5d\x24\xf1\x1e\x64\x5e\xf1\x1c"
>  	"\xd2\x00\xf1\x00\xcb\x00\xf1\x01"
> -	,
> +	), (
>  	"\xd3\x02\xd4\x10\xd5\x81\xd0\x02" "\xd1\x08\xd2\xe1"
> -};
> +)};
>  
>  static s32 tbl_sat[] = {0x25, 0x1d, 0x15, 0x0d, 0x05, 0x4d, 0x55, 0x5d, 0x2d};
>  static s32 tbl_bright[] = {0, 8, 0x10, 0x20, 0x30, 0x40, 0x50, 0x60, 0x70};
> 

