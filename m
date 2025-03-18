Return-Path: <linux-media+bounces-28398-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BB9EA66EEF
	for <lists+linux-media@lfdr.de>; Tue, 18 Mar 2025 09:50:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 796973ABD1F
	for <lists+linux-media@lfdr.de>; Tue, 18 Mar 2025 08:50:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EDCC204F79;
	Tue, 18 Mar 2025 08:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S+6YJkp6"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A54691581EE;
	Tue, 18 Mar 2025 08:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742287806; cv=none; b=QHfcMxCbA6pLgSdTqk2QtiNYFM4qIH0v8zSPa0NfNgJiDqZ02nRU3/iQORpYGa0WdzSz0gwKE9w5ZYstEGllNLA2ouTJHEemDsUDIYWeyJFAM2HLcK+fBN+Ve/94EX+42kKsxQe26bdunT8S2P4MEKBadSdWU4kZCndVY309MIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742287806; c=relaxed/simple;
	bh=muVfotdBVkgMqpFob4WAELBMk0aNg3mJPn4XqjMIXXg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pCNlfzJie/J+GMCQIDKfnrreMgUFm7MnPM4IyDK4xRo5lTPelNYN4R4Fr9wKKyJmv/uJ4TtOsXIsGX7FrU1cY13u3EVlQObIGTBLjAhivTxO8RF2lLXlHbkni4QXQIW76kmBygnNEHlc4htbz/VOHiJHJ55vQKkx8B39MsKz9TY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S+6YJkp6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 449CDC4CEEF;
	Tue, 18 Mar 2025 08:50:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742287805;
	bh=muVfotdBVkgMqpFob4WAELBMk0aNg3mJPn4XqjMIXXg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S+6YJkp63UNGN2FX4jJzXrHc/yzzH+EK/cS7L+SZrLmk5BkobWYvSKOnC/WTSrSyS
	 DLinzHSFM/0dVmRiH886cbsADDTvVKQWzjb+kYOe5FSDaRXtOxAYcWVwNRfm63Gr9m
	 fucrnOpd2AaSy4kHXmAzqf/+v/ZRg8Skk17nmyjgGNrLYwQ/t0vo1g0+LWH8lU4HkK
	 gqffAH4o0B+3DO6R92ylua25PM/eLloy4/d8MMklEAsYqRF4UT3h2cN842q1YfshPB
	 LBsjC7HDZyfZRI8I5vYJ+rGG0yVPOqFnEQYv3xklQtLUkYlrK6Fva2G4YYM+U/SBmw
	 cv++zmtoKs0PA==
Date: Tue, 18 Mar 2025 09:50:01 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Tiffany Lin <tiffany.lin@mediatek.com>, 
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Yunfei Dong <yunfei.dong@mediatek.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] media: dt-bindings: mediatek,vcodec-encoder: Drop
 assigned-clock properties
Message-ID: <20250318-rebel-voracious-tuna-3a9f53@krzk-bin>
References: <20250317214621.794674-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250317214621.794674-1-robh@kernel.org>

On Mon, Mar 17, 2025 at 04:46:20PM -0500, Rob Herring (Arm) wrote:
> The assigned-clock properties are always allowed on nodes with
> 'clocks' and generally not required. Additionally the mt8183 doesn't
> define them, so they must not be required in that case.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


