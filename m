Return-Path: <linux-media+bounces-57784-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oMeGKrSxy2kpKAYAu9opvQ
	(envelope-from <linux-media+bounces-57784-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 13:36:20 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A130368E1A
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 13:36:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 201033051C6F
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 11:34:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1241A3D6CBD;
	Tue, 31 Mar 2026 11:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KeDrD7/y"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C01183DC4C4
	for <linux-media@vger.kernel.org>; Tue, 31 Mar 2026 11:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774956855; cv=pass; b=ExCa1hVmycm+8DDKx5kk7Gs45zV554dI9ZCneezn+L87XByMV0vZS4cS4zvM1KIx8snGd2SA9e6lkwe4E855CoSWANweESGc/LRWzCLkE+ZHTsOeNxVjRA7HIUArGpGAqVUjNk5tTcplQAd/PQgB6rtyau6g31b8pt13pQaFdLo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774956855; c=relaxed/simple;
	bh=fvcDsk+Dh9LbyHECz4bnznmrSq+OdCpbbeM5YLbTkds=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GWxmycp4KkqszM/N8SQPNB+9X3tkjCFynZCU+caumrpTC8Vviq19YnJma9j/hIa2kW54uTA4+R35PCbDWAUm3N+hZMHAs1f/C7+L5CUm2h4d3k1QQmsYNYgiJEUobszHcEm/0zlVZztBNb3thpoei/7zXLgUfC9tFd9XXYkAAHQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KeDrD7/y; arc=pass smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5a27b5ad832so6397319e87.2
        for <linux-media@vger.kernel.org>; Tue, 31 Mar 2026 04:34:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774956852; cv=none;
        d=google.com; s=arc-20240605;
        b=dJHEUDmuX+FZIIbyap/bi2kp945YYLHKJ7CkO8x3xp8hKZzBmrkb+LADhqvmRdpujb
         6jGbILsT6Bc18/ZANzybTNN0fhezP9yTSIvhYrQAoCc+LTd+k3vnG+ES6X+WPkkBo5JF
         fM/J4GxUdetLi8ajlBR4E9j+zdKRWE08ms5IKb6b/wwUneq84zjEttztrLbjh0kUugKc
         IkKWGDpNBEhkdxkwTwAc5RlMo8Z/7yjEnYNDVEl7949UYpYHZOM7jSJUzHDcL9nweHDo
         CN//jRIy9KlajxODIeM04llU30hpoYMRgGsNizNj1gqgseCWKkgyowNwLLOP7MNvgy9J
         eu8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FGcYOF43Fmt+IF0mxxl7l+XSr0GQEhq288tkKBbNS6g=;
        fh=I3lvRhpd0eo56q7f7jk8f1HFrgS21e+9kGnQyFFxviU=;
        b=F40Ezy9DD8qBA8dzXxjmAbY2694b2J5K3idj/766Md/172v8lapm9L7PyXeijbWRxy
         KMdQDjozk5Lt42dnX+nXZkxdypfeaAKsUGY+VTkYCYig65EX+iihHC+v/eFomvs9vY/O
         KBbHa39ZMd223GGcb6J/TeqHWnzXV+QB44ZUugNeLbhoUB2n1N9MxofjePwvy8kORACl
         O+95dRpsqshYgxf5oVazWaMuVJhyRXJd1QVOADj6HIyyvLpsMcXoAoSFIJl4qqVbUv1k
         wqhg0C//d1TtXv96Pj8SSwL3Nhjt5rqV8qVAblimcMWeZAUClPTO87EpWCD+DV+2z750
         4Pyg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774956852; x=1775561652; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FGcYOF43Fmt+IF0mxxl7l+XSr0GQEhq288tkKBbNS6g=;
        b=KeDrD7/yI3/16ZEeMyZnj78MqSBCa/eNWnPEkeAYhLevO8maetOMhmPI1inSAE0K+j
         PE/CmpJAsbIIGb6mD5jZXCXs6onFAfWtTNpG1XB4E6Db/ppDhoIR0KNIvqC9HW81QAaP
         rJjsi6XhRTS3+eCW0VXhjIK/bj7BEg7wYhkeegw3eu3FNMYiiAKDxpxSFUQwiSRcS6ei
         XfyqZeCSDDVGL9/5nUN81RQpi96adVxov9hulCN/b4xQm2nhzhbE+/jqcXZ5xmEBKXBC
         msWwnM1xSSv53465TfU0cJMV3IutPU1jtY9DKfI1QcygSd2ODudvJc7RIFJ6PEDG8zPR
         bWRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774956852; x=1775561652;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FGcYOF43Fmt+IF0mxxl7l+XSr0GQEhq288tkKBbNS6g=;
        b=S5rx954vIya1oD+lrEdXAXaiZmio+/9SscfwdwHfuudrEhB2Y3ao6yVtP76iTI+0CX
         t/RUyvDfbC4J7TMlgVdt+aqr4PewoxTnaSdG7olhibm8l3n9lXb+5wC/ckG0KmvZlmGF
         6pDdehr36z77Hg8yJDXaak7T4Bk8VxkBqUL6ebVd+D8adcFNxRDuj/Y760HEOUC+GDpV
         OfDvneXQu03lOyJ6eaL2NJrni7xr5/63mNtuadlSPEcyzUP6vMYF/9jHngU2Fozt51Jl
         Bt7ac4lrfKo+RIK9DOJEcBBJqECmW6UIhC26hP4jd8nqx97ihEKC+pNdq+8Cxzp7D455
         Jv7g==
X-Forwarded-Encrypted: i=1; AJvYcCXvaQpO3vPOUF0AUZ9kc2EaWchDqX9ANoGM2bLeqiL6NvMYPqSIcixeZAErHxfby+gzFuCJeEepruWwhA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwXX8d64LWVTzIKQPTZNddc17SSOhxxFEvXh+It3vsDZsW0Ifpi
	PiiBC5ns5xnRN65HkicF9hPY/gnFWUU83XU3SfNLqcqpsdefJnKNKz48QfU9PA/Z3MMf3A/+q5R
	7VrLOTkhHvceAmwnRVSOjfF8rC4IHEbOvQdoMwkulhg==
X-Gm-Gg: ATEYQzzDbLIUy/ccoeE25qXA2GP2UJXeJ3x6cr/uj7fbn4lJXjeJ96axKpz3i98A1bl
	eGiMPqNXkMdDedXOLKmOLfFEAfpScJ2XiBAdlEpodiTxtM0TaskD6mVbv3BA19ae58LBzX8ifNs
	25Y1wC2kUmwQim7VDJliD5d80og2harLKLW8Inf/4q0e8sjqfB2hUfR/yE6lr4rLgs0eOJNTjrp
	dnNdQOvhMH5EXAj/8hLra159quD+yy9sxpZJIWxA/Eyr6VbwjgI8rBl1iRxvWf6crIw7wNX385d
	HY1dReY9JFEfUPBNy9w=
X-Received: by 2002:a05:6512:31d6:b0:5a2:bda5:c4a3 with SMTP id
 2adb3069b0e04-5a2bda5c5cfmr730600e87.11.1774956851831; Tue, 31 Mar 2026
 04:34:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260209-iris-venus-fix-sm8250-v5-0-0a22365d3585@oss.qualcomm.com>
 <20260209-iris-venus-fix-sm8250-v5-2-0a22365d3585@oss.qualcomm.com>
 <5e2635ac-35de-645b-b5e7-235923f844ce@oss.qualcomm.com> <x5gv6dxdum5klzfjyo7xjqull6o43okkmkn7avssg26epbvrz6@z2brpssbk7iv>
 <0b41ee7c-83fe-d604-b750-8a5a0bd62bf8@oss.qualcomm.com>
In-Reply-To: <0b41ee7c-83fe-d604-b750-8a5a0bd62bf8@oss.qualcomm.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 31 Mar 2026 13:33:35 +0200
X-Gm-Features: AQROBzB4ctl2c0yLSalbIIkWrD6Zd2w8t9cdNUGWWq81ZnkBTRFdQQbrOgG2lXI
Message-ID: <CAPDyKFrO3DzfG0aW4z4w87j_iWM=3dpvp=2Wgr4MX1Bin5-6ZA@mail.gmail.com>
Subject: Re: [PATCH v5 2/5] media: iris: scale MMCX power domain on SM8250
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Taniya Das <quic_tdas@quicinc.com>, Jonathan Marek <jonathan@marek.ca>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, "Bryan O'Donoghue" <bod@kernel.org>, 
	Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Stanimir Varbanov <stanimir.varbanov@linaro.org>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Hans Verkuil <hverkuil@kernel.org>, 
	Stefan Schmidt <stefan.schmidt@linaro.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, Dikshita Agarwal <dikshita@qti.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-media@vger.kernel.org, 
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57784-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ulf.hansson@linaro.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt,huawei];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,mail.gmail.com:mid,linaro.org:dkim]
X-Rspamd-Queue-Id: 8A130368E1A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, 30 Mar 2026 at 15:06, Dikshita Agarwal
<dikshita.agarwal@oss.qualcomm.com> wrote:
>
>
>
> On 3/30/2026 4:45 PM, Dmitry Baryshkov wrote:
> > On Mon, Mar 30, 2026 at 10:55:02AM +0530, Dikshita Agarwal wrote:
> >>
> >>
> >> On 2/9/2026 7:02 AM, Dmitry Baryshkov wrote:
> >>> On SM8250 most of the video clocks are powered by the MMCX domain, wh=
ile
> >>> the PLL is powered on by the MX domain. Extend the driver to support
> >>> scaling both power domains, while keeping compatibility with the
> >>> existing DTs, which define only the MX domain.
> >>>
> >>> Fixes: 79865252acb6 ("media: iris: enable video driver probe of SM825=
0 SoC")
> >>> Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> >>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> >>> ---
> >>>  drivers/media/platform/qcom/iris/iris_platform_gen1.c | 2 +-
> >>>  drivers/media/platform/qcom/iris/iris_probe.c         | 7 +++++++
> >>>  2 files changed, 8 insertions(+), 1 deletion(-)
> >>>
> >>> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen1.c b/=
drivers/media/platform/qcom/iris/iris_platform_gen1.c
> >>> index df8e6bf9430e..aa71f7f53ee3 100644
> >>> --- a/drivers/media/platform/qcom/iris/iris_platform_gen1.c
> >>> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
> >>> @@ -281,7 +281,7 @@ static const struct bw_info sm8250_bw_table_dec[]=
 =3D {
> >>>
> >>>  static const char * const sm8250_pmdomain_table[] =3D { "venus", "vc=
odec0" };
> >>>
> >>> -static const char * const sm8250_opp_pd_table[] =3D { "mx" };
> >>> +static const char * const sm8250_opp_pd_table[] =3D { "mx", "mmcx" }=
;
> >>>
> >>>  static const struct platform_clk_data sm8250_clk_table[] =3D {
> >>>     {IRIS_AXI_CLK,  "iface"        },
> >>> diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/=
media/platform/qcom/iris/iris_probe.c
> >>> index 7b612ad37e4f..74ec81e3d622 100644
> >>> --- a/drivers/media/platform/qcom/iris/iris_probe.c
> >>> +++ b/drivers/media/platform/qcom/iris/iris_probe.c
> >>> @@ -64,6 +64,13 @@ static int iris_init_power_domains(struct iris_cor=
e *core)
> >>>             return ret;
> >>>
> >>>     ret =3D  devm_pm_domain_attach_list(core->dev, &iris_opp_pd_data,=
 &core->opp_pmdomain_tbl);
> >>> +   /* backwards compatibility for incomplete ABI SM8250 */
> >>> +   if (ret =3D=3D -ENODEV &&
> >>> +       of_device_is_compatible(core->dev->of_node, "qcom,sm8250-venu=
s")) {
> >>> +           iris_opp_pd_data.num_pd_names--;
> >>> +           ret =3D devm_pm_domain_attach_list(core->dev, &iris_opp_p=
d_data,
> >>> +                                            &core->opp_pmdomain_tbl)=
;
> >>> +   }
> >>>     if (ret < 0)
> >>>             return ret;
> >>>
> >>>
> >>
> >> Hitting below compilation error on latest kernel
> >>
> >> drivers/media/platform/qcom/iris/iris_probe.c: In function
> >> =E2=80=98iris_init_power_domains=E2=80=99:
> >> drivers/media/platform/qcom/iris/iris_probe.c:71:46: error: decrement =
of
> >> read-only member =E2=80=98num_pd_names=E2=80=99
> >>    71 |                 iris_opp_pd_data.num_pd_names--;
> >
> > See commit 7ad7f43e568b ("pmdomain: de-constify fields struct
> > dev_pm_domain_attach_data")

The intent was for this patch to be part of v7.0-rc1, but I failed
with my pull-request to Linus.

Instead this will be part of v7.1-rc1, assuming everything goes as expected=
.

Is it possible to drop/defer these changes until v7.2?

Kind regards
Uffe

