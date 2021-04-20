Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07105365927
	for <lists+linux-media@lfdr.de>; Tue, 20 Apr 2021 14:43:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231996AbhDTMmE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Apr 2021 08:42:04 -0400
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:43741 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231590AbhDTMmB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Apr 2021 08:42:01 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id YpgzlXqG48K3KYph2lzdcz; Tue, 20 Apr 2021 14:41:28 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1618922488; bh=LmpPnPkn3X5VabNM+R3RACjye7cXzYGW2T06bu5PJOk=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=n1KlLas/k8Ebog/po1csc3m+nORAZ3CBYWh7BZIl+OR0aJrCDMcFEwDFYftt+7cg/
         2Y2nw7fQmj7+VXokr5Fi7sOwcQNbHN2vNj6ulwP0pLgvluMpRPiT1/mqL29tUkhSpB
         FRwlnPJUQZiDpRccP/YTdJ76WWXUv46Ut758oLZKlJtNcg8LoCx57jCkpBB2x3wck8
         6MtrV3+xjuf4GvDBN032IH9Tkdt4xbj7z9tD/+H8LcOu4VEZ5g3+1yBUMNsyoqxhkU
         y6S5NY3Ul5whKry7TBs2fb7lnaEx21uVw8a4E1RiCxxwRAJWY/SUZmfW52aCcbckT/
         VpYQhFcB8oe0Q==
Subject: Re: [PATCH v2] staging: media: atomisp: pci: Change line break to
 avoid an open parenthesis at the end of the line
To:     Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com
References: <20210415170819.GA17534@focaruja>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <fd8eb0f1-aab4-17d8-f590-3e574799c9f5@xs4all.nl>
Date:   Tue, 20 Apr 2021 14:41:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210415170819.GA17534@focaruja>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfJ+6TMWQZxkOW4WJICtb/CBRSGKDps49iYq/fH2/dS8SOcQjxwOncdgX0YfG0KSRgNNjBbbmYoz/Lzfs8wf8R3Dndf+foDpsLNdL+yHb6CYw5uixsER7
 XvKZUNSw/hRLlCHq1axRttZzRL/NJ9ArAu082BsIDoCwTj6XHwj8wzZHCVU1a+zb+8X3Ti9e/yJB/gPPg1BlfGRjWt5MhWAGEyR45eV8Lirk1QIDQdCoz5H5
 SqPUbAoSniEjRTcxu70VAfBpWkARgkHtTjDDduuoUQjR+6m/FwgNdvJppHQhVxwScCQazYlW/cwLg7vcORUAupf1zsW3/LvpeDBAq0bQvJgkzj84FnuhdDnh
 cvRowUQmylFXQ0zkmDyq1h5DaYzcMKNlNnnKiHxX5FqI2njH6noqmI6wASmVrHYQuuxySMWV+olkTe3OZezwTpdk40h8X+0nIOD9N/HxZ+qJjXgQenbMXYAI
 6gfacz9j85iKKlUQ
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 15/04/2021 19:08, Aline Santana Cordeiro wrote:
> Change line break to avoid an open parenthesis at the end of the line.
> It consequently removed spaces at the start of the subsequent line.
> Both issues detected by checkpatch.pl.
> 
> Signed-off-by: Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>
> ---
> 
> Changes since v1:
>  - Keep the * with the function return type 
>    instead of left it with the function name
> 
>  drivers/staging/media/atomisp/pci/atomisp_cmd.h | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.h b/drivers/staging/media/atomisp/pci/atomisp_cmd.h
> index 1c0d464..e2b36fa 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_cmd.h
> +++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.h
> @@ -75,8 +75,8 @@ void atomisp_wdt(struct timer_list *t);
>  void atomisp_setup_flash(struct atomisp_sub_device *asd);
>  irqreturn_t atomisp_isr(int irq, void *dev);
>  irqreturn_t atomisp_isr_thread(int irq, void *isp_ptr);
> -const struct atomisp_format_bridge *get_atomisp_format_bridge_from_mbus(
> -    u32 mbus_code);
> +const struct atomisp_format_bridge*

Keep the space before the *!

Regards,

	Hans

> +get_atomisp_format_bridge_from_mbus(u32 mbus_code);
>  bool atomisp_is_mbuscode_raw(uint32_t code);
>  int atomisp_get_frame_pgnr(struct atomisp_device *isp,
>  			   const struct ia_css_frame *frame, u32 *p_pgnr);
> @@ -381,9 +381,9 @@ enum mipi_port_id __get_mipi_port(struct atomisp_device *isp,
>  
>  bool atomisp_is_vf_pipe(struct atomisp_video_pipe *pipe);
>  
> -void atomisp_apply_css_parameters(
> -    struct atomisp_sub_device *asd,
> -    struct atomisp_css_params *css_param);
> +void atomisp_apply_css_parameters(struct atomisp_sub_device *asd,
> +				  struct atomisp_css_params *css_param);
> +
>  void atomisp_free_css_parameters(struct atomisp_css_params *css_param);
>  
>  void atomisp_handle_parameter_and_buffer(struct atomisp_video_pipe *pipe);
> 

