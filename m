Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B69435E241
	for <lists+linux-media@lfdr.de>; Tue, 13 Apr 2021 17:06:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346462AbhDMPGg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Apr 2021 11:06:36 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:45233 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1345564AbhDMPGg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Apr 2021 11:06:36 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id WKcElFjlXMxedWKcHlj8nW; Tue, 13 Apr 2021 17:06:13 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1618326373; bh=1qWX5LSdkE+UnSxx/mvnAUMQvE7SF+yGfcmW7NGrCHA=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=SZp7DqsM7byWceRJQ9c2en83ABJJ0WU9J+XYVlhrQ2Gf6m+LSiB9Tmh0XIMNYbohK
         tvZs3ICT3x5jtx8fCGm/RKCfNLTQVd9f3bS9YL9tRDO9zMmBgbonfY32j+1qiCsesg
         QAMfrx+rhe6eFu51ATayJykB35a79uo/zXWtXI5tuTbZtoe4It9p6HHQDCD4jaYdNF
         mlDwLoR1TOmHtxQsdWGnw+jTMchLoJ21Ujew0mW0QwcyOAZDlDIxk2zR0KJcXVpqvP
         RYem6NEdwG8MYYisinsYD0fZjzuZEaCh/n3LCZa0If61zT1+GgIoPxZ8UhPV7qUMkZ
         NNiWMeawekYqw==
Subject: Re: [PATCH] staging: media: omap4iss: Remove unused macro functions
To:     Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com
References: <20210412134253.GA19402@focaruja>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <03549d0e-04d9-6d37-93e3-c09b29ce53aa@xs4all.nl>
Date:   Tue, 13 Apr 2021 17:06:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210412134253.GA19402@focaruja>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfE6LJLukE/yUnm9irefi8TOqJFZGAFoIfIRJ3P7rPL9c7aLLTZJOOuCkboRVdF30rTQag5qsupBz63U4q6IU2tXSsl8FXD1gYdhyYNZYkNjVRHfeFdC1
 SbP+biyhRRE1t2z2E8QM/LgoEu9LfVnGtthfNu0JFFARltATLunu513QBqDmzqIjlsJ4+kzG+llWDl6odePurhZd7DeJEruFO+uCUTYvcXSctTpuKgaKjl7+
 sSoLo3vPimuqc4ZoubUZP9gQ8WpGTY25n4PUVhwp8Wvs+UFeTWnwT9SlOOGxrodVlZHyePEk9ujPhI8Tpfnk/uXgk1L5K63Ok2JB6zNr8VDuEv29KB/NW1H9
 0R1HTG5cz1hFgiKz/OJDMwnukQXu2yjwxZ27Gmz7QbJgSsrZSlDe/RSv2GrI+bBRVGKjnwSOr3V03dNYlf4W7S1lXmrQyGmRCWwo86GsWHg++qvpoPTGgX9w
 Bes9pRO5t3Q+vDrW/6WZ85+OQIaIXyrAyxqo/g==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 12/04/2021 15:42, Aline Santana Cordeiro wrote:
> Remove unused macro functions "to_iss_device()", "to_device()",
> and "v4l2_dev_to_iss_device(dev)".

'git grep to_iss_device drivers/staging/omap4iss' gives me lots of hits!
Same for to_device. Only v4l2_dev_to_iss_device appears to be unused.

Regards,

	Hans

> 
> Signed-off-by: Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>
> ---
>  drivers/staging/media/omap4iss/iss.h | 8 --------
>  1 file changed, 8 deletions(-)
> 
> diff --git a/drivers/staging/media/omap4iss/iss.h b/drivers/staging/media/omap4iss/iss.h
> index b88f952..a354d5f 100644
> --- a/drivers/staging/media/omap4iss/iss.h
> +++ b/drivers/staging/media/omap4iss/iss.h
> @@ -29,11 +29,6 @@
>  
>  struct regmap;
>  
> -#define to_iss_device(ptr_module)				\
> -	container_of(ptr_module, struct iss_device, ptr_module)
> -#define to_device(ptr_module)						\
> -	(to_iss_device(ptr_module)->dev)
> -
>  enum iss_mem_resources {
>  	OMAP4_ISS_MEM_TOP,
>  	OMAP4_ISS_MEM_CSI2_A_REGS1,
> @@ -119,9 +114,6 @@ struct iss_device {
>  	unsigned int isp_subclk_resources;
>  };
>  
> -#define v4l2_dev_to_iss_device(dev) \
> -	container_of(dev, struct iss_device, v4l2_dev)
> -
>  int omap4iss_get_external_info(struct iss_pipeline *pipe,
>  			       struct media_link *link);
>  
> 

