Return-Path: <linux-media+bounces-30356-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D4E63A9048D
	for <lists+linux-media@lfdr.de>; Wed, 16 Apr 2025 15:42:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 30D7B189C528
	for <lists+linux-media@lfdr.de>; Wed, 16 Apr 2025 13:43:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD0831AA782;
	Wed, 16 Apr 2025 13:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="nq27BIM3"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E70C156F20
	for <linux-media@vger.kernel.org>; Wed, 16 Apr 2025 13:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744810961; cv=none; b=OlmlcijMfMLWP6rGe9CVCjOKJELHUMwuguc51JdMKWgZDQpQk+M4jSMPWrsRylJVLHRjpeiw5tii+BRrSi1kqnW13UGPTcOJMRxbw6meaNU1sThZlxTNoig3FP55PJrNa8R/RIobIU3S6SrqoZknwO245sWQqdn2yPsnJFjv3+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744810961; c=relaxed/simple;
	bh=cu1hwgcAG1/lyg5yFhVpUwC+hLyuquvPpqbuQLeIMmM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=RP3asQUY9g8dlrJ77qr92ncCOzUmGpwDYakIitfOTa/urJIeFmLxMLmkq82ZZvBZJFhrt3sbpaL6FuK2qiMILc4s3hcd1hMwt9hCw5VAgxDZFLrNFnL4CqXv+WTz3Uqe6W4t86lQLzTVNEftsYzcBU0B8GBXbJR0H91w+C00zr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca; spf=none smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=nq27BIM3; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ndufresne.ca
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-476805acddaso62534071cf.1
        for <linux-media@vger.kernel.org>; Wed, 16 Apr 2025 06:42:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1744810958; x=1745415758; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=cu1hwgcAG1/lyg5yFhVpUwC+hLyuquvPpqbuQLeIMmM=;
        b=nq27BIM3x4k9bM626X7OV/MMObMRsnLmGnsf2gruIoHQO30pZOK4JYZ4TNY+DKgXE1
         84L1hjElYc3M4/QMCn0rOvYQpvax0u9dWhs3l9q3o4SLLidxYLj9BxGft5RXzQBbLPs6
         CqVB5qh4szB5kOrKpBHK0DhJ5LJYF9EnYoXAXe/tgVr5HQMeQSWVR3NHfG9SjMlFI4/G
         wF92ZT11dQey2mdg32k7dO4LA50mryXkhTLiHqZGO3bwlljVm6pvhIXRoSpIJONMEd7a
         EfQ1PPVP+8Wdyg3C5OkGXIrxdA+FbPWdh1LIZM12bPbUyxH/6YgUIxG1kC6WN51wyL8f
         8tvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744810958; x=1745415758;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cu1hwgcAG1/lyg5yFhVpUwC+hLyuquvPpqbuQLeIMmM=;
        b=mRxjYEWy1XjY6/24o7Q/qqgKxCcXVyru6qBZ8BiP8lEiNu/EB0F27mXujCV9g/hxug
         I77R5tGjjEE180BJOTaNRjAw39/SnoCaP0kAYki873UVSrCnnPNIAxnyjV5+ARSV0kA5
         WE5dtdD3lz1Z/No8xN1InGzK80scPldzZQ9tO8py/Nv4/EenrMqqe2iFQ20rBxSFRMjs
         HX1evYqiJdpPpeqdy9S4nsfKvB8Pts7mlFyF8+gz0DDSDkRNTDeAYlZxP1L2ACwkI3I2
         NvtTEtKLQH0oF2e1kVXfkuqpSoh3ylhLP9InIq2RHP5wREOc0J/S8PyHBEYvP0EgANHs
         IPpg==
X-Forwarded-Encrypted: i=1; AJvYcCVDI6Hgz7BRp9s6eTibtiyUU9nI7UlnFJo5GeRqXUUU4HGowXeNcH0RmtncWfoI0Yo0wzOQz4YO94oJTA==@vger.kernel.org
X-Gm-Message-State: AOJu0YygXQnUJBsBOo01i8bVy2EAuSBPq1dl2NaLBO33LOE0TmM3Lk1u
	ihvLP4obJmD8XsmtcUvhAcc7/Ns4FPL+3+gjxzMUF7g5MDpYfnTMZn53RBmg4x8=
X-Gm-Gg: ASbGnctL0j7ZT9iAFnlFhSyGTZmqFvyS8vZtxZRAxA6fDr9a+n+2dgWbxtHvP3oTnqg
	ZD60PDJ6wB0CHfl2xdjiGNrD9wEY017gyhmorkqu2bbQmAeKmiMnuDw8wrX3HUT7mQMILDB0e1y
	Qhpegqti4ToKFzZGFMKBtJKLYPl1i9QbngYRhq0HsMw/G+l/k/nTFOdvIgZ4b/BDK0GRYFuTBGZ
	meaue9NauyjBNwUcMt6gsBpJp1FyTo55I1BF2mATk502Bm+ZIEkwnh+kyopv9enuf4qyimDAfNV
	u3MHmqCVRzq9wSlzUbe+ECP4up22zHtaIdf6sxSJVzGP5g==
