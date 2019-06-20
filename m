Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 36DEB4D040
	for <lists+linux-media@lfdr.de>; Thu, 20 Jun 2019 16:21:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726811AbfFTOVH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 Jun 2019 10:21:07 -0400
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:36019 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726391AbfFTOVH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 Jun 2019 10:21:07 -0400
Received: from [IPv6:2001:983:e9a7:1:4588:eede:a2a7:f8e] ([IPv6:2001:983:e9a7:1:4588:eede:a2a7:f8e])
        by smtp-cloud8.xs4all.net with ESMTPA
        id dxvzhKbNa7KeZdxw0hM7xQ; Thu, 20 Jun 2019 16:21:05 +0200
Subject: Re: [PATCH 1/1] MAINTAINERS: Add maintainers for Media Controller
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
Cc:     mchehab@kernel.org, laurent.pinchart@ideasonboard.com
References: <20190620141753.15983-1-sakari.ailus@linux.intel.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <ec866523-216f-1e6a-d28b-3168a9daf7ed@xs4all.nl>
Date:   Thu, 20 Jun 2019 16:21:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190620141753.15983-1-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfIO1Xgi3btFkFMw6dAynM2J9f++AnhC7UKHVkso0duBHGsCK4GY+EC9d0OJqjJN3ry/zOy+BP/AeQJVaoqnFfxP9twED4dqsnJu1rF1hwkO4P37uXsdF
 tJDJKE9wfDubSGlxRZ+zlZFAEU3FbnsMTkMGo02bfYF44Tsz9DydiJf1XJKm2wS/cQlErOkM5zYZByo62Pej4aGnWQJdkkSuOUIq/gY6JEbLVXT99aPbS7RL
 BFXnewLY+k6SNwWi8jVYtPRWZlVvFtt6cKCqf7ldpJ9ump2buVLoZoXH0JE0qdgFQhlsM/4kebrWowXc/YMEhkdk+tOqDN2N7gE/hi54Fhl92//NzjOP/ufh
 pSVwO4Htpm0XvXCQkgZ47UPA6+fXEP4jr19MU70CVdKVGd4cAgc=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 6/20/19 4:17 PM, Sakari Ailus wrote:
> When Media Controller was merged to mainline long, long time ago, no-one
> bothered to think what its MAINTAINERS entry should be. Now that Media
> Controller is moved into its own directory, address this at the same time.
> 
> So tell people to mail patches to myself and Laurent Pinchart.
> 
> Note that the patches are still merged through the Media tree, just like
> any other driver or framework bits that have separate "mail patches to"
> entries different from the main drivers/media one.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Acked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Regards,

	Hans

> ---
> This patch adds a MAINTAINERS entry for the MC framework and API, as
> discussed in this week's weekly meeting.
> 
>  MAINTAINERS | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index ad2bf808b02c..0a064d10a5df 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -9643,6 +9643,17 @@ L:	linux-iio@vger.kernel.org
>  S:	Maintained
>  F:	drivers/iio/dac/cio-dac.c
>  
> +MEDIA CONTROLLER FRAMEWORK
> +M:	Sakari Ailus <sakari.ailus@linux.intel.com>
> +M:	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> +L:	linux-media@vger.kernel.org
> +W:	https://www.linuxtv.org
> +T:	git git://linuxtv.org/media_tree.git
> +S:	Supported
> +F:	drivers/media/mc/
> +F:	include/media/media-*.h
> +F:	include/uapi/linux/media.h
> +
>  MEDIA DRIVERS FOR ASCOT2E
>  M:	Sergey Kozlov <serjk@netup.ru>
>  M:	Abylay Ospan <aospan@netup.ru>
> 

