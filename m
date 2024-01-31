Return-Path: <linux-media+bounces-4495-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BEBA6843776
	for <lists+linux-media@lfdr.de>; Wed, 31 Jan 2024 08:15:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 79F9028A61A
	for <lists+linux-media@lfdr.de>; Wed, 31 Jan 2024 07:15:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86D8B60B9A;
	Wed, 31 Jan 2024 07:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hUwHFag2"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31D7F605AE
	for <linux-media@vger.kernel.org>; Wed, 31 Jan 2024 07:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706685073; cv=none; b=b1ulQns6p8Aw/EA1MAYeZWiJks8Eco+RNxiv5yjSnBfVWcrdLemCHgEa2/EzFCqMo8KTcZK6E67m0WTnpMXHeU8Q0Ewi866qeZRxa78ZG12cKz6j0m+ANK6WCp9KuurcQUZcqmRtSIkOP4D68G/ckitstRB+MyLQlf4DX1kNh7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706685073; c=relaxed/simple;
	bh=GmZxBCKHGyshBRlpzFoyY+WISbapATpv9MSRvwNc8UE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JTB8HmmyRnAqOXnzobj/jh9c9G/h1ZDqCMUrJEKkbBIeSTm70QJpDXBISb7v5PCppOmpDnYRy+qcr8Ed8Ft/nSOiyNqmp042Y27w9r7ZGyiQ4IebponmcRxI+CwUloH0wHTvJoAntEu+hUtEZeiXAu4OHILInsuiSsT8itAFy3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hUwHFag2; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-33ae42033e2so2901019f8f.1
        for <linux-media@vger.kernel.org>; Tue, 30 Jan 2024 23:11:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706685069; x=1707289869; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xd47AY+hSOC1Xyva7tGd95qEcQuLSb1LeXLcWajNgAM=;
        b=hUwHFag2XxOGCFr/PY5G56SmEQbCTlcEwMqID8H9IYyN4giZdtjGClTnEDPIhuJfDi
         rv9AOzDpvPWifPND9D8wm0uL4vng7hHmM01HD6bPjTIuntSHegettj8Nn/3D8280iXmi
         i8qf5lkqPGk6nTJTJEW2SNp6daNxmBK9gIvzNGwJdi5lN0df/mrSEUM/4+1YSoegUcP+
         EOOnNebw1cyWiXgrx8/OGTbp5UiUGG0WqC5A6Kb38yBXRohYs+9Uhq7jCcwzpQrSBC79
         94ad0tpuK1OdBi+/XlycenhVbMcGJvokVcarmhjykw6F//7FyJ1UQQYsbHFZSmcdl0e1
         vqrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706685069; x=1707289869;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xd47AY+hSOC1Xyva7tGd95qEcQuLSb1LeXLcWajNgAM=;
        b=A8eY+u+SITdW6Wz4bINEi8SDmIVO45kSHPo/MZKpQ756LI3NUaPzWwnsZWhAbWKHfs
         sJ49/RL7FtaXsaQl6dXuVYyBEXAC8MG7SakJPBF+lidyuFRIdbUCHF+6f8UA/8dB/yIb
         D4iaoIDKK8TXZRhQ14nU3mWkHyIwY2I8tUvQZ07wTkSjxMTV7qy2oZGbUO1RoWbTgsh6
         6YBdNeYtpDnWIb/a2NG2fTipNPbZB2GEhp5K9SzhIBuopWvfb+7xumzwdjjS5ifFQyvO
         1t5+aWBFS9yJI2sgKQKsJPITQqMbsIAoXbHd2e9AUZjrnOuCHAgQ5US/y6LAeoUP3hpe
         k3NA==
X-Gm-Message-State: AOJu0Yybz6QX0PKM6RXg9OUttu6//p+NUJkbx6ut5oQDrS8QCDaxjzxh
	Q2lq/kjDOk+8A1y9Yqg0ClmLy1Q/RTKV692Q+ZsfIWH/+Q7gTI2k/qAQYkc+X2Y=
