Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED79F345F1B
	for <lists+linux-media@lfdr.de>; Tue, 23 Mar 2021 14:12:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231558AbhCWNMV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Mar 2021 09:12:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:44530 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231301AbhCWNMN (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Mar 2021 09:12:13 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id BF939619B8;
        Tue, 23 Mar 2021 13:12:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1616505133;
        bh=vCYR3ZBZvyax7SeVVHE9u9H/gK+P9HuMDSSUVInEa3k=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=NqunR2LCqbRdIrWeRH4B/w/oeXwFFoAMUYyiluOZ/KAlbO9qURC8kLON+PQr0Gyl6
         ZS8k9UJxqIhWQ4EkV9hyMhAxKS/4g1G/kvV0947eefBXpL3pv+Wxg0sI1PBduGOToM
         fZL2JbVdrZd0wt7vBFDH7lJQUG5Pkh6wP8k1udBPn0+oYknLDmZYeipSGdrUuWgT6I
         NetmbwcsJWGTEbJ75lAhmMoH+RcJeF/U1mZj2aAWs+W+0aFxIC7PsF9NdqB8eUXQPz
         /QSF8YKhlstgZzg3sw5QNKNauIamAwE069/OBvfP2VVVPzTB4DRcaNy5oHr+K5Z+SS
         1RFunG2xTgGoQ==
Date:   Tue, 23 Mar 2021 14:12:07 +0100
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Philipp Gerlesberger <Philipp.Gerlesberger@fau.de>
Cc:     linux-kernel@vger.kernel.org,
        ij72uhux@stud.informatik.uni-erlangen.de,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@i4.cs.fau.de, gregkh@linuxfoundation.org,
        sakari.ailus@linux.intel.com
Subject: Re: [PATCH v2 06/12] media: atomisp: Remove defines
Message-ID: <20210323141207.2185a4b8@coco.lan>
In-Reply-To: <20201214110156.6152-7-Philipp.Gerlesberger@fau.de>
References: <20201214110156.6152-1-Philipp.Gerlesberger@fau.de>
        <20201214110156.6152-7-Philipp.Gerlesberger@fau.de>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Mon, 14 Dec 2020 12:01:50 +0100
Philipp Gerlesberger <Philipp.Gerlesberger@fau.de> escreveu:

> Remov defines, they don't make sense.
> The programmer should know what things need to be static and what not.
> Also leave "inline" out and let the compiler decide
> 
> Co-developed-by: Andrey Khlopkov <ij72uhux@stud.informatik.uni-erlangen.de>
> Signed-off-by: Andrey Khlopkov <ij72uhux@stud.informatik.uni-erlangen.de>
> Signed-off-by: Philipp Gerlesberger <Philipp.Gerlesberger@fau.de>
> ---
>  .../media/atomisp/pci/runtime/rmgr/interface/ia_css_rmgr.h   | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/runtime/rmgr/interface/ia_css_rmgr.h b/drivers/staging/media/atomisp/pci/runtime/rmgr/interface/ia_css_rmgr.h
> index 9cd3d92b34c9..45b72e98bc9f 100644
> --- a/drivers/staging/media/atomisp/pci/runtime/rmgr/interface/ia_css_rmgr.h
> +++ b/drivers/staging/media/atomisp/pci/runtime/rmgr/interface/ia_css_rmgr.h
> @@ -21,10 +21,7 @@
>  #ifndef __INLINE_RMGR__
>  #define STORAGE_CLASS_RMGR_H extern
>  #define STORAGE_CLASS_RMGR_C
> -#else				/* __INLINE_RMGR__ */
> -#define STORAGE_CLASS_RMGR_H static inline
> -#define STORAGE_CLASS_RMGR_C static inline
> -#endif				/* __INLINE_RMGR__ */
> +#endif


No, that's not the right way to address it. Instead, you should
replace the occurrences of those macros at the code and get rid
of them.


Thanks,
Mauro
