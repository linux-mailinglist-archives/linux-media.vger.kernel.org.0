Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2288B1B7705
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2020 15:32:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727896AbgDXNcT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Apr 2020 09:32:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726667AbgDXNcS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Apr 2020 09:32:18 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D463AC09B045;
        Fri, 24 Apr 2020 06:32:17 -0700 (PDT)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id CEB454F7;
        Fri, 24 Apr 2020 15:32:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1587735135;
        bh=iP8PdRM31IFHHSbyWgQMMkyqvUVBYQfiE+g1rWt46/s=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=lWeMhQJiHBangWXpMof86nkLnAf4N66PdW7f9jEDJAvoKBT/CbHqB36MOot4irERd
         hYwMX3xuB6EGbXhNVUZups0bJzh05w2k+LDIe1XBd4zqgJMjLWSMR5sW/3fmpqYHV1
         mB99o+PR07zVivB2Wca7N1wVxcaZzpVy55FY1f2o=
Date:   Fri, 24 Apr 2020 16:32:00 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Helen Koike <helen.koike@collabora.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH] v4l2-compliance: zero mbus_code
Message-ID: <20200424133200.GI5954@pendragon.ideasonboard.com>
References: <5cf00351-bf5f-b347-0ab5-9ea260a7bc85@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <5cf00351-bf5f-b347-0ab5-9ea260a7bc85@xs4all.nl>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

Thank you for the patch.

On Thu, Apr 23, 2020 at 12:48:20PM +0200, Hans Verkuil wrote:
> The new fmtdesc.mbus_code should be zeroed by applications.
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> diff --git a/utils/v4l2-compliance/v4l2-test-formats.cpp b/utils/v4l2-compliance/v4l2-test-formats.cpp
> index 824769b3..269a5fd9 100644
> --- a/utils/v4l2-compliance/v4l2-test-formats.cpp
> +++ b/utils/v4l2-compliance/v4l2-test-formats.cpp
> @@ -235,6 +235,7 @@ static int testEnumFormatsType(struct node *node, unsigned type)
>  		memset(&fmtdesc, 0xff, sizeof(fmtdesc));
>  		fmtdesc.type = type;
>  		fmtdesc.index = f;
> +		fmtdesc.mbus_code = 0;
> 
>  		ret = doioctl(node, VIDIOC_ENUM_FMT, &fmtdesc);
>  		if (ret == ENOTTY)

-- 
Regards,

Laurent Pinchart
