Return-Path: <linux-media+bounces-53664-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kPW3HAtIoWkirwQAu9opvQ
	(envelope-from <linux-media+bounces-53664-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 08:30:19 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D3F271B3E8E
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 08:30:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8F260309A13D
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 07:28:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C91DB35A385;
	Fri, 27 Feb 2026 07:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cDvgwN7j"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35761364E91;
	Fri, 27 Feb 2026 07:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772177299; cv=none; b=OzH4wGJMjJ0nkvyav8x2K0aSi9de1aZMDQuoeDxiL58BtElcQ7sAl87O6WY6omoXd/AXXYeQQml/Pk80DyMtin8Hdtb/FPOI5m+xHU7KF6oVKG485+YdRbp3EfofuZwP2bGnCNR/UCC5aLVRufmHdfpAFN5TkU5c14zVPnjm6SQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772177299; c=relaxed/simple;
	bh=JtoES17Nxln4x2/Z3ODW+0119OnP0+ui+E04/VyxiCo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fOiL9VpTGiZoBFzNjHcDKQD0YZ4HunhlOEVqMXYn73eENkOWEpXTETj9+65k3nUR2TZAnSvkJOMAt2eGPowGlD2l84OPvwi3PcYWb6c/ls1S/JbiK9wZCyaY8BGwii2AapMfCEhKn+aqgRGBIM0A3jiBvCFsfeAGuVAKM6bL+cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cDvgwN7j; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E5CDC19421;
	Fri, 27 Feb 2026 07:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772177298;
	bh=JtoES17Nxln4x2/Z3ODW+0119OnP0+ui+E04/VyxiCo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cDvgwN7jfZSzfhQQGNxoUHy/Fg8JoHmViIx7QC/nh96cXPsqRLckBbF8dnRAR91rS
	 D/XFn7SGBg12ZsjNpMZk0wqPnSjwPXxPsloGahLerWfZODqegC9tTMN/XFz929UouR
	 QxAJb47AaWbpV5RDkaC69jqc+fnK3zSq8tFIqeUm9ElPZw0LU7W/dw58Mc+NPB/epd
	 wwMfEDHlPugLoQD8RCoQPRs1WZZHlAlThF1+1KkA03V6QjADbNm2rxWE4hSwLkdq1o
	 D0MXdWUDpeA9R2qMida0aXHuaLSPgcrwm1djf3pIalLmddkYZDg/qaRIXkfRombQNJ
	 MFfUxAU3TXjYw==
Date: Fri, 27 Feb 2026 08:28:16 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, Bryan O'Donoghue <bod@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org
Subject: Re: [PATCH v9 4/7] dt-bindings: media: qcom,x1e80100-camss: Allow
 CSIPHY supplies to be optional
Message-ID: <20260227-quixotic-delectable-rhino-ea72a8@quoll>
References: <20260226-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v9-0-a59c3f037d0b@linaro.org>
 <20260226-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v9-4-a59c3f037d0b@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260226-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v9-4-a59c3f037d0b@linaro.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53664-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,baylibre.com,gmail.com,linaro.org,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D3F271B3E8E
X-Rspamd-Action: no action

On Thu, Feb 26, 2026 at 02:28:45PM +0000, Bryan O'Donoghue wrote:
> When CSIPHY devices are modelled as standalone PHY nodes the voltage
> rails are defined per-PHY. Allow the CAMSS-level supply properties
> to be omitted in this case.

So that's the same patch as adding phys. Why would adding phys and
keeping these required be a correct approach?

Best regards,
Krzysztof


