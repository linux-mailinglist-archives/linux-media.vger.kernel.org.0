Return-Path: <linux-media+bounces-21403-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F26919C89A1
	for <lists+linux-media@lfdr.de>; Thu, 14 Nov 2024 13:16:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 08150B2A075
	for <lists+linux-media@lfdr.de>; Thu, 14 Nov 2024 12:11:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0ECC1F9AA8;
	Thu, 14 Nov 2024 12:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JnXLe4zW"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 479421F9414
	for <linux-media@vger.kernel.org>; Thu, 14 Nov 2024 12:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731586307; cv=none; b=sFhs7WKVgGrRIYrMXJdXZfisPGGEORYDPNfYm3uYOH9utGuP7V3+nwG+K1InmvNk8kcY8bBBjSZ9n84rEqwxzL8sWR0Ka5KJxQFTsTEeUBx2fD3mqoFukyD8yeIeeDadXpsP/iJkJXeVWH2FPLmsMpOLZNETSBrCkHsaFfjnjZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731586307; c=relaxed/simple;
	bh=8z+kqJBm6xVUjsx7g2KL+Nw8vebu/U9FGTQdulnyuOw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cuWH1cAatqUHhKU9Vuy55t/Y6GSzxh3TrluEjIfw8Xh8w5y9EZh8EyIg1Lk89ssXtCYsLHqDMdYR/PfvdBNdMNbxXK8iFN1OJ7DO4gN4Fq7Kd/RZHOKLIGZAOX9ppNxAfWv7WcBgLCQbr+qhqMuvAsD6xk9rwUPqZ8feFANHlrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JnXLe4zW; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-539f8490856so491792e87.2
        for <linux-media@vger.kernel.org>; Thu, 14 Nov 2024 04:11:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731586303; x=1732191103; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=E+Fn+TRNlFXO3ulOSTzXE3Z/L18YHrd+68I42zTssiQ=;
        b=JnXLe4zWtSk7OGlME9cgTQdpgDnZG7qL8lO3CiiEnH7PSrjACstCKAWk3S9H6hGeNq
         S/Lnhon4sLeuOxn0hrWyV1z19FDhFY+OSwxPx2dP2eOvtlC209D4wja31ujBBCUIQc0x
         M9LbnI0wXm2YzKg1MI62T7bnUVwe8mQox/n0nLiLZjWgFuReytvvXysGcfdND4YSyWWJ
         qlynMbNLiZxheBXSmKCqG+dSt8ybJcTF9Zxaklwt9PcxgWXmtV5t/Xcjl9oOWqcFWEE2
         py/+wSCjxt/rTUVvJrIO8cd48nLyglpJ9mWwR5QMyPegPg7xqaB8uzy0rWLBdJsu0Q/n
         EBaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731586303; x=1732191103;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E+Fn+TRNlFXO3ulOSTzXE3Z/L18YHrd+68I42zTssiQ=;
        b=Zfll2ySa10VvFAj7ITJ7fmgprFIc6JB1wlO33eAUpTvrkC6TG8721952/M6tkzZlJd
         BG3tkKyAPTDXeSNqcH0Zghim/luffSXs3Xdf2kc+bRJN7SlUCJbbTglM9x5ydE2EVrxR
         Pq0R27NIO4xN74kJQEdVJ5ybCqIvGTQakJAsPlpKUfEAiIORnzJgZntsbp7aFAL6wX9j
         4p4+axhejVwp58LBA4ZVNyG0dHf9NcKiSBBS3fXwwVGfddiMmk+eFv06ssnCPF7ni724
         OHUmVpDriSBK7kDV1AAUH1D0wT5dzBoHxNCUoEvzk6fmomiNIBR/ZUPovM7w7cqnjCwn
         RXJQ==
X-Forwarded-Encrypted: i=1; AJvYcCWoI69d4vjuUCYAXStVIT4IunTgedUDP9LywcUQ/4tvlyjefCjnVu7VRoXmHF6N3VaUNYx3F834kp65kg==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywo1tXooKKElToZPBi/V05eZgSsPVB4eL/inT0RuYxphgZr78yY
	TDDt9ReEy8JryKt+2NEI+f4oriM37vJjn4J5EVANzQXaw6LNBtJ5KuQgxMZgjsQ=
X-Google-Smtp-Source: AGHT+IEuwJH3uXzQoHJuqJQBlLC78MEjhVMGtWYMu62qUlP11U2Jmmz1Nm73TpwhnS/Tw4rX6aoyBA==
X-Received: by 2002:ac2:4c04:0:b0:53d:a077:1d0b with SMTP id 2adb3069b0e04-53da0771ddcmr2952197e87.44.1731586303288;
        Thu, 14 Nov 2024 04:11:43 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53da64fa596sm164800e87.48.2024.11.14.04.11.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Nov 2024 04:11:41 -0800 (PST)
Date: Thu, 14 Nov 2024 14:11:40 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: "Renjiang Han (QUIC)" <quic_renjiang@quicinc.com>
Cc: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
	"Vikash Garodia (QUIC)" <quic_vgarodia@quicinc.com>, "bryan.odonoghue@linaro.org" <bryan.odonoghue@linaro.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/4] media: venus: core: add qcs615 platform data
