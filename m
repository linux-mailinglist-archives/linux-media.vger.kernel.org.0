Return-Path: <linux-media+bounces-56574-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KGTTHYa8vWnyAwMAu9opvQ
	(envelope-from <linux-media+bounces-56574-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 22:30:46 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 88F032E1675
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 22:30:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E69BD303ABED
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 21:24:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87BE03A963C;
	Fri, 20 Mar 2026 21:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="L8Fp4irv"
X-Original-To: linux-media@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7419236EABF
	for <linux-media@vger.kernel.org>; Fri, 20 Mar 2026 21:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774041840; cv=none; b=uK+f3Msmc/wZJFmDkNPJPeehrpVWfd/876ujrGURr0xjCTz4R1g7hl/Ceo5n9qaMpCsqsF2NOHHQbmy5OFTAeX6lmhrCBidVVS2uc/+mSd/HnU8M3bCIei2C51KnU6G8CBlMB2x/D8C6GnSB1N8aSzIXuHbzQUDqWnUreArTQqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774041840; c=relaxed/simple;
	bh=uTaN04j6+cb6/7R2Oaa7TFsdeuAss2ZJO+KB7exIZv4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dYuSXSL2VF2Wb6llCemK2+lFqicAGwyglasX3kF1rGMZf4IKnyVzy4ONijJ1+Ml1clcEPDjOSCPgDZGtw9G5f1n+n93S2rnY+paNLXwUxCKHoqw3V3RvB8yiwxCuAvum9DmTswJczPLbgSgsO6sSXjrDsbexLod3A+an8yczDT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=L8Fp4irv; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=jAQD
	Q2Ijn2JafmoVVhu9OwhIlf/ITjKAIPoy10A798Y=; b=L8Fp4irv4LycvmIlOZ3f
	WUViDiZxJrvz9m7VzpNUdk3cGXX0Aeo61n8EJTCw0K9+d4I/PGRtkPig7GSaosp7
	bgCmcWipGxQUCT61C2BVKByrJpsvoyQJybJFDLrHrFcLUNYrBeldQUxr7vS4E8Io
	ZMjTN6EKxsAC2rIo4e1LljfH8CFRnthH8/r0fy6OTvUxV0PYxA3dNYXY+mRTrCrD
	P47+wuBlLfRS7EjA7UzMZJvbX1rs/j5hoFr8G0GP51EuX/irog4Dh5BtP6aW2HR2
	WZ62n6T/enlZrq/cuxNwPlea9aiK2HPz3Cengtv1RPKmWK1wN4xsWoZ5kH7ybTLN
	Ag==
Received: (qmail 1700375 invoked from network); 20 Mar 2026 22:23:53 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 20 Mar 2026 22:23:53 +0100
X-UD-Smtp-Session: l3s3148p1@2XBHTXtNHLEujnsL
Date: Fri, 20 Mar 2026 22:23:52 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>,
	linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v6 1/5] dt-bindings: i2c: qcom-cci: Document sm6150
 compatible
Message-ID: <ab266KF-8ll2TKxm@shikoro>
References: <20260305-sm6150_evk-v6-0-38ce4360d5e0@oss.qualcomm.com>
 <20260305-sm6150_evk-v6-1-38ce4360d5e0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260305-sm6150_evk-v6-1-38ce4360d5e0@oss.qualcomm.com>
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_NA(0.00)[sang-engineering.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56574-lists,linux-media=lfdr.de,renesas];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,gmail.com,linaro.org,pengutronix.de,nxp.com,vger.kernel.org,lists.linux.dev,lists.infradead.org];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sang-engineering.com:dkim,qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,linaro.org:email]
X-Rspamd-Queue-Id: 88F032E1675
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 05, 2026 at 05:48:12PM +0800, Wenmeng Liu wrote:
> Add the sm6150 CCI device string compatible.
> 
> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> Acked-by: Andi Shyti <andi.shyti@kernel.org>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>

Applied to for-next, thanks!


