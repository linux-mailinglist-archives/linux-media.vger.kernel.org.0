Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A938848E871
	for <lists+linux-media@lfdr.de>; Fri, 14 Jan 2022 11:42:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240449AbiANKl4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 14 Jan 2022 05:41:56 -0500
Received: from mx07-00178001.pphosted.com ([185.132.182.106]:43752 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233947AbiANKlz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 14 Jan 2022 05:41:55 -0500
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20E9K1Y7028639;
        Fri, 14 Jan 2022 11:41:10 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=Db8QoLf2xpm+lVoXBntS8ts6R2As6iUdm19chCVqc50=;
 b=YnGikFqXTkWXyKKI6gP9Hdz6hNUbt8VIMw4oFehA6YMpaIGn5VhmHtKn79MMXAsFPSNW
 ++ywwrN9bYLBgipIHKnNNIdTEh6e3zbryXjbawXxOSng1j/7bb8fWEMg4g/3H0dDdg2p
 la50Lc+9ujAG6kr7kj7cBoNstHn6WZ76bsHCFzF5pcwMouAYa1HaTYWw2ZVoWUVrsP+z
 a46wuBZ/VEwvQtjGPM5XI/JoYtXy9kdqtDGplfFKe5w44RaAx1EbtU2NRJjyoajASj3v
 Ft9Hl9/UXGQRPSC14GLETN95FZQx0lv3Oqg+fVXbruPEKar8EAqawewUz7nNKNHVZV9l 2A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3dk6eygfch-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 14 Jan 2022 11:41:10 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E71BB100034;
        Fri, 14 Jan 2022 11:41:09 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id DC5AA21231F;
        Fri, 14 Jan 2022 11:41:09 +0100 (CET)
Received: from lmecxl1137.lme.st.com (10.75.127.46) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Fri, 14 Jan
 2022 11:41:08 +0100
Subject: Re: [PATCH 2/2] MAINTAINERS: update drm/stm drm/sti and cec/sti
 maintainers
To:     Philippe Cornu <philippe.cornu@foss.st.com>,
        Yannick Fertre <yannick.fertre@foss.st.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Alain Volmat <alain.volmat@foss.st.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        Liam Mark <lmark@codeaurora.org>,
        Laura Abbott <labbott@redhat.com>,
        Brian Starkey <Brian.Starkey@arm.com>,
        John Stultz <john.stultz@linaro.org>,
        Christian Konig <christian.koenig@amd.com>, <soc@kernel.org>
CC:     <dri-devel@lists.freedesktop.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <linaro-mm-sig@lists.linaro.org>
References: <20220113171921.17466-1-philippe.cornu@foss.st.com>
 <20220113171921.17466-3-philippe.cornu@foss.st.com>
From:   Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
Message-ID: <7bd3229c-8b66-6a4f-4fed-cd1929f2c397@foss.st.com>
Date:   Fri, 14 Jan 2022 11:41:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220113171921.17466-3-philippe.cornu@foss.st.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-14_04,2022-01-14_01,2021-12-02_01
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 1/13/22 6:19 PM, Philippe Cornu wrote:
> Add Alain as sti maintainer for both drm/sti & cec/sti.
> Add Raphaël as stm maintainer for drm/stm.
>
> Signed-off-by: Philippe Cornu <philippe.cornu@foss.st.com>
> ---
>  MAINTAINERS | 3 +++
>  1 file changed, 3 insertions(+)


Hi Philippe,


Reviewed-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>


Thank you ! :D
Raphaël


>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 6bea080d0159..708f8c86e4c9 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -6423,6 +6423,7 @@ F:	Documentation/devicetree/bindings/display/rockchip/
>  F:	drivers/gpu/drm/rockchip/
>  
>  DRM DRIVERS FOR STI
> +M:	Alain Volmat <alain.volmat@foss.st.com>
>  L:	dri-devel@lists.freedesktop.org
>  S:	Maintained
>  T:	git git://anongit.freedesktop.org/drm/drm-misc
> @@ -6431,6 +6432,7 @@ F:	drivers/gpu/drm/sti
>  
>  DRM DRIVERS FOR STM
>  M:	Yannick Fertre <yannick.fertre@foss.st.com>
> +M:	Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
>  M:	Philippe Cornu <philippe.cornu@foss.st.com>
>  L:	dri-devel@lists.freedesktop.org
>  S:	Maintained
> @@ -18152,6 +18154,7 @@ F:	Documentation/devicetree/bindings/sound/st,sti-asoc-card.txt
>  F:	sound/soc/sti/
>  
>  STI CEC DRIVER
> +M:	Alain Volmat <alain.volmat@foss.st.com>
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/media/stih-cec.txt
>  F:	drivers/media/cec/platform/sti/
