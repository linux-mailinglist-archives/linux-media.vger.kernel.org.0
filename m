Return-Path: <linux-media+bounces-32871-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 059D8ABD1C3
	for <lists+linux-media@lfdr.de>; Tue, 20 May 2025 10:23:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 27D8E4A29BD
	for <lists+linux-media@lfdr.de>; Tue, 20 May 2025 08:23:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92926263F5F;
	Tue, 20 May 2025 08:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sIWBUvLF"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E510325F994;
	Tue, 20 May 2025 08:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747729398; cv=none; b=QduUpuHX463j4WrlG+Woiv9y/f8gh+9s9nJFDiqjuYeqINZkeMSFJlMs9rU8GQHRJ0P8l+77/oPMKv2zrQG5qd28OmtNjpU9IfQpbsuk1T3OfF8daXDaKzjRBa9tSu6Kr53dshpLbGsSMuaKcz1hUQ9tUJQYi6+9IHUs7duvBqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747729398; c=relaxed/simple;
	bh=+y0ms533sl2v+6l/eq8yPL6k6+m+DNYi0UCVrrXPVlk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LP1V6r8lDamPdn/XSPVHP5UsfQ/ZiGW6dJuqon5kTJp20mhukBaj5X2X6v/ubgih4mzA9iDcoehKbztf04rxqsrKTn5WZzz3cSJRSWP+qrVosZeSyagjcP+bbCnELHMt8qdbyz/y4akNSRbiPnl1uSKadFuFxK3cmLRgPF+xJTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sIWBUvLF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F63DC4CEE9;
	Tue, 20 May 2025 08:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747729397;
	bh=+y0ms533sl2v+6l/eq8yPL6k6+m+DNYi0UCVrrXPVlk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sIWBUvLFDc4MpGlGvJZV90gqdyDP6WfewZpC0I4VOha3csMAOXkIZzJ/vo9CgJBTv
	 35leoM1k5RZSdBQ9vtxpX6jltaBzA33k4K65JvSk15RfdazmrPSSECWx9s10gN238i
	 6zp/KJhrPk0frJPjJ9Fb51tQ2E+z4zmCJtJJQ4es6RTQHcFY8Zmh7CLYFSLy5qYOQY
	 1obov4sZJlyMEaOoV99itOXnsJBQK8+YQKJlSYcUrrAvNDEg6v5/8aN5yHcRr4E5o7
	 Yg+eT6EAN8zvsOmyS1enPlx9SVoIB5mG1Nj4b5KixKq0a9CLNAPNgv2r9rtY4h9b3G
	 xFRO/nPTBIczA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1uHIFk-000000001sn-3CPX;
	Tue, 20 May 2025 10:23:13 +0200
Date: Tue, 20 May 2025 10:23:12 +0200
From: Johan Hovold <johan@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] media: qcom: camss: vfe: Stop spamming logs with
 version
Message-ID: <aCw78CRda6VS6ost@hovoldconsulting.com>
References: <20250429180828.950219-4-krzysztof.kozlowski@linaro.org>
 <aBHQejn_ksLyyUm1@hovoldconsulting.com>
 <3e34ce09-1207-4dba-bff8-38c01cad9b78@linaro.org>
 <4d942a6c-cbff-41ac-af8b-12a1ff5181aa@linaro.org>
 <883eb54a-fcaf-443c-a4d7-e1278fd43f5a@linaro.org>
 <ea9f570c-b135-4a98-91ea-ceeb2f48a0e5@linaro.org>
 <aCw09Vci12txhYj-@hovoldconsulting.com>
 <190100e7-8a59-4cf3-8434-bcb6292cacb2@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <190100e7-8a59-4cf3-8434-bcb6292cacb2@linaro.org>

On Tue, May 20, 2025 at 10:02:32AM +0200, Krzysztof Kozlowski wrote:
> On 20/05/2025 09:53, Johan Hovold wrote:

> > Spamming the logs as the driver currently does is clearly broken and
> > should be fixed. Keeping a hw version dev_dbg() is generally perfectly
> > fine, though.

> My main argument, expressed in the commit msg to which no one objected,
> is that this debug is 100% useless: deducible from the compatible,
> always known upfront, always the same.

To me that deduction does not seem straightforward, at least not without
access to internal qualcomm docs, for example:

	compatible = "qcom,sc8280xp-camss";

        qcom-camss ac5a000.camss: VFE:0 HW Version = 1.2.2
	qcom-camss ac5a000.camss: VFE:1 HW Version = 1.2.2
        qcom-camss ac5a000.camss: VFE:2 HW Version = 1.2.2
        qcom-camss ac5a000.camss: VFE:3 HW Version = 1.2.2
        qcom-camss ac5a000.camss: VFE:4 HW Version = 1.3.0
        qcom-camss ac5a000.camss: VFE:5 HW Version = 1.3.0
        qcom-camss ac5a000.camss: VFE:6 HW Version = 1.3.0
        qcom-camss ac5a000.camss: VFE:7 HW Version = 1.3.0

Whether the hw version is actually useful to anyone debugging this
driver I can't say, but keeping it printed *once* seems perfectly
alright if someone wants to keep it (e.g. as we have a long history of
working around hw bugs based on revision information like this).

Johan

