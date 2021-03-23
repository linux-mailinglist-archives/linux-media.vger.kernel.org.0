Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B450345F67
	for <lists+linux-media@lfdr.de>; Tue, 23 Mar 2021 14:17:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231732AbhCWNRg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Mar 2021 09:17:36 -0400
Received: from mail.kernel.org ([198.145.29.99]:45966 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231760AbhCWNQT (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Mar 2021 09:16:19 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id CD84561990;
        Tue, 23 Mar 2021 13:16:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1616505379;
        bh=Cj5IOH7chrcZeUM/Ve74t3Qs1c93JnmkzNVeGi2sh6c=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=QQcBRhqvQgRA28Ir5zzpvQCz+MxRHBDR0+75BeeUG+lae6YjrXQAB9WZgn5t0lV0m
         h/QBfXOkDbrlaveBAIo2aCz//Jvhq3tautTV5ymZV9IeCNxLECYlUQ4VcCbhJyVb0B
         G9v03RwNQ+A1ixuHl3ThUlbF5Tf5tfGeN2wDgvhM3iXP7LqiITZmWxInn5rP3EJ3xL
         hMdyGi1UanMpl7qJ2PSweVR6PpYkqdDJ6qhAbd3aHWJNIODeYMarsUgWgCMHipHcHo
         LwYAjp0f5uvJZH7phycufFOdVYhGE4VLzylVgbezym8NpYUkIU299j/6B1ghgP0pI3
         wqY2qMDq89S2w==
Date:   Tue, 23 Mar 2021 14:16:14 +0100
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Philipp Gerlesberger <Philipp.Gerlesberger@fau.de>
Cc:     linux-kernel@vger.kernel.org,
        ij72uhux@stud.informatik.uni-erlangen.de,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@i4.cs.fau.de, gregkh@linuxfoundation.org,
        sakari.ailus@linux.intel.com
Subject: Re: [PATCH v2 12/12] media: atomisp: Fix LOGICAL_CONTINUATIONS
Message-ID: <20210323141614.6fcb195b@coco.lan>
In-Reply-To: <20201214110156.6152-13-Philipp.Gerlesberger@fau.de>
References: <20201214110156.6152-1-Philipp.Gerlesberger@fau.de>
        <20201214110156.6152-13-Philipp.Gerlesberger@fau.de>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Mon, 14 Dec 2020 12:01:56 +0100
Philipp Gerlesberger <Philipp.Gerlesberger@fau.de> escreveu:

> Logical continuations should be on the previous line
> 
> Co-developed-by: Andrey Khlopkov <ij72uhux@stud.informatik.uni-erlangen.de>
> Signed-off-by: Andrey Khlopkov <ij72uhux@stud.informatik.uni-erlangen.de>
> Signed-off-by: Philipp Gerlesberger <Philipp.Gerlesberger@fau.de>
> ---
>  drivers/staging/media/atomisp/pci/runtime/queue/src/queue.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/runtime/queue/src/queue.c b/drivers/staging/media/atomisp/pci/runtime/queue/src/queue.c
> index 2f1c2df59f71..7d44070c7114 100644
> --- a/drivers/staging/media/atomisp/pci/runtime/queue/src/queue.c
> +++ b/drivers/staging/media/atomisp/pci/runtime/queue/src/queue.c
> @@ -24,8 +24,8 @@
>   *****************************************************************************/
>  int ia_css_queue_local_init(ia_css_queue_t *qhandle, ia_css_queue_local_t *desc)
>  {
> -	if (NULL == qhandle || NULL == desc
> -	    || NULL == desc->cb_elems || NULL == desc->cb_desc) {
> +	if (NULL == qhandle || NULL == desc ||
> +	    NULL == desc->cb_elems || NULL == desc->cb_desc) {

Nah, there are coding style issues here... we usually do:

	if (foo == CONSTANT)

instead of:

	if (CONSTANT == foo)

Also, we usually simplify checks for null. So, the above should
be, instead, just:

	if (!qhandle || !desc || !desc->cb_elements || !desc->cb_desc)


>  		/* Invalid parameters, return error*/
>  		return -EINVAL;
>  	}



Thanks,
Mauro
