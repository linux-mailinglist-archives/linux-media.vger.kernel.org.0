Return-Path: <linux-media+bounces-51269-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uGgzKenrcGk+awAAu9opvQ
	(envelope-from <linux-media+bounces-51269-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 16:08:25 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C82E58F54
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 16:08:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 8E821A62C91
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 14:11:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A254649252D;
	Wed, 21 Jan 2026 14:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q3HU9LTo"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F109649250E;
	Wed, 21 Jan 2026 14:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769004051; cv=none; b=fs8STA88FsIEEWPY3ccKUtXIv2dWWxLlrGTM95x5hsoK9HmLFpMGQqLsGU7V9NyzsGilmo4WdBj+Al808Sw7oIPXpU/rEdxP8uofFkvIe95TN0q2fraJLfUe8eJlq30sur458hUubtpzlQI6yjU33JMnxzxrGBY9aY461DIbxw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769004051; c=relaxed/simple;
	bh=4Y/dQQ9O27GubkCYAbiRqBKVCm96wWR3GWTuiKkCsSg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LnmlpowaWK39t1i3GdBsarky34ZtJm5+U19IR6bxE0ZVyLE4rl3BXbjWOA6AH48AiuZKC4+ycK/LvaJ7zfdtrS9IfS6UYqyd0IJC3YLiRZJqZgRAxPlf1zBdtbFZ6wCbay8QrOQQINoP2pZhZLRWtCtsjAlv8Uu46OlsTc6L9mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q3HU9LTo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0E25C4CEF1;
	Wed, 21 Jan 2026 14:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769004050;
	bh=4Y/dQQ9O27GubkCYAbiRqBKVCm96wWR3GWTuiKkCsSg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q3HU9LToG7OTdOJVNoG+A6HKVbEU/Y3S8H2JdtIh9/s5FaNvTbXJcQ0LKFMJynsNA
	 TTnbw5C9CiFYzqqHNx5aZ9fk5p3p3JyOBOOAziWBaqMJhJ3Kc4uOyNJuKYiNDJSH9k
	 OEkmJi+wEGhwSJkUB8DKbyYBpduRSVz1ILc5EUzMhYDtW5oRaPhRKC/ftnQWBibe7n
	 8SUybz+Ui2WLmB7nt6YEEeRgQJogsQVD6+3zMAkksDDz6vG5Qfp/7cE9vM8pwiCJ+I
	 5ni7CiR41EdgpiWJuE8MK/DcyhbeQWhkPfrJRD8CYaKNW4puYKVSNM7P0QAMfsshRs
	 gOMFOtDw9GMzg==
Date: Wed, 21 Jan 2026 08:00:46 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
Cc: bryan.odonoghue@linaro.org, mchehab@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org, 
	hverkuil-cisco@xs4all.nl, cros-qcom-dts-watchers@chromium.org, catalin.marinas@arm.com, 
	will@kernel.org, linux-arm-kernel@lists.infradead.org, quic_svankada@quicinc.com, 
	linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Subject: Re: [PATCH v8 1/5] dt-bindings: i2c: qcom-cci: Document qcs8300
 compatible
Message-ID: <wfkjfoaqgn7lyhtiojodjcaxyzsi75zszoxpd3o47p5i6l2eb7@gxmozuc2wh47>
References: <20251222095914.1995041-1-quic_nihalkum@quicinc.com>
 <20251222095914.1995041-2-quic_nihalkum@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251222095914.1995041-2-quic_nihalkum@quicinc.com>
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-51269-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_CC(0.00)[linaro.org,kernel.org,xs4all.nl,chromium.org,arm.com,lists.infradead.org,quicinc.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-media@vger.kernel.org];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo,quicinc.com:email]
X-Rspamd-Queue-Id: 2C82E58F54
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Dec 22, 2025 at 03:29:10PM +0530, Nihal Kumar Gupta wrote:
> The three instances of CCI found on the QCS8300 are functionally the same
> as on a number of existing Qualcomm SoCs.
> 
> Introduce a new SoC-specific compatible string "qcom,qcs8300-cci" with a
> common fallback.
> 
> Signed-off-by: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

Maybe I'm not seeing it, but you didn't include either i2c maintainers
or the linux-i2c mailing list, so this is unlikely to move anywhere.

Please send this out again with the recipients that get_maintainers tell
you do include. (and skip the ones that aren't relevant).

And please adopt b4 (go/upstream tells you how) to avoid such (human)
mistakes going forward.

Thanks,
Bjorn

> ---
>  Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> index a3fe1eea6aec..399a09409e07 100644
> --- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> +++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> @@ -28,6 +28,7 @@ properties:
>            - enum:
>                - qcom,kaanapali-cci
>                - qcom,qcm2290-cci
> +              - qcom,qcs8300-cci
>                - qcom,sa8775p-cci
>                - qcom,sc7280-cci
>                - qcom,sc8280xp-cci
> @@ -133,6 +134,7 @@ allOf:
>              enum:
>                - qcom,kaanapali-cci
>                - qcom,qcm2290-cci
> +              - qcom,qcs8300-cci
>                - qcom,sm8750-cci
>      then:
>        properties:
> -- 
> 2.34.1
> 

