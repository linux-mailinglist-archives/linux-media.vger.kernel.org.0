Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2B5A1D9180
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2020 09:57:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728515AbgESH4K (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 May 2020 03:56:10 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:57569 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728439AbgESH4K (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 May 2020 03:56:10 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id ax6aj0jpntKAsax6ejPLXs; Tue, 19 May 2020 09:56:08 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1589874968; bh=af6uyNGBX294+loJXQvBmBMWU8SIJH1yzuokUpZVrPE=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=vHPA+j83VKFVjAf4BvJkXpu/wlBDV0+9RzsEMyZw5Y8yzZ1rS5e2pUscfPgGVvyKQ
         e8/zOHwbRBt8YyuXBDGc1waPAKZ7xRnBUwipMnXUvr27D3ngSRYIfLwfSiRI/Fbl2P
         9zGyYX120raEm0R0gEOzfPeMZA6a5bryTqclAtox/w47yGxqVAncmOFjL0V+unGy6i
         jXOCjpeJar4wBYgVcMh42kd32PGE6anj4Fq3zp6bGMVwiUbIk2io6cd5mQZFh7U7nr
         7dEb/emB7IN2EZL29YLzR4ISaiVG7Yex2vyF42dEfJETJlI+Y8+EbNytD+4FLkt4aV
         WfhZl+ju96/sQ==
Subject: Re: [PATCH 1/1] Documentation: media: Document media bus codes to use
 on serial busses
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com
References: <20200519072148.28071-1-sakari.ailus@linux.intel.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <aede80cc-f891-c861-8ba3-f733088e5694@xs4all.nl>
Date:   Tue, 19 May 2020 09:56:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200519072148.28071-1-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfNPYQXXxmmJLMW7xaXe2Vo8A3OfHxt7VNYFq/Tp5Fd4jvavSLc5QUioj66VZnDr1FEQOZYZ42Zx+fhw4nJ/RM0083NdqTh0GtkapE7FoSFvDnBCXRVxZ
 OeXKc4aps8cozIQ2E49oEiogBj+PBIpla0OgrE75xGzdu4K0Sag4y7wy3V6zfbakbdXN1NXkWlHJAs1u6QOwbE7b0bFBZvtTJaSq0FAlk6CKU1UfAJazNMCJ
 Gh5fVohUOoo8yLEgfztOJBO0nJXC31hqgur47o7jP28=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 19/05/2020 09:21, Sakari Ailus wrote:
> Document media bus codes on serial busses. The single sample per pixel
> variant is to be chosen from all the possible variants. While this has
> been the practice since the introduction of CSI-2 support, it never was
> written down. Do it now.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  Documentation/driver-api/media/csi2.rst | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/Documentation/driver-api/media/csi2.rst b/Documentation/driver-api/media/csi2.rst
> index da8b356389f0..af078ac927bd 100644
> --- a/Documentation/driver-api/media/csi2.rst
> +++ b/Documentation/driver-api/media/csi2.rst
> @@ -10,6 +10,16 @@ the host SoC. It is defined by the `MIPI alliance`_.
>  
>  .. _`MIPI alliance`: http://www.mipi.org/
>  
> +Media bus formats
> +-----------------
> +
> +Always use single sample per pixel formats on the CSI-2 bus.
> +
> +No new media bus formats were created when the support for serial busses were

busses -> buses

(actually, both spellings are used in about equal measures in the kernel, but
the official spelling is 'buses').

were -> was

(the support was added, 'support' is singular)

> +added. To avoid using different media bus codes to describe the same format, the
> +practice is to use a format that has a single sample per pixel on the parallel
> +bus.

To be honest, I'm confused by this text. Probably because I don't know enough
about CSI. I'm not really sure what you mean with 'single sample per pixel'.

Regards,

	Hans

> +
>  Transmitter drivers
>  -------------------
>  
> 

