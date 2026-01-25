Return-Path: <linux-media+bounces-51510-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oMQaCBNQdmk4PQEAu9opvQ
	(envelope-from <linux-media+bounces-51510-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 25 Jan 2026 18:17:07 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BC3EA818FF
	for <lists+linux-media@lfdr.de>; Sun, 25 Jan 2026 18:17:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C609A3008A7D
	for <lists+linux-media@lfdr.de>; Sun, 25 Jan 2026 17:16:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2BBB23E34C;
	Sun, 25 Jan 2026 17:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TzGy7NqM"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A1173EBF33
	for <linux-media@vger.kernel.org>; Sun, 25 Jan 2026 17:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769361410; cv=pass; b=QzXwUKhCH6+fcchcUFRRoVvOrKfDCZqtE1HZplS219nBfJRnn8hjN0cqYtPW4i8v+ZD3jNCS8U1bTUNHERMQPlEYzM6caN1cWzgIbIdu/Xu5R+A0QKPrSDQYx+pa9nOL618PkvJ1+0OoP/6BRv212q2TXpBPynaWCnf9820j3+c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769361410; c=relaxed/simple;
	bh=bdUyJXwBrnObAxEL5K+ZWNJ31wi532ZrNooozfyN5hw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MtgG1lP8D6rX/2bMKapr4bdfeGhYyxN5FQrc/BugiqaiBEOHBUOSx9+rAcxIE2pmteYrt583GRo/lD52ptkZyZYDV1JpukqB7bqu4Eh8g8gJ3nTO7EDJHPZGyj98siIlmuJe9tork2fvc4GlZ5Mx1uwlxqpsuNPdJaBZsxqcV7M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TzGy7NqM; arc=pass smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-34ab4ac9a34so316232a91.0
        for <linux-media@vger.kernel.org>; Sun, 25 Jan 2026 09:16:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769361408; cv=none;
        d=google.com; s=arc-20240605;
        b=XXwXlOVhMmFyIeUlt8hRqrtX0oFTJN3yzThngUn31qow+M0S3jbiK5jXmiYIZGMhR7
         U6+dYj9fCSyHPF8zNpzy86UcOpLh6K2bYCuAGXo+e6laJbbAouIr3BoTzZIg1lXz5Jbt
         oUhwghwNu7Ia91RjexRyEXJ35dzBWGs87eWoFlYCOxprTfrixeTypoBfALesFyiSFoCa
         Q7RVt2gC/h/M7EaHjTks9ejsZcAWGikmBehP/E4f0/QnRxl43SNxJk5gDuXHWc0iWqeS
         pqX/lWOz6XuWW3tVKfaAsFQ2rQCho3OfQ0ZdXyhCERir9bt8tfJKnpEsWpXrAZDXrvbE
         Ua2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=k8X9SwxtwKptigAeV0uEMOHmuEgza198fJUXdmHkMTE=;
        fh=JLuLIig3yD28w+SSo6rl/6D27a6mw96eNGP1PTrXytE=;
        b=AhYF7mqeNmWcvDKBTwl01ZdXVO6CFsShvNqwMXZuq50DNLkEDEPBCuHyt1iiFyNai3
         V8kHtoUg3d1t5yA865YQDPCo8csgzp4f5/SySwfm3lyWgCt3LxnEIvizKWkrFnPHf+U1
         1DxP00apSM6JjkfTz7N/FC34CJcW8cQI/LP3S9UQs3R3GtiMq2Rl8p2ZNPVzl5r/n/Qg
         w/QfShSD8lWS7y9t0GRZ02oppwKBbumwKfEqTneOiiYEG10mJVpqmt4pE+MXCNNDng7x
         c9YGWjuuMydwkn9M5xzSTlMHvjMuXMlgmAJxWkER+7bQIlNsGyYvQG6w7Lyk2OF9OCYC
         pN8A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769361408; x=1769966208; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k8X9SwxtwKptigAeV0uEMOHmuEgza198fJUXdmHkMTE=;
        b=TzGy7NqMOb1RkmBJG75YvXq8UNHBS+u1FUSCzt4usgqHeLlQXY5mtDP3BKP/wl090I
         uWFi+k9LtV/Gh1XZeLzSMTKMOFJqwce5V74CPzCOEczUK+pGkdpn6Lhbc6326XpNhg1X
         7afH/IW5GS5dgJpLQySONGtgZRxM7yVH3bYPofMLyjiVMk2VxE35uqlLpmt0nCiD3j/l
         QXBr8kpdEzs+NifOfAIEn+/csfVau4OQ6jgQM46hKRiLDKN5VMEkWmUqUYk5791z5vyz
         hbk3nhdKrTShgpdcP4uOoXM280BNzrGRbwcZR2a291q4tSxlCKuMWYKmd6Equ3uwhdCS
         zCtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769361408; x=1769966208;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=k8X9SwxtwKptigAeV0uEMOHmuEgza198fJUXdmHkMTE=;
        b=pnDMHQhc11Kb0bH09AxhjW0yHtihJi0FtE5DTinxXijOlBNo5EPG8wtpUsY+AWHaoR
         A8DdHhwFjq1E4G9YL/vSEn2jwrWCJ+vHzhPLQ3ee16JqGr68y/HXHHfpD003TuTTsb9f
         I5qKKORyHnEdxxgrQHzrFl55tkvsxDxsNcRXeKuUyxTS5kxpS+Csm3NSci9FIQVuoRcp
         HpYwnNPOu8GCZvT1ZG2PIrfiGV47kj5AyFdRNFfi3J+QjQGjOElnCGhzkepsGENYN6pu
         XXXHJFhmPaCCl/8HFP47DHqMeYcT5mUvIOAKwiHAuqCjjXn7ohd/XTzIF/MkDzB+ACO6
         w9HA==
X-Forwarded-Encrypted: i=1; AJvYcCVVeEtoa17C1VEeBJik8gXyjN20Xsnp4tkoTJV8vwZNHHaFfelsQ8ewb+46lrAPioN25HRT70vnl/Iz9Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyYK5btUX7WTngvXIQxwqUYWA4sjvPLcgSFYjJTp/BaCmTgOOv/
	eQkp2lUinNDQAxemIvRqondRAFmoMS1autP+B9feUpCki0BiVkJNivfb3ClBiaU4eiilu01Pwa1
	3b+TtyWjnfS2or/bXdvgxiGWsw25OdAg=
X-Gm-Gg: AZuq6aJ+JH/iK9o+j8G2WTk/jmGtHdDg9OmNhBfTTcxAg6eWRBorKsag7bxXRgMvVAH
	GfdKDyin18wpDwasrgQFZuB5VL2zt989ttP1p/zN5Pp7Tbsa5YScAMBds39OT3aAh5x2cExxxuX
	tLIz4OxYYXFYZWCuiEeJduE9qdq9v6dnp8Yebva3XwW0fCaH8C32D6zTGZH+BSC0dW/BsIlulUD
	bOtDD5dy6K6+k2XQP9phdC8pNLUBF9OHg51Crr17zu1B9tif98JD6/CwQ8cL+m/Mxvhgpk=
X-Received: by 2002:a17:90b:394a:b0:340:dd41:df7d with SMTP id
 98e67ed59e1d1-353c41625dbmr1417254a91.3.1769361408319; Sun, 25 Jan 2026
 09:16:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260125-iris-ubwc-v4-0-1ff30644ac81@oss.qualcomm.com> <20260125-iris-ubwc-v4-2-1ff30644ac81@oss.qualcomm.com>
In-Reply-To: <20260125-iris-ubwc-v4-2-1ff30644ac81@oss.qualcomm.com>
From: Connor Abbott <cwabbott0@gmail.com>
Date: Sun, 25 Jan 2026 12:16:37 -0500
X-Gm-Features: AZwV_Qh6bCEQHtHjA5NyO7y-zT5kVNEbiRdlIWpRsBNsjtNaSF0FG6h2tF4V0UQ
Message-ID: <CACu1E7Gpzgg0WKT9EyFO+uJsGCVAcEUG1OkTdhXLpGThTrd=Ww@mail.gmail.com>
Subject: Re: [PATCH v4 2/9] soc: qcom: ubwc: add helpers to get programmable values
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Akhil P Oommen <akhilpo@oss.qualcomm.com>, Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, "Bryan O'Donoghue" <bod@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-media@vger.kernel.org, Wangao Wang <wangao.wang@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-51510-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,oss.qualcomm.com,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cwabbott0@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid,qualcomm.com:email]
X-Rspamd-Queue-Id: BC3EA818FF
X-Rspamd-Action: no action

