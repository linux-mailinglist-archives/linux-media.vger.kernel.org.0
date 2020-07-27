Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A209322E62A
	for <lists+linux-media@lfdr.de>; Mon, 27 Jul 2020 08:58:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726890AbgG0G63 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 Jul 2020 02:58:29 -0400
Received: from mail.kernel.org ([198.145.29.99]:46942 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726116AbgG0G62 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Jul 2020 02:58:28 -0400
Received: from coco.lan (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B7CF12072E;
        Mon, 27 Jul 2020 06:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595833107;
        bh=v3uxQUZIUFYNREgoRDKNAzU54DfWJ9M6hRyKdLri09w=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=A2+300saTc3WWp3BS3NdrKDHfwdaZK/MaKd7G//I+IMugo7r+Ak0JgIu2V3YIoawq
         t3M3rlFXRTyrrKyno+/bWkwLHvpukpxt5hs8jrXL4cESCnu9ZYX6IhYxOHKY6NhOKk
         HH27mZsQzBVl+DeWEXAcK6YyVdN8SwdzYx7+O3kE=
Date:   Mon, 27 Jul 2020 08:58:23 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Rosen Penev <rosenp@gmail.com>
Cc:     linux-media@vger.kernel.org
Subject: Re: [PATCH 7/8] [clang-tidy] fix mismatching declarations
Message-ID: <20200727085823.78fa67c8@coco.lan>
In-Reply-To: <20200727031456.232955-8-rosenp@gmail.com>
References: <20200727031456.232955-1-rosenp@gmail.com>
        <20200727031456.232955-8-rosenp@gmail.com>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Sun, 26 Jul 2020 20:14:55 -0700
Rosen Penev <rosenp@gmail.com> escreveu:

> Found with readability-inconsistent-declaration-parameter-name
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  lib/include/libdvbv5/atsc_eit.h               |  4 +-
>  lib/include/libdvbv5/cat.h                    |  4 +-
>  lib/include/libdvbv5/descriptors.h            |  2 +-
>  lib/include/libdvbv5/dvb-demux.h              |  2 +-
>  lib/include/libdvbv5/dvb-dev.h                |  2 +-
>  lib/include/libdvbv5/dvb-fe.h                 |  2 +-
>  lib/include/libdvbv5/dvb-file.h               |  4 +-
>  lib/include/libdvbv5/dvb-scan.h               | 16 +++----
>  lib/include/libdvbv5/eit.h                    |  4 +-
>  lib/include/libdvbv5/header.h                 |  4 +-
>  lib/include/libdvbv5/mgt.h                    |  4 +-
>  lib/include/libdvbv5/mpeg_pes.h               |  2 +-
>  lib/include/libdvbv5/nit.h                    |  6 +--
>  lib/include/libdvbv5/pat.h                    |  4 +-
>  lib/include/libdvbv5/pmt.h                    |  4 +-
>  lib/include/libdvbv5/sdt.h                    |  4 +-
>  lib/include/libdvbv5/vct.h                    |  4 +-
>  lib/include/libv4l2.h                         |  2 +-
>  lib/libdvbv5/parse_string.h                   |  2 +-
>  lib/libv4lconvert/libv4lconvert-priv.h        | 48 +++++++++----------
>  .../processing/libv4lprocessing.h             |  2 +-
>  lib/libv4lconvert/tinyjpeg.h                  |  2 +-
>  utils/common/v4l-stream.h                     |  4 +-
>  utils/keytable/bpf.h                          |  6 +--
>  utils/libcecutil/cec-log.cpp                  | 12 ++---
>  25 files changed, 75 insertions(+), 75 deletions(-)
> 
> diff --git a/lib/include/libdvbv5/atsc_eit.h b/lib/include/libdvbv5/atsc_eit.h
> index 5e52087c..18ae599d 100644
> --- a/lib/include/libdvbv5/atsc_eit.h
> +++ b/lib/include/libdvbv5/atsc_eit.h
> @@ -192,7 +192,7 @@ ssize_t atsc_table_eit_init(struct dvb_v5_fe_parms *parms, const uint8_t *buf,
>   *
>   * @param table pointer to struct atsc_table_eit to be freed
>   */
> -void atsc_table_eit_free(struct atsc_table_eit *table);
> +void atsc_table_eit_free(struct atsc_table_eit *eit);
>  
>  /**
>   * @brief Prints the content of the ATSC EIT table
> @@ -202,7 +202,7 @@ void atsc_table_eit_free(struct atsc_table_eit *table);
>   * @param table pointer to struct atsc_table_eit
>   */
>  void atsc_table_eit_print(struct dvb_v5_fe_parms *parms,
> -			  struct atsc_table_eit *table);
> +			  struct atsc_table_eit *eit);

A change like that will break the documentation build, as it relies
on "table" name for this parameter:

	/**
	 * @brief Prints the content of the ATSC EIT table
	 * @ingroup dvb_table
	 *
	 * @param parms	struct dvb_v5_fe_parms pointer to the opened device
	 * @param table pointer to struct atsc_table_eit
	 */
	void atsc_table_eit_print(struct dvb_v5_fe_parms *parms,
				  struct atsc_table_eit *table);

So, if this is willing to be changed, the kerneldoc header would
need a similar change...

> diff --git a/lib/include/libdvbv5/dvb-fe.h b/lib/include/libdvbv5/dvb-fe.h
> index 96657013..4bd94108 100644
> --- a/lib/include/libdvbv5/dvb-fe.h
> +++ b/lib/include/libdvbv5/dvb-fe.h
> @@ -732,7 +732,7 @@ int dvb_fe_is_satellite(uint32_t delivery_system);
>   * "COUNTRY" property in dvb_fe_set_parm() overrides the setting.
>   */
>  int dvb_fe_set_default_country(struct dvb_v5_fe_parms *parms,
> -			       const char *country);
> +			       const char *cc);
>  
>  #ifdef __cplusplus
>  }

...yet, some of those changes are not ok.

I mean, while it is OK to use "cc" inside the function implementation
(it is an alias for Country code), at the headers - and at the 
documentation, which is created by Doxygen, it should keep a better 
description.

Btw, the main reason why the headers don't match the implementation
is because those parameter names changed when we added support for
Doxygen. The goal was to have parameter names that would be
clearer about what the parameter was meant for.

So, if you want to have both using the same name, specially for a
parameter like "country", the change should be done inside the 
implementation, and not at the header.

Just to mention, I'm OK on keeping both declaration and usage in 
sync, although this change shouldn't affect C++11, as the 
implementation is in C.

Thanks,
Mauro
