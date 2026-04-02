Return-Path: <linux-media+bounces-57922-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SNBqBFwYzmmnkgYAu9opvQ
	(envelope-from <linux-media+bounces-57922-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 02 Apr 2026 09:18:52 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1191E385080
	for <lists+linux-media@lfdr.de>; Thu, 02 Apr 2026 09:18:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D9EE9304BA81
	for <lists+linux-media@lfdr.de>; Thu,  2 Apr 2026 07:11:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A62B3387358;
	Thu,  2 Apr 2026 07:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BlsePBgw"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A3C21EFFA1;
	Thu,  2 Apr 2026 07:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775113867; cv=none; b=MPm91A5f3MhwH6NzVAHRJ3O4Q+qHSKtCW58pb5S57PMXCKIE1rZzq5+UdaTCM7gWuhTfOCJd0Tgfr0HFj4xZnb4BMwBl5vJzAlQwMuEMckKeeUubL+5bBHiKiqrTn87hjM5+kHFK7KsKmEQ3glnRlaOcZdWZaPH3uAXFkf7akzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775113867; c=relaxed/simple;
	bh=0gLYidwj8tspKBeVYR9YCQT+3k2VlmR+PXyw8uxLLoo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=epiRYZrXOWx2z1fTMz0V6rpv9nutgLMZIm8HWM03QBI4nXazMXNKgvnAdQt5j3/AEfLqx3/ikYum1B7/WTJpipDYQ4oD3rjfYsZpl7FQca9Dfbi7e58UU93fWegRfIDPaqND1zeXZ0jHxHYen2Qn/RrNpGXdPH7Jn0fJ9E/JfMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BlsePBgw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB23CC2BC9E;
	Thu,  2 Apr 2026 07:11:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775113866;
	bh=0gLYidwj8tspKBeVYR9YCQT+3k2VlmR+PXyw8uxLLoo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BlsePBgwC9g3wEH1iKJXTBmx5df6zzjmRYMKS6Ay4FXMQJ+L5IFTQoo+4iowJTqj7
	 XHTnJfLQYz1/5bvufGGP5HVb34mrgihrvU1kUX81bgOL2A2wtUifHqTQwrYsQgpNn+
	 a9bUV4mviTTRDw3cQb176J0zFcmd40hmrrWDztjnjkEZ0LTxw5V36iQE+R6lnKDDak
	 ImcEBK+FAEoqWx8kL9SxpZEw8Ekqd1bqZN/04tK3t4Lrap9GiY2k1MTNaDVEYxdVw6
	 k0Vo6RHkIT8eEn0cwXKsVQ/IAylKkk5MeZWlxZObAjIJqrdYYbB//q3xHdmqAXYa7/
	 9JfdfB091Go3w==
Date: Thu, 2 Apr 2026 09:11:04 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Cc: Wangao Wang <wangao.wang@oss.qualcomm.com>, 
	Bryan O'Donoghue <bod@kernel.org>, Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v4 5/5] arm64: dts: qcom: purwa-iot-som: enable video
Message-ID: <20260402-versatile-spider-of-music-ddf3af@quoll>
References: <20260401-enable_iris_on_purwa-v4-0-ca784552a3e9@oss.qualcomm.com>
 <20260401-enable_iris_on_purwa-v4-5-ca784552a3e9@oss.qualcomm.com>
 <9f94af36-6460-c227-2735-628e45819a03@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <9f94af36-6460-c227-2735-628e45819a03@oss.qualcomm.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57922-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: 1191E385080
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 01, 2026 at 06:12:24PM +0530, Dikshita Agarwal wrote:
> On 4/1/2026 3:54 PM, Wangao Wang wrote:
> > Enable video nodes on the purwa-iot-som board.
> > 
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
> > ---
> >  arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi | 4 ++++
> >  1 file changed, 4 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi b/arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi
> > index 394e65518ac5037e5c7c50583acefc0dbc8ebb47..ff8621f8750584636ad781467f9c35ace2354e4c 100644
> > --- a/arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi
> > @@ -389,6 +389,10 @@ &gpu_zap_shader {
> >  	firmware-name = "qcom/x1p42100/gen71500_zap.mbn";
> >  };
> >  
> > +&iris {
> > +	status = "okay";
> > +};
> > +
> >  &pcie3 {
> >  	pinctrl-0 = <&pcie3_default>;
> >  	pinctrl-names = "default";
> > 
> 
> Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> 

I wonder how many reviews from qcom are needed for such trivial one
liners which are 100% obvious. Let's go for more - please everyone,
let's provide here review:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Does it make any sense? Are we making the process just ridicilous?

Best regards,
Krzysztof


