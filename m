Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 206C4F4252
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2019 09:42:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726672AbfKHImW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 8 Nov 2019 03:42:22 -0500
Received: from retiisi.org.uk ([95.216.213.190]:40042 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726072AbfKHImV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 8 Nov 2019 03:42:21 -0500
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTPS id 6A4FF634C87;
        Fri,  8 Nov 2019 10:42:14 +0200 (EET)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1iSzqR-0000Lm-7a; Fri, 08 Nov 2019 10:42:15 +0200
Date:   Fri, 8 Nov 2019 10:42:15 +0200
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Michael Ashton <mpa@fb.com>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Alexandre Courbot <acourbot@chromium.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Tomasz Figa <tfiga@chromium.org>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Daniel Gomez <daniel@qtec.com>,
        Peter Griffin <peter.griffin@linaro.org>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Eugen Hristev <Eugen.Hristev@microchip.com>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Helen Koike <helen.koike@collabora.com>,
        jacopo mondi <jacopo@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: Re: [ANN] Report of Media Summit: V4L2 Future Work
Message-ID: <20191108084215.GD829@valkosipuli.retiisi.org.uk>
References: <756c2d9c-ef4d-9f56-d6bd-a09767ec2ae8@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <756c2d9c-ef4d-9f56-d6bd-a09767ec2ae8@xs4all.nl>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Sat, Nov 02, 2019 at 03:06:07PM +0100, Hans Verkuil wrote:
> - Continue work on my old patch series dealing with dma_buf_begin/end_cpu_access():
> 
>   https://git.linuxtv.org/hverkuil/media_tree.git/log/?h=vb2-cpu-access
> 
>   This series converts most drivers to use these dmabuf functions.
> 
>   See also this thread: https://patchwork.kernel.org/patch/7159871/
>   As mentioned in my last reply, the outstanding drivers that are not
>   converted are netup_unidvb, coda, exynos4-is, rcar_jpu and au0828:
>   as far as I remember I did not know how to convert coda and exynos4-is
>   and never found the time to figure that out. The others are new and need
>   to be looked at again. There are probably more drivers that need work
>   since my patch series is from September 2015.

I've worked on the set since; it's here:

<URL:https://git.linuxtv.org/sailus/media_tree.git/log/?h=vb2-dc-noncoherent>

It does address other issues as well. There are likely topics that will
need to be discussed. I remember I got somewhat stuck converting drivers
(coda?) that accessed the buffer data whilst the hardware was operating on
it.

-- 
Regards,

Sakari Ailus
