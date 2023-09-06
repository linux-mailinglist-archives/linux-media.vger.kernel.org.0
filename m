Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C1887939D6
	for <lists+linux-media@lfdr.de>; Wed,  6 Sep 2023 12:28:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238950AbjIFK2J (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 Sep 2023 06:28:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238958AbjIFK2J (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 6 Sep 2023 06:28:09 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A84910F9
        for <linux-media@vger.kernel.org>; Wed,  6 Sep 2023 03:28:05 -0700 (PDT)
Received: from [192.168.88.20] (91-154-35-171.elisa-laajakaista.fi [91.154.35.171])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 46A1510FC;
        Wed,  6 Sep 2023 12:26:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1693995996;
        bh=6bCjItkxvcbukakWl9PwbW5GRpAeu27DDzR+6hWRiHA=;
        h=Date:Subject:To:References:From:In-Reply-To:From;
        b=plwWi3m57hCNyYLHyUUZGNb+fZQ+zv51x0TsIe41aaUqidUBCe9m9ytZzTeBKeequ
         Wkms9BsF9QmSbI8hnhMfaPznuut8UWjbH/63/vP77QXpna8TPk8/6IaIkDhewEDnr1
         LyXn1bRjNzVpaOxKXhZSRd8qkP59+KpIR5MbBRMg=
Message-ID: <15361ac5-8c1b-fce1-f101-ab9d83f21abb@ideasonboard.com>
Date:   Wed, 6 Sep 2023 13:28:00 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [v4l-utils PATCH 1/1] utils: libv4l2subdev: Set stream for
 g_routing
Content-Language: en-US
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
References: <20230906094923.1447570-1-sakari.ailus@linux.intel.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <20230906094923.1447570-1-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,PDS_OTHER_BAD_TLD,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 06/09/2023 12:49, Sakari Ailus wrote:
> Set the stream field for g_routing. This was missed in the original patch
> adding support for streams.

I think you mean g_selection, in both the subject and desc.

Other than that:

Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>


> Fixes: e300287381c6 ("media-ctl: Add support for routes and streams")
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>   utils/media-ctl/libv4l2subdev.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/utils/media-ctl/libv4l2subdev.c b/utils/media-ctl/libv4l2subdev.c
> index 16e1284cc0a3..c614f4a2e0fd 100644
> --- a/utils/media-ctl/libv4l2subdev.c
> +++ b/utils/media-ctl/libv4l2subdev.c
> @@ -166,6 +166,7 @@ int v4l2_subdev_get_selection(struct media_entity *entity,
>   
>   	memset(&u.sel, 0, sizeof(u.sel));
>   	u.sel.pad = pad;
> +	u.sel.stream = stream;
>   	u.sel.target = target;
>   	u.sel.which = which;
>   

