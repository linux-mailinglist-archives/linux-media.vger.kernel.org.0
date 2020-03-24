Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 21E32190D3E
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2020 13:21:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727553AbgCXMU6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Mar 2020 08:20:58 -0400
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:59055 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727422AbgCXMU6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Mar 2020 08:20:58 -0400
Received: from [192.168.2.10] ([46.9.234.233])
        by smtp-cloud8.xs4all.net with ESMTPA
        id GiY4jVrsjBr2bGiY8jCVHV; Tue, 24 Mar 2020 13:20:55 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1585052455; bh=q8/Nxldo0LneGCdfQpNyLduJF8p8iKBwes/hSH0SxlM=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=qupwrIayFeTsrlTx4+9FCeHD636QJ2URJOpz0zDyrsmgIvLumwAOXyRBYwiyIUJKi
         UlnunWkyu3CDjdXMWAw8zQ/yG1u7xWxO8vWCuTRl+GPGXSnc9A6eqkPWtg25iC+ars
         nL+7OKvhKX45SH2Fi/pWZ/n8OuNoK6wgdXYQB/2CG/4yjMZDW2xhGz6A9nQu4jfR9p
         LAOC+KA4O1Cf2sMGMuJ/xY5lVp5Cf+8zr+xNjDmBvHMblW+22uUaSGwGOrkRCzUMLO
         nXF0Em7pjFM+T9dqtPnc0f8mfgX0ajrPC0sUS4XqcCfm3i52BCeBkdgmX6chA8L9J7
         kqjAOYjUgSyLw==
Subject: Re: [PATCH] media: mtk-vpu: load vpu firmware from the new location
To:     gtk_ruiwang@mediatek.com,
        Alexandre Courbot <acourbot@chromium.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Tomasz Figa <tfiga@chromium.org>, linux-media@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     Erin Lo <erin.lo@mediatek.com>, Sj Huang <sj.huang@mediatek.com>,
        Houlong Wei <houlong.wei@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Maoguang Meng <maoguang.meng@mediatek.com>,
        srv_heupstream@mediatek.com
References: <20200322075745.6133-1-gtk_ruiwang@mediatek.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <396021fd-ec2e-1ec1-602e-08b9393c5ae9@xs4all.nl>
Date:   Tue, 24 Mar 2020 13:20:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200322075745.6133-1-gtk_ruiwang@mediatek.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfPcSfPBFnE60zpFmF76AlV/HJsSpaQpqXlnD5wDic0hiCQOCEZhacKr2KO3ERRpWPwCGDnIhG3WHoksBYOMelaGBPqt1t9paNJH0Kw0WaAIlqnhhuLE4
 gAGQ5OYYcwupJvWJefx8UXCvyvrhZafMSETMwl7oQTB9JmAsXu5lXKPeiH+1rK2tST7TlRwpJAgpwkJhQlAL8906mhdxXmORyndb+7k5YAtwH3WdO5nPDg8O
 bA+5zEzsCzTVCan4hRn7fIAvbSLIO52qOclO0LJIII50/iDroZmAsvu6uxpWuVQw4k2OIvtiNs9rez0l3gDpqp1FHaNXPEFOLiAvYmdRw5Z+2RhBTCoXf0tR
 /oeOi2aGlgFwKuBo8wtN2ncHWQ4IIC+uv5zYuR0c+VLI+CYKVdpUbV06Rzr9jqKc5+wI5ghk8ydBWa5U+imU/9u9pRo4+H3kEhVA9PfoTw+L/rIWToQzuIKm
 VSnQZKQeSI2OsDIZ0vQ56lxiP3G2ls+oBZomsJrmrAiffRU5wwBS4+904yk3SQNauEkdlIGAtszGJ18Pjlh1WCX+O5P95k0X+HehJef1qf6pUCkKJxzvFfV/
 /tpwNPKPJg/46GozwS0i58kadUPDKgybfHGG6fY7JwfvD6RnZCx3uBMgg5DQhAkkQyxSAM5z1WvDPo5NKU+pwxnz0rBzZqunVJkAQGyGAcnBnbR9lxsZO+3x
 idjdCb5gpuY=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 3/22/20 8:57 AM, gtk_ruiwang@mediatek.com wrote:
> From: gtk_ruiwang <gtk_ruiwang@mediatek.com>
> 
> mt8173 VPU firmware has been moved to a sub-folder of
> linux-firmware, so load vpu-fw from the new location first,
> if it fails, then from the old one.
> 
> Signed-off-by: Rui Wang <gtk_ruiwang@mediatek.com>

Hmm, I'm getting this from checkpatch.pl --strict:

WARNING: Missing Signed-off-by: line by nominal patch author 'gtk_ruiwang <gtk_ruiwang@mediatek.com>'

Rather than sending this from 'gtk_ruiwang@mediatek.com', can you send this from
'Rui Wang <gtk_ruiwang@mediatek.com>'?

Then the two are the same.

Regards,

	Hans

> ---
>  drivers/media/platform/mtk-vpu/mtk_vpu.c | 16 +++++++++++++---
>  1 file changed, 13 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/mtk-vpu/mtk_vpu.c b/drivers/media/platform/mtk-vpu/mtk_vpu.c
> index a768707abb94..89274842e07b 100644
> --- a/drivers/media/platform/mtk-vpu/mtk_vpu.c
> +++ b/drivers/media/platform/mtk-vpu/mtk_vpu.c
> @@ -46,6 +46,8 @@
>  /* binary firmware name */
>  #define VPU_P_FW		"vpu_p.bin"
>  #define VPU_D_FW		"vpu_d.bin"
> +#define VPU_P_FW_NEW		"mediatek/mt8173/vpu_p.bin"
> +#define VPU_D_FW_NEW		"mediatek/mt8173/vpu_d.bin"
>  
>  #define VPU_RESET		0x0
>  #define VPU_TCM_CFG		0x0008
> @@ -477,16 +479,24 @@ static int load_requested_vpu(struct mtk_vpu *vpu,
>  	size_t tcm_size = fw_type ? VPU_DTCM_SIZE : VPU_PTCM_SIZE;
>  	size_t fw_size = fw_type ? VPU_D_FW_SIZE : VPU_P_FW_SIZE;
>  	char *fw_name = fw_type ? VPU_D_FW : VPU_P_FW;
> +	char *fw_new_name = fw_type ? VPU_D_FW_NEW : VPU_P_FW_NEW;
>  	const struct firmware *vpu_fw;
>  	size_t dl_size = 0;
>  	size_t extra_fw_size = 0;
>  	void *dest;
>  	int ret;
>  
> -	ret = request_firmware(&vpu_fw, fw_name, vpu->dev);
> +	ret = request_firmware(&vpu_fw, fw_new_name, vpu->dev);
>  	if (ret < 0) {
> -		dev_err(vpu->dev, "Failed to load %s, %d\n", fw_name, ret);
> -		return ret;
> +		dev_info(vpu->dev, "Failed to load %s, %d, retry\n",
> +			 fw_new_name, ret);
> +
> +		ret = request_firmware(&vpu_fw, fw_name, vpu->dev);
> +		if (ret < 0) {
> +			dev_err(vpu->dev, "Failed to load %s, %d\n", fw_name,
> +				ret);
> +			return ret;
> +		}
>  	}
>  	dl_size = vpu_fw->size;
>  	if (dl_size > fw_size) {
> 

