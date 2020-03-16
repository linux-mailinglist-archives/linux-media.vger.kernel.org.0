Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4E5A518695B
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2020 11:47:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730709AbgCPKrh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Mar 2020 06:47:37 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:36062 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730478AbgCPKrh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Mar 2020 06:47:37 -0400
Received: by mail-wm1-f66.google.com with SMTP id g62so17453557wme.1
        for <linux-media@vger.kernel.org>; Mon, 16 Mar 2020 03:47:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=3Fvzm0jnK7nG9oC/6t8l32p7bVJdfH91TDz1GxmcK6o=;
        b=Tjqzg7L5eO71rNRVxaTUpg2ybm9nuMmLUvBFvUFpIQZyJKwjFV6wC8EItjIOEl2spT
         olwPrkbkrWRQswvsG9QIYXYC7fIegpxCeTy3M8I4bYz367Jdbye0vGxMMvkEkF3Zv7N+
         rpMPdUUd6w9E3MiGTwHRCxzTTcEut92p4n71SQsA/z1kmvfh0YdtZdtWlHlYb2W3vWgL
         6Utv7Sb4SppDiHbGAy06ML6YLby4UcvSQEA0a2qZ3kA4Pg3aOSOJKX5Nv8BGpw6QWolV
         zOzAT48JCZyWG3Xv+eG10D3q3nPtD2g+n4fjYRTUswEx7qmjoDkDMoUp9SOLes45Izmr
         Ss5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=3Fvzm0jnK7nG9oC/6t8l32p7bVJdfH91TDz1GxmcK6o=;
        b=ZMLIglS2BjJy3Crcv7HrGA/qJljyG+XOQgxteTudTMse2gxJvN7kbEBQI5NReoPw3e
         fQQZQL+z2t+X4kheXVBx9DUsvG0p03EPvKfLOcd5Jkf5UENS9XBr7PNJoxB9p1c7lqhP
         Y9qX8qvLfGPZKne6FETEsZS3iibNW/6iVva2w5eiSpttf2VOvkZpHYbrrtJEMLVOJ9dZ
         4q39j3Cemj+dNar+g6qezJwp/MCvIObxy82p4fxaKrSjtbn5Pf/94yOz2uKGyI6mwuTR
         Q3WtQiNGQLVX6uOGynMGMRj5FO+pMnBpMhgxXOS7+KaaQk/wgFuJg+Hl9QowFgf9zdOY
         iK2A==
X-Gm-Message-State: ANhLgQ04rC5IuTFdsbWhuyz+T2BBq47a9m8LHpxadQ4fAd+6yo8cKYZ5
        wvskhvTKsPFBJGpINwrYxM4h/auf
X-Google-Smtp-Source: ADFU+vubuovec7WG+7mQaqMDUjmOMPnf+ADc1/6RK1ouRyw4AzHnCVAr2HN3FlcNJmsmBa0l5jAO4Q==
X-Received: by 2002:a05:600c:1006:: with SMTP id c6mr17836286wmc.96.1584355654676;
        Mon, 16 Mar 2020 03:47:34 -0700 (PDT)
Received: from arch-thunder.localdomain (a109-49-46-234.cpe.netcabo.pt. [109.49.46.234])
        by smtp.gmail.com with ESMTPSA id k9sm14325535wrd.74.2020.03.16.03.47.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2020 03:47:34 -0700 (PDT)
Date:   Mon, 16 Mar 2020 10:47:31 +0000
From:   Rui Miguel Silva <rmfrfs@gmail.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH 00/14] media: imx: Miscellaneous fixes for i.MX7 CSI-2
 receiver
Message-ID: <20200316104731.xeamvurfjy4czy7m@arch-thunder.localdomain>
References: <20200312234722.23483-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200312234722.23483-1-laurent.pinchart@ideasonboard.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,
Thanks for this series.

On Fri, Mar 13, 2020 at 01:47:08AM +0200, Laurent Pinchart wrote:
> Hello,
> 
> This patch series completes (for now :-)) my rework of the CSI-2
> receiver found in the i.MX7 SoCs.
> 
> Patches 01/14 and 02/14 have already been tested and acked. The next
> four patches (03/14 to 06/14) fix format handling by adding missing
> formats and removing unsupported formats, and patches 07/14 to 09/14
> then clean up and fix image width alignment handling.
> 
> The next three patches (10/14 to 12/14) are again miscellaneous
> cleanups. Patch 13/14 removes usage of the only imx-media-utils helper
> used in this driver as the helper isn't compatible with the i.MX7 CSI-2
> receiver formats. Patch 14/14 finally implements the subdev
> .enum_mbus_code() pad operation to allow enumeration of media bus codes
> from userspace.
> 
> The patches have been tested on an i.MX7Q with a 10-bit greyscale MIPI
> CSI-2 sensor.

For the all series:
Acked-by: Rui Miguel Silva <rmfrfs@gmail.com>

------
Cheers,
     Rui

> 
> Laurent Pinchart (14):
>   media: imx: imx7-mipi-csis: Cleanup and fix subdev pad format handling
>   media: imx: imx7-mipi-csis: Centralize initialization of pad formats
>   media: imx: imx7-mipi-csis: Add missing RAW formats
>   media: imx: imx7-mipi-csis: Expose correct YUV formats
>   media: imx: imx7-mipi-csis: Fix MEDIA_BUS_FMT_UYVY8_2X8 data alignment
>   media: imx: imx7-mipi-csis: Add MEDIA_BUS_FMT_UYVY10_2X10 support
>   media: imx: imx7-mipi-csis: Rename data_alignment field to width
>   media: imx: imx7-mipi-csis: Align image width based on format
>   media: imx: imx7-mipi-csis: Never set MIPI_CSIS_ISPCFG_ALIGN_32BIT
>   media: imx: imx7-mipi-csis: Align macro definitions
>   media: imx: imx7-mipi-csis: Remove link setup on source pad
>   media: imx: imx7-mipi-csis: Cleanup includes
>   media: imx: imx7-mipi-csis: Don't use imx-media-utils helpers
>   media: imx: imx7-mipi-csis: Implement the .enum_mbus_code() operation
> 
>  drivers/staging/media/imx/imx7-mipi-csis.c | 446 +++++++++++++--------
>  1 file changed, 274 insertions(+), 172 deletions(-)
> 
> -- 
> Regards,
> 
> Laurent Pinchart
> 
