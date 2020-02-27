Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8038D171458
	for <lists+linux-media@lfdr.de>; Thu, 27 Feb 2020 10:51:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728728AbgB0Juq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Feb 2020 04:50:46 -0500
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:39633 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728666AbgB0Juq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Feb 2020 04:50:46 -0500
Received: from [IPv6:2001:420:44c1:2577:f10e:c7d:8cc0:4dc1]
 ([IPv6:2001:420:44c1:2577:f10e:c7d:8cc0:4dc1])
        by smtp-cloud7.xs4all.net with ESMTPA
        id 7FoQjCsjZjmHT7FoTjhgWE; Thu, 27 Feb 2020 10:50:44 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1582797044; bh=ByJVUEPLZ7tIhy2q8vr9cuIU5zHaJVyikWn1UOZGCH0=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=jAldvDjUP+2sch8FAjl3tRgQbtP30TxMccHRfBTx0AG7qcuIATR+YS9Nz2VyI7z6b
         2bdvHiX6Z/L6mJI7b4nv54bKnRliMEVQM7ySwyQNAkoDNchfxN8t4CYHzfevXfB9f8
         LybufA3No+1VRB5FQcWflrscC6WbERot2gpInO67/M0n6IFDADfiZx2PIF3g4pSwHx
         z/7p8fhwJ085la0RM6nw3Uw2TbL/on46LEYh1L4i8LFEemmBCgZg8m8lvoTBW42kTb
         lmP1Ema0sJ4YMTnvpQQV7+hlWMN1SEz349s++ZvojelgkPLdmfbl7iI+GBcwETKL68
         d1DrVrZF7v6fw==
Subject: Re: [PATCH v3] media: mtk-vpu: avoid unaligned access to DTCM buffer.
To:     Hsin-Yi Wang <hsinyi@chromium.org>,
        linux-arm-kernel@lists.infradead.org
Cc:     Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
        Houlong Wei <houlong.wei@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20200225172437.106679-1-hsinyi@chromium.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <6986e879-cf35-13a5-baae-9ab09ba1a0d7@xs4all.nl>
Date:   Thu, 27 Feb 2020 10:50:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200225172437.106679-1-hsinyi@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfEmWyewWtYOmHee0wLG9KVhzvdC+vZ2Yn3M5QK7toJOjegKaoNuwTebMFlNUkX4g5ubItYRWYyIhs9fGxCf8cD1rUEnuEdF4lkw2Txy5JZSTdCcXpB5B
 pzO5NkIdXaxs9P+pVHBrmJIkOsU5Eroa9DV8ZTMnglUWubr8LP9y9m4lrANhiZiELvr2vgtUaNnUrH/z4wjpIQouugabPCkx5QqnrCnfi2V6tgsdVHr8zOA8
 mskhshBV7XjDMTd5xLYZ0Sm9OpE9a0gr0ElTGRjFT+FJQNuLIVgUwDTN961nhIssd25SFvemCatJXt34OY1tWo5jOU+tteyyXulpyXgchGIMPBQTTaJL4Ji/
 BDZeOQ+aZfeJoA0ppicA6MUd7/lCyKg6hL1KWvDnx/ZLDMY6VT1KNZ9+CVD6Y4XoIfaYgurc68lAMRXyukwMzOUhuDJ/fXoZyVy7cakzf2yVCHIFr1MQkom2
 6uXVTJbJJ2ntKSdMcuzDzxxLVI/BioY4HHz9HrFB0kvsXSZ85OlEwY/El9R2R4b62kVs1vAMd79qJR06ewzsBO5vcefSk/KCV3UTXq0dtsHArbHy35bC8iLR
 Rah4L33UxuNXea6VawerW38hGGj3VKbG0GGWnNC73+Jstfp45IVOhkAtbTCX7EpKdn0ZIfFxhHTwpxpDIZAvShcQMHLyEncijo0icB4e/D51NB9J3TYHYJbP
 PGwtJwvHsA+s8xkxnt2oMOeUDgII1xG2
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 2/25/20 6:24 PM, Hsin-Yi Wang wrote:
> struct vpu_run *run in vpu_init_ipi_handler() is an ioremapped DTCM (Data
> Tightly Coupled Memory) buffer shared with AP.  It's not able to do
> unaligned access. Otherwise kernel would crash due to unable to handle
> kernel paging request.
> 
> struct vpu_run {
> 	u32 signaled;
> 	char fw_ver[VPU_FW_VER_LEN];
> 	unsigned int	dec_capability;
> 	unsigned int	enc_capability;
> 	wait_queue_head_t wq;
> };
> 
> fw_ver starts at 4 byte boundary. If system enables
> CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS, strscpy() will do
> read_word_at_a_time(), which tries to read 8-byte: *(unsigned long *)addr
> 
> Copy the string by memcpy_fromio() for this buffer to avoid unaligned
> access.
> 
> Fixes: 85709cbf1524 ("media: replace strncpy() by strscpy()")
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
> Change in v3:
> - fix sparse warnings.
> Change in v2:
> - fix sparse warnings.
> ---
>  drivers/media/platform/mtk-vpu/mtk_vpu.c | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/platform/mtk-vpu/mtk_vpu.c b/drivers/media/platform/mtk-vpu/mtk_vpu.c
> index a768707abb94..e3fd2d1814f3 100644
> --- a/drivers/media/platform/mtk-vpu/mtk_vpu.c
> +++ b/drivers/media/platform/mtk-vpu/mtk_vpu.c
> @@ -603,12 +603,14 @@ EXPORT_SYMBOL_GPL(vpu_load_firmware);
>  static void vpu_init_ipi_handler(void *data, unsigned int len, void *priv)
>  {
>  	struct mtk_vpu *vpu = (struct mtk_vpu *)priv;
> -	struct vpu_run *run = (struct vpu_run *)data;
> -
> -	vpu->run.signaled = run->signaled;
> -	strscpy(vpu->run.fw_ver, run->fw_ver, sizeof(vpu->run.fw_ver));
> -	vpu->run.dec_capability = run->dec_capability;
> -	vpu->run.enc_capability = run->enc_capability;
> +	struct vpu_run __iomem *run = (struct vpu_run __iomem __force *)data;

The use of __force is generally a bad sign. Shouldn't the 'void *data' be a
'void __iomem *data'? And vpu->recv_buf should be 'struct share_obj __iomem *recv_buf;'.
Probably send_buf as well.

In other words, the __iomem attribute should be wired up correctly throughout the
driver code, and not forcibly applied in one place. That is asking for trouble in
the future. Also, sparse only works well in detecting problems if such attributes
are applied at the right level.

Regards,

	Hans

> +
> +	vpu->run.signaled = readl(&run->signaled);
> +	memcpy_fromio(vpu->run.fw_ver, run->fw_ver, sizeof(vpu->run.fw_ver));
> +	/* Make sure the string is NUL-terminated */
> +	vpu->run.fw_ver[sizeof(vpu->run.fw_ver) - 1] = '\0';
> +	vpu->run.dec_capability = readl(&run->dec_capability);
> +	vpu->run.enc_capability = readl(&run->enc_capability);
>  	wake_up_interruptible(&vpu->run.wq);
>  }
>  
> 

