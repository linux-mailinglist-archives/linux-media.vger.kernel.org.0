Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D40BD62B28D
	for <lists+linux-media@lfdr.de>; Wed, 16 Nov 2022 06:03:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230244AbiKPFDs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Nov 2022 00:03:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230083AbiKPFDr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Nov 2022 00:03:47 -0500
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E45F10E1
        for <linux-media@vger.kernel.org>; Tue, 15 Nov 2022 21:03:45 -0800 (PST)
Received: from localhost (node-1w7jr9st5p2etziuntaazujnj.ipv6.telus.net [IPv6:2001:569:beb1:1500:c96f:992f:7c34:9ff])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: dbrouwer)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 5FC196602A1F;
        Wed, 16 Nov 2022 05:03:42 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1668575023;
        bh=ym4UIUN5w+GC2MMpV5P41gv12XlVuLUOZpNg4cuc00k=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=LsciKB/rcu/5w0GKA+IJf5FRJFPSA4Xe0VEIJWQAYDx1jl0dJoIADeTJWyj39vR84
         NSg/5wye2bDNyxn+c1fruh25vjGWk/aJCqE4X4NETQWWG/XaKZCUkYZuY9tB5SZjkw
         anIBLdLqHgmhTegLUzYLB04VKLxPm+P/P85zvMxW2ha5naA8EJmS5CgDGcND+39BE2
         qTRAnb/QVIfXftdIP9d18wUD+NC7vJBmass7Pm6hp/vrsiejJiUPVM2/TP6r7hKxOc
         Y8sN3ShzPX01fQyCEdejtwzGOy7ZkA7gr1UHymFEGkZtGCJOSLyhxwWqt/ACgFrxnu
         khimG6AN8ua8A==
Date:   Tue, 15 Nov 2022 21:04:25 -0800
From:   Deborah Brouwer <deborah.brouwer@collabora.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     daniel.almeida@collabora.com, nfraprado@collabora.com,
        nicolas.dufresne@collabora.com, deborahbrouwer3563@gmail.com,
        linux-media@vger.kernel.org
Subject: Re: [PATCH] v4l2-tracer: add support for most basic controls
Message-ID: <Y3Ru+Y6fzBX2Ym+9@xps>
References: <20221114184426.39997-1-deborah.brouwer@collabora.com>
 <1c1fd714-5277-417e-bf69-0941dc40a8b7@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1c1fd714-5277-417e-bf69-0941dc40a8b7@xs4all.nl>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,
Thanks for this! I have one question below

On Tue, Nov 15, 2022 at 12:36:44PM +0100, Hans Verkuil wrote:
> The v4l2-tracer utility didn't support tracing simple controls without
> a payload (i.e. the 'size' field is 0) and just a simple value.
> 
> This adds support for that, plus the four standard INTEGER64 controls
> that use field value64.
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> ---
> Hi Deb,
> 
> I think this is a nice addition for your v3 patch. Support for these
> common simple controls is easy to add, and it makes for much better
> tracing.
> 
> 	Hans
> ---
> diff --git a/utils/v4l2-tracer/retrace.cpp b/utils/v4l2-tracer/retrace.cpp
> index b736e835..f0353988 100644
> --- a/utils/v4l2-tracer/retrace.cpp
> +++ b/utils/v4l2-tracer/retrace.cpp
> @@ -734,7 +734,23 @@ struct v4l2_ext_control *retrace_v4l2_ext_control(json_object *parent_obj, int c
>  		p->value = retrace_v4l2_ext_control_value(v4l2_ext_control_obj,
>  		                                          v4l2_stateless_hevc_start_code_val_def);
>  		break;
> +	case V4L2_CID_MPEG_VIDEO_DEC_PTS:
> +	case V4L2_CID_MPEG_VIDEO_DEC_FRAME:
> +	case V4L2_CID_MPEG_VIDEO_DEC_CONCEAL_COLOR:
> +	case V4L2_CID_PIXEL_RATE: {
> +		json_object *value64_obj;
> +
> +		if (json_object_object_get_ex(v4l2_ext_control_obj, "value64", &value64_obj))
> +			p->value64 = json_object_get_int64(value64_obj);
> +		break;
> +	}
>  	default:
> +		if (!p->size) {
> +			json_object *value_obj;
> +
> +			if (json_object_object_get_ex(v4l2_ext_control_obj, "value", &value_obj))
> +				p->value = json_object_get_int64(value_obj);

The json library integers don't map to exactly what we need but should
this be just a plain int since value is __s32?

> +		}
>  		break;
>  	}
> 
> diff --git a/utils/v4l2-tracer/trace.cpp b/utils/v4l2-tracer/trace.cpp
> index f0bd7002..e26d6e6d 100644
> --- a/utils/v4l2-tracer/trace.cpp
> +++ b/utils/v4l2-tracer/trace.cpp
> @@ -405,9 +405,19 @@ void trace_v4l2_ext_control(void *arg, json_object *parent_obj, std::string key_
>  	case V4L2_CID_STATELESS_MPEG2_QUANTISATION:
>  		trace_v4l2_ctrl_mpeg2_quantisation_gen(p->p_mpeg2_quantisation, v4l2_ext_control_obj);
>  		break;
> +	case V4L2_CID_MPEG_VIDEO_DEC_PTS:
> +	case V4L2_CID_MPEG_VIDEO_DEC_FRAME:
> +	case V4L2_CID_MPEG_VIDEO_DEC_CONCEAL_COLOR:
> +	case V4L2_CID_PIXEL_RATE:
> +		json_object_object_add(v4l2_ext_control_obj, "value64", json_object_new_uint64(p->value64));
> +		break;
>  	default:
> -		fprintf(stderr, "%s:%s:%d: ", __FILE__, __func__, __LINE__);
> -		fprintf(stderr, "warning: cannot trace control: %s\n", val2s(p->id, control_val_def).c_str());
> +		if (p->size) {
> +			fprintf(stderr, "%s:%s:%d: ", __FILE__, __func__, __LINE__);
> +			fprintf(stderr, "warning: cannot trace control: %s\n", val2s(p->id, control_val_def).c_str());
> +		} else {
> +			json_object_object_add(v4l2_ext_control_obj, "value", json_object_new_uint64(p->value));

Same here I'm thinking to change uint64 to just int?

> +		}
>  		break;
>  	}
> 
> 
