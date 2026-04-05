Return-Path: <linux-media+bounces-58078-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eO0HEFLU0mm7bQcAu9opvQ
	(envelope-from <linux-media+bounces-58078-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 05 Apr 2026 23:29:54 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E89E839FDD8
	for <lists+linux-media@lfdr.de>; Sun, 05 Apr 2026 23:29:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 28465300A7E3
	for <lists+linux-media@lfdr.de>; Sun,  5 Apr 2026 21:29:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37096383C6C;
	Sun,  5 Apr 2026 21:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CFcRW3Oz"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A8AA1DED40;
	Sun,  5 Apr 2026 21:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775424580; cv=none; b=prW6dthydNEtwSGLy3m7YpWxFpyWEyX+nGH7TwSKK0ql7yMfeYueiIPSXkvPypGmfUBSIOfPSM9CvILgtpPwxGlDAKUF7rxI1Qy0DgVPqq1VEIQcGjfwKa2DXF7M35N5PmIK1EJ0IwzxKQbtrjnSLrUgOmnt8lOGHDKxN+cZkcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775424580; c=relaxed/simple;
	bh=dXS+FxVq4LEDJe2HdwsZRG/n6zVumhKsjswpD80SDYI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QvuNXthMrWHU+iAapyioT/xIl7NzYjBTzc+458cyf4J2Q5plZTVuA0+Fg+JOQ9EwxtLRXkJ+zb1W3D/8QynbQ4+Mve6uh291AUyQWCxBo+bX0e7/MryFuJKtrObwgtML9H4HGydHWo12B0MfkVJGYqRFfXGXwTInw9TfL568jwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CFcRW3Oz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 842FFC116C6;
	Sun,  5 Apr 2026 21:29:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775424580;
	bh=dXS+FxVq4LEDJe2HdwsZRG/n6zVumhKsjswpD80SDYI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=CFcRW3OzyCZSgsAI1ltCYmjXiLFSGvw78h3AbwATNn+RCFdXjBC7MHJWhX3wqgtdA
	 Gd6564oMCqKTZJQueKZyr40MvlHHCy16ss9pvizJAEgjWLU4w46fXW4YRVW3NS3CZ8
	 +Ipnw4TmagFK1rxLNR5VzyepLc1TZSGthe+owM8ZR6aS7LPGNXKHAvqv/rK8LUtGl8
	 eG7zxFqHue5khgWGgI9XTU3hHGDGLmVkYpVbiXSC7EbqR6P+1mEHgXW8blWwaR8H+z
	 46iFwbEcnqm89JnTD9Vcj7nalN3fWefzkDtba6C+2FiEW0HdpIePsVfNLYlD76ZnLa
	 YYDuhajrWhDzg==
Message-ID: <bf820340-4831-44c5-97e7-fb738dca6325@kernel.org>
Date: Sun, 5 Apr 2026 22:29:35 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/3] media: qcom: camss: CAMSS Offline Processing
 Engine support
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>,
 vladimir.zapolskiy@linaro.org, kieran.bingham@ideasonboard.com,
 robh@kernel.org, krzk+dt@kernel.org, andersson@kernel.org,
 konradybcio@kernel.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, johannes.goede@oss.qualcomm.com,
 mchehab@kernel.org
References: <xy6TKmdveRx4cMshSHEUGZ7s3lbsurWcsc2vq05A7_N4bCialR7EelZitouugtZDkpFCAghjqY4NDdSQEIPprw==@protonmail.internalid>
 <20260323125824.211615-1-loic.poulain@oss.qualcomm.com>
 <055a7281-3e41-4e26-a8c8-5e28d69c0685@kernel.org>
 <CAFEp6-2NniQquVrw_V8P_cyUayMMY0SPC8hgczjB3ef5zx7e5A@mail.gmail.com>
 <j1jExQP2GCnHhjXkyuhDn_d0CP50oZDMyso3CFfkygb7Ww_9Z3L93P8Px0KjTQAqU5jzr2I41V1_2ZdQOQqfxA==@protonmail.internalid>
 <20260405194851.GA3972481@killaraus.ideasonboard.com>
 <d5bb1f75-f55f-43e6-8160-bacc4088b0a2@kernel.org>
 <zZSYnBEVwbsoC3zAxYw3b-FDBES5SVplE8_8v55ro9lhsRrCnB3xietqoJ41CLDv5iHdFFvfWF7ZgO1QFjrQiQ==@protonmail.internalid>
 <20260405204722.GF1213462@killaraus.ideasonboard.com>
Content-Language: en-US
From: Bryan O'Donoghue <bod@kernel.org>
In-Reply-To: <20260405204722.GF1213462@killaraus.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-58078-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bod@kernel.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: E89E839FDD8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 05/04/2026 21:47, Laurent Pinchart wrote:
> Temporal denoising can also be more tricky in an inline ISP.

Funny you should mention that, to my knowledge, this is the only 
functional thing BPS/IPE has that IFE/PIX does not.

---
bod

