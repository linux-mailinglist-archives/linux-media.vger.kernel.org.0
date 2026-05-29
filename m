Return-Path: <linux-media+bounces-63076-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cLK3NOwZGmo+1ggAu9opvQ
	(envelope-from <linux-media+bounces-63076-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 30 May 2026 00:57:48 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 72026609899
	for <lists+linux-media@lfdr.de>; Sat, 30 May 2026 00:57:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A72123030366
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 22:57:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F36F73BC668;
	Fri, 29 May 2026 22:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MTfZDkmd"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DFCD1AC45D;
	Fri, 29 May 2026 22:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780095465; cv=none; b=ARQ7OYqR7DHTTlcRB3vSPO9NthqnahNQcIqt/lZt9//BDcKybtksOOex/J7SCu1ld2YlMpN7/HvgIlKTJ3l1Z3R/d/YaykVzqX3wYKFJ0BRYC2xm4+fwFyWxMaETHr7PmgqyLH1rwYIbzVL9sW9gpI4NXBZwGvsOgnq0pIYxtLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780095465; c=relaxed/simple;
	bh=qHtiwpZ+hr3LQA/M8vOQeknAplJllI+oQpfScdkdaC0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l8A8Tim482YGAtWEuDqP3tNw786O6rqsfema22ylEX6P2WPF7LMnOqldnuBX67ujcLAINtVzZGqFIvUoH5CMPeu/FVo14S/4YrFu4PehQlUY0I27moJUZwKhZnBpgR5drDCwOiZBciTe9GUpBT0A7NTo3V21Ul6dB21t129Sh+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MTfZDkmd; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 774D91F00893;
	Fri, 29 May 2026 22:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780095464;
	bh=qHtiwpZ+hr3LQA/M8vOQeknAplJllI+oQpfScdkdaC0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=MTfZDkmdKifsvJxS5issxaPsSpVdp3atWttJuQnh042nP/CAAxDPs3AXYF5CXQZM7
	 GXnWIfnLV4oloyJK2Y+f86OdMUOackqzoQL5ogAGfanY2/It1c65Bm7mqS3b6/uwjx
	 kRA3bFPJ7vHRBg+VvL05VeR/pYNky/n4evRZFGH89b1yBFVvn7BFw71fJrSOyHzkPX
	 sCaTe+eE6brH4k40UNjqzwCenhZyrO5McjZRh64s9WejW63BejWSjGvMy6TC6xTptb
	 X6Q1LValvWGpKM5GI5N+lS+QR2MoSLeb6pn4UPvoyLelgFeYWKyEoC6eJX+icoQJat
	 Mr6g6cZx3vWPQ==
Message-ID: <73364628-5345-4c6d-ab18-7aee6c5b579d@kernel.org>
Date: Fri, 29 May 2026 23:57:35 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/8] arm64: dts: qcom: shikra-cqm-evk-imx577-camera: Add
 DT overlay
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, linux-arm-msm@vger.kernel.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 Suresh Vankadara <quic_svankada@quicinc.com>,
 Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20260526-shikra-camss-review-v1-0-645d2c8c75a7@qti.qualcomm.com>
 <20260526-shikra-camss-review-v1-7-645d2c8c75a7@qti.qualcomm.com>
 <178000731452.4557.8537369407478321842.b4-reply@b4>
 <oiPZ6ZMRghpGaIEC7KqUDt7QZQT8w5gq0OMZzopCPkcqKOBXXVrP7-t6ZL4LY4ErAN_z1Z4tCdqn7xbxE5EE7w==@protonmail.internalid>
 <bc2aecf3-fedd-4b15-8e69-33ca928831d6@oss.qualcomm.com>
Content-Language: en-US
From: Bryan O'Donoghue <bod@kernel.org>
In-Reply-To: <bc2aecf3-fedd-4b15-8e69-33ca928831d6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[linaro.org,oss.qualcomm.com,kernel.org,nxp.com,pengutronix.de,gmail.com,vger.kernel.org,lists.linux.dev,lists.infradead.org,quicinc.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-63076-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bod@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCPT_COUNT_TWELVE(0.00)[25];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 72026609899
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 29/05/2026 18:30, Nihal Kumar Gupta wrote:
> Happy to rename to shikra-cqm-cqs-evk-imx577-camera if that makes the
> shared scope clearer - open to suggestions.

That would sufficiently pick the nit for me.

---
bod

