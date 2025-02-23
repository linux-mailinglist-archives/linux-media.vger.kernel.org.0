Return-Path: <linux-media+bounces-26661-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E4973A40E5E
	for <lists+linux-media@lfdr.de>; Sun, 23 Feb 2025 12:34:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 88FAC3A5FC5
	for <lists+linux-media@lfdr.de>; Sun, 23 Feb 2025 11:34:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 499C6205E0A;
	Sun, 23 Feb 2025 11:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JHc07aI/"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C158433C4;
	Sun, 23 Feb 2025 11:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740310440; cv=none; b=plVs/4qIU3YsRG7VcmtLvjKYR1Oqyf8SSHVnmwl2zY/xOaYI/H9G0Qm1wODfoSQK5TE2lzyeTGq6M7xo1AJdnGQgEzm2E4LCUCjlFRO/0pE+JnyRznYS4qhkOkV0LstaGft/dQjkZtIW9TzDewGBW9q+orokaVvJ/RCo6dB4UG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740310440; c=relaxed/simple;
	bh=r3B2XKtHika1E6YlhyAhjpbDcp+3BKHZQcf8cFHxtx8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OkATKUmCWN+UgnbOhY2t93xueMnyXv006ybOMNScDxsawvq5J677oxBcjoWgp16nPYq/jf0Y3wNmcZik9Ynk8lzgqvuhGNrKpK4KiF+gqVIFzW3Cf0Bhfbq9wtkRJJDwtp0h0VwVOhiwVao1+fUKbRctYYzwoENLn2HJrFuSwHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JHc07aI/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 561A8C4CEDD;
	Sun, 23 Feb 2025 11:33:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740310440;
	bh=r3B2XKtHika1E6YlhyAhjpbDcp+3BKHZQcf8cFHxtx8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JHc07aI/cOs6xnSiH19djvhV4PFy8CAhy91dsyHjSEuIedINzBZJA5uJeQQCKG1gR
	 jVmnPRxz/7eMTWxdy3QzZlU0lzVA4tNqxrZzheRkEovEpH6xgKR0bQS/pl4OhFOTYS
	 6gjuWpDr7SVKpmnUkQgut4i00cBfo7n33l99qStjx8ZlyeyjgBsajTsp8gt56OvM8g
	 sC6GstDJLYYGw4xXsxmRXmGCHZU07XAY9Mh04xlhz3suU5mW5lzDYN8+RXZ4+M89Xv
	 uMF16iIYIMItKra3HXlfmmIIekLSLhJDNFeE07YbDkqIu487XxgRc4xUM3WB+rJ0PX
	 hWIpJqLk9OAYg==
Date: Sun, 23 Feb 2025 12:33:56 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Vikram Sharma <quic_vikramsa@quicinc.com>
Cc: rfoss@kernel.org, todor.too@gmail.com, bryan.odonoghue@linaro.org, 
	mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	andersson@kernel.org, konradybcio@kernel.org, hverkuil-cisco@xs4all.nl, 
	cros-qcom-dts-watchers@chromium.org, catalin.marinas@arm.com, will@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/2] media: dt-bindings: Add qcom,qcs8300-camss
Message-ID: <20250223-observant-auspicious-basilisk-d78ba9@krzk-bin>
References: <20250214094747.2483058-1-quic_vikramsa@quicinc.com>
 <20250214094747.2483058-2-quic_vikramsa@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250214094747.2483058-2-quic_vikramsa@quicinc.com>

On Fri, Feb 14, 2025 at 03:17:46PM +0530, Vikram Sharma wrote:
> +properties:
> +  compatible:
> +    const: qcom,qcs8300-camss
> +
> +  reg:
> +    maxItems: 21
> +
> +  reg-names:
> +    items:
> +      - const: csid_wrapper

Why different order of entries than sm8550?

> +      - const: csid0
> +      - const: csid1
> +      - const: csid_lite0
> +      - const: csid_lite1
> +      - const: csid_lite2
> +      - const: csid_lite3
> +      - const: csid_lite4
> +      - const: csiphy0
> +      - const: csiphy1
> +      - const: csiphy2
> +      - const: tpg0
> +      - const: tpg1
> +      - const: tpg2
> +      - const: vfe0
> +      - const: vfe1
> +      - const: vfe_lite0
> +      - const: vfe_lite1
> +      - const: vfe_lite2
> +      - const: vfe_lite3
> +      - const: vfe_lite4
> +
> +  clocks:
> +    maxItems: 26
> +
> +  clock-names:
> +    items:
> +      - const: camnoc_axi
> +      - const: core_ahb
> +      - const: cpas_ahb
> +      - const: cpas_fast_ahb_clk
> +      - const: cpas_ife_lite
> +      - const: cpas_vfe0
> +      - const: cpas_vfe1
> +      - const: csid
> +      - const: csiphy0
> +      - const: csiphy0_timer
> +      - const: csiphy1
> +      - const: csiphy1_timer
> +      - const: csiphy2
> +      - const: csiphy2_timer
> +      - const: csiphy_rx
> +      - const: gcc_axi_hf
> +      - const: gcc_axi_sf
> +      - const: icp_ahb
> +      - const: vfe0
> +      - const: vfe0_fast_ahb
> +      - const: vfe1
> +      - const: vfe1_fast_ahb
> +      - const: vfe_lite
> +      - const: vfe_lite_ahb
> +      - const: vfe_lite_cphy_rx
> +      - const: vfe_lite_csid
> +
> +  interrupts:
> +    maxItems: 20
> +
> +  interrupt-names:
> +    items:
> +      - const: csid0
> +      - const: csid1
> +      - const: csid-lite0
> +      - const: csid-lite1
> +      - const: csid-lite2
> +      - const: csid-lite3
> +      - const: csid-lite4

Different naming than existing variants. Keep it consistent.

> +      - const: csiphy0
> +      - const: csiphy1
> +      - const: csiphy2
> +      - const: tpg0
> +      - const: tpg1
> +      - const: tpg2
> +      - const: vfe0
> +      - const: vfe1
> +      - const: vfe-lite0
> +      - const: vfe-lite1
> +      - const: vfe-lite2
> +      - const: vfe-lite3
> +      - const: vfe-lite4

Best regards,
Krzysztof


