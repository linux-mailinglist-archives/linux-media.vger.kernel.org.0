Return-Path: <linux-media+bounces-29246-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CC24A7923D
	for <lists+linux-media@lfdr.de>; Wed,  2 Apr 2025 17:35:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6B1F23B4211
	for <lists+linux-media@lfdr.de>; Wed,  2 Apr 2025 15:35:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E756513D8B2;
	Wed,  2 Apr 2025 15:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="QrnQHdsa"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A49E3DDDC
	for <linux-media@vger.kernel.org>; Wed,  2 Apr 2025 15:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743608103; cv=none; b=Q97rY4T4C4alth4zVOiwH6uEnFBe0j9S+MWQ9V/lLmxIdUvrzOPQ6ipUXuh1DhikuHRq0qx5L/UHXndPNl0wY9rSsgQiF66qvRaK5rdeHDKKHdgFcX2cjlj2TP2BwmHNJgkGjQPLASYBtnwziwcY+0Y7kIjL80QxYRB/wIW1K/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743608103; c=relaxed/simple;
	bh=K682Bd58fkkp1pJQ7mnKCEx8s1kZZBJxAHAaFRvYPxg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=odDXQC8Di//YLPsgnQ1r3dl8snxaHCCLadR1DcKyRgXOHCFKZniz65W5VRTXqzvnVBUZye/Ga9J+UDiwNDC6igCM4dULl76v9KWK5/t240diEXS8sFXSgfBvbo/2m5m/Zzm5SL17WYbNQReFwYQHj5g4SolpwBxxITX+d5avpXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca; spf=none smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=QrnQHdsa; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ndufresne.ca
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-477296dce76so61355171cf.3
        for <linux-media@vger.kernel.org>; Wed, 02 Apr 2025 08:35:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1743608099; x=1744212899; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=TMIWEgwFtWafyi1/bv5jf0ov4gPA0B6DmtDQeyIS7xQ=;
        b=QrnQHdsaqIs9LFfnwAsh+/jc2YYPcPd4gsCkxbzuILcL3t4qjjymITswk+RnXZrHIy
         ZT91neAYxeTOQUeFHAVoTf5TBVtrUlfeb+bg6rAsqXeo77zVMpl2oVCBvrICfqv3ST6l
         QtjcbFMsVXUL1iTA7Rwg9+vgnXbkzU+kXwLcoNcS2D7ipPRPnkKT7PN94A+h+G+YzWxY
         +3iFP9GBdansaYlsl6jUXWYcOLCOK+X9R41zJb6BEI+uOO4Hu5H2lOLDKyqD8do4pYdH
         dqwW1eQkEmt8YvMpW7/DyKfCZ0wIlZfZ3Xl/rYkN3DSmoC373mAq2JP/p5Tr871R1R3X
         Wzaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743608099; x=1744212899;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TMIWEgwFtWafyi1/bv5jf0ov4gPA0B6DmtDQeyIS7xQ=;
        b=nZuTuiq1ellvIdBx3IKmg8RQor9TgOJ4RGbjHJvClydomOJuMi2j0WTaICUj1t0UNw
         0oAkfRa1ed7eTi+8AUOttIYkJmfM5qaks+WAGYq4fP6hLlHYlA9HJ5NLvMm+Kniz5/Y/
         Q/3/MxbNyHmTlXdHHDdVHOp/I2j4z3eqHZYzh63Py65OiJahcBzyAhE7mYvSUWA9WgDj
         Z5V/Qt5mrIGGZIkeIjpd3nRguUll9H3f6sjEsYab6vY1Xtzxw6wgift0AKvzzaMv4VaD
         RoGp5ZtHLmbSZkddF2racq7DWSsQpr3vERujLM7jZs+nEcW24ClSoPC8XaKz0YEWTfBO
         PgoA==
X-Forwarded-Encrypted: i=1; AJvYcCWDzxQme2V/6LoHK0cPyCCkXT2EchnrU87FEAbOzQ3jAtj4JpCo7gdAccFebOAmSNuizse+vnQxWp24/w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3XYCHmJrgeyC2m3ZDyG/pUvHeo7nC3J2Qc0q+ZkkHmdwEIyP9
	/O76hmdhBGaNEgpOR0m3S6jjn84QQtc+PyMFSEgfYMKM4w7y6l5YKogX68VPnd8=
