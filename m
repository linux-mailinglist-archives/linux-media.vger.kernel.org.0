Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6D78D77CE2E
	for <lists+linux-media@lfdr.de>; Tue, 15 Aug 2023 16:35:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234124AbjHOOfL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Aug 2023 10:35:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237670AbjHOOex (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Aug 2023 10:34:53 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72E45E3
        for <linux-media@vger.kernel.org>; Tue, 15 Aug 2023 07:34:51 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-2b9b50be31aso82048461fa.3
        for <linux-media@vger.kernel.org>; Tue, 15 Aug 2023 07:34:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=qtec.com; s=google; t=1692110089; x=1692714889;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=agEutMmwHL+WYJIhMANrvRhbVqiLIMarlzDwKTRhAhI=;
        b=cEyw9/bumXA1bvmosrQNCT64TPJ/9NPFko/+mcU4EQSXjoH7YiJ2LKjQ5hBGptR2et
         ivH1LU75GYAdykN9HwiWHnraZda7uAkGfJIp5PTc5i3hi0FKqk6RJ4mmFlhyTmQ39owU
         89hjEbNwfEwsg2N0FRYr+Z2NgKRI0SRAVimYjAE6uLCB7INYLh+Dvzp7/7saMkwVn35y
         CDU/jTaZTsMoOvgCJYl4wy3RUDy4BWrJ7j6b3jow/gQE9AyEfE1BZ6XqXPHcwErb36AP
         IbJFP97LyGoyYgYFocsJUdhuPnojb3ZJ8XZcv6QpdYJvuQiEZJZSokWLKzVng/iJWSdg
         Xk7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692110089; x=1692714889;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=agEutMmwHL+WYJIhMANrvRhbVqiLIMarlzDwKTRhAhI=;
        b=WNO+0KkI9dA8xya5fB7y+kJreV2b7r+/0DKDsVDaqQfuuis57Jvm+/GwASwi+tIcpD
         /dAog35R8kA2pl0rLsPa6qrEpEV7/arTpD5/usLdkCk7UOvNvUqje8QJw8tRvP3kmt5Y
         Xlx9emnzZdulSZX/g1SrLzHUG7aJvDCkJfNJ66O+Btzy5+2YBEjOGmUxChPZQhu/hR2V
         U8Ocyh0oZOqgXYGIhTMauH0VVBNexPJdblYBaZVW3+axjBrt8McftWNaMYaxOLWHC1Oz
         x0plMMBsKa4QHdApvDftfdn4YOUP+Gwd0C+GP/jB90WLMVUK7j8S9kVwlNGuAi4y2qmg
         8oqQ==
X-Gm-Message-State: AOJu0YyfcT3CCHdbA8xFbzkwbT/8Ugvw7oZ4OIC/+NFpuHDzTkHOQ+i9
        PV4wNW4OkiXuonbUb2WRRdQMJ/hcjkX6p0GtY1gLAp675G6YiHfL6hm0EDTwzW9WElJ/irY3VPO
        +twLWxVb8QdorTE3kkxhXxmjiS9t5sqoy5yaP1/rlx/wYTTtbjcKNymGtAbG8LqBt2tD8bSdzf8
        g=
X-Google-Smtp-Source: AGHT+IFa4A+Pf73TbiTgokoprH6PjXa2vYCw42VPtlnHQpUFgxX8h7O0kp0OBkquvAXB+jEVgkCqow==
X-Received: by 2002:a2e:b0ed:0:b0:2b6:e159:2c3e with SMTP id h13-20020a2eb0ed000000b002b6e1592c3emr9916880ljl.33.1692110089350;
        Tue, 15 Aug 2023 07:34:49 -0700 (PDT)
Received: from [192.168.2.10] (cpe.ge-3-0-8-100.ryvnqe10.dk.customer.tdc.net. [80.197.57.18])
        by smtp.gmail.com with ESMTPSA id a17-20020a170906671100b0099bd8c1f67esm7076849ejp.109.2023.08.15.07.34.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Aug 2023 07:34:48 -0700 (PDT)
Message-ID: <4690fb95-17af-6742-90f8-9c1b0802e4e5@qtec.com>
Date:   Tue, 15 Aug 2023 16:34:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH] v4l2-ctl: Add --get/--set-ctrl support for INTEGER and
 INTEGER64 arrays
