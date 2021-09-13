Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C2B440852C
	for <lists+linux-media@lfdr.de>; Mon, 13 Sep 2021 09:16:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237590AbhIMHRj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Sep 2021 03:17:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237578AbhIMHRh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Sep 2021 03:17:37 -0400
Received: from gofer.mess.org (gofer.mess.org [IPv6:2a02:8011:d000:212::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58FB7C061574
        for <linux-media@vger.kernel.org>; Mon, 13 Sep 2021 00:16:22 -0700 (PDT)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 30A97C6050; Mon, 13 Sep 2021 08:16:19 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mess.org; s=2020;
        t=1631517379; bh=Yzf1akP2aRjFIElVdEr27Pvql0XEdfkU7pVgxo6QHTE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=rD5RPAWtSaHWBxDqx+g09ZSaum+DROkx9boqcvUVsUfhDKcM1zGvMuNijdOgeV7Tq
         5GykamWt1PDZeJAc7bre+p3rJdUDSirlPpscIXwGAQvK3I4az/nHHbHZAGGiyGtYkE
         fn6GI7vpQ59o8LZLyXGegxgv+GIczoRZZmV5paAChJ7B/uUCygGP2XAiNHgtjb8OLy
         05+mQ9TUgrklWMlkOnkwdatihAx4mXbmDPd3s52pySqeICHkWZE8y8ksuUK8xdZQcY
         efLOY4HCBh53e5XN/U/s/k9PrRV/JLegxgvOFL9eaEVHdSBMdeA7csuqC5zS6qzSQO
         kmpK7w3RebmRA==
Date:   Mon, 13 Sep 2021 08:16:19 +0100
From:   Sean Young <sean@mess.org>
To:     Norman Rasmussen <norman@rasmussen.co.za>
Cc:     linux-media@vger.kernel.org
Subject: Re: [PATCH] ir-ctl: increase the size of the buffer used to read raw
 files
Message-ID: <20210913071618.GA2393@gofer.mess.org>
References: <436115bb-9f0-1e7-1682-a87c733312ad@darkskies.za.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <436115bb-9f0-1e7-1682-a87c733312ad@darkskies.za.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sun, Sep 12, 2021 at 05:51:06PM -0700, Norman Rasmussen wrote:
> Air conditioner codes typically have 100 pulse/space pairs (12 bytes +
> headers). The resulting raw IR line length is 1063, which exceeds the
> current 1024 byte buffer, and results in an error trying to parse the
> line.

Right, thanks for catching that.

> The buffers used to read pulse/space files are significantly larger than
> needed so this decreases their size, and allocates the difference to the
> buffer used to read raw IR files in order to keep the total size of
> buffers the same.

Decreasing the other sizes is not necessary, and is probably a bad thing. If
anything, I would say all of them can be increased. Something like 4096.
ir-ctl uses very little stack space so increasing them won't do any harm,
but will prevent others running into problems if their lines are too long.

Thanks,

Sean

> 
> Signed-off-by: Norman Rasmussen <norman@rasmussen.co.za>
> ---
>  utils/ir-ctl/ir-ctl.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/utils/ir-ctl/ir-ctl.c b/utils/ir-ctl/ir-ctl.c
> index 3c3bcca1..46fe12d9 100644
> --- a/utils/ir-ctl/ir-ctl.c
> +++ b/utils/ir-ctl/ir-ctl.c
> @@ -211,7 +211,7 @@ static struct send *read_file_pulse_space(struct
> arguments *args, const char *fn
>  {
>  	bool expect_pulse = true;
>  	int lineno = 0, lastspace = 0;
> -	char line[1024];
> +	char line[512];
>  	int len = 0;
>  	static const char whitespace[] = " \n\r\t";
>  	struct send *f;
> @@ -380,7 +380,7 @@ static struct send *read_file_pulse_space(struct
> arguments *args, const char *fn
>  static struct send *read_file_raw(struct arguments *args, const char
> *fname, FILE *input)
>  {
>  	int lineno = 0, lastspace = 0;
> -	char line[1024];
> +	char line[2048];
>  	int len = 0;
>  	static const char whitespace[] = " \n\r\t,";
>  	struct send *f;
> @@ -474,7 +474,7 @@ static struct send *read_file_raw(struct arguments
> *args, const char *fname, FIL
>  static struct send *read_file(struct arguments *args, const char *fname)
>  {
>  	FILE *input = fopen(fname, "r");
> -	char line[1024];
> +	char line[512];
> 
>  	if (!input) {
>  		fprintf(stderr, _("%s: could not open: %m\n"), fname);
> -- 
> 2.30.2
> 
> 
> -- 
> - Norman Rasmussen
>  - Email: norman@rasmussen.co.za
>  - Home page: http://norman.rasmussen.co.za/
