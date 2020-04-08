Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 39E241A1DDB
	for <lists+linux-media@lfdr.de>; Wed,  8 Apr 2020 11:06:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727835AbgDHJGZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Apr 2020 05:06:25 -0400
Received: from gofer.mess.org ([88.97.38.141]:46775 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727505AbgDHJGY (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 8 Apr 2020 05:06:24 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 3ED9AC6377; Wed,  8 Apr 2020 10:06:23 +0100 (BST)
Date:   Wed, 8 Apr 2020 10:06:23 +0100
From:   Sean Young <sean@mess.org>
To:     Rosen Penev <rosenp@gmail.com>
Cc:     linux-media@vger.kernel.org
Subject: Re: [PATCH] keytable: add compatibility for input_event_sec
Message-ID: <20200408090623.GA4777@gofer.mess.org>
References: <20200408011344.13022-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200408011344.13022-1-rosenp@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Apr 07, 2020 at 06:13:44PM -0700, Rosen Penev wrote:
> Linux 4.16 added support for this macro. When it is not available,
> define it back to the previous value.

Thanks, merged.

Sean

> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  utils/keytable/keytable.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/utils/keytable/keytable.c b/utils/keytable/keytable.c
> index bc890394..4db91267 100644
> --- a/utils/keytable/keytable.c
> +++ b/utils/keytable/keytable.c
> @@ -62,6 +62,10 @@ struct input_keymap_entry_v2 {
>  	u_int8_t  scancode[32];
>  };
>  
> +#ifndef input_event_sec
> +#define input_event_sec time.tv_sec
> +#define input_event_usec time.tv_usec
> +#endif
>  
>  #define IR_PROTOCOLS_USER_DIR IR_KEYTABLE_USER_DIR "/protocols"
>  #define IR_PROTOCOLS_SYSTEM_DIR IR_KEYTABLE_SYSTEM_DIR "/protocols"
> -- 
> 2.25.1
