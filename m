Return-Path: <linux-media+bounces-22080-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC2489D96EC
	for <lists+linux-media@lfdr.de>; Tue, 26 Nov 2024 13:04:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6E01B282F2F
	for <lists+linux-media@lfdr.de>; Tue, 26 Nov 2024 12:03:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 723D31BD9DF;
	Tue, 26 Nov 2024 12:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aMRvF+Lc"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDB951C3F00
	for <linux-media@vger.kernel.org>; Tue, 26 Nov 2024 12:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732622632; cv=none; b=Z4AR15zwkHIi0g04Gt3mw8GZMKWm4jL5bJ6d/e0kfXYM268wuwktF2nFTQBOvug4tm4g15asNXqXTYntqAhm+c36S4kQpHhi7/2bt5U4/cul5DBtmP/Wf0o5qz6tWDAtub8m1gSXWueBrutwMivW9p/4CXnVAV8rpPt9Q4VSx08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732622632; c=relaxed/simple;
	bh=ZhxTRNp1iOgVhb1TJcCAisZHc1T27MAe32itSCII+vg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CvRmsqLRzJEZML3GUYn4LZMUBIQaY1w/krewG/yKnxEbt1gPPhgL+e3GrpBdoxTOBQ1KJQtVtdm4IeaYkJAHNB2tilRihQ85/gvpq/ujKzxYETkfIXBAKqcvy6vdpt5aHzju1f0A3F1xmzGzi5Mi0HhqoJc2lrNFarwWsmENShQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aMRvF+Lc; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2ffc76368c6so29898831fa.0
        for <linux-media@vger.kernel.org>; Tue, 26 Nov 2024 04:03:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732622629; x=1733227429; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zpyYn15MUH66vkZULVZR7JEeL4VUeZ1EeEi+VMRTwas=;
        b=aMRvF+LcLW15oEp/Rv3q6VoUFJvAPxY7NZTncH0Gx3KLN9djaJavrly9eW8m2s8oAv
         TQApWdZ7NGvsgm1IeeeBuhyPsQ+33uG+WfDUAvKf8hKoP33N0Dzq6NVHdUIWgV4U9npq
         agEYDiU5pyBzs7pR+5AR6sryUY1QwF+02e2fC7DjKBdwlEFuVGZ+VkcTXpP4PAYJwJ0U
         dAHUHUf8teeY8cfZ7QqpJViu/ve4BPHRO36P3konWgNdRN7jMXOy7Eu7CiK5lF2Tivvq
         7YQCgKnRrOkS2eT3zuNT3elXwqBs8P6bLJniZK0ZBlJJNAzTFCbbVHmex1cw/KewxfYP
         cgAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732622629; x=1733227429;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zpyYn15MUH66vkZULVZR7JEeL4VUeZ1EeEi+VMRTwas=;
        b=fR1zix/IMFBfFJJrZqWbFoa4vtUjiA49zmGXlLbaFZTcO+dRCR6lhtB1TRgxtp4x8z
         WzbaY3cz6pSKe/Lk46TN74J3RQRwpmnPezVIK1J6Fh3Lo1T/mlh4zmPgOA+JV5LBLJxn
         81NI++Ws6vU2z5Gosl50NHZMvxgMzEiRWPisV2mrhImhUn22cS3IgE2Zdr3QJArzQ5wf
         bFy74ZojbU+YvcdoSpwOE5i6QZVCe30cmMvVMQHeu3mCZiZxhj8tHZLIe8KYAFMvJbwZ
         V+kKmIiPG3jZ2IaqekbQEWf8dxFYwQTSIoVg4D8f4EqFy74JrUxKj0Fsyqex2JZelK9f
         c3dg==
X-Forwarded-Encrypted: i=1; AJvYcCUAvo6nIk3KflWwCCCVmg//onp9aA5eVg+7lOdRCMUBbwq8sfLUrgbBY3whD7Sh1ilEqCjEM9NTBuYe/w==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywz9/TTK8gyYCQKtnIUOpfIa51aez/nmTLpbRgNcJVyQt+xH0i3
	JCIEv5TwgG97OQT7C3fG42+ZDMkABBWj+YGWcemjuXNa1SF2iL3MwraRGbJ4KVY=
X-Gm-Gg: ASbGncu6D8nosCYDNa8gIhj6HwdTOs8YvysZE3pToTFaCRCB8SJLboHW5SwSaXjwc6r
	xQhE6TIh5o6WrAv+5D8EFqyplXqTXeGiZ2CFZqzfksXuj9jOIE0LPFMGwVl0YFGC3Zf+iVyWhcK
	aVLtFxZG0TkH7daKHAWiGHcMJgMB+DKwgQWM3kcHMQNinRy38+J+8PwtB/luAnXdPvQUQVYBjOX
	FFojMRKtf0l2eUIpsqkBSInhhVj83T6mnHDj0T7h5a7D4bJBUJ5XdBs1IA3zdkODJ14HV6pQxI+
	B9Goz+S4VetPwNtX0xjn/+yIKQfNzQ==
