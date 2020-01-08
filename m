Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 57BE9134172
	for <lists+linux-media@lfdr.de>; Wed,  8 Jan 2020 13:08:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727236AbgAHMI4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Jan 2020 07:08:56 -0500
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:50495 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726252AbgAHMI4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 8 Jan 2020 07:08:56 -0500
Received: from [IPv6:2001:420:44c1:2577:919a:30e7:f323:4bf1]
 ([IPv6:2001:420:44c1:2577:919a:30e7:f323:4bf1])
        by smtp-cloud8.xs4all.net with ESMTPA
        id pA8liVTFJpLtbpA8piGST2; Wed, 08 Jan 2020 13:08:54 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1578485334; bh=1C0KidIyiLVO8lwHIf540UFf1K42WRXWnuM8epXFZNw=;
        h=Subject:From:To:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=q9Gsb9RT5m8IVE0R9IllFFtcoA/4erYYwBb7GEA/IF9HMxiEhyuMNkUjfrrBwq2E3
         Z47dZAhFzskFSF3g5ttC4VD0LKhCCUgDBa2xurGDAg65gG8+cUJFV4QYyvKOijzJPw
         wIs3mtlNyy3N+bs444FDU3kqd+h6Lsji5rl1KpF5Dzqzk8p/SbLSFnxh+wTR5qiNRv
         H88Ms6yfeGfvRhOG2BTHDp/2agrycIL2s916RxyzLARa8CUhHrFxjquue4vrs6xOIE
         KVWrLB9Wyug0vqfijuN1ZfQv/bTICOj45vX93u1tQZcGeXwCCBSnyplebEa3UkATHP
         gmcfnrhQM2c6g==
Subject: Re: [PATCH] drm/Kconfig: add missing 'depends on DRM' for DRM_DP_CEC
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>
References: <489bdaae-9b05-2d70-12e1-4fda7899dfc1@xs4all.nl>
Message-ID: <bbbef09d-6c90-75ba-e480-28365474b1a5@xs4all.nl>
Date:   Wed, 8 Jan 2020 13:08:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <489bdaae-9b05-2d70-12e1-4fda7899dfc1@xs4all.nl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfAYfwofXI8ne6Q6yhVgrGvPLD/zxwNq2q6mztlCWWgWgoAv4NW0M2XXSlfY09uG4RbmlvFiIDWPtPT19dd0KbqR4ANU2Nd2J+S1CrgdwZskROWo0Fc9N
 5c6UzcxMzpfJdrfF1CbgOptP5vj3OiH4SLqCCMErYELzN8Y8QPjXHoh11eL2Q6qIij8k1t112N8R76YVVUibScyaEGlYQZC0uThe8HO/ec4tb2Qht6TPLkH3
 j77oM5JOEjba9lpLjmNLR1mm1QtdP6oSB58Bf5PE13+l4pA+vYKra1Mb/hdiTLLd8/Svz8bCoQfoSARKrpkW3BNGadrPJFmC2RyW809egV7zJkHY6Mu2cpoN
 YFHmNMlkQpgmhIZ63iuYWBrE9j9FIw==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 12/6/19 12:26 PM, Hans Verkuil wrote:
> Add a missing 'depends on DRM' for the DRM_DP_CEC config
> option. Without that enabling DRM_DP_CEC will force CEC_CORE
> to =y instead of =m if DRM=m as well.
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Daniel, can you review this? It's annoying that the cec core is
compiled as part of the kernel when it can just be a module.

Regards,

	Hans

> ---
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index 1168351267fd..e8e478d6da9c 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -163,6 +163,7 @@ config DRM_LOAD_EDID_FIRMWARE
> 
>  config DRM_DP_CEC
>  	bool "Enable DisplayPort CEC-Tunneling-over-AUX HDMI support"
> +	depends on DRM
>  	select CEC_CORE
>  	help
>  	  Choose this option if you want to enable HDMI CEC support for
> 

