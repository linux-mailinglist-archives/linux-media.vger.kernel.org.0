Return-Path: <linux-media+bounces-55521-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2GlQDmb5smmLRAAAu9opvQ
	(envelope-from <linux-media+bounces-55521-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2026 18:35:34 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EAA72769AA
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2026 18:35:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E0094309BEA4
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2026 17:34:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A346E3FD144;
	Thu, 12 Mar 2026 17:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="Z+0B417l"
X-Original-To: linux-media@vger.kernel.org
Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2BDE3F87E4;
	Thu, 12 Mar 2026 17:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773336875; cv=none; b=FBdfW8/jWo2bPVmu3mvxVbTcQ59YP6+KaYaOmMqZP1CHYrqtTxV+Z0lVCWLly5hk8CX3u6SeWJewFiWadyp7Ja+6waVmqfvF39JfGZf9tY3/cq5rvLDprqpsRMOqJitihImfDDrvK8Yg64uYrqtIT04tLmwu+Ct4bNUWQujd4V8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773336875; c=relaxed/simple;
	bh=VGtXHilX3UlaPfPfilvV8r1wHZFmWNithjQkgVtRITw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LMCVdYMz8Y1YwfwFhMOMg2Bib/xMAekzEkoBWkbrJU1Cr+V6PNJTwda5WwqALO8Yxn8+blR3giGbt8rafNgeTzYOq7rIr+Gl7bgApVWP15u9+/zRE49GeV2URZ6CAdpPW/orr4WLSmplnY+RmuGgpr965AwLSsN606HA2F0eLBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=Z+0B417l; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 5909322831;
	Thu, 12 Mar 2026 18:34:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1773336863;
	bh=fmtlnhSTjgOoQaF3XdzpaQYVg6I7U+e/byYCHILShjg=; h=From:To:Subject;
	b=Z+0B417l9p71c9g2467dWy9UgcuD70ES35DaANtN0imwURTZU/GPr25LH+b5eQ6ym
	 0hVsZhSnAJUU+RVHvGSUx+CMOWrr9b2F4DVMWTVphdX0DP/GRwUn61FTHAp9jUl6tC
	 oCNGIxNG1N0CODjGoX0qFYW4Q+SeYau8/Ta3jzwoE9eiOyI0Ggn54oBoF9nA2/5qCQ
	 zyNIj16+riOjZYIm70/XvM2xZAF6ZIW67O49FwbCDgCphk2melEEoB9awSAIKjGRIM
	 yMc9HpZiPhvaMcw5R9TguGnDUDO2I3fUxmwPrQil1l7fnVLrsiN7+2OySDqguMHfTM
	 zACt1/KiYryLg==
Date: Thu, 12 Mar 2026 18:34:18 +0100
From: Francesco Dolcini <francesco@dolcini.it>
To: ming.qian@oss.nxp.com
Cc: linux-media@vger.kernel.org, mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl, nicolas@ndufresne.ca,
	benjamin.gaignard@collabora.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de,
	sebastian.fricke@collabora.com, shawnguo@kernel.org,
	ulf.hansson@linaro.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com, m.felsch@pengutronix.de,
	fra.schnyder@gmail.com, linux-imx@nxp.com, l.stach@pengutronix.de,
	Frank.li@nxp.com, peng.fan@nxp.com, eagle.zhou@nxp.com,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, regressions@lists.linux.dev
Subject: Re: [PATCH v4] media: verisilicon: Fix kernel panic due to
 __initconst misuse
Message-ID: <20260312173349.GA137045@francesco-nb>
References: <20260306031059.801-1-ming.qian@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260306031059.801-1-ming.qian@oss.nxp.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[dolcini.it,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[dolcini.it:s=default];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-55521-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,xs4all.nl,ndufresne.ca,collabora.com,pengutronix.de,linaro.org,gmail.com,nxp.com,lists.linux.dev,lists.infradead.org];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[francesco@dolcini.it,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[dolcini.it:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCPT_COUNT_TWELVE(0.00)[29];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dolcini.it:dkim,pengutronix.de:email,nxp.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,toradex.com:email]
X-Rspamd-Queue-Id: 8EAA72769AA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello,

On Fri, Mar 06, 2026 at 11:10:57AM +0800, ming.qian@oss.nxp.com wrote:
> From: Ming Qian <ming.qian@oss.nxp.com>
> 
> Fix a kernel panic when probing the driver as a module:
> 
>   Unable to handle kernel paging request at virtual address
>   ffffd9c18eb05000
>   of_find_matching_node_and_match+0x5c/0x1a0
>   hantro_probe+0x2f4/0x7d0 [hantro_vpu]
> 
> The imx8mq_vpu_shared_resources array is referenced by variant
> structures through their shared_devices field. When built as a
> module, __initconst causes this data to be freed after module
> init, but it's later accessed during probe, causing a page fault.
> 
> The imx8mq_vpu_shared_resources is referenced from non-init code,
> so keeping __initconst or __initconst_or_module here is wrong.
> 
> Drop the __initconst annotation and let it live in the normal .rodata
> section.
> 
> A bug of __initconst called from regular non-init probe code
> leading to bugs during probe deferrals or during unbind-bind cycles.
> 
> Reported-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Closes: https://lore.kernel.org/all/68ef934f-baa0-4bf6-93d8-834bbc441e66@kernel.org/
> Reported-by: Franz Schnyder <franz.schnyder@toradex.com>
> Closes: https://lore.kernel.org/all/n3qmcb62tepxltoskpf7ws6yiirc2so62ia23b42rj3wlmpl67@rvkbuirx7kkp/
> Fixes: e0203ddf9af7 ("media: verisilicon: Avoid G2 bus error while decoding H.264 and HEVC")
> Suggested-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Suggested-by: Marco Felsch <m.felsch@pengutronix.de>
> Reviewed-by: Marco Felsch <m.felsch@pengutronix.de>
> Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>

What's the plan to merge this? It fixes a quite severe regression,
a boot failure.

#regzbot introduced: e0203ddf9af7

Thanks,
Francesco


