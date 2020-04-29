Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 90A6A1BD0FD
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2020 02:23:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726467AbgD2AXc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Apr 2020 20:23:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726450AbgD2AXb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Apr 2020 20:23:31 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A433CC03C1AC
        for <linux-media@vger.kernel.org>; Tue, 28 Apr 2020 17:23:30 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id g4so791491ljl.2
        for <linux-media@vger.kernel.org>; Tue, 28 Apr 2020 17:23:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=C/pdmU2ua6bM5Ycc1csVAEgUFZ4BowBkji8Xa1QIY6g=;
        b=NXc9e0TB/eZPPKKmUQP350BpF0d0Pz1XC77zI1fgQ6pfrL7toAPXftoZHZue7Qafg9
         2SCw2ppGg6MPnQdhr3fZJhNW1dS/9FKGl0tCMZlSE9vr7D0XJuMZXKqHwj4CuZ1rFPtj
         WdJqKyoqjG7eqNSaitq5OnxEwHj81mBXMwDzDOEtQdmCz8LO9TdPclBf8S0Yip/si7HL
         +9Hg9RXMEAbWzSCCNGWCALluZcnNvPpQaCM7MMJKCAauGC63/yUSx5qfrzAUy7gt/Jge
         oxlvkRfk81jju8HcECTO9TCKs6BfW58k82kMfrjrf7PqDDfTpTojer2LYAa7+vgPE1wx
         Dxpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=C/pdmU2ua6bM5Ycc1csVAEgUFZ4BowBkji8Xa1QIY6g=;
        b=pHpLNESGdU7d9hWPgrlB1t3NuplMi2ldXUle4m/XjgkkEZhCRsTqABkALPqbvGGVPT
         brND1rAtEhhHeJD3IILSwOfsWXhT0ddZDc4iwdAsqde0W3d+3huLznfiYmynhAIb9jT5
         P9qcZLunn1tknBRTRrRYh7QyXWdg0HFXKoa1K3gZmIZEG3fldOoMGBGJqNSaqc6pdr9P
         K2OyTuYr+dEXJbiLy23Jsxj9Pxb9HxbHrnVZO1q5sES7sveUB7PgyC+KuBogdWNyOLIh
         VVYPiPEzk6x+z7DT1Fo8fov0X0atdrPIxkJdDIgs0S8q7CayTUo1lIapsNhm8FIicQs/
         2QqQ==
X-Gm-Message-State: AGi0PuYFlYxQUC3TTEIXAhMBOyraD/Rxhxv7uZD13kd4w1OEnC03QkTG
        yMJjoxvQfniTe2SOANJOtbuetA==
X-Google-Smtp-Source: APiQypKHlVtercOMlWFn2Fz8eMjLJQxbAv5rBUrqKSbiwyLCYn/TgCtZDj1mtslltd58qv7mDxIhJg==
X-Received: by 2002:a2e:82c7:: with SMTP id n7mr9908128ljh.47.1588119809082;
        Tue, 28 Apr 2020 17:23:29 -0700 (PDT)
Received: from localhost (h-209-203.A463.priv.bahnhof.se. [155.4.209.203])
        by smtp.gmail.com with ESMTPSA id b23sm849282lff.5.2020.04.28.17.23.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2020 17:23:28 -0700 (PDT)
Date:   Wed, 29 Apr 2020 02:23:27 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Helen Koike <helen.koike@collabora.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCHv2] v4l2-compliance: add tests for V4L2_CAP_IO_MC
Message-ID: <20200429002327.GE1372619@oden.dyn.berto.se>
References: <a79f8f49-817a-1804-e88e-455f00d21006@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a79f8f49-817a-1804-e88e-455f00d21006@xs4all.nl>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

Thanks for your work.

