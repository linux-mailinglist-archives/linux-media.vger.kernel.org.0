Return-Path: <linux-media+bounces-53433-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CKk7E5ryn2kyfAQAu9opvQ
	(envelope-from <linux-media+bounces-53433-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 08:13:30 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C68551A1B42
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 08:13:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8D1CA30A9DC5
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 07:08:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B911B38E5C6;
	Thu, 26 Feb 2026 07:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="snk+3bDd"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2665537418C;
	Thu, 26 Feb 2026 07:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772089731; cv=none; b=qrakWkU0C9KTocRPGG5jI7dq5RDxWYoMAfhvhTuaZSgTb/XfL+Hd2EpUs9H9UU0fJSc/9Esdl+ClwoXfXGGpw1c6PrTEz0o0ckewzR8MO1Wd3ghv9YOWslW7cGXt0PPxcKFIdyZF/ardoSh5WDJaUTS+WvkUFp6TTAK0Mj8LocM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772089731; c=relaxed/simple;
	bh=/nOXJwtWBRqjHtF18qw9d+YwsOuhUDgleHpYP8DpyP8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ICvNyoLn6ZmiVJ31iIYJx3sUs35NGFZ5uxd7ZbIfEj1iETJ9nQTftUDMOMVBzocoBU7fwW6MUCkXdGbIG6ktOB6lBoaPM8fH+8sNs6Ed/EvFWRXguv2iX8AZ2RPFtjqMVNU9KBUQrwIJHuQwTa7GjxUOoUcPIStx06QHYg7NNwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=snk+3bDd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40E04C19422;
	Thu, 26 Feb 2026 07:08:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772089730;
	bh=/nOXJwtWBRqjHtF18qw9d+YwsOuhUDgleHpYP8DpyP8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=snk+3bDdO+iB2/f6ppPep06p88NcbIg2BBYSO7yUoZ1EZ/YVMLmgWoWA4OCb36jPl
	 3BtaQw6aS4VIZnMcJMWUeMTvSeh2Q4DTsuSBzk4r3QIgGZXUXrfiUgt5VfO56SnUsw
	 EMgxjB+Wb2iaOegyOhOxODlhjdoQ/kEII5HgppPjZ/HFrQSYVHLUsPiMQ7J8bmtbp/
	 AyYXcF1LuzLMQBlSHYMOnm4Sbe8x90XrhUg0WQMrMhKEMX+EmJu1CJ1uxT+iNRdE00
	 UYwSNGzvX/3YM6BHt82mvwc6Cv1NUOKOOATL+ei1rThXzpyeouJto/8fkPracuhz8L
	 NOz/CqjNxa68w==
Date: Thu, 26 Feb 2026 08:08:48 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, Bryan O'Donoghue <bod@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org
Subject: Re: [PATCH v8 04/18] dt-bindings: media: qcom,x1e80100-camss: Reduce
 iommus to five
Message-ID: <20260226-magnetic-honored-taipan-355eb8@quoll>
References: <20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-0-95517393bcb2@linaro.org>
 <20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-4-95517393bcb2@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-4-95517393bcb2@linaro.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53433-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,baylibre.com,gmail.com,linaro.org,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C68551A1B42
X-Rspamd-Action: no action

On Wed, Feb 25, 2026 at 03:11:21PM +0000, Bryan O'Donoghue wrote:
> Rather than bury the BPS and IPE inside of the CAMSS block we can define
> them like the CCI/I2C and CSIPHY as their own individual devices.
> 
> Remove the IPE and BPS iommu entries from the main CAMSS yaml. There is no
> upstream user of these iommu entries right now so this is safe to do.

Of course there is - v6.16.

Best regards,
Krzysztof


