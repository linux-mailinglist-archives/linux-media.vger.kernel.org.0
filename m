Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9BCC82279FA
	for <lists+linux-media@lfdr.de>; Tue, 21 Jul 2020 09:57:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726919AbgGUH5J (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Jul 2020 03:57:09 -0400
Received: from gofer.mess.org ([88.97.38.141]:51197 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726614AbgGUH5I (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Jul 2020 03:57:08 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 5B4B5C63E8; Tue, 21 Jul 2020 08:57:07 +0100 (BST)
Date:   Tue, 21 Jul 2020 08:57:07 +0100
From:   Sean Young <sean@mess.org>
To:     Hans Petter Selasky <hps@selasky.org>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: [PATCH] [MEDIA] Use standard integer types
Message-ID: <20200721075707.GA1497@gofer.mess.org>
References: <4c32e020-1da4-5fbd-a445-121d361bd1e0@selasky.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4c32e020-1da4-5fbd-a445-121d361bd1e0@selasky.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Jul 20, 2020 at 08:10:18PM +0200, Hans Petter Selasky wrote:
> Fixes compilation under FreeBSD.

This looks good, but there are other places which uses the same types:

https://git.linuxtv.org/v4l-utils.git/tree/utils/keytable/keytable.c#n58

https://git.linuxtv.org/v4l-utils.git/tree/utils/keytable/keytable.c#n85

Do these not affect the build?

> 
> Signed-off-by: Hans Petter Selasky <hps@selasky.org>
> ---
>  utils/common/keymap.h | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/utils/common/keymap.h b/utils/common/keymap.h
> index 99833827..dc198bc1 100644
> --- a/utils/common/keymap.h
> +++ b/utils/common/keymap.h
> @@ -2,6 +2,8 @@
>  #ifndef __KEYMAP_H
>  #define __KEYMAP_H

Your patch got mangled, there two spaces before the # on these two lines.

Thanks

Sean

> 
> +#include <stdint.h>
> +
>  struct keymap {
>  	struct keymap *next;
>  	char *name;
> @@ -20,16 +22,16 @@ struct protocol_param {
> 
>  struct scancode_entry {
>  	struct scancode_entry *next;
> -	u_int64_t scancode;
> +	uint64_t scancode;
>  	char *keycode;
>  };
> 
>  struct raw_entry {
>  	struct raw_entry *next;
> -	u_int64_t scancode;
> -	u_int32_t raw_length;
> +	uint64_t scancode;
> +	uint32_t raw_length;
>  	char *keycode;
> -	u_int32_t raw[1];
> +	uint32_t raw[1];
>  };
> 
>  void free_keymap(struct keymap *map);
> -- 
> 2.27.0