On 2020-04-23 12:46:28 +0200, Hans Verkuil wrote:
> Add tests to check the behavior of VIDIOC_ENUM{INPUT,OUTPUT},
> VIDIOC_G_{INPUT,OUTPUT} and VIDIOC_S_{INPUT,OUTPUT} when the
> V4L2_CAP_IO_MC is set.
> 
> And the old 'node->has_inputs || node->has_outputs' argument for testColorspace()
> can now be replaced with !node->is_io_mc.
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
> Supersedes https://patchwork.linuxtv.org/patch/62312.
> ---
> diff --git a/utils/v4l2-compliance/v4l2-compliance.cpp b/utils/v4l2-compliance/v4l2-compliance.cpp
> index b3a18492..7bd2e035 100644
> --- a/utils/v4l2-compliance/v4l2-compliance.cpp
> +++ b/utils/v4l2-compliance/v4l2-compliance.cpp
> @@ -1004,6 +1004,8 @@ void testNode(struct node &node, struct node &node_m2m_cap, struct node &expbuf_
>  		node.is_video = false;
>  		node.is_meta = true;
>  	}
> +	if (node.g_caps() & V4L2_CAP_IO_MC)
> +		node.is_io_mc = true;
> 
>  	/* Information Opts */
> 
> diff --git a/utils/v4l2-compliance/v4l2-compliance.h b/utils/v4l2-compliance/v4l2-compliance.h
> index 07c7be29..6c3928fe 100644
> --- a/utils/v4l2-compliance/v4l2-compliance.h
> +++ b/utils/v4l2-compliance/v4l2-compliance.h
> @@ -97,6 +97,7 @@ struct base_node {
>  	bool is_meta;
>  	bool is_touch;
>  	bool is_m2m;
> +	bool is_io_mc;
>  	bool is_planar;
>  	bool can_capture;
>  	bool can_output;
> diff --git a/utils/v4l2-compliance/v4l2-test-formats.cpp b/utils/v4l2-compliance/v4l2-test-formats.cpp
> index 824769b3..f38bc30a 100644
> --- a/utils/v4l2-compliance/v4l2-test-formats.cpp
> +++ b/utils/v4l2-compliance/v4l2-test-formats.cpp
> @@ -447,7 +447,7 @@ static int testFormatsType(struct node *node, int ret,  unsigned type, struct v4
>  		fail_on_test(pix.bytesperline && pix.bytesperline < pix.width);
>  		fail_on_test(!pix.sizeimage);
>  		if (!node->is_m2m)
> -			fail_on_test(testColorspace(node->has_inputs || node->has_outputs,
> +			fail_on_test(testColorspace(!node->is_io_mc,
>  						    pix.pixelformat, pix.colorspace,
>  						    pix.ycbcr_enc, pix.quantization));
>  		fail_on_test(pix.field == V4L2_FIELD_ANY);
> @@ -463,7 +463,7 @@ static int testFormatsType(struct node *node, int ret,  unsigned type, struct v4
>  			return fail("pixelformat %08x (%s) for buftype %d not reported by ENUM_FMT\n",
>  					pix_mp.pixelformat, fcc2s(pix_mp.pixelformat).c_str(), type);
>  		if (!node->is_m2m)
> -			fail_on_test(testColorspace(node->has_inputs || node->has_outputs,
> +			fail_on_test(testColorspace(!node->is_io_mc,
>  						    pix_mp.pixelformat, pix_mp.colorspace,
>  						    pix_mp.ycbcr_enc, pix_mp.quantization));
>  		fail_on_test(pix_mp.field == V4L2_FIELD_ANY);
> diff --git a/utils/v4l2-compliance/v4l2-test-input-output.cpp b/utils/v4l2-compliance/v4l2-test-input-output.cpp
> index fb8d12b1..80ecf75d 100644
> --- a/utils/v4l2-compliance/v4l2-test-input-output.cpp
> +++ b/utils/v4l2-compliance/v4l2-test-input-output.cpp
> @@ -466,6 +466,10 @@ int testInput(struct node *node)
>  	if (!node->inputs && node->has_inputs)
>  		return fail("no inputs found, but input capabilities set\n");
>  	fail_on_test(node->is_m2m && node->inputs > 1);
> +	if (node->is_io_mc) {
> +		fail_on_test(!node->is_video && !node->is_meta);
> +		fail_on_test(node->inputs != 1);
> +	}
>  	return 0;
>  }
> 
> @@ -836,6 +840,10 @@ int testOutput(struct node *node)
>  	if (!node->outputs && node->has_outputs)
>  		return fail("no outputs found, but output capabilities set\n");
>  	fail_on_test(node->is_m2m && node->outputs > 1);
> +	if (node->is_io_mc) {
> +		fail_on_test(!node->is_video && !node->is_meta);
> +		fail_on_test(node->outputs != 1);
> +	}
>  	return 0;
>  }
> 

-- 
Regards,
Niklas Söderlund