On Sun, Jan 25, 2026 at 6:37=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> Currently the database stores macrotile_mode in the data. However it
> can be derived from the rest of the data: it should be used for UBWC
> encoding >=3D 3.0 except for several corner cases (SM8150 and SC8180X).

FWIW, there is a UBWC version 3.1 not currently reflected in the code
which adds the 8-channel macrotile mode. If we just added that and
made SM8150 and SC8180X be 3.1 then we could derive it from the
version.

Connor

>
> The ubwc_bank_spread field seems to be based on the impreside data we
> had for the MDSS and DPU programming. In some cases UBWC engine inside
> the display controller doesn't need to program it, although bank spread
> is to be enabled.
>
> Bank swizzle is also currently stored as is, but it is almost standard
> (banks 1-3 for UBWC 1.0 and 2-3 for other versions), the only exception
> being Lemans (it uses only bank 3).
>
> Add helpers returning values from the config for now. They will be
> rewritten later, in a separate series, but having the helper now
> simplifies refacroring the code later.
>
> Tested-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  include/linux/soc/qcom/ubwc.h | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>
> diff --git a/include/linux/soc/qcom/ubwc.h b/include/linux/soc/qcom/ubwc.=
h
> index 5bdeca18d54d..f5d0e2341261 100644
> --- a/include/linux/soc/qcom/ubwc.h
> +++ b/include/linux/soc/qcom/ubwc.h
> @@ -84,4 +84,19 @@ static inline bool qcom_ubwc_min_acc_length_64b(const =
struct qcom_ubwc_cfg_data
>                  cfg->ubwc_dec_version =3D=3D UBWC_3_0);
>  }
>
> +static inline bool qcom_ubwc_macrotile_mode(const struct qcom_ubwc_cfg_d=
ata *cfg)
> +{
> +       return cfg->macrotile_mode;
> +}
> +
> +static inline bool qcom_ubwc_bank_spread(const struct qcom_ubwc_cfg_data=
 *cfg)
> +{
> +       return cfg->ubwc_bank_spread;
> +}
> +
> +static inline u32 qcom_ubwc_swizzle(const struct qcom_ubwc_cfg_data *cfg=
)
> +{
> +       return cfg->ubwc_swizzle;
> +}
> +
>  #endif /* __QCOM_UBWC_H__ */
>
> --
> 2.47.3
>

