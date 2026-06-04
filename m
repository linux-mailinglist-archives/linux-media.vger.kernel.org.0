Return-Path: <linux-media+bounces-63849-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id JE9fEDYNImrERwEAu9opvQ
	(envelope-from <linux-media+bounces-63849-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 05 Jun 2026 01:41:42 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 947C2643FA0
	for <lists+linux-media@lfdr.de>; Fri, 05 Jun 2026 01:41:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=THm9wCWq;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63849-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-63849-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 10A5930477F7
	for <lists+linux-media@lfdr.de>; Thu,  4 Jun 2026 23:39:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A13F937BE70;
	Thu,  4 Jun 2026 23:39:40 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 374EC28DB54;
	Thu,  4 Jun 2026 23:39:38 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780616380; cv=none; b=rCewKRXHe5PEAeKVm42hRbbvxZtf+QDXIliBt1++GrnFVzm/PvvngYSL6DvfyYzDJR+UEId54dq1oyjTZ1K01N+I/bzEEn+HbdIDPp8jJkfGQ88JYFG8DlEbbcHprkrRuiUQfSHtV+bLhDcVbQtZXuD6Ar45fi+4IBJhgin5ZBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780616380; c=relaxed/simple;
	bh=YCqsF/al6+5Ci+dfHVoXboKVX0K6TkEaBEdZCJ/62So=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HKSwXBfIn8ecl71G8GggquBlFNfqKOrfYerDdZHIrNSMvGeYbH7PiLgyqQBk/bG1DhatXdgJndV4s/4QrjtvcrVkhtlO/F981iNGS61ttjOtmiaLEy+sasVd/wUKuAtSPvxrhWI+Q/tzK7WIZIAa+9gSyJaIpNuuepfjRhb2Ir4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=THm9wCWq; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E82C1F00893;
	Thu,  4 Jun 2026 23:39:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780616378;
	bh=WAuad6/MhQeUeophKKyTVk7SPCKkPoGUex3aya7+4zU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=THm9wCWq55chLTiGhQ/4UHKF1OzrvksZl1fpixgDRMMY090CkkRLiM6Y+cU6T+rFd
	 6ldFSXLG+BfqNFk+J1V6iS0BZRBQoj2ZAR8olq69eUIqFbVwADdZd7Hc7+5yojRPI9
	 4pNyFrw9sYoxBEqvdGf/KjVSfjoecwX5Viqj0He/95JdqV2zRtlYnY1W2rDoagVoIy
	 /0OdA+ZlLGy3Fknf0MUITwFpMdPo9qwHLLU+C/3PhUZ7Z0IgnbesnLfH/M1R6Z6pkd
	 OI85AjGdvhiK8ezgRA8C+eWkz35ULmRZUgCLfsC+P+lvM6GopvWaQ+VJDlUZG9SCPo
	 eI+FGPFo2vVBg==
Date: Fri, 5 Jun 2026 01:39:35 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Vikram Sharma <vikram.sharma@oss.qualcomm.com>, 
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
	Loic Poulain <loic.poulain@oss.qualcomm.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>, 
	Robert Foss <rfoss@kernel.org>, linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, 
	Suresh Vankadara <svankada@qti.qualcomm.com>, Prashant Shrotriya <pshrotri@qti.qualcomm.com>
Subject: Re: [PATCH 2/6] dt-bindings: i2c: qcom-cci: Document Glymur
 compatible
Message-ID: <aiIMg7MuoM_vg6Da@zenone.zhora.eu>
References: <20260529-glymur_camss-v1-0-bee535396d22@oss.qualcomm.com>
 <20260529-glymur_camss-v1-2-bee535396d22@oss.qualcomm.com>
 <ahrvlYI-WfHwUPMC@shikoro>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ahrvlYI-WfHwUPMC@shikoro>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-63849-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[andi.shyti@kernel.org,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:wsa+renesas@sang-engineering.com,m:vikram.sharma@oss.qualcomm.com,m:bryan.odonoghue@linaro.org,m:vladimir.zapolskiy@linaro.org,m:loic.poulain@oss.qualcomm.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:nihal.gupta@oss.qualcomm.com,m:rfoss@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-i2c@vger.kernel.org,m:svankada@qti.qualcomm.com,m:pshrotri@qti.qualcomm.com,m:wsa@sang-engineering.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andi.shyti@kernel.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 947C2643FA0

On Sat, May 30, 2026 at 04:09:25PM +0200, Wolfram Sang wrote:
> On Fri, May 29, 2026 at 08:07:22PM +0530, Vikram Sharma wrote:
> > From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
> > 
> > Add Glymur compatible consistent with CAMSS CCI interfaces.
> > 
> > Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
> > Signed-off-by: Vikram Sharma <vikram.sharma@oss.qualcomm.com>
> 
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

I will wait for the other patches from the series to be in a
better shape before taking this one.

Andi

