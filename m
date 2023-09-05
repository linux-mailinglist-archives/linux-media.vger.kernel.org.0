Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6A44379251A
	for <lists+linux-media@lfdr.de>; Tue,  5 Sep 2023 18:01:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233645AbjIEQBZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Sep 2023 12:01:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354130AbjIEJrb (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Sep 2023 05:47:31 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9E2D1AD
        for <linux-media@vger.kernel.org>; Tue,  5 Sep 2023 02:47:27 -0700 (PDT)
Received: from [192.168.88.20] (91-154-35-171.elisa-laajakaista.fi [91.154.35.171])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 31609128D;
        Tue,  5 Sep 2023 11:45:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1693907158;
        bh=xuWX4Cem/ho6zJ16KyfsBiEvv//mpf68dx9bz6Sdd3A=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=Q44VSJto+g69sFAh4bAKEY6sx9SPYMw6lw8XxlyD7Xcrz61taBbGT35QOig87asUW
         T27gs3e3/6iM14MnRO0PvmYBn9/MQQN9mff7qunMdZMa98QSt/INNNqTj/yCJ/yVHW
         U7aQmqKrqCyysIwqSRB4O6DQlyuRejgcrgFHX4KU=
Message-ID: <98069c4c-d2fd-9117-08cd-eb595df77d4a@ideasonboard.com>
Date:   Tue, 5 Sep 2023 12:47:21 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 06/10] media: uapi: Add a macro to tell whether an mbus
 code is metadata
Content-Language: en-US
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        bingbu.cao@intel.com, hongju.wang@intel.com, hverkuil@xs4all.nl,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Dmitry Perchanov <dmitry.perchanov@intel.com>
References: <20230808075538.3043934-1-sakari.ailus@linux.intel.com>
 <20230808075538.3043934-7-sakari.ailus@linux.intel.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <20230808075538.3043934-7-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 08/08/2023 10:55, Sakari Ailus wrote:
> Add a macro to tell whether a given mbus code is metadata.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>   include/uapi/linux/media-bus-format.h | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/include/uapi/linux/media-bus-format.h b/include/uapi/linux/media-bus-format.h
> index 9ee031397372..2486b4178c5f 100644
> --- a/include/uapi/linux/media-bus-format.h
> +++ b/include/uapi/linux/media-bus-format.h
> @@ -182,4 +182,7 @@
>   #define MEDIA_BUS_FMT_META_20			0x8006
>   #define MEDIA_BUS_FMT_META_24			0x8007
>   
> +#define MEDIA_BUS_FMT_IS_META(code)		\
> +	((code) & 0xf000 == 0x7000 || (code) & 0xf000 == 0x8000)
> +
>   #endif /* __LINUX_MEDIA_BUS_FORMAT_H */

mbus code seems to be u32, so the above won't work. Maybe:

(((code) & ~0xfffULL) == 0x7000 || ((code) & ~0xfffULL) == 0x8000)

Also, embedded formats with 0x9nnn codes are added later in the series.

  Tomi

