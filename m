Return-Path: <linux-media+bounces-51209-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mMtDF42kcGlyYgAAu9opvQ
	(envelope-from <linux-media+bounces-51209-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 11:03:57 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 0823E54DFD
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 11:03:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id F295C8E017F
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 09:56:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A0B5480962;
	Wed, 21 Jan 2026 09:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M7ZSnuID"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64BA0480944;
	Wed, 21 Jan 2026 09:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768989254; cv=none; b=N+Pv61Ek+vpXy1MQQ8N8GYXn0SoXyaP2acvsdBustYekK+rEShQzoqHk8qkLxQeBLkpQhf5qzj7HRARvoeh+yuty6eAec7vrtpwQn4DYAvfzli/UN9CSnjmoK9wYCN7XDd2tJeYTGDJgdqQxpUD4QXC5cAgx7ZLBXpF3pShbaJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768989254; c=relaxed/simple;
	bh=82pjmy3qs+SVx1Sw2wyIUvIhaaezCyrk8eCnSb6mmKc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GmxURYqvEdFPcIiaAoJlO5/opgOm4ZAx9b6GT/WOCv40hmqq72yrzhVSdYyYeSCt7pCNyySrYxcJ9+kLqNInznKkN9iLF0p93cEhe7kwd94sJi2ny0I5M4R7Yu2htzUYIJY1E3mionOEtoo3hwqkynFP0fsffkXW7aOjW1yk5h8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M7ZSnuID; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D671C19425;
	Wed, 21 Jan 2026 09:54:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768989254;
	bh=82pjmy3qs+SVx1Sw2wyIUvIhaaezCyrk8eCnSb6mmKc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M7ZSnuIDGdJyOg3Cjb13rPrw3ldvatg3mrx3GrBNtciqQdW+f0C7b03tGmtxNnMX7
	 ZWSyQ7tTha8NgB7BMFI/mwRRufS9ND5P80nuYK1TF0kfG3K5iNkofZnD0Fynu+D6zj
	 7KvSl0KQm+h2llh3cqsndpAzatEczPSfogrqzeGBQEbSdoyJBp/97fG+VSKe/bNL03
	 4OD9BgNBOaBtaDQCW1FCuTH1/ajH/H3+ZHMYHqLtYgSbNU0krfXU8qrGwpP1Hs2sZH
	 3NTJ7qr8TL+3RbsrEw9u0WK1jnS+UeVOr7FoSp5OxtDWkvThYilmNsEN2+a9/t89kr
	 JZDhO1df2dVvQ==
Date: Wed, 21 Jan 2026 10:54:08 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Robert Foss <rfoss@kernel.org>, 
	Todor Tomov <todor.too@gmail.com>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v3 0/5] Add CCI and imx577 sensor support for Talos evk
Message-ID: <aXCiEyyu7mcx0YhK@zenone.zhora.eu>
References: <20260115-sm6150_evk-v3-0-81526dd15543@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260115-sm6150_evk-v3-0-81526dd15543@oss.qualcomm.com>
X-Spamd-Result: default: False [-0.46 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-51209-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,gmail.com,linaro.org,pengutronix.de,vger.kernel.org,lists.linux.dev,lists.infradead.org];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andi.shyti@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo]
X-Rspamd-Queue-Id: 0823E54DFD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Wenmeng,

> Wenmeng Liu (5):
>       arm64: dts: qcom: talos: Add camss node
>       dt-bindings: i2c: qcom-cci: Document sm6150 compatible

I assume you are still going to address Krzysztof's concerns here
before merging the whole thing, right?

Andi

>       arm64: dts: qcom: talos: Add CCI definitions
>       arm64: dts: qcom: talos: Add camera MCLK pinctrl
>       arm64: dts: qcom: talos-evk-camera: Add DT overlay

