Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EDC1D1AC091
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2020 14:00:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2634642AbgDPMAV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Apr 2020 08:00:21 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:41931 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2634588AbgDPL6T (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Apr 2020 07:58:19 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id P39mjcdN97xncP39pj7Yw1; Thu, 16 Apr 2020 13:58:16 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1587038296; bh=pgULbLNuPDuvkt/ZE7BTxpxzQCy1rEQZOEHhfHg1VsM=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=qjJyOjHdFOjLwbBE5AMGl7i/o5lLp0YJqVH5ujUzEQNe8Xt3PSeNOeupqZto1YFuW
         1zfq7YnpoeW8afpHrSYzbQSe8iBC3azo6Uxb6qsBAt0zV+NPGaKtNoRfw4mh+irm/C
         cK4qk7i7a19AnPLv0EmYn8EuIz6IJDOs+aiYMmuaEUZGKLHngVpwy3Mtn2wp6nhBbC
         FsE70o5599zP/V2uzhyxjS/ra95EzJUEW4p/rsJ8EEgyWh3qGLyy7D7iijvZ4j7hjc
         wXCsRTpX/+ViygxDP+AunKH8K/njPSwTGz6YWJ22p2MnWHVUglxSNVQJOZLmbwVUQ5
         mbSM0G0jboTmg==
Subject: Re: [PATCH 3/4] media: rockchip: rga: Add support for the PX30
 compatible
To:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     Jacob Chen <jacob-chen@iotwrt.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Hans Verkuil <hansverk@cisco.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20200416115047.233720-1-paul.kocialkowski@bootlin.com>
 <20200416115047.233720-4-paul.kocialkowski@bootlin.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <cd224bf8-5b0a-46e5-1657-4b40c6d3915e@xs4all.nl>
Date:   Thu, 16 Apr 2020 13:58:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200416115047.233720-4-paul.kocialkowski@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfEmG96rhmgcqUobz4xw4DTPU7o17Xmvi5xmN9E10YvKe1uRWAQ34IA/UrD5J42lmTdsyo8ey/yTPTMkxY2TjqV+ryE32yZ58s/zhufVN+JCBqYB8YTqd
 JTP8ANJFV7SYHFjqgYiARvpouqE3LcP5EponpFIyRknmpRa6MsYPuLssOMDS5mIlBLAvbslArMg3knyFzFb0jgcck7Ive6XVEP5dJaWJtLyZv1enArMbBVjZ
 h/5ph52twVpt8aTe5KonGJzlYYJba1aMWxyyeNZc7HIVoyx75CzB0Qt4qG0hUXyTiBZ1O3KOafO0dxnLJDPKsJP1HpLQRFPM9LhiRlXlMxKwX/qBh5dFQrck
 +LH3aa4HIf/N8VHqLzB0Zvm5xGv8MmXazHJ6zsPELgIG38jezZPZBpCDF5f85lDUFRXNVG6LvmyXQzAy5SChrPFC4ZwKZ7lY5K86KXA83D8fe+JGaZDUgpPp
 ybVpQUhRRnBahgWe/qwFfjWGCbk2dUXTkqi8x5jU4ufWFOtDFTrcYZ9U/+UYUQ49zXeGZrqt//ITrVC9MSUWB8K98nu0w6qvxeQeSvyj5jgJ0tPQkthejEg2
 E1V739v7VepB0WyJwMLOROH0Ch7pm6H009lDEyYBGjTS5MPX7v0drTfYmVDGQHDVdvjYUIT55hyQeDmFLkS2FGys
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 16/04/2020 13:50, Paul Kocialkowski wrote:
> The PX30 SoC has a RGA block, so add the associated compatible to
> support it.
> 
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> ---
>  drivers/media/platform/rockchip/rga/rga.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/platform/rockchip/rga/rga.c
> index e9ff12b6b5bb..0ebeb9b4c14a 100644
> --- a/drivers/media/platform/rockchip/rga/rga.c
> +++ b/drivers/media/platform/rockchip/rga/rga.c
> @@ -880,7 +880,6 @@ static int rga_probe(struct platform_device *pdev)
>  	rga->cmdbuf_virt = dma_alloc_attrs(rga->dev, RGA_CMDBUF_SIZE,
>  					   &rga->cmdbuf_phy, GFP_KERNEL,
>  					   DMA_ATTR_WRITE_COMBINE);
> -

Spurious change?

Regards,

	Hans

>  	rga->src_mmu_pages =
>  		(unsigned int *)__get_free_pages(GFP_KERNEL | __GFP_ZERO, 3);
>  	rga->dst_mmu_pages =
> @@ -955,6 +954,9 @@ static const struct dev_pm_ops rga_pm = {
>  };
>  
>  static const struct of_device_id rockchip_rga_match[] = {
> +	{
> +		.compatible = "rockchip,px30-rga",
> +	},
>  	{
>  		.compatible = "rockchip,rk3288-rga",
>  	},
> 

