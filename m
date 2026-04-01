Return-Path: <linux-media+bounces-57856-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8K6eOhr5zGnRYgYAu9opvQ
	(envelope-from <linux-media+bounces-57856-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 01 Apr 2026 12:53:14 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 98B7C378D57
	for <lists+linux-media@lfdr.de>; Wed, 01 Apr 2026 12:53:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9B4D63046EB8
	for <lists+linux-media@lfdr.de>; Wed,  1 Apr 2026 10:46:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 860103CBE65;
	Wed,  1 Apr 2026 10:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="focpdnG0"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54D4D3BD246
	for <linux-media@vger.kernel.org>; Wed,  1 Apr 2026 10:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775040403; cv=pass; b=Dudm0sg+an7yYERRL90LPrfLycgRsHRCz1/iUWICNuuTN/xqfwUT3ESt9tmdVdiwx1GddIXg8UHjRfYZ2ooMYb4p1aQLlF+g99O+gQWmUzExVoVQiSCJDwstiFkOBDu0iB1C25Ugcp1S/tXxf/LAeqVcFI65BBv0E2SX656N7/k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775040403; c=relaxed/simple;
	bh=40aqi1I55Vmq2m60iYFNVNuV+Shkhm9O7nHBPNLlR0s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=grjTIGS6uhaRXMCRXLv3OlcBmGP/jXZl5osiagxnM36mNvH/UL6Jt56RzE6TIaY3xM7e/Hmod8NyECE3jfvxdqKE87vq0Gz69CmLoaYiQT0d9t3e6ewiad7ZfIcSTJnAJ6n1KWrWu6Ze33z8KKOd03S2LdXroZiG1oP9CRcBM1Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=focpdnG0; arc=pass smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5a2beddab48so1693519e87.1
        for <linux-media@vger.kernel.org>; Wed, 01 Apr 2026 03:46:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775040400; cv=none;
        d=google.com; s=arc-20240605;
        b=U5C+F8EgOXNLtvVkb7kcLc3bVXtWz+rzcW18BbLV7q0SJFuDQls+MfmuFAIyCWvoM4
         yx7NKi2I2M4oEciCEYGgbSGWiIJ5PKkbNQCO0tDjbdDh8M6m+eiUAiy/zieg7gRO2Whq
         r4NQ2O9Fup9xFJlzcOXDwZI8oMCxNPnzkl6iK60/L0o1P5dUoB+DbzRRFfqzAJG71IU6
         5F6WHvimw2tiAgK531c48H1aZ7le5rSDEfAoS+MRRtfZbLxbY4vZud5GvceuLsiKI7d9
         1Vry5bDQK9HZyIMfHDa8DNPd3hHr3qffuQUG20m4CtalOko2pjTjtUvp/fU0A3fg7SXM
         x/2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gSozclW0x9vuMSqSBfuRXxbpTpkomr2e0lWVw9uMgPE=;
        fh=SerOeeMj/sYRqK5Ov9wo7/4jfz4KNaU2KWz12bWDcIU=;
        b=XLSv64VJtAn9S+rpMqs5B54QYrJu8Y8iHVgRoBGGh67vUSEJShZVcKGuU86Ji1FfQY
         ZwpBM/cRZDuib8O6YeWhQSXFBzmiz3VpCe7wWYG6Ow/1/9En5QfX9aUJJSmc2uKUxKX2
         5Bf2HBe5iAh84UMSb8L3QKGTJLD4sEscvYdheUY6LkD1ACb4cpYjEQQkvOmrj7i0qdJo
         6uJwThWuyBWsdUPmKaW0KMiix9DC1Pch3i6MOMzU2vfTdLPyPCpjDftDvKjQZBez1Lw5
         r0N7bdxhuJEFOzpFGLZxTiV3R+wkzcxGjb/cBKT7jHQMwN3nSYUOw/MShipw8xBuTPaj
         ZhtQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775040400; x=1775645200; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gSozclW0x9vuMSqSBfuRXxbpTpkomr2e0lWVw9uMgPE=;
        b=focpdnG0GNhSC5kPZtsCRM+qqdNyOoozw55topTHlqkT64idlswtImyxxhINAityZZ
         bcEtkg/HPSTytTw7A7MPNY4KkVmXLrzLkLNNTKPj37Twvjaz0onaXbAptuv2B9tBXsAm
         2WmpmwS0pSogb9M4YXD79tOwcd2o4l3CaB+9FpQ6EEUXLJpEW1fTksCZp8+MxDx6LzWn
         /DvY6EnxnogHltjx+1SbFhTNABu/66GEItPQ49kbEvm7oKb30fBNNsEW4HE5wkNotULc
         FLaFedn5Z7OazQsO17FVTAh0EzOKMFAMPfBNzn7W+Usd+sa5n4vjcA/biSE5Ua6XReIz
         Q5RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775040400; x=1775645200;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gSozclW0x9vuMSqSBfuRXxbpTpkomr2e0lWVw9uMgPE=;
        b=X1cTwg4Z5qzhZVp1EBHa+Ydtm3bHJa9SLFxQ/5NsZLWGGGVj5ST3fYMJ6h8UAJVCWB
         N1YVCubJ2nMbsQb8tYj7NRIS4oQj7Eudh7CyqBo6UZI7XLRyzwDTaskEijJLGZHvSn4f
         yvgylZD0JMw/Yabv9JRpJC1q+4o8yB7d3QDx8MVONudIPgAK7qXSwzhczOcqu7SVQMnW
         fBogGR5pBEVDYFIvwHN6w/0o0eqvmT0vAWobns2YI+XZ4KiCl9l4zWazjz+aRCv9e0R8
         hC5zlsHRyty+Dw9VKV6qIBPYDj+MJT+v8BBklPnQM2Q8kVe8BcvrG+YQST9OJLSwRhkC
         Szog==
X-Forwarded-Encrypted: i=1; AJvYcCXVCTLGQ7WZKnqax0UgzP2MXpqfkal2mTuYi3e0RM29AwMHxDxZRCEOAI8TAZyMIgsPzPgtosrfwvpVeQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxrfLH9YS95CD4Eod/zikcheYLFtVKLQWBLKEfqvYBM4ZRn5QRO
	P50SNjQ8/WUBCsd8dgPGBfnSUSi6ent1fRU9SeoEDcWeMxKBJ1YH2Yq5r+GtkK/nrU0pMNjpCqJ
	NG1hifDKmxIXroM2o2aANJrd2M+IqeuqtNl3vJzYVQw==
X-Gm-Gg: ATEYQzwDjGz473+/JmcI69uciNIyAl2TJGkVssQ6WHLrlAF/OR1gPcVeBY1nqXELbTJ
	lKLppwc3C0mCxvUeQgtmce5MfVSOkRee8OhrYzp388y28HFU/E5ItGZ+kbpmGmkPJ8lFErmcXEb
	i5qMBSwKwn2drJtDXCFrtjtCOqt0lvJ9m5Ha9imdK2nWc85ixRyFdlvHKzyTmkVYAzIEEwtvGTU
	AOHn+si4plZibhO3qtqMZCTtaYb5WBFPP5fttUPkoAhM2M+YGrC2tauYEhvjpvvvSdHXrFSKbT7
	4GZ3FYEI
X-Received: by 2002:a05:6512:1254:b0:5a2:c0b6:729e with SMTP id
 2adb3069b0e04-5a2c1ee82b3mr1132629e87.4.1775040399387; Wed, 01 Apr 2026
 03:46:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260209-iris-venus-fix-sm8250-v5-0-0a22365d3585@oss.qualcomm.com>
 <20260209-iris-venus-fix-sm8250-v5-2-0a22365d3585@oss.qualcomm.com>
 <5e2635ac-35de-645b-b5e7-235923f844ce@oss.qualcomm.com> <x5gv6dxdum5klzfjyo7xjqull6o43okkmkn7avssg26epbvrz6@z2brpssbk7iv>
 <0b41ee7c-83fe-d604-b750-8a5a0bd62bf8@oss.qualcomm.com> <CAPDyKFrO3DzfG0aW4z4w87j_iWM=3dpvp=2Wgr4MX1Bin5-6ZA@mail.gmail.com>
 <6yfn6ux3gbin2dtopdxxv4okinspueryuey5vfdq633gsewc6r@ttp56brnpgvr>
In-Reply-To: <6yfn6ux3gbin2dtopdxxv4okinspueryuey5vfdq633gsewc6r@ttp56brnpgvr>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 1 Apr 2026 12:46:01 +0200
X-Gm-Features: AQROBzANxupbHHkAqu8GJiUFFGG603SVUVTYVg4H2FBCM1h61nXzlIOx_SK4W6w
Message-ID: <CAPDyKFpm7ujNw51dVpPaHCwssjgYe1JVBEyrQ_1CsPbDJuW0Ww@mail.gmail.com>
Subject: Re: [PATCH v5 2/5] media: iris: scale MMCX power domain on SM8250
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
	Bjorn Andersson <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57856-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt,huawei];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,mail.gmail.com:mid,linaro.org:dkim]
