Return-Path: <linux-media+bounces-17540-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D553C96B556
	for <lists+linux-media@lfdr.de>; Wed,  4 Sep 2024 10:48:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 013421C21C5F
	for <lists+linux-media@lfdr.de>; Wed,  4 Sep 2024 08:48:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D86661CEABD;
	Wed,  4 Sep 2024 08:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TR1bL4pL"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 876491CDA20;
	Wed,  4 Sep 2024 08:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725439368; cv=none; b=mJVgob+/CFENxUojc5daY4DXWbEbsRNM7/0RtLkj86N7rOM1DNo5xGSws3dqFJP6Pf8eLRziXVMOUCAFQD8WychXHeHalsTsww7ij7RhLo04XWKXIxTf8Rc5YCTs/agSgzGJVZbDryVzEbNugha0VX5AgTXo7M4GNtY6OoI5uxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725439368; c=relaxed/simple;
	bh=VdY4ggFvEl70ep26nXUbysnWfXGaBgr9tlRJ16b+Rfs=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Q5q0hXECvtdLn5oxAPqCtb4BRdzW13X+2ZiD4Qnb7ZtCEG+TdmVQZVQ1sYsbAajrN/5de3v9/KN1bWKkMRHm2KVHDNLHj/mS2K9xO+8VM8Jrj+pexnktN67wwggISEOFJjRU5wtuDoEkn6Q+SgDWD7A4dOukhnxIZF7ieQTtSnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TR1bL4pL; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-42c7b5b2d01so43273105e9.3;
        Wed, 04 Sep 2024 01:42:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725439365; x=1726044165; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=shuryc8UlV73M1Z/RV04h2I1CmqvY0itpik4aNPG9pM=;
        b=TR1bL4pLzB2l9ZDH5IhwXsCf/M8F3gE7SrHvdk1xKhGHUqPEUUPkRjdRiX/RGCQkrH
         /kQvCan2pQbIBly3+XyjL62fcVeSgsONTC26UNEfFZ9vjaCjTom6MQboE5WTMQrEqsmt
         uNFm/qZeBSOLp9QklEdyUoLxUvuAIImorUp1rtkkWC1zicUBQaJBrVv8dO6ij5r4/SvA
         DA3R6k1eVr8++rXSZmhMdrvI04SiLIh2PGSuembh2e3TGYMxSKbnoKIeqK4prMVozaL3
         GafFoveveSECkodTH2HQ7afj/OIFzU4tbBxPZZ/y7HsVOqjfimND8ktYcZYfpauRjT1i
         yCYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725439365; x=1726044165;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=shuryc8UlV73M1Z/RV04h2I1CmqvY0itpik4aNPG9pM=;
        b=rO8k+8c2vy0Kn1YRjQMdHVk5r+6t+K7cFGrWLxB0NLYx7GhbffAzcTp3flx6+HV5Hs
         quxIi8mIMuRgSmODKtVri500WHjC0L/dgh6i06Ri0IwVi0c/BM1ysfTJsDRlopL0WvZH
         OUzqtYREVPaZ2lr6+aWPWhQcGGWn4Xm04aJ7ZLBRuqNTkvgaUnQPUMtLOUISDDxgEyZw
         OTRO7QR9DdyJ2jN396PqGYe6jqWVb5EABYRCi/M51CUtmswn0b95GyndDfjC/9MNm745
         pXmo9jHy9HPmVT357esFGBWH7Mxcga6UI5hwymEZDopJ6PYaoW780jKDfg8VU9BRKAQV
         m9Iw==
X-Forwarded-Encrypted: i=1; AJvYcCVxUNI+0hqYDQDGEjvsj9bRb3eREEKtsClSOE4T74QkbtFkmsFEyVcj8AT+YqtOyhFkchJ/FvOxh2mNOlc=@vger.kernel.org, AJvYcCXY/NtAjDSNkTtNoo4dR3Lw0qSXmYRuyohDMtzxiG5HG8Y66bp7/iNn8FwtlTvLllzVyzUprm1+LMgQohY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8V1WsdiU6fLCnCBcOce8eoK00PjpKvOx5tyDqxHCpSRl1cc22
	5ffV2LcLD+ykJnXxEb1qumFdDxHAgOnhaSDzrXZ48CD0pLKQmyLY