X-Gm-Gg: ASbGnctZIlxkFpoLmYtDGZ7qHEA/uUNxgYusokPOdsb3pvDdWcYoE7AGm9zMrwYRz9R
	56mr7gI1nA1fnfAiK9zjS/+JDYHTkwZk2E1mL/dIxo6KEhEsee9EbcaR0vMElEZ+3u95Ezy0CwL
	3IKYXVAmcnrbgNEd0yBzG44U1o2df7TD/EGSW5lzhrNq7y3vKwnF7+Z5iJ8VEJkGqbs5c1CxoKP
	B90S608gQnzBcpbBpWblBKIQiU0clUltZU7D9tefZkIHVWrOU5NZt+pgBx540FwiM0z09WVJ7WY
	1Mzd0+t8aTzP/dw6p4NtveipzjLHhPaKR3dAd/iEnQ2RrwPFig==
X-Google-Smtp-Source: AGHT+IF86UTdqujtK2ylyC4iKj51JDYDBGg0ZkrtMCZ8qTcR6Ji/O+4OQfsimKWJomrOBg7nwZAemg==
X-Received: by 2002:ac8:5991:0:b0:476:9e82:6515 with SMTP id d75a77b69052e-47909fa7e14mr42821291cf.23.1743608099524;
        Wed, 02 Apr 2025 08:34:59 -0700 (PDT)
Received: from ?IPv6:2606:6d00:11:e976::5ac? ([2606:6d00:11:e976::5ac])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-47782a7fbf4sm80192371cf.39.2025.04.02.08.34.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 08:34:59 -0700 (PDT)
Message-ID: <8fe576366e52d530d0507d8475fb52210a27b6df.camel@ndufresne.ca>
Subject: Re: [PATCH] media: mediatek: vcodec: Correct vsi_core framebuffer
 size
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Fei Shao <fshao@chromium.org>, Hans Verkuil <hverkuil@xs4all.nl>, Mauro
 Carvalho Chehab <mchehab@kernel.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Yunfei Dong
	 <yunfei.dong@mediatek.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-mediatek@lists.infradead.org
Date: Wed, 02 Apr 2025 11:34:57 -0400
In-Reply-To: <20250314075703.4167532-1-fshao@chromium.org>
References: <20250314075703.4167532-1-fshao@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0 (3.56.0-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi,

Le vendredi 14 mars 2025 =C3=A0 15:56 +0800, Fei Shao a =C3=A9crit=C2=A0:
> The framebuffer size for decoder instances was being incorrectly set -
> inst->vsi_core->fb.y.size was assigned twice consecutively.
>=20
> Assign the second picinfo framebuffer size to the C framebuffer instead,
> which appears to be the intended target based on the surrounding code.
>=20
> Fixes: 2674486aac7d ("media: mediatek: vcodec: support stateless hevc dec=
oder")
> Signed-off-by: Fei Shao <fshao@chromium.org>
> ---
>=20
> =C2=A0.../mediatek/vcodec/decoder/vdec/vdec_hevc_req_multi_if.c=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_hev=
c_req_multi_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec=
_hevc_req_multi_if.c
> index aa721cc43647..2725db882e5b 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_hevc_req_m=
ulti_if.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_hevc_req_m=
ulti_if.c
> @@ -821,7 +821,7 @@ static int vdec_hevc_slice_setup_core_buffer(struct v=
dec_hevc_slice_inst *inst,
> =C2=A0	inst->vsi_core->fb.y.dma_addr =3D y_fb_dma;
> =C2=A0	inst->vsi_core->fb.y.size =3D ctx->picinfo.fb_sz[0];
> =C2=A0	inst->vsi_core->fb.c.dma_addr =3D c_fb_dma;
> -	inst->vsi_core->fb.y.size =3D ctx->picinfo.fb_sz[1];
> +	inst->vsi_core->fb.c.size =3D ctx->picinfo.fb_sz[1];

To Yunfei, this information is copied to be passed to the CORE, is that
value not used by the firmware ? I can see that everything else in the
driver uses the picinfo structure. I'm simply trying to understand why
that didn't break anything and what is the implication before this fix,
so I can determin is that's more or less cosmetic at the moment. That
being asked, I'll give it my:

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> =C2=A0
> =C2=A0	inst->vsi_core->dec.vdec_fb_va =3D (unsigned long)fb;
> =C2=A0

