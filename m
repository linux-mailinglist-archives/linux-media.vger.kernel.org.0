Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B6D5E2874A0
	for <lists+linux-media@lfdr.de>; Thu,  8 Oct 2020 14:58:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730149AbgJHM6Y convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Thu, 8 Oct 2020 08:58:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729722AbgJHM6Y (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 8 Oct 2020 08:58:24 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E6ADC061755
        for <linux-media@vger.kernel.org>; Thu,  8 Oct 2020 05:58:24 -0700 (PDT)
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1kQVUz-0005iB-Ev; Thu, 08 Oct 2020 14:58:21 +0200
Received: from pza by lupine with local (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1kQVUy-0003XU-9a; Thu, 08 Oct 2020 14:58:20 +0200
Message-ID: <a87446cfd9eac5ac92d7f948f18b9fc6611eda26.camel@pengutronix.de>
Subject: Re: [PATCHv2 1/3] s5k5baf: drop 'data' field in struct s5k5baf_fw
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org
Cc:     Kyungmin Park <kyungmin.park@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>
Date:   Thu, 08 Oct 2020 14:58:20 +0200
In-Reply-To: <20201008115913.3579973-2-hverkuil-cisco@xs4all.nl>
References: <20201008115913.3579973-1-hverkuil-cisco@xs4all.nl>
         <20201008115913.3579973-2-hverkuil-cisco@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 2020-10-08 at 13:59 +0200, Hans Verkuil wrote:
> struct s5k5baf_fw ends with this:
> 
>        struct {
>                u16 id;
>                u16 offset;
>        } seq[0];
>        u16 data[];
> };
> 
> which is rather confusing and can cause gcc warnings:
> 
> s5k5baf.c: In function 's5k5baf_load_setfile.isra':
> s5k5baf.c:390:13: warning: array subscript 65535 is outside the bounds of an interior zero-length array 'struct <anonymous>[0]' [-Wzero-length-bounds]
>   390 |   if (f->seq[i].offset + d <= end)
>       |       ~~~~~~^~~
> 
> It turns out that 'data[]' is used in only one place and it can
> easily be replaced by &fw->seq[0].id and 'seq[0]' can be replaced by
> 'seq[]'.
> 
> This is both more readable and solved that warnings.
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Cc: Kyungmin Park <kyungmin.park@samsung.com>
> Cc: Sylwester Nawrocki <snawrocki@kernel.org>
> ---
>  drivers/media/i2c/s5k5baf.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/i2c/s5k5baf.c b/drivers/media/i2c/s5k5baf.c
> index 42584a088273..ec6f22efe19a 100644
> --- a/drivers/media/i2c/s5k5baf.c
> +++ b/drivers/media/i2c/s5k5baf.c
> @@ -280,8 +280,7 @@ struct s5k5baf_fw {
>  	struct {
>  		u16 id;
>  		u16 offset;
> -	} seq[0];
> -	u16 data[];
> +	} seq[];
>  };
>  
>  struct s5k5baf {
> @@ -563,7 +562,7 @@ static u16 *s5k5baf_fw_get_seq(struct s5k5baf *state, u16 seq_id)
>  	if (fw == NULL)
>  		return NULL;
>  
> -	data = fw->data + 2 * fw->count;
> +	data = &fw->seq[0].id + 2 * fw->count;

Would it make sense to make this

+	data = &fw->seq[fw->count];

or

+	data = fw->seq + fw->count;

instead?

regards
Philipp