X-Google-Smtp-Source: AGHT+IF/pOUJJl0LCA5WpJcCGZEm59/Vf3Hin0V6BO18X7t+yP5gInTEKJS1DwObTNtwuSa8H+xXaw==
X-Received: by 2002:a05:600c:1391:b0:426:6f87:65fc with SMTP id 5b1f17b1804b1-42bb01c19c0mr181812735e9.17.1725439364028;
        Wed, 04 Sep 2024 01:42:44 -0700 (PDT)
Received: from [192.168.0.20] ([148.56.230.39])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42bbc127ec5sm169965315e9.19.2024.09.04.01.42.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Sep 2024 01:42:43 -0700 (PDT)
Message-ID: <e58b27cc-69a8-4338-827c-c27f09856802@gmail.com>
Date: Wed, 4 Sep 2024 10:42:41 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] media: platform: mtk-mdp3: Use cmdq_pkt_create()
 and cmdq_pkt_destroy()
To: =?UTF-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 =?UTF-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 "mchehab@kernel.org" <mchehab@kernel.org>,
 =?UTF-8?B?TW91ZHkgSG8gKOS9leWul+WOnyk=?= <Moudy.Ho@mediatek.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>
References: <20240901143259.16849-1-chunkuang.hu@kernel.org>
 <20240901143259.16849-3-chunkuang.hu@kernel.org>
 <1d4e9e86-aaaf-4d19-b89f-6f7207ab72d8@gmail.com>
 <d5c512d06e013555397722137d5790dc8a627bfd.camel@mediatek.com>
