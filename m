Return-Path: <linux-media+bounces-28801-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D1FF7A72044
	for <lists+linux-media@lfdr.de>; Wed, 26 Mar 2025 21:56:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B942A171F74
	for <lists+linux-media@lfdr.de>; Wed, 26 Mar 2025 20:55:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF94225F783;
	Wed, 26 Mar 2025 20:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="MdrhbgmX"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 164C125D204
	for <linux-media@vger.kernel.org>; Wed, 26 Mar 2025 20:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743022530; cv=none; b=SVBUvcnogBXCnXlR8iAJ3NNIdR6AGNC0rgYswthjP7W1CUwak795i6XMXIpqGcz/QDRfFE0SbOOr5t//lyUUdTJH0J9HPj+Kjr+17FbhKJadC8CBx/sjOEG9qdUHa0lTjSUgUVYYRu7arLQ0GAN4pkLs2yOzAMSfqLDT19/OG18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743022530; c=relaxed/simple;
	bh=Xl9hEEBlJ9dSh85SPF5rDHvTpb212NQOd6rM5MloDQM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=njcE60GKD/Y/X9oGGtg7VaJe2pwOCSsLt7vDW/UfX8/9WAqpRwd1g4j9bllwQWdpzKytsQo9/76Rai6M5DNWRtpxqfYNVWGQitXW8ksXAXT2Qf9VtNKLbTBaeB4LG1zXwediiceO1WaeogFtW89503gx1pvk1TXHttLVz0Ge0JA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca; spf=none smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=MdrhbgmX; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ndufresne.ca
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-6eaf1b6ce9aso2046636d6.2
        for <linux-media@vger.kernel.org>; Wed, 26 Mar 2025 13:55:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1743022527; x=1743627327; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5W7eit3LvJ+Cj4I9mmTKcAopJ4/V9ebVZTl7mNDE+uo=;
        b=MdrhbgmXtT/Ieg5ahtNdxsLlxXSJRPiYBkJQFyrMAf7eEbIy0ZOVPbBx7TpTPb0QDl
         w8fZiEkLdYLokIqR8KXtONwkAYuzdVrcgsbPl61Cv9x2C/1XRBFBjDknKhsS4OZcwzyr
         x9m64mUmLhDFZfUNNGhe329CQaQAQkB09CF5oQF9yecjUth3mQUIz+ITqfMxdGFOVr/2
         qyeIpBkxnwI5nnDLC2KUeNNOZ2bskuDXNS1IS/LceWbW0Mb9CXSqwevp4rrh5SSBSV2h
         hAkjL05q8/8ZJ5GIshxi43ym7Gq6/PJuWYY6o7jSbdYvvYiNMHl4VokDG/5Pg/uLZBtF
         3Ksw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743022527; x=1743627327;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5W7eit3LvJ+Cj4I9mmTKcAopJ4/V9ebVZTl7mNDE+uo=;
        b=obkwv255MvI+Wws7WHyIjW53aSil8A3tThRHN/hFiUFmifAALKt9Y3KBFcMSFXB3D+
         Jr7KtUsl7DEmoK4TNF7afoIMGc0CQU4ZDlcAeC28D7h0X79pbnfkHcXi/LpquQ3cphSI
         kHXxg1d9IijrlnyLlu3MMrHy4puFs3ze763Q2qI8bgOXUCWTpjglRLAYn+JmiErHWrJI
         0sjzn0/DHAP8ipaqbJBYYz/5bwYI++KsyQIcYwhNthb3bh/EutEMKsPAtEgIvL7LyQTo
         +iDULlHvxqF2TfLb8dpg97vIR04QnaGYOYevTTIKtFRumY7liZN7OKbiJsF/wEFUSkou
         stEg==
X-Forwarded-Encrypted: i=1; AJvYcCWVfg/j0BcmITHyMmeolTZWlLB41ZUnSjIUytTtA9xToOHdV2zeLJB4v4jDcyxPerdWMpcHsWdCIaTndg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxQFO2iUE+N8vH6sT5py1NoXsWicupjTUb7zMDFjsXN2qCJ8mmp
	jHkuimsdzTNcI2INqKDZqHy9YobG4O67KGGlLe/I/TTfniGjWQYUiOiJO4Z1sDQ=
X-Gm-Gg: ASbGncvoJCscRf1fZaOLw+bN2kFHLEch2m/ovgr9m2Vgh1Nk8/ZK/uN3LSJAqXedynT
	/I4O8n2vPg0qqaPJTA5deEFiBJlknf78KOW5io/NAN0xUSmffwlGY+Bu6Hh/P9oe4Z03I9rqbmg
	+5gMbyK/QHt240c+gHvWCMHCs0BqBR71WE5LM5LGVcZotkxzzEqAFFWozViw+KMeAXHXKRbYAEz
	HQbfz/jc9Su1gTE16CtaXLUIsbSFpiNHLM5Ky5sIw2rP8y20Nz8Kv2uaClQQn6lDoXYp3KdH00j
	6wmzZM3PPe2Ojabo42KojCOvYl5rkjdSBIQLurYQ4UduUtlOhw==
