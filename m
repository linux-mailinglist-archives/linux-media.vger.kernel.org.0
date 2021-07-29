Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 542033DA080
	for <lists+linux-media@lfdr.de>; Thu, 29 Jul 2021 11:45:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235364AbhG2JpZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Jul 2021 05:45:25 -0400
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:40891 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235019AbhG2JpZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Jul 2021 05:45:25 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id 92bPmQVBPXTlc92bQmWAb2; Thu, 29 Jul 2021 11:45:20 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1627551920; bh=vbIVqTDTAteecuz2DMVo/JVX+W1bA/dNCU66Lx7X4hQ=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=oj7yqS63iQ8xIlHb6YQBYHE+KFC1OPqMIO2uSUXeJnhSiaLA/P/YGmhVRKK6GymIC
         dc3sL5xLB4XZnbqtxKr0eTGP1BB3WxT4/vo3NBDcs5n1QmSROu01fWVyGYmD1ZW4vp
         PkRCNhJfbAzF6kx40MWnun3TsUs5inX5A20u4WtMkzapxYN2wDgBtI8i8DzOBtIPco
         o02aSaxcEiq4UhrxDZsD+/rhgppOl2BCbQjUqY0c8KKQgBbIlgiRa8Ar2noTrWd3vh
         AylIMKNeKc2UKWvZ32/4ZhPiqoIu8AW4cWu4t7ChONrqom6YclnVMDNJusmzYIeEUM
         sZuKF0Auop+GA==
Subject: Re: [PATCH v2] media: em28xx: add missing em28xx_close_extension
To:     Pavel Skripkin <paskripkin@gmail.com>, mchehab@kernel.org
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        syzbot+a6969ef522a36d3344c9@syzkaller.appspotmail.com
References: <7df1705e-b2c7-ddfc-9cc5-582fb1a304e5@xs4all.nl>
 <20210721194307.12155-1-paskripkin@gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <3b1de658-ebf0-e45f-49ef-953e3467e7d4@xs4all.nl>
Date:   Thu, 29 Jul 2021 11:45:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210721194307.12155-1-paskripkin@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfKd8PN8J7/4z6Rk4e1ePDXyaG+++PODV2c39F/Q4Syb0lmmnIUmzTpFFugx8QSYNQp207C6WweJSGQkN4lW+pAqnONjyq97UP66u/ADAINzi4C7M4CUD
 07Io7n/EwXDJBBinsVPr05P29+ZaJLTjeAcm2uk60o6QJhA8Rdm+fDcZMKCjyA5M/DZgMh4I3vvPWwpPdBS6vI97twj8mdaq6L3/2cHpxa8FycfAkJWTglPe
 ZYozeKYYKgn3o5Mw8dwn4+xhbpaDW/0YcwQ7x8ReBk5DAvaaSxxHcEK9+48PgG6Vmn3FBYOW8IMVcvyW1RfAmj1K4y+gyFPyX6aPtSssmyeSwmzbiwGaDooE
 6I5+vCiJ4QeeLVj+t/0BkTQEG1EnttHDQnrVO95zCSsYsRlpFSxvUNtbJ7zsFWwqG55Pf+GovQ0pBwrVb55mH2T2ztwMjlmqMCQ2VlhUdkkae7stWducgEOx
 4bX7hHCAvWKNYvd8
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 21/07/2021 21:43, Pavel Skripkin wrote:
> If em28xx dev has ->dev_next pointer, we need to delete dev_next list node
> from em28xx_extension_devlist on disconnect to avoid UAF bugs and
> corrupted list bugs, since driver frees this pointer on disconnect.
> 
> Fixes: 1a23f81b7dc3 ("V4L/DVB (9979): em28xx: move usb probe code to a proper place")
> Reported-and-tested-by: syzbot+a6969ef522a36d3344c9@syzkaller.appspotmail.com
> Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
> ---
> 
> Changes in v2:
> 	Previous patch was completely broken. I've done some debugging
> 	again and found true root case of the reported bug.
> 
> ---
>  drivers/media/usb/em28xx/em28xx-cards.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/usb/em28xx/em28xx-cards.c b/drivers/media/usb/em28xx/em28xx-cards.c
> index c1e0dccb7408..d56b040e1bd7 100644
> --- a/drivers/media/usb/em28xx/em28xx-cards.c
> +++ b/drivers/media/usb/em28xx/em28xx-cards.c
> @@ -4139,8 +4139,10 @@ static void em28xx_usb_disconnect(struct usb_interface *intf)
>  
>  	em28xx_close_extension(dev);
>  
> -	if (dev->dev_next)
> +	if (dev->dev_next) {
>  		em28xx_release_resources(dev->dev_next);
> +		em28xx_close_extension(dev->dev_next);

Wouldn't it be better to swap these two?

That order is also used for em28xx_close_extension(dev) and em28xx_release_resources(dev).

You do need to store dev->dev_next in a temp variable, though.

Regards,

	Hans

> +	}
>  	em28xx_release_resources(dev);
>  
>  	if (dev->dev_next) {
> 