To:     linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>
References: <20230525133559.211048-1-dlp@qtec.com>
Content-Language: en-US
From:   Daniel Lundberg Pedersen <dlp@qtec.com>
In-Reply-To: <20230525133559.211048-1-dlp@qtec.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi

Gentle ping Hans

Regards Daniel

On 25/05/2023 15:35, Daniel Lundberg Pedersen wrote:
> Add support for INTEGER and INTEGER64 arrays.
> 
> Also print error if trying to print unkown array type
> 
> Signed-off-by: Daniel Lundberg Pedersen <dlp@qtec.com>
> ---
> NOTE: This patch depends on the fixed pointer types for p_s32 and p_s64
> from this patch:
> https://lore.kernel.org/linux-media/20230501145707.4088026-2-dlp@qtec.com/
> 
>  utils/v4l2-ctl/v4l2-ctl-common.cpp | 34 +++++++++++++++++++++++++++++-
>  1 file changed, 33 insertions(+), 1 deletion(-)
> 
> diff --git a/utils/v4l2-ctl/v4l2-ctl-common.cpp b/utils/v4l2-ctl/v4l2-ctl-common.cpp
> index a1cc93c825c8..d753f64d8e30 100644
> --- a/utils/v4l2-ctl/v4l2-ctl-common.cpp
> +++ b/utils/v4l2-ctl/v4l2-ctl-common.cpp
> @@ -472,6 +472,26 @@ static void print_array(const v4l2_query_ext_ctrl &qc, const v4l2_ext_control &c
>  			}
>  			printf("\n");
>  			break;
> +		case V4L2_CTRL_TYPE_INTEGER:
> +			for (i = from; i <= to; i++) {
> +				printf("%10i", ctrl.p_s32[idx + i]);
> +				if (i < to)
> +					printf(", ");
> +			}
> +			printf("\n");
> +			break;
> +		case V4L2_CTRL_TYPE_INTEGER64:
> +			for (i = from; i <= to; i++) {
> +				printf("%12lli", ctrl.p_s64[idx + i]);
> +				if (i < to)
> +					printf(", ");
> +			}
> +			printf("\n");
> +			break;
> +		default:
> +			fprintf(stderr, "%s: unsupported array type\n",
> +					qc.name);
> +			break;
>  		}
>  	}
>  }
> @@ -1149,6 +1169,18 @@ void common_set(cv4l_fd &_fd)
>  						if (idx_in_subset(qc, subset, divide, i))
>  							ctrl.p_u32[i] = v;
>  					break;
> +				case V4L2_CTRL_TYPE_INTEGER:
> +					v = strtol(set_ctrl.second.c_str(), nullptr, 0);
> +					for (i = 0; i < qc.elems; i++)
> +						if (idx_in_subset(qc, subset, divide, i))
> +							ctrl.p_s32[i] = v;
> +					break;
> +				case V4L2_CTRL_TYPE_INTEGER64:
> +					v = strtol(set_ctrl.second.c_str(), nullptr, 0);
> +					for (i = 0; i < qc.elems; i++)
> +						if (idx_in_subset(qc, subset, divide, i))
> +							ctrl.p_s64[i] = v;
> +					break;
>  				case V4L2_CTRL_TYPE_STRING:
>  					strncpy(ctrl.string, set_ctrl.second.c_str(), qc.maximum);
>  					ctrl.string[qc.maximum] = 0;
> --
> 2.38.5
> 
