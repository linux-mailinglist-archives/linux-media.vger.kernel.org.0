Return-Path: <linux-media+bounces-56588-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AI32HBNyvmmGPwMAu9opvQ
	(envelope-from <linux-media+bounces-56588-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 21 Mar 2026 11:25:23 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EC67A2E4B7F
	for <lists+linux-media@lfdr.de>; Sat, 21 Mar 2026 11:25:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 95419302C6DA
	for <lists+linux-media@lfdr.de>; Sat, 21 Mar 2026 10:25:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0245D3033C6;
	Sat, 21 Mar 2026 10:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kXGp0ft0"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69268284881;
	Sat, 21 Mar 2026 10:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774088708; cv=none; b=Z+Xfa2pfM6APw2hR/o+WDBncn0iuXYOpp/O3/9LlzF8TzuB+md0zANqzEWccCjbQ/VxOXStudhlcO0V6YqjZUHD1tX7hWvCsND5/lEPjQk4xR9ngKuSZ/9KlKDoOogzmwrhNtDAaKcIyCzHBHyCorw3eoPTfJ+Uy8XK5qWg5FIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774088708; c=relaxed/simple;
	bh=4c2UGREoV8Q2qiw2a01/uWpIY9FsYCc+H0oXm1WqdLc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q1A+oPL0WUpUTqYQDLumnvr3XGa1rLHcyZ+vUsrfam98ZvH1lduTKzBGDny/z6a3SylDRMZgJdZiNVgkY/fmsP/Odo2I3+R3cu23nAqEwvGobIGz+mbzhmVGJ3rfY7K88VW3EuDT9OIiD11isoKbbmRzE7JhzFL1A51WQDkk9/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kXGp0ft0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F472C19421;
	Sat, 21 Mar 2026 10:25:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774088708;
	bh=4c2UGREoV8Q2qiw2a01/uWpIY9FsYCc+H0oXm1WqdLc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kXGp0ft0xG4Tfw7xS3Zlu3s96dUizv8IXf77YcPVrfesRvlfCuOd8cDco1Szhwj7p
	 a8iitQsTj23puL0cPqDSogB8t5HO57D8E/J3KR+Y7Yc2nwCW23pBzrXkzBP1I/2fIJ
	 LAY1IqLibnEoFVdJXSwXu5q4gvh2dMrBeosUHkU8RXhYBb5JdQytDOtEJK5DsU/m+H
	 zkbw7RG1WcPNMrRbmXX3lcQSH2GLoQ6hJRLj9AHQ0fdVYUBKS4rXFSpOCtMo35azN4
	 XAiwp+FfSJUICCYyukeYHLmhGk5Ue6f1X2toWHkJyHfzOTpQHGPvGEgFErCile8y8j
	 u1l/K6aPf0vgg==
Date: Sat, 21 Mar 2026 11:25:05 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Antoine Bernard <zalnir@proton.me>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Arec Kao <arec.kao@intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"~postmarketos/upstreaming@lists.sr.ht" <~postmarketos/upstreaming@lists.sr.ht>
Subject: Re: [PATCH v2 2/3] media: dt-bindings: Add OmniVision OV13B10
Message-ID: <20260321-screeching-lovely-earwig-c0bd53@quoll>
References: <cTZxBKdzN37cy_eGcCK3hocAgzwzdfBnsqWXpJnNYFZb6Odl4FspR5333ZBJIJG5dRunnVBB3fWiRJL_pq3SmykhDKxaGPRl_T5_BShJIng=@proton.me>
 <ab2-j6tMKTAlCDcT@kekkonen.localdomain>
 <8or0YwK4oKEWSf5sBtuu8Xo6CYaQTVSu3BhkNBR_xv6se8zLgy4VVO3Q5gvuNk4UyQs_omqdqaqHhZBfLJuoaibc7A8foK9ISRweQCkInb8=@proton.me>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <8or0YwK4oKEWSf5sBtuu8Xo6CYaQTVSu3BhkNBR_xv6se8zLgy4VVO3Q5gvuNk4UyQs_omqdqaqHhZBfLJuoaibc7A8foK9ISRweQCkInb8=@proton.me>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56588-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[linux.intel.com,intel.com,kernel.org,gmail.com,vger.kernel.org,lists.sr.ht];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,bootlin.com:url,proton.me:email]
X-Rspamd-Queue-Id: EC67A2E4B7F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, Mar 21, 2026 at 04:36:09AM +0000, Antoine Bernard wrote:
> Document the device tree bindings for OmniVision OV13B10 image
> sensor.
> 
> Signed-off-by: Antoine Bernard <zalnir@proton.me>
> 
> ---

There is no 1/3 and 3/3 in this posting. There is v1 though...

Do not attach (thread) your patchsets to some other threads (unrelated
or older versions). This buries them deep in the mailbox and might
interfere with applying entire sets. See also:
https://elixir.bootlin.com/linux/v6.16-rc2/source/Documentation/process/submitting-patches.rst#L830


> v2:
> - Rename to "external clock".
> - Drop link-frequencies and remote-endpoint.
> - Set maintainer as myself.
> ---
>  .../bindings/media/i2c/ovti,ov13b10.yaml      | 94 +++++++++++++++++++

Looks exactly as ovti,ov08x40, no? Why another file is needed?

Best regards,
Krzysztof