Content-Language: en-US, ca-ES, es-ES
From: Matthias Brugger <matthias.bgg@gmail.com>
Autocrypt: addr=matthias.bgg@gmail.com; keydata=
 xsFNBFP1zgUBEAC21D6hk7//0kOmsUrE3eZ55kjc9DmFPKIz6l4NggqwQjBNRHIMh04BbCMY
 fL3eT7ZsYV5nur7zctmJ+vbszoOASXUpfq8M+S5hU2w7sBaVk5rpH9yW8CUWz2+ZpQXPJcFa
 OhLZuSKB1F5JcvLbETRjNzNU7B3TdS2+zkgQQdEyt7Ij2HXGLJ2w+yG2GuR9/iyCJRf10Okq
 gTh//XESJZ8S6KlOWbLXRE+yfkKDXQx2Jr1XuVvM3zPqH5FMg8reRVFsQ+vI0b+OlyekT/Xe
 0Hwvqkev95GG6x7yseJwI+2ydDH6M5O7fPKFW5mzAdDE2g/K9B4e2tYK6/rA7Fq4cqiAw1+u
 EgO44+eFgv082xtBez5WNkGn18vtw0LW3ESmKh19u6kEGoi0WZwslCNaGFrS4M7OH+aOJeqK
 fx5dIv2CEbxc6xnHY7dwkcHikTA4QdbdFeUSuj4YhIZ+0QlDVtS1QEXyvZbZky7ur9rHkZvP
 ZqlUsLJ2nOqsmahMTIQ8Mgx9SLEShWqD4kOF4zNfPJsgEMB49KbS2o9jxbGB+JKupjNddfxZ
 HlH1KF8QwCMZEYaTNogrVazuEJzx6JdRpR3sFda/0x5qjTadwIW6Cl9tkqe2h391dOGX1eOA
 1ntn9O/39KqSrWNGvm+1raHK+Ev1yPtn0Wxn+0oy1tl67TxUjQARAQABzSlNYXR0aGlhcyBC
 cnVnZ2VyIDxtYXR0aGlhcy5iZ2dAZ21haWwuY29tPsLBkgQTAQIAPAIbAwYLCQgHAwIGFQgC
 CQoLBBYCAwECHgECF4AWIQTmuZIYwPLDJRwsOhfZFAuyVhMC8QUCWt3scQIZAQAKCRDZFAuy
 VhMC8WzRD/4onkC+gCxG+dvui5SXCJ7bGLCu0xVtiGC673Kz5Aq3heITsERHBV0BqqctOEBy
 ZozQQe2Hindu9lasOmwfH8+vfTK+2teCgWesoE3g3XKbrOCB4RSrQmXGC3JYx6rcvMlLV/Ch
 YMRR3qv04BOchnjkGtvm9aZWH52/6XfChyh7XYndTe5F2bqeTjt+kF/ql+xMc4E6pniqIfkv
 c0wsH4CkBHqoZl9w5e/b9MspTqsU9NszTEOFhy7p2CYw6JEa/vmzR6YDzGs8AihieIXDOfpT
 DUr0YUlDrwDSrlm/2MjNIPTmSGHH94ScOqu/XmGW/0q1iar/Yr0leomUOeeEzCqQtunqShtE
 4Mn2uEixFL+9jiVtMjujr6mphznwpEqObPCZ3IcWqOFEz77rSL+oqFiEA03A2WBDlMm++Sve
 9jpkJBLosJRhAYmQ6ey6MFO6Krylw1LXcq5z1XQQavtFRgZoruHZ3XlhT5wcfLJtAqrtfCe0
 aQ0kJW+4zj9/So0uxJDAtGuOpDYnmK26dgFN0tAhVuNInEVhtErtLJHeJzFKJzNyQ4GlCaLw
 jKcwWcqDJcrx9R7LsCu4l2XpKiyxY6fO4O8DnSleVll9NPfAZFZvf8AIy3EQ8BokUsiuUYHz
 wUo6pclk55PZRaAsHDX/fNr24uC6Eh5oNQ+v4Pax/gtyyc7BTQRd1TlIARAAm78mTny44Hwd
 IYNK4ZQH6U5pxcJtU45LLBmSr4DK/7er9chpvJ5pgzCGuI25ceNTEg5FChYcgfNMKqwCAekk
 V9Iegzi6UK448W1eOp8QeQDS6sHpLSOe8np6/zvmUvhiLokk7tZBhGz+Xs5qQmJPXcag7AMi
 fuEcf88ZSpChmUB3WflJV2DpxF3sSon5Ew2i53umXLqdRIJEw1Zs2puDJaMqwP3wIyMdrfdI
 H1ZBBJDIWV/53P52mKtYQ0Khje+/AolpKl96opi6o9VLGeqkpeqrKM2cb1bjo5Zmn4lXl6Nv
 JRH/ZT68zBtOKUtwhSlOB2bE8IDonQZCOYo2w0opiAgyfpbij8uiI7siBE6bWx2fQpsmi4Jr
 ZBmhDT6n/uYleGW0DRcZmE2UjeekPWUumN13jaVZuhThV65SnhU05chZT8vU1nATAwirMVeX
 geZGLwxhscduk3nNb5VSsV95EM/KOtilrH69ZL6Xrnw88f6xaaGPdVyUigBTWc/fcWuw1+nk
 GJDNqjfSvB7ie114R08Q28aYt8LCJRXYM1WuYloTcIhRSXUohGgHmh7usl469/Ra5CFaMhT3
 yCVciuHdZh3u+x+O1sRcOhaFW3BkxKEy+ntxw8J7ZzhgFOgi2HGkOGgM9R03A6ywc0sPwbgk
 gF7HCLirshP2U/qxWy3C8DkAEQEAAcLBdgQYAQgAIBYhBOa5khjA8sMlHCw6F9kUC7JWEwLx
 BQJd1TlIAhsMAAoJENkUC7JWEwLxtdcP/jHJ9vI8adFi1HQoWUKCQbZdZ5ZJHayFKIzU9kZE
 /FHzzzMDZYFgcCTs2kmUVyGloStXpZ0WtdCMMB31jBoQe5x9LtICHEip0irNXm80WsyPCEHU
 3wx91QkOmDJftm6T8+F3lqhlc3CwJGpoPY7AVlevzXNJfATZR0+Yh9NhON5Ww4AjsZntqQKx
 E8rrieLRd+he57ZdRKtRRNGKZOS4wetNhodjfnjhr4Z25BAssD5q+x4uaO8ofGxTjOdrSnRh
 vhzPCgmP7BKRUZA0wNvFxjboIw8rbTiOFGb1Ebrzuqrrr3WFuK4C1YAF4CyXUBL6Z1Lto//i
 44ziQUK9diAgfE/8GhXP0JlMwRUBlXNtErJgItR/XAuFwfO6BOI43P19YwEsuyQq+rubW2Wv
 rWY2Bj2dXDAKUxS4TuLUf2v/b9Rct36ljzbNxeEWt+Yq4IOY6QHnE+w4xVAkfwjT+Vup8sCp
 +zFJv9fVUpo/bjePOL4PMP1y+PYrp4PmPmRwoklBpy1ep8m8XURv46fGUHUEIsTwPWs2Q87k
 7vjYyrcyAOarX2X5pvMQvpAMADGf2Z3wrCsDdG25w2HztweUNd9QEprtJG8GNNzMOD4cQ82T
 a7eGvPWPeXauWJDLVR9jHtWT9Ot3BQgmApLxACvwvD1a69jaFKov28SPHxUCQ9Y1Y/Ct
