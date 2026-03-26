Return-Path: <linux-media+bounces-57116-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gMIpNHGexGki1gQAu9opvQ
	(envelope-from <linux-media+bounces-57116-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2026 03:48:17 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 866F432E7D0
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2026 03:48:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 873DB30358A3
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2026 02:46:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3DFC2DC789;
	Thu, 26 Mar 2026 02:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W54oi4We"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45FA7391840;
	Thu, 26 Mar 2026 02:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774493205; cv=none; b=SArPt23NUVz/kfaGSi7Ls5jxrkeOGRqmZjmje9igYGIvpaclAMNEkeMHV6kdgg6Aa+wRcGSdxwp/KSnb0RMa0MEoq8V38IyUTYke5LERMxQ4/ST5gJrNLpgy02X7NTnUqYvDFiuZTeqj/c5iy6H1yXgud2LdH6/OkFPZROLJ5fI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774493205; c=relaxed/simple;
	bh=BbxAq8YVCseKwmtOIFaf6vZEz/jYaPjt4c1ImQxigf8=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=KdkDWtV+FaL61241p5HLFcZxb1i6F8eXMSPr1gbjUUpU9vyy38x1OdEdlOwEZyxLymvjW78rKxvUwSwVqBdaIBrOHhS74i+uRBhbnmUBpuxf6bXx9PTkgA3RLvvgDsP9WckTKw2tIwBFdJqggiZQyqkDpTHGrIZqltTmc+Bvf94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W54oi4We; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6461AC4CEF7;
	Thu, 26 Mar 2026 02:46:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774493204;
	bh=BbxAq8YVCseKwmtOIFaf6vZEz/jYaPjt4c1ImQxigf8=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=W54oi4Weyiq+flagJOUcRMtzL/ZL1/c7Hg6eLeYmRspR4RQvSfnV+fIx5ORYXc6IE
	 4GwM7QzK0owiV2BOYmhpdaIfBW4WIdl2ta9ehjFK0To3ILoJ29fxPXFmOdhS9qTXab
	 if7s8F1mX1X/6R9iK2dPrwoBiYj2dYP70uAYwXZdOYWovgDzF9f4kZTTVi/bI9U6GR
	 SOiCEKC9f8lYKt2q3RzTxXDVccVbd1DgvjleLlPpdgODO3AbIwvJzzsN9HYJd2B3Ml
	 55hrSLdqE810ukv9+9TDelTvKFY50BUgftDBE0tgmk24j44dtNLmcUzvhlX4MLtEBG
	 omEQku6w/KTtw==
Date: Wed, 25 Mar 2026 21:46:40 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-clk@vger.kernel.org, Robert Foss <rfoss@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Stephen Boyd <sboyd@kernel.org>, linux-media@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Bryan O'Donoghue <bod@kernel.org>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Todor Tomov <todor.too@gmail.com>, Bjorn Andersson <andersson@kernel.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20260326-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v11-1-5b93415be6dd@linaro.org>
References: <20260326-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v11-0-5b93415be6dd@linaro.org>
 <20260326-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v11-1-5b93415be6dd@linaro.org>
Message-Id: <177449320091.827032.5601565411540937952.robh@kernel.org>
Subject: Re: [PATCH v11 1/7] dt-bindings: media: qcom,x1e80100-camss: Add
 optional PHY handle definitions
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-57116-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,baylibre.com,linaro.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 866F432E7D0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Thu, 26 Mar 2026 01:28:29 +0000, Bryan O'Donoghue wrote:
> Add optional PHY handle definitions. This will allow for supporting both
> legacy PHY definitions as well as supporting the optional new handle based
> approach.
> 
> Drop the legacy high-level 0p8 and 1p2 supplies as required, each PHY has
> its own individual rails. The old binding is still valid but with
> individual nodes we define the rails in the CSIPHY sub-nodes.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  .../bindings/media/qcom,x1e80100-camss.yaml        | 33 ++++++++++++++++++++--
>  1 file changed, 31 insertions(+), 2 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml: Unresolvable reference: /schemas/phy/qcom,x1e80100-csi2-phy.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260326-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v11-1-5b93415be6dd@linaro.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


