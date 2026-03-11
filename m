Return-Path: <linux-media+bounces-55451-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0KCaKzr0sWl7HQAAu9opvQ
	(envelope-from <linux-media+bounces-55451-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2026 00:01:14 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D04326B08C
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2026 00:01:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0E9EC301B791
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 23:01:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EAFD39EF21;
	Wed, 11 Mar 2026 23:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TFg4LtDY"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2174397E96;
	Wed, 11 Mar 2026 23:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773270066; cv=none; b=lNIvjRlyrjl/Deo8HiAyaqf2gMp0iNeKK55bc44Xpc6i2tgJ3qdyIVSqpa2MoXkBtVTWETvXC8c55l6Jw3Bpi7L/huxSWUqQhFaWK+8vSqdBDBxFWRg9KB804LCll28fKu4I5NrSZSrvOGAO3ge5DqcC94C6qsMS8q1Gq+CvtMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773270066; c=relaxed/simple;
	bh=M43vvKeQEycI0Se6DJz0lUqaq2xuGnr0lBhb8EOl+sk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ouo55r3MCCL6roPK6Hc0ER/hTzbUK57xg7Rm97TG7O1wWJFe5cpMD/FFG+bIn6HmwInqNj0CGJSBCvicpTcjmCXdjeyI9qlYK7p+W6QiCz/icvhAEHeMjKvKxcfHPsadPjIaYMSCxkdJQC13CNzlVToEFb0OnJiClV8uVIeOyPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TFg4LtDY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25FD9C4CEF7;
	Wed, 11 Mar 2026 23:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773270066;
	bh=M43vvKeQEycI0Se6DJz0lUqaq2xuGnr0lBhb8EOl+sk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TFg4LtDY60YO3DcpIt9jlsGJRZl8kpQHrl28MfEteMjifEiNlK2ItuP6nJyPjAOIa
	 8IsWNSauYnDAXh57ABMqJwEw6UZtzN4dbupuKBv0DL9sNh+DewkqUnfQxhJpaLqbX3
	 qx3AH/mafIMqKPqhbPSJNNmkI6fkeAasKrSjtZolNhljxehwodpFSP2WvR3YmUOHBb
	 Xb3bFsr/f0d8FPDOK1S+sP3Rtkl0GvmUhWBSrmR2+cjHQvVIuX+z3TQIRlePjq4+2C
	 yDWf8leE2GPvPwQtnZ84ErtgphEYfSlH5Yt1hKSBs/dHompWid4+Ac08J4uentM3hg
	 lI3D6wZwimoAA==
Date: Wed, 11 Mar 2026 18:01:05 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Irui Wang <irui.wang@mediatek.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh+dt@kernel.org>, wenst@chromium.org,
	kyrie wu <kyrie.wu@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	nicolas.dufresne@collabora.com, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	angelogioacchino.delregno@collabora.com,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Maoguang Meng <maoguang.meng@mediatek.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Project_Global_Chrome_Upstream_Group@mediatek.com,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Longfei Wang <longfei.wang@mediatek.com>,
	Tiffany Lin <tiffany.lin@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH v5 5/6] media: dt-bindings: mediatek,vcodec-encoder: Add
 MT8196
Message-ID: <177327006458.1099258.2235399248272370761.robh@kernel.org>
References: <20260302035244.8994-1-irui.wang@mediatek.com>
 <20260302035244.8994-6-irui.wang@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260302035244.8994-6-irui.wang@mediatek.com>
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,chromium.org,mediatek.com,collabora.com,vger.kernel.org,lists.infradead.org,xs4all.nl,gmail.com];
	TAGGED_FROM(0.00)[bounces-55451-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mediatek.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4D04326B08C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Mon, 02 Mar 2026 11:52:42 +0800, Irui Wang wrote:
> Add support for MT8196 video encoder which uses VCP (Video Co-Processor)
> for firmware management. Unlike previous platforms that use SCP/VPU, MT8196
> requires VCP to load and execute the video encoding firmware, with the
> encoder communicating through VCP to perform encoding operations.
> 
> Add the "mediatek,mt8196-vcodec-enc" compatible string and introduce
> the "mediatek,vcp" property to reference the VCP device, which is
> required for MT8196 encoder operation.
> 
> Signed-off-by: Irui Wang <irui.wang@mediatek.com>
> ---
>  .../media/mediatek,vcodec-encoder.yaml        | 22 +++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


