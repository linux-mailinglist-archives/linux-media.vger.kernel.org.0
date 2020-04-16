Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F5681ABC15
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2020 11:04:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2502813AbgDPIpd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Apr 2020 04:45:33 -0400
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:46625 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2502720AbgDPIom (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Apr 2020 04:44:42 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id P05fjxrLMlKa1P05ijR4UE; Thu, 16 Apr 2020 10:41:54 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1587026514; bh=nDiiDq5VxoANMFzKvaHDm5u5hBfjVUKYxuJ4Vl53I9E=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=DVK1/Z0UttgiZCFRsZ3bMTL/5GO0v6WyWPweVBM3xhNdgn7WUS+HvaQJIyfNoxg9U
         nNMA8ToP6CIp+RnJG6vuaXWnYGzu+4NZuC049wgxmMcFTJ6H61SiS+GOG8hNSfOkx6
         xmSi8LHOxShK0bj4hZPSQ1po5fP+AQxsladHKTrI4EkQEQdwY8BKsCTvQaspqDQn91
         CoRtJJ1qmc9pgfQ+ptbFkflqY+rTeiV+nwm0DXh/aOR4p+0N2vR6d8QOuaM9Sh0Trb
         g/4WO/y+nAfVLi5pNRzWWnVqQJAVIgbAOqLLJqQHnsqz4mSQqpmaw2aV22auz3T9GZ
         JFfiyYkQ2rJmw==
Subject: Re: [PATCH 1/2] arm64: dts: mt8173: fix mdp aliases property name
To:     Hsin-Yi Wang <hsinyi@chromium.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Cc:     Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
        Houlong Wei <houlong.wei@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
References: <20200414030815.192104-1-hsinyi@chromium.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <4e335bc7-a45d-4688-a578-1e9793a61229@xs4all.nl>
Date:   Thu, 16 Apr 2020 10:41:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200414030815.192104-1-hsinyi@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfMRXhIiwag2O6pLuQ2S1/m/UzBg8JrrSZagIUAA4xYEUDBHly1PbuCwb4LDhizYpEfFs3dPdy9Dod0YG8uUWitCPx80aF9uzvLyby9dTr2yyBl9eApiU
 knu5VuVPUdx0VdZXYeZxUbWth/4x8GzHPCpbEJzaPjFfu5skGd+DYtgTCFmZ4f81p3BoDxc8zZyVUA0liIVCkfyRRoOutPpY2JRTvGu9ZSDr5KFwI+Ipp+qK
 nn+itAIR5S/QaxpBjCv/Lh7OS7WDBzxQXCVv+lt/cfWaSXCk2W1VOEVdAIpUKW5cWCNH/QtxgFDsJvJEovCcrr0pnVR5gXahpCWXmXXMJXhD0N7BbIarJB/v
 JcZ8XNAaMvoddbwLF601Bh41gLzgoKdUBBPdu/25m4Ytk/Y0wRakVq4TAfLixO/jJP3g1d5xP9QU7xFs4FE3W0sbvReAP0RLIILVohO6j0oTJSeqLsN3t0IY
 HpBdwLonp7Vg7QIIxigMTh7YxYrvcWTU+KcgXWwRlh/EPv3dfBclZ/rX3x366N5BG2PUEP5mog2ms28P2nkpY2uueEIzsAFCNhA+tdcLbpmt/vqVNusF/xkk
 wu/db57jEKXRh48AoAgObV4V
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 14/04/2020 05:08, Hsin-Yi Wang wrote:
> Fix warning:
> Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
> 
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
>  arch/arm64/boot/dts/mediatek/mt8173.dtsi | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)

I'll merge patch 2/2 for 5.8. I assume that this dtsi patch is merged through
a mediatek subsystem?

Regards,

	Hans

> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> index a212bf124e81..d1e9c41004b4 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> @@ -42,14 +42,14 @@ aliases {
>  		dpi0 = &dpi0;
>  		dsi0 = &dsi0;
>  		dsi1 = &dsi1;
> -		mdp_rdma0 = &mdp_rdma0;
> -		mdp_rdma1 = &mdp_rdma1;
> -		mdp_rsz0 = &mdp_rsz0;
> -		mdp_rsz1 = &mdp_rsz1;
> -		mdp_rsz2 = &mdp_rsz2;
> -		mdp_wdma0 = &mdp_wdma0;
> -		mdp_wrot0 = &mdp_wrot0;
> -		mdp_wrot1 = &mdp_wrot1;
> +		mdp-rdma0 = &mdp_rdma0;
> +		mdp-rdma1 = &mdp_rdma1;
> +		mdp-rsz0 = &mdp_rsz0;
> +		mdp-rsz1 = &mdp_rsz1;
> +		mdp-rsz2 = &mdp_rsz2;
> +		mdp-wdma0 = &mdp_wdma0;
> +		mdp-wrot0 = &mdp_wrot0;
> +		mdp-wrot1 = &mdp_wrot1;
>  		serial0 = &uart0;
>  		serial1 = &uart1;
>  		serial2 = &uart2;
> 

