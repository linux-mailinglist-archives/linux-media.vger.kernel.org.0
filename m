Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4DED417030E
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2020 16:48:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728501AbgBZPsL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 Feb 2020 10:48:11 -0500
Received: from retiisi.org.uk ([95.216.213.190]:46172 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728018AbgBZPsK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 Feb 2020 10:48:10 -0500
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTPS id 94214634C89;
        Wed, 26 Feb 2020 17:46:57 +0200 (EET)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1j6ytm-0002Kc-13; Wed, 26 Feb 2020 17:46:58 +0200
Date:   Wed, 26 Feb 2020 17:46:58 +0200
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Sean Young <sean@mess.org>
Cc:     linux-media@vger.kernel.org
Subject: Re: [PATCH v4l-utils] Fix build failure on s390x
Message-ID: <20200226154657.GM5023@valkosipuli.retiisi.org.uk>
References: <20200216091839.31183-1-sean@mess.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200216091839.31183-1-sean@mess.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sean,

On Sun, Feb 16, 2020 at 09:18:39AM +0000, Sean Young wrote:
> See: https://bugzilla.redhat.com/show_bug.cgi?id=1800228
> 
> /usr/bin/ld: .libs/libdvbv5_la-dvb-fe.o:(.bss+0x8): multiple definition of `delivery_system_name'; .libs/libdvbv5_la-dvb-v5.o:/builddir/build/BUILD/v4l-utils-1.18.0/lib/libdvbv5/dvb-v5.h:29: first defined here
> /usr/bin/ld: .libs/libdvbv5_la-dvb-fe.o:(.bss+0xa8): multiple definition of `dvb_v5_name'; .libs/libdvbv5_la-dvb-v5.o:/builddir/build/BUILD/v4l-utils-1.18.0/lib/libdvbv5/dvb-v5.h:28: first defined here
> /usr/bin/ld: .libs/libdvbv5_la-dvb-fe.o:(.rodata+0x3ec): multiple definition of `fe_bandwidth_name'; .libs/libdvbv5_la-dvb-v5.o:/builddir/build/BUILD/v4l-utils-1.18.0/lib/libdvbv5/dvb-v5.h:20: first defined here
> 
> delivery_system_name etc are being defined both in lib/libdvbv5/dvb-v5.c and
> lib/libdvbv5/dvb-v5.h.
> 
> Signed-off-by: Sean Young <sean@mess.org>
> ---
>  lib/libdvbv5/gen_dvb_structs.pl | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/lib/libdvbv5/gen_dvb_structs.pl b/lib/libdvbv5/gen_dvb_structs.pl
> index 7e1d645c..d15d1fc3 100755
> --- a/lib/libdvbv5/gen_dvb_structs.pl
> +++ b/lib/libdvbv5/gen_dvb_structs.pl
> @@ -419,6 +419,9 @@ sub output_arrays($$$$$)
>      }
>      printf OUT " %s[%i]", $name, $size;
>    } else {
> +    if ($decl) {
> +      printf OUT "extern ";
> +    }
>      printf OUT "const %s%s[%i]", $type, $name, $size + 1;
>    }
>  

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
Sakari Ailus
