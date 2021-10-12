Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 271EA42A78F
	for <lists+linux-media@lfdr.de>; Tue, 12 Oct 2021 16:45:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237010AbhJLOrC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 Oct 2021 10:47:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230195AbhJLOrC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 Oct 2021 10:47:02 -0400
Received: from lb2-smtp-cloud8.xs4all.net (lb2-smtp-cloud8.xs4all.net [IPv6:2001:888:0:108::2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CCA4C061570
        for <linux-media@vger.kernel.org>; Tue, 12 Oct 2021 07:45:00 -0700 (PDT)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id aJ1TmsXzhx7rIaJ1WmMO8N; Tue, 12 Oct 2021 16:44:59 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1634049899; bh=d1/LSYSB8teHeDrMim6yF7lrAdaJu/tCPH0lLZY4lbY=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=YvMrSNBJO2IZJyevZ89wWoQuG9mhSbtl7Dhyjyn3lHA1RsTkSmqf/CCObOqbuV4kh
         Kky380kRLXJKUSuJWQSHf/1LOCsgcJDpRXfIpZqbtBxDus7p8qo9hlAuqRRfwY2Qqs
         boK1ZXNrVAsnnTgi5zM1983LIa9m3ckOYFdWiauhYJMjEtfxdvMwQV8sRXJh3AGGpB
         o+HlAfmyNVb95p6SJnTK8N3CUbghWl3UVZdqwDemTRvz25vqU1N09atXAtXpYltdCi
         kRKGhRjOCZUViq5MdmxsStq51l26gvuti/rNlSzi+5mjQtHtUOZOm5nZBOEVzEpZiM
         dBY3iyYvQLr6g==
Subject: Re: [PATCH v9 24/36] media: subdev: increase
 V4L2_FRAME_DESC_ENTRY_MAX to 8
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Pratyush Yadav <p.yadav@ti.com>
References: <20211005085750.138151-1-tomi.valkeinen@ideasonboard.com>
 <20211005085750.138151-25-tomi.valkeinen@ideasonboard.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <28fe73f7-07e6-b3fe-04c5-3a28a6cf010f@xs4all.nl>
Date:   Tue, 12 Oct 2021 16:44:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211005085750.138151-25-tomi.valkeinen@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfEl5gh828BkGQ3hwUYNTx1DRfiqekeCWgNEj1KRattDuuxU/HO0xWM5Qpb8Vo4lJ+ELaArK2IgpFo3etjGKNr1QVhf3kzCnRN1BciiV3+17pEja6r4lL
 XvYLgz+eaYrrH9zu54BYDFBogms3QcwwCDUkA+6KkvJP8FRgqMThEWf+Gp9eTciPbpQCmlkERlvtPH9VTKwxPPlQdD4zSCWTXNbls1Krpy3RYiyLp6ZPTNyG
 YKH/OP+e6CA6tyKHeFQeBtU+6zTDB5oI6kW7lrVofhxSSDOgocq4lyxLSB8x17AOg4vohycbbtVBoNijRCaF/XdaNKK236ivdPE6M9+pzO8d8hMmLOVfwiOm
 zxrUj3d3XNcdp85Fuct893JqIBe5vW9njD9V3J/69LqoNEE7yUwf/e51mlsYvYw0/YzK7RMYPV/+vzZIGzugbWQcc28r+vxXC6Ah4uyT8XS3ocTsb4o8Wowl
 sJgzZU7kjMtB3ToP0wZYVEpzL1S4Jt0SzMoIxQ==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 05/10/2021 10:57, Tomi Valkeinen wrote:
> V4L2_FRAME_DESC_ENTRY_MAX is currently set to 4. In theory it's possible
> to have an arbitrary amount of streams in a single pad, so preferably
> there should be no hardcoded maximum number.
> 
> However, I believe a reasonable max is 8, which would cover a CSI-2 pad
> with 4 streams of pixel data and 4 streams of metadata.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

> ---
>  include/media/v4l2-subdev.h | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> index f8443475651d..b3a72c98a2d3 100644
> --- a/include/media/v4l2-subdev.h
> +++ b/include/media/v4l2-subdev.h
> @@ -360,7 +360,11 @@ struct v4l2_mbus_frame_desc_entry {
>  	} bus;
>  };
>  
> -#define V4L2_FRAME_DESC_ENTRY_MAX	4
> + /*
> +  * FIXME: If this number is too small, it should be dropped altogether and the
> +  * API switched to a dynamic number of frame descriptor entries.
> +  */
> +#define V4L2_FRAME_DESC_ENTRY_MAX	8
>  
>  /**
>   * enum v4l2_mbus_frame_desc_type - media bus frame description type
> 

