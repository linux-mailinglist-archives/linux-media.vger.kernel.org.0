Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D202C1C6977
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2020 08:54:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728010AbgEFGx5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 May 2020 02:53:57 -0400
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:52829 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725782AbgEFGx4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 6 May 2020 02:53:56 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id WDwEjnDEK8hmdWDwHjBf2e; Wed, 06 May 2020 08:53:54 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1588748034; bh=ajeYTYpW2stA5uxu5d9aTwu82ozRtYvaSmlwniMHM7g=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=tNlpNrhmVLgMGOJ9zBRHwpB4FJi//gD1n5ZyZaWBVVi+ElW+XnjlLdzyWC5a9sBDJ
         pzTkJe1+mewgJnve8bMhjs2/xARqjNmGK5O3Dx/Px5DMxOHJecFcCFriaKhmjxP9Vj
         AO5N41lrlw3qzyAa++8HlseTSf5xQf9FrYzxaaSaCGR9EsQesxCrSM3W1oomd1mf4j
         9Ct7p6I80AgzKfjBhxVq/0LMUwNvOW7fVUN47jwrTTJzRK2Mfc/BlA5eunICnBXrD6
         VEwZyQ+tL1Wr1y53CoaSfxe5TTaCbW5Ztezz0D9ft/FpZPHJROFMk4Z0eDNMJdkIn8
         mO7ptlXIdAowQ==
Subject: Re: [RFC PATCH v12 7/9] MAINTAINERS: Add Tegra Video driver section
To:     Sowjanya Komatineni <skomatineni@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com, frankc@nvidia.com,
        sakari.ailus@iki.fi, helen.koike@collabora.com
Cc:     digetx@gmail.com, sboyd@kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1588645920-20557-1-git-send-email-skomatineni@nvidia.com>
 <1588645920-20557-8-git-send-email-skomatineni@nvidia.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <f8c66ec5-7641-5600-b79e-30624a18ebdd@xs4all.nl>
Date:   Wed, 6 May 2020 08:53:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <1588645920-20557-8-git-send-email-skomatineni@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfP+ADfYPsJxKFMVzegRcx63hwx1VPGOY6SaLmRkjlJq/HES6338CeQoKPOKdclkKQMafEqMOqUEeJG8PJaXxUX4tHzS0oA3uEQwBbG5ZJyju7smDqcZm
 XjVQG125ksEoKx7NKRPmCndh+R++QKs5TgFLHaloLV8uIUOdDS2RzHHGNRFv/Vdgw5wle9CDtPh80Gk1EHKt2nlrR3HyiTgkVABa5CGcEHFKUrZLacJG+m8T
 RLliCCbxg8BOdsC8g6zHZBvMTEnSdQFI/wgQVITa+mAV8uxLtsUoGpZ66pj0+8BcUahF15tZJl23jH7E8BbxKOgIj/4+jmnOHbuDvABcLt0KAlTP1kYyjnwe
 lXmEod1FHxVjBw1dpn1mnC/qInOOKA24zq3jPS6W1n3OKBX6VW3Pr5dGdRrkSDzZuKcd+Hh2F3aI2MZgJc6Zjwo4Wv9wV7nperBxKy2OH/qEFyw9lEPw8kql
 0e2N4OK/zmL8Z2xLOjcygDYZI8rLRDPNRvPtEcjI0GG4f1F8mA0wCVBSKASAiomy8jnbhjI+fE2x25rqfj0ix6rTnNhbB1JWiSSqyDEh3mU17HfziU6/isXS
 z3M=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 05/05/2020 04:31, Sowjanya Komatineni wrote:
> Add maintainers and mailing list entries to Tegra Video driver section.
> 
> Acked-by: Thierry Reding <treding@nvidia.com>
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>

Since this goes through Thierry:

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Regards,

	Hans

> ---
>  MAINTAINERS | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index fe55b3f..611d7bc 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -16652,6 +16652,16 @@ M:	Laxman Dewangan <ldewangan@nvidia.com>
>  S:	Supported
>  F:	drivers/spi/spi-tegra*
>  
> +TEGRA VIDEO DRIVER
> +M:	Thierry Reding <thierry.reding@gmail.com>
> +M:	Jonathan Hunter <jonathanh@nvidia.com>
> +M:	Sowjanya Komatineni <skomatineni@nvidia.com>
> +L:	linux-media@vger.kernel.org
> +L:	linux-tegra@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
> +F:	drivers/staging/media/tegra/
> +
>  TEGRA XUSB PADCTL DRIVER
>  M:	JC Kuo <jckuo@nvidia.com>
>  S:	Supported
> 

