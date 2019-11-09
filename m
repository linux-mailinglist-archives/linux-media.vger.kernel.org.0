Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 68547F5E97
	for <lists+linux-media@lfdr.de>; Sat,  9 Nov 2019 12:08:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726289AbfKILII (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 9 Nov 2019 06:08:08 -0500
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:52289 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726143AbfKILII (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 9 Nov 2019 06:08:08 -0500
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud7.xs4all.net with ESMTPA
        id TOb3iwTk7PMT8TOb6iPBE6; Sat, 09 Nov 2019 12:08:05 +0100
Subject: Re: [PATCH] media: rockchip/rga: fix potential use after free
To:     Pan Bian <bianpan2016@163.com>, Jacob Chen <jacob-chen@iotwrt.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>
Cc:     linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
References: <1572969354-8967-1-git-send-email-bianpan2016@163.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <e89f6a90-4899-0945-e11a-67be6a28e7c0@xs4all.nl>
Date:   Sat, 9 Nov 2019 12:08:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1572969354-8967-1-git-send-email-bianpan2016@163.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfAEIQNDj0MrkNwMDONLTaAveOQTV90nc/m7292hp5RhbHodvPvVOF7YABtpCI5/hudEn1y22ZqA+1Zv8Q5vySCxJngJ6HhmqrH0G4Pbt7P+WOd0lz5Y4
 63/JBeAViow65qolHk+fGi3DH5TAgkFqMuZyXAoygqjBxjI/S2NCX4SYVCL5wvIpNseOd29oQlXoTF6BPxGwODycBm/YXesDN/5rRDPxhPSdkdkx6ze4KaX/
 rIRLjaZ0DUHD0Q5blMv6aM+rE2gn/llYsl1ETROOdfA3aHM7GZ/aBax1Vb5CFJfB/rFttkCOqDlGu0X+fH53RGgAg4cza3jzMzgoxrlYQ+9534j/mKlg7JcY
 X5BUCQK0PuMiecZaAZ4JadtiuegxK/ePgPiemh52wAr2qxgako0xpEPjqnh2HHDBtVfIUhF5tV0O+mDwtS3ikCxbAjMRyQUywTz2KwIoccd+y/+sjuoIwD+3
 MfVUAq0p1Ft5fY6e
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 11/5/19 4:55 PM, Pan Bian wrote:
> The variable vga->vfd is an alias for vfd. Therefore, releasing vfd and
> then unregister vga->vfd will lead to a use after free bug. In fact, the
> free operation and the unregister operation are reversed.
> 
> Signed-off-by: Pan Bian <bianpan2016@163.com>
> ---
>  drivers/media/platform/rockchip/rga/rga.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/platform/rockchip/rga/rga.c
> index e9ff12b6b5bb..613b868fce33 100644
> --- a/drivers/media/platform/rockchip/rga/rga.c
> +++ b/drivers/media/platform/rockchip/rga/rga.c
> @@ -901,9 +901,9 @@ static int rga_probe(struct platform_device *pdev)
>  	return 0;
>  
>  rel_vdev:
> -	video_device_release(vfd);
> -unreg_video_dev:
>  	video_unregister_device(rga->vfd);
> +unreg_video_dev:
> +	video_device_release(vfd);
>  unreg_v4l2_dev:
>  	v4l2_device_unregister(&rga->v4l2_dev);
>  err_put_clk:
> 

This isn't right, you need to update the goto labels as well.

With this change unreg_video_dev releases the vdev, while rel_vdev
unregisters it. Very confusing.

I'd also rename unreg_video_dev to unreg_vdev to be consistent with
rel_vdev.

Regards,

	Hans