X-Google-Smtp-Source: AGHT+IFUMY1WY3yagazW3F3+TQd2N1V070AvMKUcYn8VzRKtEiMJ3VZP4mf3lCBn6xadKdz1w9sp2w==
X-Received: by 2002:a2e:be9f:0:b0:2ff:c77c:c71e with SMTP id 38308e7fff4ca-2ffc77cc9dfmr50021991fa.20.1732622628941;
        Tue, 26 Nov 2024 04:03:48 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ffa4d1746bsm18581581fa.12.2024.11.26.04.03.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Nov 2024 04:03:47 -0800 (PST)
Date: Tue, 26 Nov 2024 14:03:45 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Renjiang Han <quic_renjiang@quicinc.com>
Cc: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
	"Vikash Garodia (QUIC)" <quic_vgarodia@quicinc.com>, "bryan.odonoghue@linaro.org" <bryan.odonoghue@linaro.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	quic_qiweil@quicinc.com
Subject: Re: [PATCH v3 2/4] media: venus: core: add qcs615 platform data
Message-ID: <l4mnw6fu3cdbmqs4bxeykm73p2pb5u7vr5wh6zq5gf5y3fydsw@t3pijaf7qymf>
References: <20241125-add-venus-for-qcs615-v3-0-5a376b97a68e@quicinc.com>
 <20241125-add-venus-for-qcs615-v3-2-5a376b97a68e@quicinc.com>
 <j4nnlbstclwgoy2cr4dvoebd62by7exukvo6nfekg4lt6vi3ib@tevifuxaawua>
 <da432de1369e4ce799c72ce98c9baaf1@quicinc.com>
 <ro5nx6brovd7inyy6tkrs7newszcxrzymfbsftejgpglz3gs6v@pscij26xmmco>
 <36fdb3d7-fd48-43a9-a392-336038db71a2@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <36fdb3d7-fd48-43a9-a392-336038db71a2@quicinc.com>

