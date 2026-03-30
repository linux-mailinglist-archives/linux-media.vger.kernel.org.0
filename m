Return-Path: <linux-media+bounces-57687-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MNXEMJb+ymk2CgYAu9opvQ
	(envelope-from <linux-media+bounces-57687-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 00:52:06 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D2BFC36223C
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 00:52:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 471FC3009814
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 22:51:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51EED3EB809;
	Mon, 30 Mar 2026 22:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CV5QRESV"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB4323E558E;
	Mon, 30 Mar 2026 22:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774911105; cv=none; b=cLip8Ns2rExKnpjVE+ackyTYMYWRTeD+URazXm6/JB/5V4xVM3yhT0+Pd6WPFKYeih9YatA4wHh3SqR3xSGMJFjwooZqlkWHjN56qXMjbYj73JnbaXBf9b2vjAPP9L+ScstSRm/zbroL4B7ft8umsr0tTVqirxjvAHHpnnQchGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774911105; c=relaxed/simple;
	bh=sZbLXgQ+6kP76ofonMlDS/YV34qv00ytaH54zjiNlXw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pTZqlFq5wics7Hor+wdiFZxfRGhCoGfIIEr+906HLK7ismCaEpMjoKpFbE9S+eR/Z0emm3LKUWfccIaDOrbAeDVlN5xBSrOYh5WwmIzO/shHc68Ax+kJGTcveSZIEfgjV3Ubig2dVwgOaHDSBnuC5e6Y6XhVNs7QxcUaqpURvoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CV5QRESV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAD46C4CEF7;
	Mon, 30 Mar 2026 22:51:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774911104;
	bh=sZbLXgQ+6kP76ofonMlDS/YV34qv00ytaH54zjiNlXw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=CV5QRESVXFA/k9ZtUf/LsWhAYAd4eFG5+kG5RgTHAMgL/2UHrXSRXcjc3CXaTKCZH
	 whBSWAfUYCeU/Xm9r67+wm9PKnj7ZJvIaek+cfe2+NTl7C16Qcz0Ydqqhn5Gr8iAxu
	 k08dMaByqdzSDe2OG3SZwov3HqG2yvwOAYtVoCmKUk1Kcir+ZOgkUM+CCLkG60zoYj
	 ec2MdmAKVvEquWkw9tepqoeCq9zcxj3B0maiPN4apZwk1dJCJfjuYwzuvaEmUGNyTr
	 D0o0PlhXJ2lSfvcFWNtSWsk8aFIu7gtVC4HgSxpd4ilzMP9pHfNqK3GSTl5NXUhFeU
	 Be2sPVau6rGtQ==
Message-ID: <96d3bb35-3fae-47e4-b484-1a37f2f41b43@kernel.org>
Date: Mon, 30 Mar 2026 23:51:38 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/3] media: qcom: camss: Add CAMSS Offline Processing
 Engine driver
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: johannes.goede@oss.qualcomm.com,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, vladimir.zapolskiy@linaro.org,
 laurent.pinchart@ideasonboard.com, kieran.bingham@ideasonboard.com,
 robh@kernel.org, krzk+dt@kernel.org, andersson@kernel.org,
 konradybcio@kernel.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, mchehab@kernel.org
References: <1ba54ec0-be51-4694-a79b-f272e76303d2@kernel.org>
 <X-Lw_zi1o015-V1Cv4dY_ik6SfTB8TTcLmn1l-Ta7UviYTJ6gwMBn4B4ulYwjd_Aetul5xUt0T6ln9E-Hl5h4g==@protonmail.internalid>
 <CAFEp6-3ziXJTYADOFj--rZL5TumroXuW+=SnUQ9XakRxHT-ypg@mail.gmail.com>
 <12194cc0-0960-486c-be7e-1a22d95de340@kernel.org>
 <rj2vb725he4yzfvjifzyxqpbqk5oztfaafp7sg2qes4qz3mlaz@z5dyoqod56d7>
 <7fc31426-3157-49c7-a30d-dcd7b181fcc6@oss.qualcomm.com>
 <qq43xl3lsv2nq4ngn2hojleddxjmkgwclb2ajek5gvdtgyjltl@3tqg5ydhsxia>
 <8DTHyPLaUjGKd83PvBsisjn_SnpUnvkateTtwz9P6CChP9VGfDyQmJa4Rfd5KwOBOLhtGFJPDzfHrXC4zvV-Fg==@protonmail.internalid>
 <0330f63f-7137-4484-954a-fc0776a9b052@oss.qualcomm.com>
 <0879e4c1-5381-4a70-9fb3-4af9b3bf6e48@kernel.org>
 <YGrwXwjIapZW_V-EEG8mk_JtJLxrTU5MYUD26CjvLYIgig9JU0zXq8UIpB_zxYL2Qxq_ZpHc02YfSBkVhDvJug==@protonmail.internalid>
 <4hasliun3wkook2pvfkntjlzs7elu67ine5q7nd7ptjthx5qvw@rntvb7lnajpc>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-US
In-Reply-To: <4hasliun3wkook2pvfkntjlzs7elu67ine5q7nd7ptjthx5qvw@rntvb7lnajpc>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57687-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bod@kernel.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D2BFC36223C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 30/03/2026 19:55, Dmitry Baryshkov wrote:
> This sounds like the most horrible idea: letting userspace directly
> program any registers in a way that is not visible to the kernel.

No I'm wondering if there is a way to construct the basic format in 
user-space so it doesn't need to be re-interpreted stuffed/unstuffed.

As mentioned I believe there is a defunct qcom project which did/does 
just that, not sure why that hasn't been investigated/developed.

---
bod

