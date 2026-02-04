Return-Path: <linux-media+bounces-52202-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qNBrNP5tg2kFmwMAu9opvQ
	(envelope-from <linux-media+bounces-52202-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 04 Feb 2026 17:04:14 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 46B80E9D15
	for <lists+linux-media@lfdr.de>; Wed, 04 Feb 2026 17:04:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1588130268A8
	for <lists+linux-media@lfdr.de>; Wed,  4 Feb 2026 16:01:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C037742316F;
	Wed,  4 Feb 2026 16:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JFVS7vLC"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DF802D5950;
	Wed,  4 Feb 2026 16:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770220905; cv=none; b=omRQnojKDxPm4+wXacjdPMmV8dRoOz190OHUVV89v5tDppb+dyFjZHYAs0ooUOBtEPA+EJj+2qaKPv5RQQPn6siA4jg5g7T6K8gutEsfgsKlIVOjGhg/vigECO7IgQuTP+AYrEK3xZeNJKECoQQNLm9ZLMrTFMkhbnl/yEICzSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770220905; c=relaxed/simple;
	bh=QJ5pDaQD2KX//M2ocucFLrlEQ7KHC4f85/La5AN4f0A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IrSjuzr1IeVP7MqKD1kaLHH7I8Q1t5Ew9fiCDrc2xwhvZ2K7EvmmXrd3V3YjO7mYReH4eNkrxl8zFmILu0BVtW0cciYW+Ogf8SmWFXxUGl/PoebKLRqngDb8l7DooLDJEq1Mf5BesBTfbCde72zg8wJDmRf4zBZlwn9F80cDZM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JFVS7vLC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A428C4CEF7;
	Wed,  4 Feb 2026 16:01:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770220904;
	bh=QJ5pDaQD2KX//M2ocucFLrlEQ7KHC4f85/La5AN4f0A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JFVS7vLCleEkoxejTw0R2Lj+Kd53mkrYUYRiYpnqcEb6td0V43kps77g8IeDHEp2V
	 UPxEurqGbRyJHKZ7tBaJ4381T8Cmp1UdH63XIFXT7Q2KsSJAKKYvwNUy0QB5kxWlMp
	 VODWhBkWS8OMco6Mzpco4HZzqNpvC+feLKJDjvL6LJ2w2WV2DndVkXnTHTo1pLUE1c
	 ZPKKaOhQ8Z2sm9CT8Bb7V8oOHK7hyCKVNwHV9PyGTQJuisv0/uqFmrs+EsP13Ynb3B
	 3XV7ByGorK5pyQw3ZfsBW/ewMDtkXwybnlxoBsJxJpG/TvsIYe0f9si7BQdtsIRaRR
	 CqUzIsCwO1LOQ==
Date: Wed, 4 Feb 2026 17:01:41 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Robert Foss <rfoss@kernel.org>, 
	Todor Tomov <todor.too@gmail.com>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 2/5] dt-bindings: i2c: qcom-cci: Document sm6150
 compatible
Message-ID: <aYNtLbUel_oWUHfh@zenone.zhora.eu>
References: <20260122-sm6150_evk-v5-0-039b170450a3@oss.qualcomm.com>
 <20260122-sm6150_evk-v5-2-039b170450a3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260122-sm6150_evk-v5-2-039b170450a3@oss.qualcomm.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52202-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,gmail.com,linaro.org,pengutronix.de,vger.kernel.org,lists.linux.dev,lists.infradead.org];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andi.shyti@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[zenone.zhora.eu:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,linaro.org:email]
X-Rspamd-Queue-Id: 46B80E9D15
X-Rspamd-Action: no action

Hi Wenmeng,

On Thu, Jan 22, 2026 at 06:48:53PM +0800, Wenmeng Liu wrote:
> Add the sm6150 CCI device string compatible.
> 
> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>

Acked-by: Andi Shyti <andi.shyti@kernel.org>

Thanks,
Andi