On Tue, Nov 26, 2024 at 03:40:47PM +0800, Renjiang Han wrote:
> 
> On 11/26/2024 12:20 AM, Dmitry Baryshkov wrote:
> > On Mon, Nov 25, 2024 at 03:34:19PM +0000, Renjiang Han (QUIC) wrote:
> > > On Monday, November 25, 2024 9:36 PM, Dmitry Baryshkov wrote:
> > > > On Mon, Nov 25, 2024 at 11:04:50AM +0530, Renjiang Han wrote:
> > > > > Initialize the platform data and enable venus driver probe of QCS615
> > > > > SoC.
> > > > > 
> > > > > Signed-off-by: Renjiang Han <quic_renjiang@quicinc.com> >
> > > > > ---
> > > > >   drivers/media/platform/qcom/venus/core.c | 50
> > > > > ++++++++++++++++++++++++++++++++
> > > > >   1 file changed, 50 insertions(+)
> > > > > 
> > > > > diff --git a/drivers/media/platform/qcom/venus/core.c
> > > > > b/drivers/media/platform/qcom/venus/core.c
> > > > > index
> > > > > 423deb5e94dcb193974da23f9bd2d905bfeab2d9..39d8bcf62fe4f72674746b75994c
> > > > > ce6cbaee94eb 100644
> > > > > --- a/drivers/media/platform/qcom/venus/core.c
> > > > > +++ b/drivers/media/platform/qcom/venus/core.c
> > > > > @@ -630,6 +630,55 @@ static const struct venus_resources msm8998_res = {
> > > > >   	.fwname = "qcom/venus-4.4/venus.mbn",  };
> > > > > +static const struct freq_tbl qcs615_freq_table[] = {
> > > > > +	{ 0, 460000000 },
> > > > > +	{ 0, 410000000 },
> > > > > +	{ 0, 380000000 },
> > > > > +	{ 0, 300000000 },
> > > > > +	{ 0, 240000000 },
> > > > > +	{ 0, 133333333 },
> > > > > +};
> > > > > +
> > > > > +static const struct bw_tbl qcs615_bw_table_enc[] = {
> > > > > +	{  972000,  951000, 0, 1434000, 0 },	/* 3840x2160@30 */
> > > > > +	{  489600,  723000, 0,  973000, 0 },	/* 1920x1080@60 */
> > > > > +	{  244800,  370000, 0,	495000, 0 },	/* 1920x1080@30 */
> > > > > +};
> > > > > +
> > > > > +static const struct bw_tbl qcs615_bw_table_dec[] = {
> > > > > +	{ 1036800, 1987000, 0, 2797000, 0 },	/* 4096x2160@30 */
> > > > > +	{  489600, 1040000, 0, 1298000, 0 },	/* 1920x1080@60 */
> > > > > +	{  244800,  530000, 0,  659000, 0 },	/* 1920x1080@30 */
> > > > > +};
> > > > > +
> > > > > +static const struct venus_resources qcs615_res = {
> > > > > +	.freq_tbl = qcs615_freq_table,
> > > > > +	.freq_tbl_size = ARRAY_SIZE(qcs615_freq_table),
> > > > > +	.bw_tbl_enc = qcs615_bw_table_enc,
> > > > > +	.bw_tbl_enc_size = ARRAY_SIZE(qcs615_bw_table_enc),
> > > > > +	.bw_tbl_dec = qcs615_bw_table_dec,
> > > > > +	.bw_tbl_dec_size = ARRAY_SIZE(qcs615_bw_table_dec),
> > > > > +	.clks = {"core", "iface", "bus" },
> > > > > +	.clks_num = 3,
> > > > > +	.vcodec0_clks = { "vcodec0_core", "vcodec0_bus" },
> > > > > +	.vcodec_clks_num = 2,
> > > > > +	.vcodec_pmdomains = (const char *[]) { "venus", "vcodec0" },
> > > > > +	.vcodec_pmdomains_num = 2,
> > > > > +	.opp_pmdomain = (const char *[]) { "cx" },
> > > > > +	.vcodec_num = 1,
> > > > > +	.hfi_version = HFI_VERSION_4XX,
> > > > > +	.vpu_version = VPU_VERSION_AR50,
> > > > > +	.vmem_id = VIDC_RESOURCE_NONE,
> > > > > +	.vmem_size = 0,
> > > > > +	.vmem_addr = 0,
> > > > > +	.dma_mask = 0xe0000000 - 1,
> > > > > +	.cp_start = 0,
> > > > > +	.cp_size = 0x70800000,
> > > > > +	.cp_nonpixel_start = 0x1000000,
> > > > > +	.cp_nonpixel_size = 0x24800000,
> > > > > +	.fwname = "qcom/venus-5.4/venus_s6.mbn",
> > > > I really want the firmware discussion of linux-firmware to be solved first,
> > > > before we land this patch.
> > > > SHort summary: can we use a single image for all 5.4 platforms (by using
> > > > v5 signatures, by using v6 signatures, v3 or any other kind of quirk).
> > > Thanks for your comment. We have discussed with the firmware team and
> > > other teams if we can use the same firmware binary. The result is we'd better
> > > use different firmware files. They should respond in the firmware binary
> > > thread. I will push them and hope them respond as quickly as possible and
> > > give reasons.
> > > > > +};
> > > > > +
> > > > >   static const struct freq_tbl sdm660_freq_table[] = {
> > > > >   	{ 979200, 518400000 },
> > > > >   	{ 489600, 441600000 },
> > > > > @@ -937,6 +986,7 @@ static const struct of_device_id venus_dt_match[] = {
> > > > >   	{ .compatible = "qcom,msm8916-venus", .data = &msm8916_res, },
> > > > >   	{ .compatible = "qcom,msm8996-venus", .data = &msm8996_res, },
> > > > >   	{ .compatible = "qcom,msm8998-venus", .data = &msm8998_res, },
> > > > > +	{ .compatible = "qcom,qcs615-venus", .data = &qcs615_res, },
> > > > The hardware seems to be the same as sc7180, only the frequencies differ.
> > > > Can we change the driver in a way that we don't have to add another
> > > > compat entry just for the sake of changing freqs / bandwidths?
> > > Thank you for your comment. I agree with you. But based on the Venus code
> > > architecturE ANd the distinction between different platforms, I think the
> > > current changes are the simplest.
> > Well, it is simplest, correct. But not the best one. There is no plan no
> > migrate these platforms to the iris driver. So instead, please improve
> > the venus driver instead of just pushing the simplest change. I should
> > have been more explicit about it earlier.
> 
> Based on the current code architecture, I don't know if there is a better
> way. If we
> 
> refactor the code, it will take a lot of effort.

Yes, please. The freq_tbl contents is a duplicate of the OPP table in
DT. Drop it from the driver.

> Therefore, I submit this change. Do you have a better approach?

NAK for this submission. Please spend some time and improve the driver
instead.

> 
> Also, the driver architecture of iris is implemented as you said.

Irrelevant. You are patching venus, not iris.

> > > > >   	{ .compatible = "qcom,sdm660-venus", .data = &sdm660_res, },
> > > > >   	{ .compatible = "qcom,sdm845-venus", .data = &sdm845_res, },
> > > > >   	{ .compatible = "qcom,sdm845-venus-v2", .data = &sdm845_res_v2, },
> > > > > 
> > > > > --
> > > > > 2.34.1
> > > > > 
> > > > -- 
> > > > With best wishes
> > > > Dmitry
> 
> -- 
> Best Regards,
> Renjiang
> 

-- 
With best wishes
Dmitry

