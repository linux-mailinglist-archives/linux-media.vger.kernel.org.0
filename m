Return-Path: <linux-media+bounces-30905-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 351E6A9A487
	for <lists+linux-media@lfdr.de>; Thu, 24 Apr 2025 09:45:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 524BE188EA25
	for <lists+linux-media@lfdr.de>; Thu, 24 Apr 2025 07:45:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0995B1DB13E;
	Thu, 24 Apr 2025 07:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jr2doCkb"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 568B1DDC3;
	Thu, 24 Apr 2025 07:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745480589; cv=none; b=tfAmVX5YK3swk6i/UYD/m2E0LuTM78ujY5flkpFb4BhybTADL9s5d3H3xxYFGlRJtuXBYpSTBg8lbu68wCs49Zt+SueBOO4Sw2ZwIT+JU6yx112llsmpSGi8XsAl9uuSlXpyCJ9gXIGn5zlQ1yA6gMOSlY8LkbyhfQ24ER63jLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745480589; c=relaxed/simple;
	bh=19AGe4I5crT8eARVyy4tALpSA71c1A8Oh2Zbr2+77CQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UVgDrRTVLbbB9vGJsKG7MqRUpo4X48i1QG4FcCAZ74eL4BBtdYj/FnbvNcAYezBT9SH5ufSntijR1jlsjAPdI3Ar3Xnu4eHjUMfZSCefEt3ufAyxzBQp3gCXH+gmQ98iaPit/C4uzQdBmZe5thrfU7yYQX8zzFhjypazgC7QPFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Jr2doCkb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 356FCC4CEE3;
	Thu, 24 Apr 2025 07:43:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745480588;
	bh=19AGe4I5crT8eARVyy4tALpSA71c1A8Oh2Zbr2+77CQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Jr2doCkbLaSrM5VNH7akOYm+HMQGQ4vL9WOotJ5cUc2W99imoh2bY6vN0nNk3+HDx
	 Dqfq2WtvHTQVqjL47Iy6TqwI7r9M9A8amEemaavqzesdcjrU9EwI07J9P+FaELtsN9
	 C+PgyoBJNsjb21VOvrKG0ePd6t+7zkSkY1Ovfr5zKiQTdXKH/EdTo7VG1Z5lxsDiDg
	 r0twvHfx99jMVZLyhKeNmetDXV2l/QQ6oy5d/DmjxHF4U3MXpX6bCJxl334/3edA4e
	 o1VLr4dtqvFoVjMZf1AA0uKT7R/2PRpcwGKeRx0SpgPgSfdNRvBEDY+UbcVM1ntASv
	 QfEXQZL4zrbMQ==
Date: Thu, 24 Apr 2025 09:43:06 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Vikash Garodia <quic_vgarodia@quicinc.com>
Cc: Dikshita Agarwal <quic_dikshita@quicinc.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/5] dt-bindings: media: qcom,sm8550-iris: document
 QCS8300 IRIS accelerator
Message-ID: <20250424-accomplished-therapeutic-chachalaca-9820de@kuoka>
References: <20250424-qcs8300_iris-v4-0-6e66ed4f6b71@quicinc.com>
 <20250424-qcs8300_iris-v4-1-6e66ed4f6b71@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250424-qcs8300_iris-v4-1-6e66ed4f6b71@quicinc.com>

On Thu, Apr 24, 2025 at 01:03:31AM GMT, Vikash Garodia wrote:
> Document the IRIS video decoder/encoder accelerator found in the QCS8300
> platform. It belongs to same iris v3 family as that of SM8550 but is a
> downscaled version of SM8550. It has 2 frame processing hardware blocks
> while SM8550 has 4. Thereby QCS8300 have fewer capabilities than those
> of SM8550.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
> ---
> This patch depends on patch
> https://lore.kernel.org/all/20250417-topic-sm8x50-iris-v10-v7-1-f020cb1d0e98@linaro.org/
> ---
>  Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
> index f567f84bd60d439b151bb1407855ba73582c3b83..3dee25e99204169c6c80f7db4bad62775aaa59b5 100644
> --- a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
> @@ -24,6 +24,7 @@ properties:
>        - enum:
>            - qcom,sm8550-iris
>            - qcom,sm8650-iris
> +          - qcom,qcs8300-iris

Keep alphabetical order.

Best regards,
Krzysztof


