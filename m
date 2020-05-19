Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 738201D92F0
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2020 11:05:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726504AbgESJFh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 May 2020 05:05:37 -0400
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:52633 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726333AbgESJFh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 May 2020 05:05:37 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id ayBnjzNDh8hmdayBqjiwLi; Tue, 19 May 2020 11:05:35 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1589879135; bh=ep92AVwgenp+B+10rjrrjEaWCgT5GcClfbVYSRCBsnM=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=vhbzmuQ2DCh0q4zI8AwWu5DpJMAprVdLzqG2i9eH8/BARMDLJFIcR+GAz/sie3Dz1
         7eWA5HB3Gd2rzyEQXtMnY1I6cW7+TRy+SmkG6HnkqL9YgjdvOyISJKa+p2/4r2A+4a
         iAPO77/HsfVZ5htPTJeqm7ovQPGzKmT7r6UFTY1EONgo/fQAQbG5NObaSkZZpM4RtL
         NJA/BSweTPBCDh9C2mEhXquh5WRpToYqimMXV7ij9waeP3MaAuIxBk69MgWGcC6A03
         rORAhvX9We3lsFsnDkBEAUUguwai363L02v9uSA2hREtlNMmXEy7Xe9PUUqiyFFTmd
         zQcF3tQ8xUsbg==
Subject: Re: [PATCH v2 1/1] Documentation: media: Refer to mbus code
 documentation from CSI-2 docs
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com
References: <20200519085014.32163-1-sakari.ailus@linux.intel.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <7f303ad0-305c-595c-dfdd-4d5a0dd85157@xs4all.nl>
Date:   Tue, 19 May 2020 11:05:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200519085014.32163-1-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfCGaPzJbWwXaMvG/8Ga7PjZUbZWhyt8me404Pctjt8nvLpECYbSyZ5CH8VWqYHeh9L49uueXO/g3SP186I3CaE/f2jx2YEyIJqW67PrbRVv2mk7p6zcf
 11Pxu7hVEfV3foR5ADKFPycnYRP1GdS+6Eo6zMGhY4rapQFQSODz6UpwSQ865zC2NHoswnOSibYgcMWbn9w4cL1XooWtj3qGusCnC6l29rflT+znnE155pug
 AnlkITCWppV0oFEiIXM/BEBYXJtTgDUwVybU0wPK6j0=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 19/05/2020 10:50, Sakari Ailus wrote:
> The media bus codes to be used on serial busses are documented but there
> was no reference from CSI-2 documentation. Add that now.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  Documentation/driver-api/media/csi2.rst | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/Documentation/driver-api/media/csi2.rst b/Documentation/driver-api/media/csi2.rst
> index da8b356389f0..1653a51d2a6e 100644
> --- a/Documentation/driver-api/media/csi2.rst
> +++ b/Documentation/driver-api/media/csi2.rst
> @@ -10,6 +10,13 @@ the host SoC. It is defined by the `MIPI alliance`_.
>  
>  .. _`MIPI alliance`: http://www.mipi.org/
>  
> +Media bus formats
> +-----------------
> +
> +Always use the media bus pixel code that describes a parallel format that
> +transfers a sample on a single clock cycle. See :ref:`v4l2-mbus-format` for more

How about: "transfers the pixel data as a single sample in one clock cycle"

Possibly with an example: "So use e.g. MEDIA_BUS_FMT_SBGGR10_1X10 instead of
MEDIA_BUS_FMT_SBGGR10_2X8_PADHI_BE."

Regards,

	Hans

> +information.
> +
>  Transmitter drivers
>  -------------------
>  
> 