X-Google-Smtp-Source: AGHT+IEyKPmpHFa7HaT0jvS9qsD8XCK+6xrkENSZQ68dn84bwoxwKIJDSm37rBEZtio3YJMumHUcPQ==
X-Received: by 2002:a5d:4d92:0:b0:33a:f493:146e with SMTP id b18-20020a5d4d92000000b0033af493146emr443953wru.55.1706685069450;
        Tue, 30 Jan 2024 23:11:09 -0800 (PST)
Received: from localhost ([102.140.226.10])
        by smtp.gmail.com with ESMTPSA id h4-20020adfa4c4000000b00337d4eed87asm12644859wrb.115.2024.01.30.23.11.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jan 2024 23:11:09 -0800 (PST)
Date: Wed, 31 Jan 2024 10:11:06 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: yunfei.dong@mediatek.com
Cc: linux-media@vger.kernel.org
Subject: [bug report] media: mediatek: vcodec: add h264 decoder driver for
 mt8186
Message-ID: <2125aa4b-9761-4032-88ad-5a1c00c8cec3@moroto.mountain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Yunfei Dong,

The patch 397edc703a10: "media: mediatek: vcodec: add h264 decoder
driver for mt8186" from May 12, 2022 (linux-next), leads to the
following (in development) Smatch static checker warning:

drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_if.c:351 vdec_h264_slice_decode() potential NULL container_of 'fb'
drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp8_req_if.c:337 vdec_vp8_slice_decode() potential NULL container_of 'fb'
drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c:728 vdec_h264_slice_single_decode() potential NULL container_of 'fb'

drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c
    709 static int vdec_h264_slice_single_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
    710                                          struct vdec_fb *unused, bool *res_chg)
    711 {
    712         struct vdec_h264_slice_inst *inst = h_vdec;
    713         struct vdec_vpu_inst *vpu = &inst->vpu;
    714         struct mtk_video_dec_buf *src_buf_info, *dst_buf_info;
    715         struct vdec_fb *fb;
    716         unsigned char *buf;
    717         unsigned int data[2], i;
    718         u64 y_fb_dma, c_fb_dma;
    719         struct mtk_vcodec_mem *mem;
    720         int err, nal_start_idx;
    721 
    722         /* bs NULL means flush decoder */
    723         if (!bs)
    724                 return vpu_dec_reset(vpu);
    725 
    726         fb = inst->ctx->dev->vdec_pdata->get_cap_buffer(inst->ctx);

Smatch says that "fb" can be NULL.

    727         src_buf_info = container_of(bs, struct mtk_video_dec_buf, bs_buffer);
--> 728         dst_buf_info = container_of(fb, struct mtk_video_dec_buf, frame_buffer);
                ^^^^^^^^^^^^
If "fb" is NULL then dst_buf_info will point to bogus memory.


    729 
    730         y_fb_dma = fb ? (u64)fb->base_y.dma_addr : 0;
    731         c_fb_dma = fb ? (u64)fb->base_c.dma_addr : 0;
                           ^^
These lines assume "fb" can be NULL.


    732         mtk_vdec_debug(inst->ctx, "[h264-dec] [%d] y_dma=%llx c_dma=%llx",
    733                        inst->ctx->decoded_frame_cnt, y_fb_dma, c_fb_dma);
    734 
    735         inst->vsi_ctx.dec.bs_buf_addr = (u64)bs->dma_addr;
    736         inst->vsi_ctx.dec.bs_buf_size = bs->size;
    737         inst->vsi_ctx.dec.y_fb_dma = y_fb_dma;
    738         inst->vsi_ctx.dec.c_fb_dma = c_fb_dma;
    739         inst->vsi_ctx.dec.vdec_fb_va = (u64)(uintptr_t)fb;
    740 
    741         v4l2_m2m_buf_copy_metadata(&src_buf_info->m2m_buf.vb,
    742                                    &dst_buf_info->m2m_buf.vb, true);
                                           ^^^^^^^^^^^^^^^^^^^^^^^^^
If "fb" is NULL, this will crash.  The other warnings are the same where
the checking for NULL "fb" isn't done consistently.

    743         err = get_vdec_sig_decode_parameters(inst);
    744         if (err)

regards,
dan carpenter

