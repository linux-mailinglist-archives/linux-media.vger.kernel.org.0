Return-Path: <linux-media+bounces-22031-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5394A9D8A24
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2024 17:20:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 13C0D285A95
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2024 16:20:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 994B41B652C;
	Mon, 25 Nov 2024 16:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="L53j1MSQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 347191B415C
	for <linux-media@vger.kernel.org>; Mon, 25 Nov 2024 16:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732551628; cv=none; b=bvVJ/TqJH1+pqS6qDe/wSE+XqwjJkoJbmoJMg0qJ+PnhM8AjvPRoimui1KTi3VHmx5rQ9n6MRD7dW97ONHys+nbrX4IcPrGHsf22vJ6RQZevw5Jpucn/GhPZ0mVXRsoMdqHdiXV6TTkJ53Xw7QGT0NSEOHD9Kn1P3/TZNVD9JHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732551628; c=relaxed/simple;
	bh=jIz6yqv3rQbq9An1NPSJcpLwnbdowJpW7nXb8kiGPyk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ORiL0wopCpJU5EuS4yPMM8F61RrdGICOkppfJZlmylkgrayrBp5/OnmgBUBi43HUvO/MnvV/uBCUTUhUpelYHYc3FqaNMLn1zpbzqvanVadUXwyus6bhNFncvRQJkf5QDpkflzZ2vjmm1aenAHLC0RMvji/sejVvQ/ynJO5RxGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=L53j1MSQ; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-53de6b7da14so751834e87.0
        for <linux-media@vger.kernel.org>; Mon, 25 Nov 2024 08:20:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732551624; x=1733156424; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=osAdnzghfwg0ow+DK7g6ijsqkNJWf2271WtACbHNvN0=;
        b=L53j1MSQHGgd56joGpTEA7/DJSkBcfWhC989ev8vZYvgbiZ5GBay8eXelRyOnAeGZj
         AmoWG+SQ77R5Id0p9sLwDCit9kCjfXGpK5EGyYtGunO+PVEod9w8HQYjlJF6k+INTh5+
         qOeP7Rb5Nac2d88nLgHD85oKPq3MSBUPbyf0pGionmscR+7s6CmowkHurwHQiL2cL1KK
         Po5kEHnbBEi7r/N6/ddnI7IDxzr9M6l99DpdUDXWcOQK2A/MZX8YyyU+p/drmtuldgGR
         0YOaARv05tGBK7rRYyVR/CIyw5Lqs/47Mx+n5fDVg/u40W1NSD1T/ccmxtVI4LexlBO8
         6Xlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732551624; x=1733156424;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=osAdnzghfwg0ow+DK7g6ijsqkNJWf2271WtACbHNvN0=;
        b=fUFpwXklQEcvR9gDSfvRsUn5Tm9YUigSBkaDlJZPPSckoJG2XmM3I0k2ugZxhaD33W
         QI1+5rmQfNXaCkJhr1CuNSvyg7OMv7OCEXuGU8bpKsTM+VKZI6iV3srMN3uorwz9WS97
         pCgpP9M5xS3V3I3ye+bXm5u2xIUuDzy/klmxms8atDy03du8jnr5z3/lG9/ST0Q75nxh
         Uqz7FbsDZTryNkuxyf0a/ZOSEJ1LMovS31IioDyxlq5ulHY83XXTbIE2VshFrWHYuN4Z
         x6tD6uvi2uA/60T0+UhvGJMDEVfDtmzkMvPGmnLjhPlIoMQe/9/QpraKaqL45OP1+5p1
         yrbQ==
X-Forwarded-Encrypted: i=1; AJvYcCVXcYCVnxiMJ7NwOk0zW3AJka9P42sqSVtroETfsL1p/XNWE3xIU0rAZAvfhBUm2VLUHvwWsbiLgEvwyA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxmN5Gl4emb91dWijFvYNntHvbuRYLVZiAAIPOcVquVuCRWhOyG
	gJUNQpib0v2YvXsqnldt7JfX9nxFjkSMMA8hCZ5xkXi/iaR5R2GRpptk9lLU/O0=
X-Gm-Gg: ASbGncsbTXRLETROBN+PnKgctyQB7O5s1cpcuAlZz7irrz5RoiezY/xXGXaMOI9TbDe
	0sknYpdRlA5iWGbnYwNzZFsKAbgtO3RqUWV7jQPPVe05mq9kCSV6pjrRQTBrkZbGCR5KC392KXM
	UTOiOFs0mroh5TQ9ufAs1W7BbrtYyPE4S8Muitj4VsLhJCxV6DTJXRq+yRcQG1JZtxlWBTt1F8Z
	MiiYcfgYYkIZJK+EQYKX6xmPpLNJrEIVBZ+NGkp1Frs3LaAG9qY5yXTbCZQsBEHuZpTRGqbaJ85
	w2el/bUXhwjLO4aysgEDLIFF7xnsxQ==
