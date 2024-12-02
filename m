Return-Path: <linux-media+bounces-22478-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D4A79E09D2
	for <lists+linux-media@lfdr.de>; Mon,  2 Dec 2024 18:26:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C19572828DD
	for <lists+linux-media@lfdr.de>; Mon,  2 Dec 2024 17:26:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84ADF1DC19E;
	Mon,  2 Dec 2024 17:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Q+XXGW9C"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 817191DBB21
	for <linux-media@vger.kernel.org>; Mon,  2 Dec 2024 17:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733160386; cv=none; b=jMpkpRqsj85/gcerlwIkebYgHr/07XA2PjoMPzcLYQ4Dhhf9mnTc/bEbP9LrWHrcl/9wr+9rkbPzZAcd/ruQbLe5ssi5dq92z0d/X1khXsNUGjg5ps2zhMUpP2vynmn4WhgUV/WyK9ITnoW6xGdb56asjoi6edc27jbHHSGXWTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733160386; c=relaxed/simple;
	bh=ae8KEDqDkL/cV/eSqqI5LQ5Sz4A4iJSDek5yer/4mas=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tXLkMIObulnS1OovNB3IcWYH/FlqCoJoZpBTCjZW/V1bsUQc211/VYYKVfmtAMprgOmBq3ujQW9suztbDRUJwtuwYLb9CEcnZNfr0dh5ElYM4WwLKdGDYPJaLhFS9fVegbQ3Ot7Xev9l408yntIg0lc0y8n4L4bRQ8w6EUwon5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Q+XXGW9C; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-21278f3d547so33613515ad.1
        for <linux-media@vger.kernel.org>; Mon, 02 Dec 2024 09:26:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733160384; x=1733765184; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hQBhvBNYSI1fNvIhGqfRe5QD/yRE1BVFAKx554DMguU=;
        b=Q+XXGW9C0FWDu4dQ3yJ+/QAXjWFgmNfZuVmxYNASz0Scwt7sILT0XxiwLb8lNqy1Zv
         4JGcQtspluCwB3HaoEQnWG/yxkLkCIktyE6r/43NjulXEx4pthYkT3TGQCbEtqqOIpp8
         iU6z2QZ+bfDJyK3Z2EiJfX45rolzNrNiYIp6Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733160384; x=1733765184;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hQBhvBNYSI1fNvIhGqfRe5QD/yRE1BVFAKx554DMguU=;
        b=osidWBw2LP/E9p1FE4AV43VikSDX8kiI54jxiV3guRdpciygi791oC1l9qCXEHQKvG
         fF9AFKGzDZUqme6l4EDRbezLntD3QgtlcTvDracawZ5ptVCAVe2QTmMOfNlEi/LcHNJo
         5vW/xglR1unLuFeQEx2aF3UqWlcoYxD7ruAKS5SHEPMKc+waldPvgU3aiTuWrRKTtVmM
         PeDDPYml4z13oLoh1nQJO5lTe24uW+LmQEBIlKzaNy2N8mn0O7ntcLA0j09c3DmCQabo
         st14+945qe4Ks1UOfPK5OylFWAHdaCF1QQLwC4KBaYpNuiEfyN3porcppCcOcOawH1mr
         fC1Q==
X-Forwarded-Encrypted: i=1; AJvYcCUKhmzngjM5V6TVDNDa/7vi88WVmHtGqidq8xVdy50lhZbTYSl1k5S7a0Xff4H4vY/qsUiMptsBbfWECw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxowfonXSCewok9Vv08nqQ8yddHUFyl1jnNnzwkGJa5/DwXoNGY
	jWxAc5ZUSdrHos4rLmbvGlmD5/ZW+1sk5t1rT0mysZyEG2flzGNEJZSydcEtwjeBTV9mavxSdhg
	=
X-Gm-Gg: ASbGncu6W7+WjwWIT85YP/nn6tujztnPKyearDHbn5jTMILW1GCCg9m9LpDajHldCqy
	ZT1NwMkAH5Ho4w5ORSBtI0JS+IQDXtrGiX1dJ9e2dcElCEQu6YaS88jGIzT+VUyMXdk9DUPIged
	kBAikuKE6Qk1yhlicYT0LFmJnBDuZhK1ALEs1hjGJuA7Q1GqmBHH90s0YIJSgAFadYXTfl9dDFr
	Eta0QppFE1s/W0rTRN17PeCeYgJWOG4kj9C7rVJ5q2Ek4sjvLimt6nX/eBk8lUIOWw0nwBbSTeD
	p7guBziai1zSH/48
