Return-Path: <linux-media+bounces-46229-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 363E9C2DB1F
	for <lists+linux-media@lfdr.de>; Mon, 03 Nov 2025 19:35:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1F1804F033F
	for <lists+linux-media@lfdr.de>; Mon,  3 Nov 2025 18:34:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAEAC267B90;
	Mon,  3 Nov 2025 18:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="NfWqPfNL"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83CAA33EC
	for <linux-media@vger.kernel.org>; Mon,  3 Nov 2025 18:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762194837; cv=none; b=fEUhunMvEFMgvyvznm3XdYih/4OLsQJvnTTBxWRnBXlus7oBtcjTPLGzwot2FX5H67xCVyjA7QhHHzVOI7w80haqbY5WBDtiQXlNs7mrUYv3aNLfFuqmCA0MAVUlER6oKFCmG9oySjtLJ0fu/2vbaDDuvirHX2eFbCfrKVgGTWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762194837; c=relaxed/simple;
	bh=7RFL2JLNfzKTvp1hqb7yXk1A27+KQsMMiKr3EtxmPzE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=GV8c6t1PfvD56ujT/sI+XM+l5i4IApAJxl6kmivnoGuqLa9N9VAExncZzXzEBYg3RrTmbW9UNmLHSno51GMp3CSDW5ckCjRvZcubceuEl58sySEKVrNtAOnsjIJa3BNHp9cUuqC86UD7DwC8Ik/+hdAt42/qSEzOZEf9vWEPF+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=NfWqPfNL; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-4ed411e8a29so32782501cf.3
        for <linux-media@vger.kernel.org>; Mon, 03 Nov 2025 10:33:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1762194834; x=1762799634; darn=vger.kernel.org;
        h=mime-version:user-agent:references:in-reply-to:date:cc:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=D6IBkTdRfVpO1bCNLk2LNL0B21F0Pxa2e8J5b4QlK6Q=;
        b=NfWqPfNLcnrLKKmICZQvbVUhMtYx7RQ23nZajIdk7huiH+LpCSvpgfXb6+j2rQA+Mb
         Xc00lTdFfGRSmNSBX0ZnX34nDHB6rbc2VhkGmwkcqhZoxbuvqSsWRDEgovRkxEvTT/DY
         HO7TW5/0lgHe5v9sfdbc0bnpLl51hxG3s5J2eVBcmxVFMI/Dnso2NlVJLqk82RokXPJX
         KA+SKHMU6V+jCDCAwDp9cW7BvXEvZq5FD8pLz1tZs2/ikTZcq0WcammScS1HV+83EXm3
         Xg7j4wYh5Dx3Jq2dYWRufds5UHKrnJ2APqwY5jLP6X/r4FZNZfp0XFXRTA3pLdXNCQk4
         JiMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762194834; x=1762799634;
        h=mime-version:user-agent:references:in-reply-to:date:cc:to:from
         :subject:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D6IBkTdRfVpO1bCNLk2LNL0B21F0Pxa2e8J5b4QlK6Q=;
        b=mn0AGXN7F6OpBmadAKNz5SlK5X3aYLCAYnbhU0H7ILU4pszUu+DPt0/2rtoTMPBVRJ
         Db3nqlTDjtcUdor/3j1VkLfbZENsGcKoAXE18GpB4ZInAeN9pGX22AtQepY5GK82qewL
         krcvWIgeaciZqRepe12yIncRDQknMBdm126fni1ZRL8ndo/wIyqMF1AL3x7CSAxQ9iUy
         oC2GFLDD5y8JLcsQYAgELTs/ZuAcGa4PG2eWTDHuzm3iW4FH8tnCCWcibamvQR0ctz68
         epKkYpJOG9mcndWMDEJ+Lm9d9BfRaF4pqMwqAXyz9aocMLWlWhrBmO+FYVMLj88ClWoR
         5Axg==
X-Gm-Message-State: AOJu0Yxr/5mXjTOziycjsXbb0X8L+zc9lWM19514bqNapM40nsg55Lix
	T3q2CDiH6a+HRIbP6o+3pitzzPLMV8+Q01W3xFrKQ0D7HVB3PG+tTKcnTQ9YM0dWSbQ=
X-Gm-Gg: ASbGncuEhIgR9fefMYYKYppCz1vEnYX+/W7xZ4A0IDoGV58OsdkxXJB5Q8vJ9ZRi5nG
	dN7lo/2674GgeBZ1MqY0lEytO+lmvuZxHBJoliZkN2OkHMSpLdQn+Fc/nKa1h/mOsJX4xx8PP8z
	EtSueNH9SIdgrJ2u+8CXaQC3kxuJ3oIyoVT+jil/KTzKhqhndiW5mfqIoBbVdPhNSx58S1pMJCS
	f5PqWBexmk1pkkcMTW2oXplASR7TRBuBOLgGEk0/fkWNnwUXWPuiPllV70JUFKfabR95ABwrKV6
	NIW4xXadoMEHFpKU6JiIZ31tuLQivEoPmopo7UagDzDQ+FleekvgYq4dC3j7Se8AUbEw5t7krq5
	bIZ7x+rlDqQWnekRzMuBZeMbWXqHhfmx5IxtdIAbwmV2pHhkHROF8j37+7u6wS/TNrpY3OPVY9V
	cAwrOry7THRk10j8rl
X-Google-Smtp-Source: AGHT+IHiLwkkP/T5WfRuyyDGcNUXxAsqql06SKeSmgibPQwsNkXLFhIvFubFnKycp+mU6mAdcvP9fA==
X-Received: by 2002:a05:622a:986:b0:4e7:2844:b5ba with SMTP id d75a77b69052e-4ed30df358amr195696001cf.27.1762194834405;
        Mon, 03 Nov 2025 10:33:54 -0800 (PST)
