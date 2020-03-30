Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ABF21198761
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2020 00:29:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729223AbgC3W3b (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Mar 2020 18:29:31 -0400
Received: from gofer.mess.org ([88.97.38.141]:59273 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728987AbgC3W3b (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Mar 2020 18:29:31 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 962AFC635C; Mon, 30 Mar 2020 23:29:29 +0100 (BST)
Date:   Mon, 30 Mar 2020 23:29:29 +0100
From:   Sean Young <sean@mess.org>
To:     Rosen Penev <rosenp@gmail.com>
Cc:     linux-media@vger.kernel.org
Subject: Re: [PATCH] keytable: use input_event properly
Message-ID: <20200330222929.GA7631@gofer.mess.org>
References: <20200330212434.10155-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200330212434.10155-1-rosenp@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Mar 30, 2020 at 02:24:34PM -0700, Rosen Penev wrote:
> It does not use time_t under musl when time_t is 64-bit. The struct has
> compatibility defines. Instead of using time_t directly, use those
> defines.
> 
> Fixes compilation under musl 1.2.0 under 32-bit OSes.

Looks good, merged.

Thanks,

Sean

> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  utils/keytable/keytable.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/utils/keytable/keytable.c b/utils/keytable/keytable.c
> index aad993ea..bc890394 100644
> --- a/utils/keytable/keytable.c
> +++ b/utils/keytable/keytable.c
> @@ -1551,7 +1551,7 @@ static void test_event(struct rc_device *rc_dev, int fd)
>  
>  		for (i = 0; i < rd / sizeof(struct input_event); i++) {
>  			printf(_("%ld.%06ld: event type %s(0x%02x)"),
> -				ev[i].time.tv_sec, ev[i].time.tv_usec,
> +				ev[i].input_event_sec, ev[i].input_event_usec,
>  				get_event_name(events_type, ev[i].type), ev[i].type);
>  
>  			switch (ev[i].type) {
> -- 
> 2.25.1
