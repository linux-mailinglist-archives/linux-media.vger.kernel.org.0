Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B5CBF6D1751
	for <lists+linux-media@lfdr.de>; Fri, 31 Mar 2023 08:23:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229896AbjCaGXs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 31 Mar 2023 02:23:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229437AbjCaGXr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 31 Mar 2023 02:23:47 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80077CC32
        for <linux-media@vger.kernel.org>; Thu, 30 Mar 2023 23:23:46 -0700 (PDT)
Received: from localhost (unknown [IPv6:2001:569:beb1:1500:c96f:992f:7c34:9ff])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: dbrouwer)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id CA33F660318E;
        Fri, 31 Mar 2023 07:23:43 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1680243824;
        bh=+bBG0reD8TQtEgxv7eY7OjQJ/bVJo0IIzgprffl6rms=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=K9m0jIz3MXpah8LC5rlHZ767SkYO4jMSm/eLW2N/zgU8+RbPrIjZ1HQeHuL6tqjyl
         LN3XElmwbNYc/mZ1vf0/JPOUAo1pB++IOOb3CiX2zkHPSDn5lehB1h5OtsjXj6Zn91
         IQWmD4zDOvqFTbwh+9/o0i/ZM/CmMvIFmgdI/w8EOpmzqAEfesOGhX2/Im+ZLW9daY
         5eicQ1VAycx+TvchifrvtlkUC+Eb8N3VUTOGZtkKkLX0xH4pLfr2h/HMt4uDW1He+0
         0L2CsiDhUaJgymCny8XiKYO0zRrrdZFoNNdodCbZtY7GKlrJbJGE/n64KQQswj3Wbv
         mXiQAZOvTGPGg==
Date:   Thu, 30 Mar 2023 23:23:24 -0700
From:   Deborah Brouwer <deborah.brouwer@collabora.com>
To:     Peter Seiderer <ps.report@gmx.net>
Cc:     linux-media@vger.kernel.org, hverkuil@xs4all.nl
Subject: Re: [PATCH v4l-utils v1] v4l2-tracer: fix trace path name creation
Message-ID: <ZCZ8XAdoUQCYQcLA@xps>
References: <20230330143635.17991-1-ps.report@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230330143635.17991-1-ps.report@gmx.net>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Mar 30, 2023 at 04:36:35PM +0200, Peter Seiderer wrote:
> Fix trace path name creation for poor man's development boards
> (e.g. Raspberry Pi) without RTC (starting at unix epoche aka time 0)
> by forcing initial trace_id creation with 6 valid digits.
> 
> Fixes:
> 
>   terminate called after throwing an instance of 'std::out_of_range'
>     what():  basic_string::substr: __pos (which is 5) > this->size() (which is 3)
>   Aborted
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  utils/v4l2-tracer/v4l2-tracer.cpp | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/utils/v4l2-tracer/v4l2-tracer.cpp b/utils/v4l2-tracer/v4l2-tracer.cpp
> index cb873d83..1a9a7d75 100644
> --- a/utils/v4l2-tracer/v4l2-tracer.cpp
> +++ b/utils/v4l2-tracer/v4l2-tracer.cpp
> @@ -241,11 +241,9 @@ int tracer(int argc, char *argv[], bool retrace)
>  		trace_id = json_file_name.substr(0, json_file_name.find(".json"));
>  		trace_id += "_retrace";
>  	} else {
> -		const int timestamp_start_pos = 5;
> -		trace_id = std::to_string(time(nullptr));
> -		// trace_id = trace_id.substr(timestamp_start_pos, std::string::npos) + "_trace";
> +		const int timestamp_start_pos = 1;
> +		trace_id = std::to_string(100000 + time(nullptr) % 100000);
>  		trace_id = trace_id.substr(timestamp_start_pos) + "_trace";
> -
Thanks for this patch, I checked and the file names are still working as
expected for traced, retraced and cleaned files, so looks good to me.

>  	}
>  	setenv("TRACE_ID", trace_id.c_str(), 0);
>  	std::string trace_filename = trace_id + ".json";
> -- 
> 2.40.0
> 