X-Google-Smtp-Source: AGHT+IG8EyrM1i2VVY9Rrvh05z+1YQTQieo5sQWF1BIaiE+8nVIp9VZIrVQa5mjKyve9x8wSvQMvhQ==
X-Received: by 2002:a17:902:d502:b0:212:9aca:14b4 with SMTP id d9443c01a7336-21501b63fb2mr354891485ad.35.1733160384606;
        Mon, 02 Dec 2024 09:26:24 -0800 (PST)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com. [209.85.210.176])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-215a57c9450sm13974235ad.143.2024.12.02.09.26.20
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Dec 2024 09:26:22 -0800 (PST)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-724f41d520cso2664597b3a.1
        for <linux-media@vger.kernel.org>; Mon, 02 Dec 2024 09:26:20 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXBi51FfVH75UY1kz0eX+AF/TMZa5j8xJRh8qIkeWaA0cID3WLcsspITbpX+Zqq0yvONCfP3b9njOZ8yA==@vger.kernel.org
X-Received: by 2002:a17:902:e5d0:b0:215:5a53:eded with SMTP id
 d9443c01a7336-2155a53eff1mr163851165ad.39.1733160379613; Mon, 02 Dec 2024
 09:26:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241202-fix-llvm9-v1-0-2a50f5acfd0b@chromium.org>
 <20241202-fix-llvm9-v1-3-2a50f5acfd0b@chromium.org> <20241202162454.GA2848026@thelio-3990X>
In-Reply-To: <20241202162454.GA2848026@thelio-3990X>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 2 Dec 2024 18:26:07 +0100
X-Gmail-Original-Message-ID: <CANiDSCu+gJb5aTywEnGDQUJYws++9x=be5QLsdSUqS=XjFZGnQ@mail.gmail.com>
Message-ID: <CANiDSCu+gJb5aTywEnGDQUJYws++9x=be5QLsdSUqS=XjFZGnQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] media: mediatek: vcodec: Workaround a compiler warning
To: Nathan Chancellor <nathan@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Hans de Goede <hdegoede@redhat.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Tiffany Lin <tiffany.lin@mediatek.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
	Yunfei Dong <yunfei.dong@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

Hi


On Mon, 2 Dec 2024 at 17:25, Nathan Chancellor <nathan@kernel.org> wrote:
>
>  Mon, Dec 02, 2024 at 03:47:17PM +0000, Ricardo Ribalda wrote:
> > llvm identifies that the SCP_IPI_VENC_H264 and IPI_VENC_H264 are from
> > the same enum type, but their are part of the same ternary operator.
> >
> > vpu_inst.id is of type int, so we can just rewrite a bit the code and
> > avoid the following llvm9 warning:
>
> LLVM 19, not LLVM 9, as the minimum version for building the kernel is
> LLVM 13.
>
> > drivers/media/platform/mediatek/vcodec/encoder/venc/venc_h264_if.c:597:29: warning: conditional expression between different enumeration types ('enum scp_ipi_id' and 'enum ipi_id') [-Wenum-compare-conditional]
> >
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
>
> Reviewed-by: Nathan Chancellor <nathan@kernel.org>
>
> FYI, Arnd basically sent the same patch October 18 but I guess it has
> not been picked up?
>
> https://lore.kernel.org/20241018152127.3958436-1-arnd@kernel.org/
>
> Hopefully the new media committers model will help patches like that get
> picked up in a more timely manner.

We can take Arnd's patch.

Yeah, this is the kind of patches that the multi committers can really
help with :)

>
> > ---
> >  drivers/media/platform/mediatek/vcodec/encoder/venc/venc_h264_if.c | 6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/media/platform/mediatek/vcodec/encoder/venc/venc_h264_if.c b/drivers/media/platform/mediatek/vcodec/encoder/venc/venc_h264_if.c
> > index f8145998fcaf..4786062e879a 100644
> > --- a/drivers/media/platform/mediatek/vcodec/encoder/venc/venc_h264_if.c
> > +++ b/drivers/media/platform/mediatek/vcodec/encoder/venc/venc_h264_if.c
> > @@ -584,7 +584,6 @@ static void h264_encode_filler(struct venc_h264_inst *inst, void *buf,
> >
> >  static int h264_enc_init(struct mtk_vcodec_enc_ctx *ctx)
> >  {
> > -     const bool is_ext = MTK_ENC_CTX_IS_EXT(ctx);
> >       int ret = 0;
> >       struct venc_h264_inst *inst;
> >
> > @@ -594,7 +593,10 @@ static int h264_enc_init(struct mtk_vcodec_enc_ctx *ctx)
> >
> >       inst->ctx = ctx;
> >       inst->vpu_inst.ctx = ctx;
> > -     inst->vpu_inst.id = is_ext ? SCP_IPI_VENC_H264 : IPI_VENC_H264;
> > +     if (MTK_ENC_CTX_IS_EXT(ctx))
> > +             inst->vpu_inst.id = SCP_IPI_VENC_H264;
> > +     else
> > +             inst->vpu_inst.id = IPI_VENC_H264;
> >       inst->hw_base = mtk_vcodec_get_reg_addr(inst->ctx->dev->reg_base, VENC_SYS);
> >
> >       ret = vpu_enc_init(&inst->vpu_inst);
> >
> > --
> > 2.47.0.338.g60cca15819-goog
> >



--
Ricardo Ribalda

