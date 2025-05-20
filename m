Return-Path: <linux-media+bounces-32884-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CBDF4ABD31F
	for <lists+linux-media@lfdr.de>; Tue, 20 May 2025 11:17:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 912564A62B0
	for <lists+linux-media@lfdr.de>; Tue, 20 May 2025 09:17:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC02C267AE3;
	Tue, 20 May 2025 09:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c1Ea/sjV"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20E9C647;
	Tue, 20 May 2025 09:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747732635; cv=none; b=PbFMPui4YbBzSClY2dyllTCY9DVCDRayfoK95ynrh5DFJAElRB2rhj0pJ3mwa5Q4AOgfAIOKcWd7hHNV2Brzh+QKEBWhHi4MqXPVFuq88VNfU/PGEdZiHUXRxbOtK37I6wVwNG42cHyEHhIEULrWjs7TwF938M4kyy5rMzyLq7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747732635; c=relaxed/simple;
	bh=BhrwYR9Bpw5TY8cvWbegmzVkfmOOpNoCkTqfQfjj81A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LLrbQUjA5C2dhe5IlgqGhxYGwvk9HLMHR7m75o7LXtqpChHTnCdv962+gS53FqJ4gyndqBYXeAq2miPp15Tuo1XJsLLT8s/KWzw6yvZbTTbZ0hUGY+hGjSWlKuKbqGWdktySkMfXE11qOswzKx0UapxJA8AVKvQLlikHT0xYsFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c1Ea/sjV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75782C4CEE9;
	Tue, 20 May 2025 09:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747732634;
	bh=BhrwYR9Bpw5TY8cvWbegmzVkfmOOpNoCkTqfQfjj81A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c1Ea/sjVdrTFuG7y7I0ieQGNx21uUgP4RgkC9wJXvN22g6sOi6sR15D/6+8dYkTh8
	 xilTfUIhrvRjwwYD2UrXQyQ4ACFIvY8akHrltM1VQDdMF0eUwYLXKn5y9FzQvRToO1
	 nltIqgzkvi6peYbdC4ebehQJxNV5RqPfhU/rG9JJeBYgTFU+e+k99ZabUYY4MIpwA9
	 t9zPPoITlYNl8YHQQmU2jtuGz5AAS/GRlIo325D5KyLK4x8zEvoWmVg58W5cBrqpBO
	 jV1aCW4FJdOKkDqu9+Ew2FF+W+vmXMIh8BVsvOihKK1uJa8Q/MO5kjOA44fXxosHvA
	 Z8gq5HN3TeSwA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1uHJ5y-000000002o0-0OPB;
	Tue, 20 May 2025 11:17:10 +0200
Date: Tue, 20 May 2025 11:17:10 +0200
From: Johan Hovold <johan@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] media: qcom: camss: vfe: Stop spamming logs with
 version
Message-ID: <aCxIlnPsVZBiUpc8@hovoldconsulting.com>
References: <3e34ce09-1207-4dba-bff8-38c01cad9b78@linaro.org>
 <4d942a6c-cbff-41ac-af8b-12a1ff5181aa@linaro.org>
 <883eb54a-fcaf-443c-a4d7-e1278fd43f5a@linaro.org>
 <ea9f570c-b135-4a98-91ea-ceeb2f48a0e5@linaro.org>
 <aCw09Vci12txhYj-@hovoldconsulting.com>
 <190100e7-8a59-4cf3-8434-bcb6292cacb2@linaro.org>
 <aCw78CRda6VS6ost@hovoldconsulting.com>
 <8a2f2269-d07f-42b2-ab6c-dcff30a1f431@linaro.org>
 <f4de3ab5-b40a-4d87-916b-8d1a1fb607b2@linaro.org>
 <d81de587-7452-4fa1-836e-9e30b6d63c57@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d81de587-7452-4fa1-836e-9e30b6d63c57@linaro.org>

On Tue, May 20, 2025 at 10:51:56AM +0200, Krzysztof Kozlowski wrote:
> On 20/05/2025 10:44, Bryan O'Donoghue wrote:

> > I find the debug prints useful in that I know the hardware block has 
> > been powered on, clocked etc. I agree the number of those prints seems 
> > excessive.
> > 
> > The reason it is printed out multiple time is the blocks get powered on/off.
> > 
> > Personally I agree with Johan - it would be nice/useful to print it out 
> > once with DEBUG on, so that we know we have successfully powered-on and 
> 
> That's opposite to what coding style asks. Success should be silent.

The coding style says probe should be silent, but debug statements are
not printed by default so that bit does not apply here.

Johan