Received: from ?IPv6:2606:6d00:17:ebd3::c41? ([2606:6d00:17:ebd3::c41])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8b0f5413f43sm38727485a.8.2025.11.03.10.33.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 10:33:53 -0800 (PST)
Message-ID: <41ef734f56c0168e65e149cabf28d585ee5f2428.camel@ndufresne.ca>
Subject: Re: [PATCH] media: iris: Refine internal buffer reconfiguration
 logic for resolution change
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, Vikash Garodia	
 <vikash.garodia@oss.qualcomm.com>, Abhinav Kumar <abhinav.kumar@linux.dev>,
  Bryan O'Donoghue	 <bod@kernel.org>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Hans Verkuil	 <hverkuil@kernel.org>, Stefan Schmidt
 <stefan.schmidt@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Val Packett <val@packett.cool>
Date: Mon, 03 Nov 2025 13:33:52 -0500
In-Reply-To: <20251103-iris-seek-fix-v1-1-6db5f5e17722@oss.qualcomm.com>
References: <20251103-iris-seek-fix-v1-1-6db5f5e17722@oss.qualcomm.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-0U7duYWV/opQAYp/tD5t"
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-0U7duYWV/opQAYp/tD5t
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le lundi 03 novembre 2025 =C3=A0 16:35 +0530, Dikshita Agarwal a =C3=A9crit=
=C2=A0:
> Improve the condition used to determine when input internal buffers need
> to be reconfigured during streamon on the capture port. Previously, the
> check relied on the INPUT_PAUSE sub-state, which was also being set
> during seek operations. This led to input buffers being queued multiple
> times to the firmware, causing session errors due to duplicate buffer
> submissions.
>=20
> This change introduces a more accurate check using the FIRST_IPSC and
> DRC sub-states to ensure that input buffer reconfiguration is triggered
> only during resolution change scenarios, such as streamoff/on on the
> capture port. This avoids duplicate buffer queuing during seek
> operations.
>=20
> Fixes: c1f8b2cc72ec ("media: iris: handle streamoff/on from client in dyn=
amic resolution change")
> Reported-by: Val Packett <val@packett.cool>
> Closes: https://gitlab.freedesktop.org/gstreamer/gstreamer/-/issues/4700
> Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

Thanks for working on this.

> ---
> =C2=A0drivers/media/platform/qcom/iris/iris_common.c | 7 +++++--
> =C2=A01 file changed, 5 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/media/platform/qcom/iris/iris_common.c b/drivers/med=
ia/platform/qcom/iris/iris_common.c
> index 9fc663bdaf3fc989fe1273b4d4280a87f68de85d..21e176ce49ac2d2d26cf4fc25=
c1e5bca0abe501f 100644
> --- a/drivers/media/platform/qcom/iris/iris_common.c
> +++ b/drivers/media/platform/qcom/iris/iris_common.c
> @@ -90,13 +90,15 @@ int iris_process_streamon_input(struct iris_inst *ins=
t)
> =C2=A0
> =C2=A0int iris_process_streamon_output(struct iris_inst *inst)
> =C2=A0{
> +	bool drain_active =3D false, drc_active =3D false, first_ipsc =3D false=
;
> =C2=A0	const struct iris_hfi_command_ops *hfi_ops =3D inst->core->hfi_ops=
;
> -	bool drain_active =3D false, drc_active =3D false;
> =C2=A0	enum iris_inst_sub_state clear_sub_state =3D 0;
> =C2=A0	int ret =3D 0;
> =C2=A0
> =C2=A0	iris_scale_power(inst);
> =C2=A0
> +	first_ipsc =3D inst->sub_state & IRIS_INST_SUB_FIRST_IPSC;
> +
> =C2=A0	drain_active =3D inst->sub_state & IRIS_INST_SUB_DRAIN &&
> =C2=A0		inst->sub_state & IRIS_INST_SUB_DRAIN_LAST;
> =C2=A0
> @@ -108,7 +110,8 @@ int iris_process_streamon_output(struct iris_inst *in=
st)
> =C2=A0	else if (drain_active)
> =C2=A0		clear_sub_state =3D IRIS_INST_SUB_DRAIN | IRIS_INST_SUB_DRAIN_LAS=
T;
> =C2=A0
> -	if (inst->domain =3D=3D DECODER && inst->sub_state & IRIS_INST_SUB_INPU=
T_PAUSE) {
> +	 /* Input internal buffer reconfiguration required incase of resolution=
 change */

There is a spurious space here and also, "incase" -> "in case"

> +	if (first_ipsc || drc_active) {
> =C2=A0		ret =3D iris_alloc_and_queue_input_int_bufs(inst);
> =C2=A0		if (ret)
> =C2=A0			return ret;

cheers,
Nicolas

>=20
> ---
> base-commit: 163917839c0eea3bdfe3620f27f617a55fd76302
> change-id: 20251103-iris-seek-fix-7a25af22fa52
>=20
> Best regards,

--=-0U7duYWV/opQAYp/tD5t
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaQj1kAAKCRDZQZRRKWBy
9PcZAP0b/914MBOGdLEOJRB5qlfQHO7FmZggakf8Kjv9KEIB+wEAoKCnmEfLLA51
Nr5ICFgwip/3oMGjlaa1EDmEGyBpNAk=
=op9q
-----END PGP SIGNATURE-----

--=-0U7duYWV/opQAYp/tD5t--