In-Reply-To: <d5c512d06e013555397722137d5790dc8a627bfd.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 03/09/2024 11:39, CK Hu (胡俊光) wrote:
> Hi, Matthias:
> 
> On Mon, 2024-09-02 at 17:31 +0200, Matthias Brugger wrote:
>>   	
>> External email : Please do not click links or open attachments until you have verified the sender or the content.
>>   
>>
>> On 01/09/2024 16:32, Chun-Kuang Hu wrote:
>>> Use cmdq_pkt_create() and cmdq_pkt_destroy() common function
>>> instead of implementing mdp3 version.
>>>
>>> Signed-off-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
>>> ---
>>>    .../platform/mediatek/mdp3/mtk-mdp3-cmdq.c    | 46 ++-----------------
>>>    .../platform/mediatek/mdp3/mtk-mdp3-cmdq.h    |  1 +
>>>    2 files changed, 6 insertions(+), 41 deletions(-)
>>>
>>> diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
>>> index ef5dade35fd3..740a484c8eb4 100644
>>> --- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
>>> +++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
>>> @@ -471,43 +471,6 @@ static int mdp_path_config(struct mdp_dev *mdp, struct mdp_cmdq_cmd *cmd,
>>>    return 0;
>>>    }
>>>    
>>> -static int mdp_cmdq_pkt_create(struct cmdq_client *client, struct cmdq_pkt *pkt,
>>> -       size_t size)
>>> -{
>>> -struct device *dev;
>>> -dma_addr_t dma_addr;
>>> -
>>> -pkt->va_base = kzalloc(size, GFP_KERNEL);
>>> -if (!pkt->va_base)
>>> -return -ENOMEM;
>>> -
>>> -pkt->buf_size = size;
>>> -pkt->cl = (void *)client;
>>
>> cmdq_pkt_create does not set the callback. Why doesn't that break things?
>> Same holds for the crtc driver that is already in linux-next.
> 
> This series is to remove pkt->cl.
> For the helper function whick need pkt->cl, add parameter to pass the cmdq_client information.
> Up to now, only cmdq_pkt_finalize() use pkt->cl, but it is replaced by cmdq_pkt_eoc() and cmdq_pkt_jump_rel() in [PATCH v4 1/3].
> So this would not break any thing.
> 

Right, actually this is explained in the cover letter. Sorry for the noise.

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> Regards,
> CK
> 
>>
>> Regards,
>> Matthias
>>
>>> -
>>> -dev = client->chan->mbox->dev;
>>> -dma_addr = dma_map_single(dev, pkt->va_base, pkt->buf_size,
>>> -  DMA_TO_DEVICE);
>>> -if (dma_mapping_error(dev, dma_addr)) {
>>> -dev_err(dev, "dma map failed, size=%u\n", (u32)(u64)size);
>>> -kfree(pkt->va_base);
>>> -return -ENOMEM;
>>> -}
>>> -
>>> -pkt->pa_base = dma_addr;
>>> -
>>> -return 0;
>>> -}
>>> -
>>> -static void mdp_cmdq_pkt_destroy(struct cmdq_pkt *pkt)
>>> -{
>>> -struct cmdq_client *client = (struct cmdq_client *)pkt->cl;
>>> -
>>> -dma_unmap_single(client->chan->mbox->dev, pkt->pa_base, pkt->buf_size,
>>> - DMA_TO_DEVICE);
>>> -kfree(pkt->va_base);
>>> -pkt->va_base = NULL;
>>> -}
>>> -
>>>    static void mdp_auto_release_work(struct work_struct *work)
>>>    {
>>>    struct mdp_cmdq_cmd *cmd;
>>> @@ -538,7 +501,7 @@ static void mdp_auto_release_work(struct work_struct *work)
>>>    wake_up(&mdp->callback_wq);
>>>    }
>>>    
>>> -mdp_cmdq_pkt_destroy(&cmd->pkt);
>>> +cmdq_pkt_destroy(mdp->cmdq_clt[cmd->pp_idx], &cmd->pkt);
>>>    kfree(cmd->comps);
>>>    cmd->comps = NULL;
>>>    kfree(cmd);
>>> @@ -578,7 +541,7 @@ static void mdp_handle_cmdq_callback(struct mbox_client *cl, void *mssg)
>>>    if (refcount_dec_and_test(&mdp->job_count))
>>>    wake_up(&mdp->callback_wq);
>>>    
>>> -mdp_cmdq_pkt_destroy(&cmd->pkt);
>>> +cmdq_pkt_destroy(mdp->cmdq_clt[cmd->pp_idx], &cmd->pkt);
>>>    kfree(cmd->comps);
>>>    cmd->comps = NULL;
>>>    kfree(cmd);
>>> @@ -620,7 +583,7 @@ static struct mdp_cmdq_cmd *mdp_cmdq_prepare(struct mdp_dev *mdp,
>>>    goto err_uninit;
>>>    }
>>>    
>>> -ret = mdp_cmdq_pkt_create(mdp->cmdq_clt[pp_idx], &cmd->pkt, SZ_16K);
>>> +ret = cmdq_pkt_create(mdp->cmdq_clt[pp_idx], &cmd->pkt, SZ_16K);
>>>    if (ret)
>>>    goto err_free_cmd;
>>>    
>>> @@ -700,6 +663,7 @@ static struct mdp_cmdq_cmd *mdp_cmdq_prepare(struct mdp_dev *mdp,
>>>    cmd->comps = comps;
>>>    cmd->num_comps = num_comp;
>>>    cmd->mdp_ctx = param->mdp_ctx;
>>> +cmd->pp_idx = pp_idx;
>>>    
>>>    kfree(path);
>>>    return cmd;
>>> @@ -711,7 +675,7 @@ static struct mdp_cmdq_cmd *mdp_cmdq_prepare(struct mdp_dev *mdp,
>>>    err_free_comps:
>>>    kfree(comps);
>>>    err_destroy_pkt:
>>> -mdp_cmdq_pkt_destroy(&cmd->pkt);
>>> +cmdq_pkt_destroy(mdp->cmdq_clt[pp_idx], &cmd->pkt);
>>>    err_free_cmd:
>>>    kfree(cmd);
>>>    err_uninit:
>>> diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.h b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.h
>>> index 53a30ad7e0b0..935ae9825728 100644
>>> --- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.h
>>> +++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.h
>>> @@ -35,6 +35,7 @@ struct mdp_cmdq_cmd {
>>>    struct mdp_comp *comps;
>>>    void *mdp_ctx;
>>>    u8 num_comps;
>>> +u8 pp_idx;
>>>    };
>>>    
>>>    struct mdp_dev;

