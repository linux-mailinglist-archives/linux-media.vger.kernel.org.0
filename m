Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CF90127AF9
	for <lists+linux-media@lfdr.de>; Thu, 23 May 2019 12:43:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729949AbfEWKnh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 23 May 2019 06:43:37 -0400
Received: from gofer.mess.org ([88.97.38.141]:51795 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727434AbfEWKnh (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 May 2019 06:43:37 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id C558560DD0; Thu, 23 May 2019 11:43:35 +0100 (BST)
Date:   Thu, 23 May 2019 11:43:35 +0100
From:   Sean Young <sean@mess.org>
To:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        Benjamin Valentin <benpicco@googlemail.com>,
        Patrick Lerda <patrick9876@free.fr>,
        Matthias Reichl <hias@horus.com>
Subject: Re: [PATCH] media: rc-main: clean-up two warnings
Message-ID: <20190523104335.qjhul234n3kcg6ue@gofer.mess.org>
References: <eda16d66b830a1bb62129b4771b5ca8ca0ed0a9b.1558603642.git.mchehab+samsung@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eda16d66b830a1bb62129b4771b5ca8ca0ed0a9b.1558603642.git.mchehab+samsung@kernel.org>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, May 23, 2019 at 05:27:30AM -0400, Mauro Carvalho Chehab wrote:
> While correct, the code is too complex for smatch to undersdand
> that protocol will always be initialized:
> 
> 	drivers/media/rc/rc-main.c:1531 store_wakeup_protocols() error: uninitialized symbol 'protocol'.
> 	drivers/media/rc/rc-main.c:1541 store_wakeup_protocols() error: uninitialized symbol 'protocol'.
> 
> So, change it a little bit in order to avoid such warning.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>

Acked-by: Sean Young <sean@mess.org>

> ---
>  drivers/media/rc/rc-main.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/rc/rc-main.c b/drivers/media/rc/rc-main.c
> index be5fd129d728..13da4c5c7d17 100644
> --- a/drivers/media/rc/rc-main.c
> +++ b/drivers/media/rc/rc-main.c
> @@ -1502,7 +1502,7 @@ static ssize_t store_wakeup_protocols(struct device *device,
>  				      const char *buf, size_t len)
>  {
>  	struct rc_dev *dev = to_rc_dev(device);
> -	enum rc_proto protocol;
> +	enum rc_proto protocol = RC_PROTO_UNKNOWN;
>  	ssize_t rc;
>  	u64 allowed;
>  	int i;
> @@ -1511,9 +1511,7 @@ static ssize_t store_wakeup_protocols(struct device *device,
>  
>  	allowed = dev->allowed_wakeup_protocols;
>  
> -	if (sysfs_streq(buf, "none")) {
> -		protocol = RC_PROTO_UNKNOWN;
> -	} else {
> +	if (!sysfs_streq(buf, "none")) {
>  		for (i = 0; i < ARRAY_SIZE(protocols); i++) {
>  			if ((allowed & (1ULL << i)) &&
>  			    sysfs_streq(buf, protocols[i].name)) {
> -- 
> 2.21.0
