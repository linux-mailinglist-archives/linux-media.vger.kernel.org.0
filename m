Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6DBAD12D745
	for <lists+linux-media@lfdr.de>; Tue, 31 Dec 2019 10:08:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725906AbfLaJIv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 31 Dec 2019 04:08:51 -0500
Received: from gofer.mess.org ([88.97.38.141]:37767 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725770AbfLaJIv (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 31 Dec 2019 04:08:51 -0500
Received: by gofer.mess.org (Postfix, from userid 1000)
        id D46C711A001; Tue, 31 Dec 2019 09:08:48 +0000 (GMT)
Date:   Tue, 31 Dec 2019 09:08:48 +0000
From:   Sean Young <sean@mess.org>
To:     Peter Seiderer <ps.report@gmx.net>
Cc:     linux-media@vger.kernel.org
Subject: Re: [PATCH v4l-utils] keymap.h needs sys/types.h and argp.h
Message-ID: <20191231090848.GB24469@gofer.mess.org>
References: <20191218211016.18796-1-ps.report@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191218211016.18796-1-ps.report@gmx.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Peter,

On Wed, Dec 18, 2019 at 10:10:16PM +0100, Peter Seiderer wrote:
> Fixes:
> 
>   keymap.h:23:2: error: unknown type name ‘u_int32_t’
>   keymap.h:36:1: error: unknown type name ‘error_t’

It would be nice to know where/how you are encountering these errors. ir-ctl
with these changes are building fine on Fedora and Debian (unstable).

Thanks,
Sean

> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  utils/common/keymap.c      | 2 ++
>  utils/ir-ctl/bpf_encoder.c | 1 +
>  2 files changed, 3 insertions(+)
> 
> diff --git a/utils/common/keymap.c b/utils/common/keymap.c
> index f574f24f..d06deb59 100644
> --- a/utils/common/keymap.c
> +++ b/utils/common/keymap.c
> @@ -9,6 +9,8 @@
>  #include <string.h>
>  #include <limits.h>
>  #include <stdbool.h>
> +#include <sys/types.h>
> +#include <argp.h>
>  
>  #include "keymap.h"
>  #include "toml.h"
> diff --git a/utils/ir-ctl/bpf_encoder.c b/utils/ir-ctl/bpf_encoder.c
> index 82d12cc0..e3e705e7 100644
> --- a/utils/ir-ctl/bpf_encoder.c
> +++ b/utils/ir-ctl/bpf_encoder.c
> @@ -5,6 +5,7 @@
>  #include <errno.h>
>  #include <string.h>
>  #include <sys/types.h>
> +#include <argp.h>
>  
>  #include "keymap.h"
>  
> -- 
> 2.24.0
> 