X-Google-Smtp-Source: AGHT+IGGJmuLAqbWK+ECiMMHIoK9Za26vUdLmxRyMCY0pIIzGmiDusuBm5BdVWv1P0n612BIvLr1ow==
X-Received: by 2002:a05:6512:224d:b0:53d:a5c8:aaa6 with SMTP id 2adb3069b0e04-53dd36a1186mr5952770e87.13.1732551624397;
        Mon, 25 Nov 2024 08:20:24 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53dd2489ac9sm1704981e87.182.2024.11.25.08.20.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2024 08:20:23 -0800 (PST)
Date: Mon, 25 Nov 2024 18:20:21 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: "Renjiang Han (QUIC)" <quic_renjiang@quicinc.com>
Cc: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
	"Vikash Garodia (QUIC)" <quic_vgarodia@quicinc.com>, "bryan.odonoghue@linaro.org" <bryan.odonoghue@linaro.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 2/4] media: venus: core: add qcs615 platform data
Message-ID: <ro5nx6brovd7inyy6tkrs7newszcxrzymfbsftejgpglz3gs6v@pscij26xmmco>
References: <20241125-add-venus-for-qcs615-v3-0-5a376b97a68e@quicinc.com>
 <20241125-add-venus-for-qcs615-v3-2-5a376b97a68e@quicinc.com>
 <j4nnlbstclwgoy2cr4dvoebd62by7exukvo6nfekg4lt6vi3ib@tevifuxaawua>
 <da432de1369e4ce799c72ce98c9baaf1@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <da432de1369e4ce799c72ce98c9baaf1@quicinc.com>

On Mon, Nov 25, 2024 at 03:34:19PM +0000, Renjiang Han (QUIC) wrote:
> On Monday, November 25, 2024 9:36 PM, Dmitry Baryshkov wrote:
> > On Mon, Nov 25, 2024 at 11:04:50AM +0530, Renjiang Han wrote:
> > > Initialize the platform data and enable venus driver probe of QCS615 
> > > SoC.
> > > 
> > > Signed-off-by: Renjiang Han <quic_renjiang@quicinc.com> >
> > > ---
> > >  drivers/media/platform/qcom/venus/core.c | 50 
> > > ++++++++++++++++++++++++++++++++
> > >  1 file changed, 50 insertions(+)
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
> > I really want the firmware discussion of linux-firmware to be solved first,
> > before we land this patch.
> 
> > SHort summary: can we use a single image for all 5.4 platforms (by using
> > v5 signatures, by using v6 signatures, v3 or any other kind of quirk).
> Thanks for your comment. We have discussed with the firmware team and
> other teams if we can use the same firmware binary. The result is we'd better
> use different firmware files. They should respond in the firmware binary
> thread. I will push them and hope them respond as quickly as possible and
> give reasons.
> > > +};
> > > +
> > >  static const struct freq_tbl sdm660_freq_table[] = {
> > >  	{ 979200, 518400000 },
> > >  	{ 489600, 441600000 },
> > > @@ -937,6 +986,7 @@ static const struct of_device_id venus_dt_match[] = {
> > >  	{ .compatible = "qcom,msm8916-venus", .data = &msm8916_res, },
> > >  	{ .compatible = "qcom,msm8996-venus", .data = &msm8996_res, },
> > >  	{ .compatible = "qcom,msm8998-venus", .data = &msm8998_res, },
> > > +	{ .compatible = "qcom,qcs615-venus", .data = &qcs615_res, },
> 
> > The hardware seems to be the same as sc7180, only the frequencies differ.
> > Can we change the driver in a way that we don't have to add another
> > compat entry just for the sake of changing freqs / bandwidths?
> 
> Thank you for your comment. I agree with you. But based on the Venus code
> architecturE ANd the distinction between different platforms, I think the
> current changes are the simplest.

Well, it is simplest, correct. But not the best one. There is no plan no
migrate these platforms to the iris driver. So instead, please improve
the venus driver instead of just pushing the simplest change. I should
have been more explicit about it earlier.

> 
> > >  	{ .compatible = "qcom,sdm660-venus", .data = &sdm660_res, },
> > >  	{ .compatible = "qcom,sdm845-venus", .data = &sdm845_res, },
> > >  	{ .compatible = "qcom,sdm845-venus-v2", .data = &sdm845_res_v2, },
> > > 
> > > --
> > > 2.34.1
> > > 
> 
> > -- 
> > With best wishes
> > Dmitry

-- 
With best wishes
Dmitry

