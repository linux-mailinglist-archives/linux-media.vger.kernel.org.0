Return-Path: <linux-media+bounces-22138-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 827E19DA46B
	for <lists+linux-media@lfdr.de>; Wed, 27 Nov 2024 10:04:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 31413166406
	for <lists+linux-media@lfdr.de>; Wed, 27 Nov 2024 09:04:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A0F9191F79;
	Wed, 27 Nov 2024 09:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="peH6d27q"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98E6F18E361;
	Wed, 27 Nov 2024 09:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732698237; cv=none; b=SuYqfhfyyn1ks22jb8BZYZhiRd5PrgIPQElhXW584rp7CmaDCrHzZl5MPgd6VFnPo228VxLLzY2nxRYcJcBDvReEEx6Gt0dA/Se5ggJQRd3l/0blTsw07rrtCfngQHH9QiA5ENeKK/PFvIm/9lG7T5xDYKvZU/w53u1l66h7Upo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732698237; c=relaxed/simple;
	bh=YjjhfKSA7UaKlVXmNfz/frkT2tjQet6crPqv7kAjLM0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J1o++PbmTmQiGRX5Xezp/gkjiIETzqUQT/cNhOHXA3JDURyUA8n8pu8/oinwvrLq/54n83QL9w//Ra+Eizf0iUPqjvorwCJRTB2SY2AES2FM1xubM/guH5A8Ejaf5cJ2ooYS8jYzamDPIxh7ZQ3k1gcux0TahHbTHAYyldTHIIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=peH6d27q; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA7F5C4CECC;
	Wed, 27 Nov 2024 09:03:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732698237;
	bh=YjjhfKSA7UaKlVXmNfz/frkT2tjQet6crPqv7kAjLM0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=peH6d27qO6z7GHzOyjoIQvVWjsJA5XydS7PvItstOfKUq/c6KwGKM5a9UNxPhlws5
	 tsZgcD41KYWOFI/mc114XMzs0IAs9bx4MbiyLTpxGykCe9Y34MV+pH+AWVI9YNTgfq
	 DOQGINExDgkCxNzsVCa+yOLQ1Pgu9m7l3q7xCeZ8TMtval1p3/CG2h6wzn88WoLi/m
	 mUv2mpxI1j1rpjGMjN4bhqhid31zHXKvl+8uLYkpoSqd2bJu3X3nRpC1tEEvd2lRq+
	 YHHfhFOx2yfPa9ASD4/MTi1qFF2pyGiFMNPxIiEdoojl2yy2fJhLKDUfb49DZ9P/Bl
	 RBGh76olt4+LQ==
Date: Wed, 27 Nov 2024 10:03:54 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
	Vikash Garodia <quic_vgarodia@quicinc.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, quic_renjiang@quicinc.com, quic_vnagar@quicinc.com, 
	quic_dikshita@quicinc.com, konradybcio@kernel.org, linux-media@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Stanimir Varbanov <stanimir.varbanov@linaro.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH 3/3] media: dt-bindings: qcom-venus: Deprecate
 video-decoder and video-encoder where applicable
Message-ID: <rlicw76pztgy5subc5lzy7hx45y6kb4erkanixx6qc366b2ucp@oncjni3qdqt6>
References: <20241127-media-staging-24-11-25-rb3-hw-compat-string-v1-0-99c16f266b46@linaro.org>
 <20241127-media-staging-24-11-25-rb3-hw-compat-string-v1-3-99c16f266b46@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241127-media-staging-24-11-25-rb3-hw-compat-string-v1-3-99c16f266b46@linaro.org>

On Wed, Nov 27, 2024 at 01:34:06AM +0000, Bryan O'Donoghue wrote:
> For the list of yaml files here the video-decoder and video-encoder nodes
> provide nothing more than configuration input for the driver. These entries
> do not in fact impart hardware specific data and should be deprecated.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---

Thanks for doing this.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


