Return-Path: <linux-media+bounces-55840-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KMxAAhBwt2nnRAEAu9opvQ
	(envelope-from <linux-media+bounces-55840-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 03:50:56 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id E69742943E9
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 03:50:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 421A83004914
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 02:50:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67E3B31D72E;
	Mon, 16 Mar 2026 02:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ilX5wJkf"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6FD421578D;
	Mon, 16 Mar 2026 02:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773629452; cv=none; b=C4UGN8pGYNGmfDYpcar2ZdCk6vvmDpJQLY7Bobl+TV6Z4ROumO8uQFFBavM/DrgtUUijxdyHe0Hg9r4HrSedDZxrrj4Gvm741iYgbeMOkuiWNhzap9/gntNEp2BTDWgXWwYSKTh0LiqzDDGi5csN3Y/p6KW5O3i0EqIEY2omNfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773629452; c=relaxed/simple;
	bh=MI8CAeQU6WpTx/lZpswqhbydku3NU7/zyHF8/KEPquw=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=SACBV2RT9Hl08cXkswRnZ0WX7a/zjnGh5io6HFau0xkQO8VajdVTdN8UwlhqtVp0w68Xmrdo/WxllHGj7wKPRfQ5o18CZG0fe9FmUwWVw7PWTg6sxsvR/fhNFxiVjQYUBgajaXgZfGZG2HiSvW7QganSBNvpW5okrt4alz8bqKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ilX5wJkf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 444EFC4CEF7;
	Mon, 16 Mar 2026 02:50:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773629452;
	bh=MI8CAeQU6WpTx/lZpswqhbydku3NU7/zyHF8/KEPquw=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=ilX5wJkf40x6+TQsMmEAx88oOuPSpkj/Nf5Z0yjguzOChCD77Xt/1VLSrHCXGeHhV
	 RZQB9YKquV6PaPs+fXdAb2OsnWF5EALLqNLdVJig2IiJo5vpbf4kFb6iPRjV+wziSn
	 a7xvn9KUcv3OC+hmYxqb8dILO1LqpFJL+LWHHOpWMth6+SdyFKn0EqWu6/O5/GbFj9
	 OqddzOWv098iFzw4P2HU4ogSDVpq5elh6aeyorrnjrmcyYIJ94coZt5xQ4tPD1hdnd
	 gUC4WNwm9RRB2kYfacqKrTJS7rljkqvCS9J6aY3YG4ce6RoePLQWCv8L1ASadh0T8k
	 yalEj5uqKr0mg==
Date: Sun, 15 Mar 2026 21:50:51 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Todor Tomov <todor.too@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Bryan O'Donoghue <bod@kernel.org>, linux-media@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 linux-arm-msm@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, Robert Foss <rfoss@kernel.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20260316-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v10-2-fdfe984fe941@linaro.org>
References: <20260316-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v10-0-fdfe984fe941@linaro.org>
 <20260316-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v10-2-fdfe984fe941@linaro.org>
Message-Id: <177362945144.790188.16928640175892453002.robh@kernel.org>
Subject: Re: [PATCH v10 2/7] dt-bindings: media: qcom,x1e80100-camss: Add
 optional PHY handle definitions
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-55840-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org,linaro.org,baylibre.com];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E69742943E9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Mon, 16 Mar 2026 01:02:02 +0000, Bryan O'Donoghue wrote:
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

See https://patchwork.kernel.org/project/devicetree/patch/20260316-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v10-2-fdfe984fe941@linaro.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