X-Rspamd-Queue-Id: 98B7C378D57
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, 31 Mar 2026 at 20:46, Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Tue, Mar 31, 2026 at 01:33:35PM +0200, Ulf Hansson wrote:
> > On Mon, 30 Mar 2026 at 15:06, Dikshita Agarwal
> > <dikshita.agarwal@oss.qualcomm.com> wrote:
> > >
> > >
> > >
> > > On 3/30/2026 4:45 PM, Dmitry Baryshkov wrote:
> > > > On Mon, Mar 30, 2026 at 10:55:02AM +0530, Dikshita Agarwal wrote:
> > > >>
> > > >>
> > > >> On 2/9/2026 7:02 AM, Dmitry Baryshkov wrote:
> > > >>> On SM8250 most of the video clocks are powered by the MMCX domain=
, while
> > > >>> the PLL is powered on by the MX domain. Extend the driver to supp=
ort
> > > >>> scaling both power domains, while keeping compatibility with the
> > > >>> existing DTs, which define only the MX domain.
> > > >>>
> > > >>> Fixes: 79865252acb6 ("media: iris: enable video driver probe of S=
M8250 SoC")
> > > >>> Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> > > >>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.co=
m>
> > > >>> ---
> > > >>>  drivers/media/platform/qcom/iris/iris_platform_gen1.c | 2 +-
> > > >>>  drivers/media/platform/qcom/iris/iris_probe.c         | 7 ++++++=
+
> > > >>>  2 files changed, 8 insertions(+), 1 deletion(-)
> > > >>>
> > > >>> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen1.=
c b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
> > > >>> index df8e6bf9430e..aa71f7f53ee3 100644
> > > >>> --- a/drivers/media/platform/qcom/iris/iris_platform_gen1.c
> > > >>> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
> > > >>> @@ -281,7 +281,7 @@ static const struct bw_info sm8250_bw_table_d=
ec[] =3D {
> > > >>>
> > > >>>  static const char * const sm8250_pmdomain_table[] =3D { "venus",=
 "vcodec0" };
> > > >>>
> > > >>> -static const char * const sm8250_opp_pd_table[] =3D { "mx" };
> > > >>> +static const char * const sm8250_opp_pd_table[] =3D { "mx", "mmc=
x" };
> > > >>>
> > > >>>  static const struct platform_clk_data sm8250_clk_table[] =3D {
> > > >>>     {IRIS_AXI_CLK,  "iface"        },
> > > >>> diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/driv=
ers/media/platform/qcom/iris/iris_probe.c
> > > >>> index 7b612ad37e4f..74ec81e3d622 100644
> > > >>> --- a/drivers/media/platform/qcom/iris/iris_probe.c
> > > >>> +++ b/drivers/media/platform/qcom/iris/iris_probe.c
> > > >>> @@ -64,6 +64,13 @@ static int iris_init_power_domains(struct iris=
_core *core)
> > > >>>             return ret;
> > > >>>
> > > >>>     ret =3D  devm_pm_domain_attach_list(core->dev, &iris_opp_pd_d=
ata, &core->opp_pmdomain_tbl);
> > > >>> +   /* backwards compatibility for incomplete ABI SM8250 */
> > > >>> +   if (ret =3D=3D -ENODEV &&
> > > >>> +       of_device_is_compatible(core->dev->of_node, "qcom,sm8250-=
venus")) {
> > > >>> +           iris_opp_pd_data.num_pd_names--;
> > > >>> +           ret =3D devm_pm_domain_attach_list(core->dev, &iris_o=
pp_pd_data,
> > > >>> +                                            &core->opp_pmdomain_=
tbl);
> > > >>> +   }
> > > >>>     if (ret < 0)
> > > >>>             return ret;
> > > >>>
> > > >>>
> > > >>
> > > >> Hitting below compilation error on latest kernel
> > > >>
> > > >> drivers/media/platform/qcom/iris/iris_probe.c: In function
> > > >> =E2=80=98iris_init_power_domains=E2=80=99:
> > > >> drivers/media/platform/qcom/iris/iris_probe.c:71:46: error: decrem=
ent of
> > > >> read-only member =E2=80=98num_pd_names=E2=80=99
> > > >>    71 |                 iris_opp_pd_data.num_pd_names--;
> > > >
> > > > See commit 7ad7f43e568b ("pmdomain: de-constify fields struct
> > > > dev_pm_domain_attach_data")
> >
> > The intent was for this patch to be part of v7.0-rc1, but I failed
> > with my pull-request to Linus.
> >
> > Instead this will be part of v7.1-rc1, assuming everything goes as expe=
cted.
> >
> > Is it possible to drop/defer these changes until v7.2?
>
> It would be very sad.

Right.

Since it's my mistake, let me reconsider. If I rebase my branch and
share the necessary commit through an immutable branch that you can
pull in. Would that work for you?

Kind regards
Uffe

