Return-Path: <linux-media+bounces-52954-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4GK7EO8alGn0/wEAu9opvQ
	(envelope-from <linux-media+bounces-52954-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 17 Feb 2026 08:38:23 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 8688A1493A0
	for <lists+linux-media@lfdr.de>; Tue, 17 Feb 2026 08:38:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 102C3300371A
	for <lists+linux-media@lfdr.de>; Tue, 17 Feb 2026 07:38:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF6AE2D641C;
	Tue, 17 Feb 2026 07:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nURBGtCV"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FC3A261B78;
	Tue, 17 Feb 2026 07:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771313897; cv=none; b=M/pOQ+4e8RpccmjwYiosTsgdQWHQnBVmgFhaJFD2WbXMguvgmYFTMJv+gid9KnBOZVTn92h4AagTtw207xq8Q1o7KIiAFzMMV54l7ad+AstsS1Pcz1UNamUFX06dg4yse3DKJE0g6L9N8QDp3u91/lY/GStz50xQHSehtziW4ck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771313897; c=relaxed/simple;
	bh=sYIw5Vc7TI8r4u9ZvnHGICD7JjEG5n8qH/M7xNUUcwA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WXdxBHp6u0fUlq/w94seb7H8cMjknx2IHv3jb9BGjYNHtt3ua84aGO8qjD1U14pwekxJyAlQUQ9wXRpBr2Di6RTYszKe9HRK5fgtzf3fxLyznU/J1Xbr4Zki9yr3xBc6GVCAvt0zL31C2oHU9wrYe8o74cGzMp8eFwL7bLx2UFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nURBGtCV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70803C4CEF7;
	Tue, 17 Feb 2026 07:38:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771313897;
	bh=sYIw5Vc7TI8r4u9ZvnHGICD7JjEG5n8qH/M7xNUUcwA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nURBGtCVkwCBropZUG13Tyz2z7ehmU9tJBtTgvheJnWJtmc6mNw8wQ0dA7cfANjpA
	 7tOw+6ofsZ/VSiKOBH/LxDKxYsFD6AcjdFM6JMEOp8MJL6V0O2XwQ37v/D3yarADy1
	 CYOjIvTdEdUwxQLsP3E+qaO4Z2n/08gSJxh2KxZG1dP91sUmBG+5rYO+ecbVTQvaKN
	 4dVvkncLxKmgViWzgzYpwVZLC3T9zatB1fTvtf6dpoBZxY9CbMZjPknlSOtNCfUhL7
	 DPBHWXd61hDTv7DV41S1cw/03kin/cYyU1qKbFHGBIDs5jtq7OHQrvCdeuz7eHb5B3
	 sJExDuhMfBOYw==
Date: Tue, 17 Feb 2026 08:38:14 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Richard Acayan <mailingradian@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>, 
	Todor Tomov <todor.too@gmail.com>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Tianshu Qiu <tian.shu.qiu@intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, Robert Mader <robert.mader@collabora.com>, 
	David Heidelberg <david@ixit.cz>, phone-devel@vger.kernel.org
Subject: Re: [PATCH v9 1/7] dt-bindings: media: qcom,sdm670-camss: Remove
 clock-lanes requirement
Message-ID: <20260217-hidden-ultramarine-teal-ca2f9a@quoll>
References: <20260217002738.133534-1-mailingradian@gmail.com>
 <20260217002738.133534-2-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260217002738.133534-2-mailingradian@gmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52954-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,linaro.org,intel.com,linux.intel.com,vger.kernel.org,collabora.com,ixit.cz];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8688A1493A0
X-Rspamd-Action: no action

On Mon, Feb 16, 2026 at 07:27:32PM -0500, Richard Acayan wrote:
> The clock-lanes property has no effect on the hardware configuration, as
> of commit 336136e197e2 ("media: dt-bindings: media: camss: Remove
> clock-lane property"). Since boards with new camss support can omit the
> property, remove it from the required lists.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---
>  Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml | 3 ---
>  1 file changed, 3 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