X-Google-Smtp-Source: AGHT+IE/Z29VG3gT2+6rvTenOSNxGyAWOb6Ti3OyI7fAKZIAmEM2rbxTc/8xC7xoiOKGeoh/P504aQ==
X-Received: by 2002:a05:622a:1447:b0:47a:cc04:aabc with SMTP id d75a77b69052e-47ad80b4f4amr28281461cf.21.1744810958243;
        Wed, 16 Apr 2025 06:42:38 -0700 (PDT)
Received: from ?IPv6:2606:6d00:15:9913::5ac? ([2606:6d00:15:9913::5ac])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4796eb0b82bsm108390751cf.7.2025.04.16.06.42.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 06:42:37 -0700 (PDT)
Message-ID: <2d9bac728c5135fe3236f6f9fa55a3cb5739cffa.camel@ndufresne.ca>
Subject: Re: [PATCH 05/20] media: iris: Send V4L2_BUF_FLAG_ERROR for buffers
 with 0 filled length
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Dikshita Agarwal <quic_dikshita@quicinc.com>, Bryan O'Donoghue	
 <bryan.odonoghue@linaro.org>, Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Stefan Schmidt	 <stefan.schmidt@linaro.org>, Hans
 Verkuil <hverkuil@xs4all.nl>, Bjorn Andersson	 <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring	 <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley	
 <conor+dt@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Neil Armstrong
	 <neil.armstrong@linaro.org>, linux-media@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Date: Wed, 16 Apr 2025 09:42:36 -0400
In-Reply-To: <0241cee0-c121-3f30-57a2-f1d15b5e0839@quicinc.com>
References: <20250408-iris-dec-hevc-vp9-v1-0-acd258778bd6@quicinc.com>
	 <20250408-iris-dec-hevc-vp9-v1-5-acd258778bd6@quicinc.com>
	 <b857d1dc-2b21-4b93-89db-808c5dd4035a@linaro.org>
	 <0241cee0-c121-3f30-57a2-f1d15b5e0839@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0 (3.56.0-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Le mardi 15 avril 2025 =C3=A0 10:01 +0530, Dikshita Agarwal a =C3=A9crit=C2=
=A0:
>=20
>=20
> On 4/11/2025 6:21 PM, Bryan O'Donoghue wrote:
> > On 08/04/2025 16:54, Dikshita Agarwal wrote:
> > > Firmware sends buffers with 0 filled length which needs to be dropped=
,
> > > to achieve the same, add V4L2_BUF_FLAG_ERROR to such buffers.
> > > Also make sure:
> > > - These 0 length buffers are not returned as result of flush.
> > > - Its not a buffer with LAST flag enabled which will also have 0 fill=
ed
> > > =C2=A0=C2=A0 length.
> >=20
> > Any buffer with a zero length must be flagged as LAST, else that buffer
> > should be discarded.
> >=20
> > Is this another bugfix ? Feels like one, processing redundant packets.
> >=20
> > > Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> > > ---
> > > =C2=A0 drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c | 6 =
++++++
> > > =C2=A0 1 file changed, 6 insertions(+)
> > >=20
> > > diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.=
c
> > > b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> > > index b75a01641d5d..91c5f04dd926 100644
> > > --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> > > +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> > > @@ -377,6 +377,12 @@ static int iris_hfi_gen2_handle_output_buffer(st=
ruct
> > > iris_inst *inst,
> > > =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 buf->flags =3D iris_hfi_gen2_ge=
t_driver_buffer_flags(inst,
> > > hfi_buffer->flags);
> > > =C2=A0 +=C2=A0=C2=A0=C2=A0 if (!buf->data_size && inst->state =3D=3D =
IRIS_INST_STREAMING &&
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 !(hfi_buffer->flags & HFI=
_BUF_FW_FLAG_LAST) &&
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 !(inst->sub_state & IRIS_=
INST_SUB_DRC)) {
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 buf->flags |=3D V4L2_BUF_=
FLAG_ERROR;
> > > +=C2=A0=C2=A0=C2=A0 }
> > > +
> >=20
> > Is this hypothetical or does it happen in real life ?
> Yes, it does. As part of flush, firmware returns the buffers with 0 fille=
d
> length but those shouldn't be marked as ERROR, same applies for buffer wi=
th
> LAST flag.
> This conditional check make sure the ERROR flag is associated with only
> frames which are supposed to be dropped/discarded.

informative: Due to legacy behaviour of MFC and Coda, you should never
push a zero-length buffer without one of LAST or ERROR flag. It may be
interpreted as last by some userspace otherwise.

Can you eventually write some doc on the double state machine you have
? Having two state in a state machine makes reading the code quite
harder for reviewers.

Nicolas

>=20
> Thanks,
> Dikshita
> >=20
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
> > > =C2=A0 }
> > > =C2=A0
> >=20
> > ---
> > bod

