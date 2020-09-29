Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6BB827BC60
	for <lists+linux-media@lfdr.de>; Tue, 29 Sep 2020 07:19:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725793AbgI2FTb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 29 Sep 2020 01:19:31 -0400
Received: from mail.kernel.org ([198.145.29.99]:34096 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725536AbgI2FTb (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 29 Sep 2020 01:19:31 -0400
Received: from coco.lan (ip5f5ad5bc.dynamic.kabel-deutschland.de [95.90.213.188])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C60B42145D;
        Tue, 29 Sep 2020 05:19:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601356771;
        bh=Jkqd0x9y1qCqf4dEAyGH6DAakth8ael+GUF3gD5Y6yM=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=xe4Ftg6fNu8TtjnFW5XlS6N3U6x+Jefb2Frpk6OW9otweRVse7t9N555j6aDwjkTg
         ujzDx5GQTBjp8cUKyKhkOqHW1BYYAcG/rGo6OGsri7zLxKaw5NMtAVYbL/emfw95Va
         hXuhDVnhwYNtljsas4TtLqV4lV2BHQ5PVkGnZ65s=
Date:   Tue, 29 Sep 2020 07:19:18 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
Cc:     r.verdejo@samsung.com, nicolas@ndufresne.ca,
        linux-media@vger.kernel.org, skhan@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH WIP 1/6] media: vidtv: extract the initial CRC value to
 into a #define
Message-ID: <20200929071918.15c018ac@coco.lan>
In-Reply-To: <20200929032625.1548909-1-dwlsalmeida@gmail.com>
References: <20200929032625.1548909-1-dwlsalmeida@gmail.com>
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Tue, 29 Sep 2020 00:26:20 -0300
"Daniel W. S. Almeida" <dwlsalmeida@gmail.com> escreveu:

> From: Daniel W. S. Almeida <dwlsalmeida@gmail.com>

On a very quick look, patches seem good. Why did you mark them as WIP?

Next time, please add a patch 0, specially when you tag something as
WIP, or RFC.

> 
> The same constant (0xffffffff) is used in three different functions.

This one at least seems to be ready for merging ;-)

Regards,
Mauro
> 
> Extract it into a #define to avoid repetition.
> 
> Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>
> ---
>  drivers/media/test-drivers/vidtv/vidtv_psi.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/test-drivers/vidtv/vidtv_psi.c b/drivers/media/test-drivers/vidtv/vidtv_psi.c
> index 3151b300a91b..a24e84adc8ce 100644
> --- a/drivers/media/test-drivers/vidtv/vidtv_psi.c
> +++ b/drivers/media/test-drivers/vidtv/vidtv_psi.c
> @@ -30,6 +30,7 @@
>  
>  #define CRC_SIZE_IN_BYTES 4
>  #define MAX_VERSION_NUM 32
> +#define INITIAL_CRC 0xffffffff
>  
>  static const u32 CRC_LUT[256] = {
>  	/* from libdvbv5 */
> @@ -794,7 +795,7 @@ u32 vidtv_psi_pat_write_into(struct vidtv_psi_pat_write_args args)
>  	/* the number of bytes written by this function */
>  	u32 nbytes = 0;
>  	const u16 pat_pid = VIDTV_PAT_PID;
> -	u32 crc = 0xffffffff;
> +	u32 crc = INITIAL_CRC;
>  
>  	struct vidtv_psi_table_pat_program *p = args.pat->program;
>  
> @@ -990,7 +991,7 @@ u32 vidtv_psi_pmt_write_into(struct vidtv_psi_pmt_write_args args)
>  {
>  	/* the number of bytes written by this function */
>  	u32 nbytes = 0;
> -	u32 crc = 0xffffffff;
> +	u32 crc = INITIAL_CRC;
>  
>  	struct vidtv_psi_desc *table_descriptor   = args.pmt->descriptor;
>  	struct vidtv_psi_table_pmt_stream *stream = args.pmt->stream;
> @@ -1143,7 +1144,7 @@ u32 vidtv_psi_sdt_write_into(struct vidtv_psi_sdt_write_args args)
>  	u32 nbytes  = 0;
>  	u16 sdt_pid = VIDTV_SDT_PID;  /* see ETSI EN 300 468 v1.15.1 p. 11 */
>  
> -	u32 crc = 0xffffffff;
> +	u32 crc = INITIAL_CRC;
>  
>  	struct vidtv_psi_table_sdt_service *service = args.sdt->service;
>  	struct vidtv_psi_desc *service_desc = (args.sdt->service) ?



Thanks,
Mauro
