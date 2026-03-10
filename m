Return-Path: <linux-media+bounces-55074-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CKCAJ/Dmr2nkdAIAu9opvQ
	(envelope-from <linux-media+bounces-55074-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 10:40:00 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 22ACC248A88
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 10:40:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F2E773019FE3
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 09:36:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62BE643DA5F;
	Tue, 10 Mar 2026 09:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e2kih3/3"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6F59293C42;
	Tue, 10 Mar 2026 09:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773135358; cv=none; b=Eflu9RK41PePruHcZLrRr0RPVscBXZjZB+wdAaBJ/Cpb9VyTYOtkp97E7YH7RGL4hzh8E8mFD5+MVn3rLgYUhZ2mFXkegh63q4paasPy3SXj4nOna0kis0xeNiv0Pkvt4LKvxTpPv/SeFEZqeup87BvPXcOTPbVNB/QWH9fWQMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773135358; c=relaxed/simple;
	bh=7QCz9nUtKsZxj3nUPeeP7oa/q7PRlMTBw7CpO+pfeNM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uIRovStT+ZswgRTu9YTF/N9KWe7Zym2Xu09Lt2JXDP56q2rtMeBFkRLKxmxg8hT5/LBzSUxsQynYUySNZotsC7LQ0PplDh64zqtkOMj78OB8P/Ejv5eVLnndj/VaJ1Sp5kqiOZ/2mD4ANVNLmqgCAsitA2fPkGqaOeNGmPhyUzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e2kih3/3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D472CC2BC86;
	Tue, 10 Mar 2026 09:35:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773135358;
	bh=7QCz9nUtKsZxj3nUPeeP7oa/q7PRlMTBw7CpO+pfeNM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=e2kih3/3WNxUiI/7dG4kfxK1Ea6LTFAFx35iblaee7d5kT9zi2z5I6RgPr9/2Talz
	 EAkHBwYPFrZ9a/3dmKhxfsnaYihYjjMM6IpM4W5nvQamL82ZaYugPA03zPFfyFdXw4
	 flpJF0r+KQA5TeFgCzYf9df3jo7yCtMtbYu+FwKTtIzXFR+1XnwfERFisaoVVqb2PG
	 Ha3S4060ezUiq06TnZC1PiIfz60PvclwFMYxU1UELsTGt5nzNSP1JW+7Moh8z0smoD
	 I65g4IJQbyWOW2u3Jd7MCmUe6LIhysqH0uQK05oWUJmn3uLfeTg9CD55hrkKpx4Wqc
	 E1GZ06mYiuccg==
Date: Tue, 10 Mar 2026 10:35:56 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alexander Koskovich <akoskovich@pm.me>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] media: dt-bindings: ovti,ov8856: Allow
 orientation & rotation props
Message-ID: <20260310-imaginary-termite-of-foundation-b6e9d6@quoll>
References: <20260310-ov8856-v4l2-props-v2-0-2717404ed045@pm.me>
 <20260310-ov8856-v4l2-props-v2-1-2717404ed045@pm.me>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260310-ov8856-v4l2-props-v2-1-2717404ed045@pm.me>
X-Rspamd-Queue-Id: 22ACC248A88
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-55074-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,pm.me:email]
X-Rspamd-Action: no action

On Tue, Mar 10, 2026 at 04:21:31AM +0000, Alexander Koskovich wrote:
> Allow the orientation and rotation properties from video-interface-devices
> to be specified. The sensor can be front or rear facing and can be mounted
> at any rotation.
> 
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> ---
>  Documentation/devicetree/bindings/media/i2c/ovti,ov8856.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov8856.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov8856.yaml
> index fa71f24823f2..24d4161a293b 100644
> --- a/Documentation/devicetree/bindings/media/i2c/ovti,ov8856.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov8856.yaml
> @@ -18,6 +18,9 @@ description: |-
>    through I2C and two-wire SCCB. The sensor output is available via CSI-2
>    serial data output (up to 4-lane).
>  
> +allOf:
> +  - $ref: /schemas/media/video-interface-devices.yaml#
> +
>  properties:
>    compatible:
>      const: ovti,ov8856
> @@ -57,6 +60,10 @@ properties:
>        This corresponds to the hardware pin XSHUTDOWN which is physically
>        active low.

I was fine with previous patch if my assumptions stated there were correct.

>  
> +  orientation: true
> +

if there is going to be new version, then drop blank line here.

> +  rotation: true
> +

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


