Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 37C292286CB
	for <lists+linux-media@lfdr.de>; Tue, 21 Jul 2020 19:08:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728773AbgGURHp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Jul 2020 13:07:45 -0400
Received: from gofer.mess.org ([88.97.38.141]:49947 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726686AbgGURHp (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Jul 2020 13:07:45 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id DFB8EC6415; Tue, 21 Jul 2020 18:07:43 +0100 (BST)
Date:   Tue, 21 Jul 2020 18:07:43 +0100
From:   Sean Young <sean@mess.org>
To:     Hans Petter Selasky <hps@selasky.org>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: [PATCH] [MEDIA] Use standard integer types
Message-ID: <20200721170743.GA9984@gofer.mess.org>
References: <4c32e020-1da4-5fbd-a445-121d361bd1e0@selasky.org>
 <20200721075707.GA1497@gofer.mess.org>
 <ce7dc15a-9f8e-733d-ccac-d6510c9eae11@selasky.org>
 <12e18aad-76af-885f-babe-c25cc1863cdd@selasky.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <12e18aad-76af-885f-babe-c25cc1863cdd@selasky.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Jul 21, 2020 at 12:53:42PM +0200, Hans Petter Selasky wrote:
> Fixes compilation under FreeBSD.

Thanks, applied.

Sean

> 
> Signed-off-by: Hans Petter Selasky <hps@selasky.org>
> ---
>  utils/common/keymap.h     | 10 ++++++----
>  utils/keytable/keytable.c | 24 ++++++++++++------------
>  2 files changed, 18 insertions(+), 16 deletions(-)
> 
> diff --git a/utils/common/keymap.h b/utils/common/keymap.h
> index 99833827..dc198bc1 100644
> --- a/utils/common/keymap.h
> +++ b/utils/common/keymap.h
> @@ -2,6 +2,8 @@
>  #ifndef __KEYMAP_H
>  #define __KEYMAP_H
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
> diff --git a/utils/keytable/keytable.c b/utils/keytable/keytable.c
> index 3df5fcf2..cb91f1f0 100644
> --- a/utils/keytable/keytable.c
> +++ b/utils/keytable/keytable.c
> @@ -55,11 +55,11 @@
> 
>  struct input_keymap_entry_v2 {
>  #define KEYMAP_BY_INDEX	(1 << 0)
> -	u_int8_t  flags;
> -	u_int8_t  len;
> -	u_int16_t index;
> -	u_int32_t keycode;
> -	u_int8_t  scancode[32];
> +	uint8_t  flags;
> +	uint8_t  len;
> +	uint16_t index;
> +	uint32_t keycode;
> +	uint8_t  scancode[32];
>  };
> 
>  #ifndef input_event_sec
> @@ -82,7 +82,7 @@ struct input_keymap_entry_v2 {
>  struct keytable_entry {
>  	// 64 bit int which can printed with %llx
>  	unsigned long long scancode;
> -	u_int32_t keycode;
> +	uint32_t keycode;
>  	struct keytable_entry *next;
>  };
> 
> @@ -1376,7 +1376,7 @@ static int get_input_protocol_version(int fd)
>  static void clear_table(int fd)
>  {
>  	int i, j;
> -	u_int32_t codes[2];
> +	uint32_t codes[2];
>  	struct input_keymap_entry_v2 entry;
> 
>  	/* Clears old table */
> @@ -1463,7 +1463,7 @@ static void display_proto(struct rc_device *rc_dev)
>  }
> 
> 
> -static char *get_event_name(struct parse_event *event, u_int16_t code)
> +static char *get_event_name(struct parse_event *event, uint16_t code)
>  {
>  	struct parse_event *p;
> 
> @@ -1647,14 +1647,14 @@ static void display_table_v2(struct rc_device
> *rc_dev, int fd)
>  		if (ioctl(fd, EVIOCGKEYCODE_V2, &entry) == -1)
>  			break;
> 
> -		if (entry.len == sizeof(u_int32_t)) {
> -			u_int32_t temp;
> +		if (entry.len == sizeof(uint32_t)) {
> +			uint32_t temp;
> 
>  			memcpy(&temp, entry.scancode, sizeof(temp));
> 
>  			scancode = temp;
> -		} else if (entry.len == sizeof(u_int64_t)) {
> -			u_int64_t temp;
> +		} else if (entry.len == sizeof(uint64_t)) {
> +			uint64_t temp;
> 
>  			memcpy(&temp, entry.scancode, sizeof(temp));
> 
> -- 
> 2.27.0
