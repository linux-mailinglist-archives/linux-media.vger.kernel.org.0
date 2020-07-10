Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB99621B96C
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2020 17:27:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727910AbgGJP1C (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 Jul 2020 11:27:02 -0400
Received: from gofer.mess.org ([88.97.38.141]:56203 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726925AbgGJP1C (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 Jul 2020 11:27:02 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 4E1DAC63DC; Fri, 10 Jul 2020 16:27:01 +0100 (BST)
Date:   Fri, 10 Jul 2020 16:27:01 +0100
From:   Sean Young <sean@mess.org>
To:     Ismael Luceno <ismael@iodev.co.uk>
Cc:     linux-media@vger.kernel.org
Subject: Re: [PATCH] keytable: Fix missing inclusion of argp.h
Message-ID: <20200710152701.GA2738@gofer.mess.org>
References: <20200709174831.14134-1-ismael@iodev.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200709174831.14134-1-ismael@iodev.co.uk>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On Thu, Jul 09, 2020 at 07:48:31PM +0200, Ismael Luceno wrote:
> error_t is only defined by argp.h on non-glibc systems.
> 
> Signed-off-by: Ismael Luceno <ismael@iodev.co.uk>
> ---
>  utils/keytable/bpf_load.c | 1 +
>  1 file changed, 1 insertion(+)

Thank you, this does indeed fix the BPF build on alpine linux. I've
push the patch to master and the stable-1.20 branch.

Sean

> 
> diff --git a/utils/keytable/bpf_load.c b/utils/keytable/bpf_load.c
> index 9f64cf4e91e8..7ae9af4a57be 100644
> --- a/utils/keytable/bpf_load.c
> +++ b/utils/keytable/bpf_load.c
> @@ -13,6 +13,7 @@
>  #include <stdlib.h>
>  #include <linux/bpf.h>
>  #include <assert.h>
> +#include <argp.h>
>  #include "keymap.h"
>  #include "bpf.h"
>  #include "bpf_load.h"
> -- 
> 2.27.0