X-Google-Smtp-Source: AGHT+IHbfejsmynMze516eRewXRtjx57eaFY2IsodhkGJRNoTFNQq3NQr/NHsm2iVzU1A+1ZgZFRqw==
X-Received: by 2002:a05:6214:cc1:b0:6eb:2fd4:30a7 with SMTP id 6a1803df08f44-6ed23934b0dmr10501496d6.33.1743022526776;
        Wed, 26 Mar 2025 13:55:26 -0700 (PDT)
Received: from ?IPv6:2606:6d00:11:e976::5ac? ([2606:6d00:11:e976::5ac])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6eb3efda74esm70987466d6.102.2025.03.26.13.55.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Mar 2025 13:55:26 -0700 (PDT)
Message-ID: <927a67500f3e4495e7efe03f3d3c8250a393192d.camel@ndufresne.ca>
Subject: Re: [PATCH v3 2/2] media: amphion: Add a frame flush mode for
 decoder
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: ming.qian@oss.nxp.com, mchehab@kernel.org, hverkuil-cisco@xs4all.nl
Cc: sebastian.fricke@collabora.com, shawnguo@kernel.org,
 s.hauer@pengutronix.de, 	kernel@pengutronix.de, festevam@gmail.com,
 linux-imx@nxp.com, xiahong.bao@nxp.com, 	eagle.zhou@nxp.com,
 imx@lists.linux.dev, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Date: Wed, 26 Mar 2025 16:55:25 -0400
In-Reply-To: <20250305062630.2329032-2-ming.qian@oss.nxp.com>
References: <20250305062630.2329032-1-ming.qian@oss.nxp.com>
	 <20250305062630.2329032-2-ming.qian@oss.nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Le mercredi 05 mars 2025 =C3=A0 14:26 +0800, ming.qian@oss.nxp.com a =C3=A9=
crit=C2=A0:
> From: Ming Qian <ming.qian@oss.nxp.com>
>=20
> By default the amphion decoder will pre-parse 3 frames before starting
> to decode the first frame. Alternatively, a block of flush padding data
> can be appended to the frame, which will ensure that the decoder can
> start decoding immediately after parsing the flush padding data, thus
> potentially reducing decoding latency.
>=20
> This mode was previously only enabled, when the display delay was set to
> 0. Allow the user to manually toggle the use of that mode via a module
> parameter called frame_flush_mode, which enables the mode without
> changing the display order.

Ok, so in short the DISPLAY_DELAY breaks the reodering like intended,
while this module parameter only reduce the delay. Perhaps I'll ask
again, is is compliant or does it break some test vectors ?=20

>=20
> Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
> ---
> v3
> - Improve commit message as recommended
> - Add some comments to avoid code looks cryptic
>=20
> =C2=A0drivers/media/platform/amphion/vpu_malone.c | 14 +++++++++++++-
> =C2=A01 file changed, 13 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/media/platform/amphion/vpu_malone.c b/drivers/media/=
platform/amphion/vpu_malone.c
> index 1d9e10d9bec1..4ef9810d8142 100644
> --- a/drivers/media/platform/amphion/vpu_malone.c
> +++ b/drivers/media/platform/amphion/vpu_malone.c
> @@ -25,6 +25,10 @@
> =C2=A0#include "vpu_imx8q.h"
> =C2=A0#include "vpu_malone.h"
> =C2=A0
> +static bool frame_flush_mode;
> +module_param(frame_flush_mode, bool, 0644);
> +MODULE_PARM_DESC(frame_flush_mode, "Set low latency flush mode: 0 (disab=
le) or 1 (enable)");

Depending on the explanation, I may come back and suggest a different
name for it. Meanwhile, have you consider simply "low_latency" ?

> +
> =C2=A0#define CMD_SIZE			25600
> =C2=A0#define MSG_SIZE			25600
> =C2=A0#define CODEC_SIZE			0x1000
> @@ -1579,7 +1583,15 @@ static int vpu_malone_input_frame_data(struct vpu_=
malone_str_buffer __iomem *str
> =C2=A0
> =C2=A0	vpu_malone_update_wptr(str_buf, wptr);
> =C2=A0
> -	if (disp_imm && !vpu_vb_is_codecconfig(vbuf)) {
> +	/*
> +	 * Enable the low latency flush mode if display delay is set to 0
> +	 * or parameter frame_flush_mode is set to 1.
> +	 * The low latency flush mode requires some padding data to be appended=
 after each frame,
> +	 * but don't put it in between the sequence header and frame.
> +	 * Only H264 and HEVC decoder support this module yet,
> +	 * for other formats, vpu_malone_add_scode() will return 0.
> +	 */
> +	if ((disp_imm || frame_flush_mode) && !vpu_vb_is_codecconfig(vbuf)) {
> =C2=A0		ret =3D vpu_malone_add_scode(inst->core->iface,
> =C2=A0					=C2=A0=C2=A0 inst->id,
> =C2=A0					=C2=A0=C2=A0 &inst->stream_buffer,

In principle I'm fine with adding a module parameters, I just want to
know more about it, perhaps we should add small hints in the
description (or a comment in the code).

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>