Message-ID: <refu5diitlpho62d756sgarsd77upbkidarx2dwuqng7kpndrd@xiqfir3nentb>
References: <20241112-add-venus-for-qcs615-v2-0-e67947f957af@quicinc.com>
 <20241112-add-venus-for-qcs615-v2-2-e67947f957af@quicinc.com>
 <eldjwrookzs46mvxdp56uj2eytfeu5fuj4zs4yowcyilhra3pg@vc6v72klixem>
 <a8c4dea53aab46b9ab8d40b9d997f13e@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a8c4dea53aab46b9ab8d40b9d997f13e@quicinc.com>

On Thu, Nov 14, 2024 at 04:25:45AM +0000, Renjiang Han (QUIC) wrote:
> On Thu 11/14/2024 2:01 AM, Dmitry Baryshkov wrote:
> > On Tue, Nov 12, 2024 at 05:17:58PM +0530, Renjiang Han wrote:
> > > Initialize the platform data and enable venus driver probe of QCS615 
> > > SoC.
> > > 
> > > Signed-off-by: Renjiang Han <quic_renjiang@quicinc.com>
> > > ---
> > >  drivers/media/platform/qcom/venus/core.c | 50 
> > > ++++++++++++++++++++++++++++++++
> > > 1 file changed, 50 insertions(+)
> > > 
> > > diff --git a/drivers/media/platform/qcom/venus/core.c 
> > > b/drivers/media/platform/qcom/venus/core.c
> > > index 
> > > 423deb5e94dcb193974da23f9bd2d905bfeab2d9..39d8bcf62fe4f72674746b75994c
> > > ce6cbaee94eb 100644
> > > --- a/drivers/media/platform/qcom/venus/core.c
> > > +++ b/drivers/media/platform/qcom/venus/core.c
> > > @@ -630,6 +630,55 @@ static const struct venus_resources msm8998_res = {
> > >  	.fwname = "qcom/venus-4.4/venus.mbn",  };
> > >  
> > > +static const struct freq_tbl qcs615_freq_table[] = {
> > > +	{ 0, 460000000 },
> > > +	{ 0, 410000000 },
> > > +	{ 0, 380000000 },
> > > +	{ 0, 300000000 },
> > > +	{ 0, 240000000 },
> > > +	{ 0, 133333333 },
> > > +};
> > > +
> > > +static const struct bw_tbl qcs615_bw_table_enc[] = {
> > > +	{  972000,  951000, 0, 1434000, 0 },	/* 3840x2160@30 */
> > > +	{  489600,  723000, 0,  973000, 0 },	/* 1920x1080@60 */
> > > +	{  244800,  370000, 0,	495000, 0 },	/* 1920x1080@30 */
> > > +};
> > > +
> > > +static const struct bw_tbl qcs615_bw_table_dec[] = {
> > > +	{ 1036800, 1987000, 0, 2797000, 0 },	/* 4096x2160@30 */
> > > +	{  489600, 1040000, 0, 1298000, 0 },	/* 1920x1080@60 */
> > > +	{  244800,  530000, 0,  659000, 0 },	/* 1920x1080@30 */
> > > +};
> > > +
> > > +static const struct venus_resources qcs615_res = {
> > > +	.freq_tbl = qcs615_freq_table,
> > > +	.freq_tbl_size = ARRAY_SIZE(qcs615_freq_table),
> > > +	.bw_tbl_enc = qcs615_bw_table_enc,
> > > +	.bw_tbl_enc_size = ARRAY_SIZE(qcs615_bw_table_enc),
> > > +	.bw_tbl_dec = qcs615_bw_table_dec,
> > > +	.bw_tbl_dec_size = ARRAY_SIZE(qcs615_bw_table_dec),
> > > +	.clks = {"core", "iface", "bus" },
> > > +	.clks_num = 3,
> > > +	.vcodec0_clks = { "vcodec0_core", "vcodec0_bus" },
> > > +	.vcodec_clks_num = 2,
> > > +	.vcodec_pmdomains = (const char *[]) { "venus", "vcodec0" },
> > > +	.vcodec_pmdomains_num = 2,
> > > +	.opp_pmdomain = (const char *[]) { "cx" },
> > > +	.vcodec_num = 1,
> > > +	.hfi_version = HFI_VERSION_4XX,
> > > +	.vpu_version = VPU_VERSION_AR50,
> > > +	.vmem_id = VIDC_RESOURCE_NONE,
> > > +	.vmem_size = 0,
> > > +	.vmem_addr = 0,
> > > +	.dma_mask = 0xe0000000 - 1,
> > > +	.cp_start = 0,
> > > +	.cp_size = 0x70800000,
> > > +	.cp_nonpixel_start = 0x1000000,
> > > +	.cp_nonpixel_size = 0x24800000,
> > > +	.fwname = "qcom/venus-5.4/venus_s6.mbn",
> 
> > Why does it need a separate firmware file?
> 
> SC7180, qcs615 can be enabled on same firmware ideally, but due to a different signing for qcs615, it takes a separate bin (venus_s6.mbn).

Continuing discussion in the linux-firmware@ thread.

-- 
With best wishes
Dmitry

