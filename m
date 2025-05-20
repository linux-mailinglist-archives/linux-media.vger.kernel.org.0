Return-Path: <linux-media+bounces-32874-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 11751ABD228
	for <lists+linux-media@lfdr.de>; Tue, 20 May 2025 10:40:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8659E3BDC39
	for <lists+linux-media@lfdr.de>; Tue, 20 May 2025 08:39:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AE062641F3;
	Tue, 20 May 2025 08:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YabBjgQz"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FFE22609DF;
	Tue, 20 May 2025 08:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747730402; cv=none; b=kvm/olsZwHNGBhscpCl8ZXj1TnsPvSQHQrb9l0QSadCvVOiJ1cZ8aafb6Ue71B/G/bImPbgCAn8GWO0jV9YjIHZnmUwkG5h/CqIMCBZvMOvOyJoFTeNVxxpE3DN8+Gypfix8psDoVzazg+G9UYTdJ+I5XLlsRKDn1lFd5ZQFnCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747730402; c=relaxed/simple;
	bh=HM0GGY3irUg3QKTBApeyVRpqXb1LAeJz4U5K3BBkn2c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cMQilKkRnQQruphd1SigkGcGq70VfVrdEUW9+omeri3odR9e12+jUwxhqM5Wmt7SXOyMB0S005kdfqNQlmbHSaLm4MQ1mLAbDV9ZoyJrCg97j5syHlD6zFeP5G84tbCNuUVFkAKAFqeMi0F7liyGUqPOG+unMsc1SHf1fRgHyF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YabBjgQz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7E5FC4CEE9;
	Tue, 20 May 2025 08:40:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747730401;
	bh=HM0GGY3irUg3QKTBApeyVRpqXb1LAeJz4U5K3BBkn2c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YabBjgQzzi6yZBO3a+CvXinC69sMvMj3bPpZdAc8KM7FIjmvUCJxaYoKcFL0JHMoq
	 CeQShmS0IvgMECr2o5RUpoGCaW9oGVRYVgF3zVUFqdx0Im3yVfBedvbo3FVXWPLhq9
	 Rizh5y4n/mddGEOaeIYJgk7pDqW+y6PSyEshQOUDzqcEmX9mfbrI9r2uLOdS19SqJ4
	 2dtZydzf7soZAJThcntnJ1gDz6KKH13hjcW7J0OTGlD2FCNe15nyWGrmX4dv7Q4BZL
	 K6uXRHALXhPbtkOLOYOidlmu2jroHz8Y1mTorizAOTccnIXDaHS3L2B8qOuXTUfIH+
	 TW/InlT7DDEGg==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1uHIVx-000000002A4-0DVA;
	Tue, 20 May 2025 10:39:57 +0200
Date: Tue, 20 May 2025 10:39:57 +0200
From: Johan Hovold <johan@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] media: qcom: camss: vfe: Stop spamming logs with
 version
Message-ID: <aCw_3cDSCQ09NSKB@hovoldconsulting.com>
References: <20250429180828.950219-4-krzysztof.kozlowski@linaro.org>
 <aBHQejn_ksLyyUm1@hovoldconsulting.com>
 <3e34ce09-1207-4dba-bff8-38c01cad9b78@linaro.org>
 <4d942a6c-cbff-41ac-af8b-12a1ff5181aa@linaro.org>
 <883eb54a-fcaf-443c-a4d7-e1278fd43f5a@linaro.org>
 <ea9f570c-b135-4a98-91ea-ceeb2f48a0e5@linaro.org>
 <aCw09Vci12txhYj-@hovoldconsulting.com>
 <190100e7-8a59-4cf3-8434-bcb6292cacb2@linaro.org>
 <aCw78CRda6VS6ost@hovoldconsulting.com>
 <8a2f2269-d07f-42b2-ab6c-dcff30a1f431@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8a2f2269-d07f-42b2-ab6c-dcff30a1f431@linaro.org>

On Tue, May 20, 2025 at 10:30:16AM +0200, Krzysztof Kozlowski wrote:
> On 20/05/2025 10:23, Johan Hovold wrote:
> > On Tue, May 20, 2025 at 10:02:32AM +0200, Krzysztof Kozlowski wrote:
> >> On 20/05/2025 09:53, Johan Hovold wrote:
> > 
> >>> Spamming the logs as the driver currently does is clearly broken and
> >>> should be fixed. Keeping a hw version dev_dbg() is generally perfectly
> >>> fine, though.
> > 
> >> My main argument, expressed in the commit msg to which no one objected,
> >> is that this debug is 100% useless: deducible from the compatible,
> >> always known upfront, always the same.
> > 
> > To me that deduction does not seem straightforward, at least not without
> > access to internal qualcomm docs, for example:
> > 
> > 	compatible = "qcom,sc8280xp-camss";
> > 
> >         qcom-camss ac5a000.camss: VFE:0 HW Version = 1.2.2
> > 	qcom-camss ac5a000.camss: VFE:1 HW Version = 1.2.2
> >         qcom-camss ac5a000.camss: VFE:2 HW Version = 1.2.2
> >         qcom-camss ac5a000.camss: VFE:3 HW Version = 1.2.2
> >         qcom-camss ac5a000.camss: VFE:4 HW Version = 1.3.0
> >         qcom-camss ac5a000.camss: VFE:5 HW Version = 1.3.0
> >         qcom-camss ac5a000.camss: VFE:6 HW Version = 1.3.0
> >         qcom-camss ac5a000.camss: VFE:7 HW Version = 1.3.0
> > 
> 
> I understand that deduction is not straightforward, but it is also a
> fixed one, meaning it will be always sc8280xp -> (vFOO, vBAR), thus the
> only usefulness of above is to map each compatible to pair of two HW
> versions. This can be done via debugfs interface once and stored in
> public docs. No need to do that mapping every time driver probes and my
> patches drop nice chunk of code, including indirect function calls.

If you still want to export it through debugfs at some point, then it
seems there is still some worth in having it.

I'm sure the implementation is terrible, and maybe that's reason enough
to simply drop it in this case. But again, generally it's perfectly fine
to print a hardware revision at debug level (once) during probe.

Johan

