Return-Path: <linux-media+bounces-19019-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F82A98EB9B
	for <lists+linux-media@lfdr.de>; Thu,  3 Oct 2024 10:30:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BFC181F21CD1
	for <lists+linux-media@lfdr.de>; Thu,  3 Oct 2024 08:30:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 341F113C906;
	Thu,  3 Oct 2024 08:29:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rZcVGDcy"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89656139566;
	Thu,  3 Oct 2024 08:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727944191; cv=none; b=f/BnVWxcO+edZBeKg+be18YPCBUQvNZsmGGcmr+rXshBkTifL5+D7+U2x3aO8+Nivo/jyxGn5uAlnZN3KlG9Hg9GjWcIr0uKsqU3C+sAyv1BPuLqkdE87ibiXbNsXTUp4mgJkmyz+I36SLykvt/rqeDTbLsl7+Y4COE5DUZXAms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727944191; c=relaxed/simple;
	bh=OkI+8g8nFZe0fk2Hx5XVcCgs1CGYPYkt8hC6nRqk8qE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fbJIESHiBHTiwcuzrMzP4+bRAoCb99uRsPu+wfaNrcsJndZnbWmwzzhHKFj0YUzVsqKTJ5uw/eO2KYoG3ZEoZe+8Z1BPireuUHceBiogvDPZVe6Ioa3GLHBKfm9ZSuOoiRobuISNQEyCDw0U7bLtGY3ueXM1TJR0eoWW92x1O3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rZcVGDcy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27C2FC4CEC7;
	Thu,  3 Oct 2024 08:29:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727944191;
	bh=OkI+8g8nFZe0fk2Hx5XVcCgs1CGYPYkt8hC6nRqk8qE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rZcVGDcy6nozBZEDFDS9TRUIIfloHx2Tmens55Zzu0eKw8JZRiHTCwEq/ei4PLsAA
	 XHFPVb2HqY6+DHXRoyK/4E+20woIuEzGewXHN9dpLof9RP3DIKjGM1QNq3k95jH5kk
	 WJ0VDTr680ZbJGpbTG66OKAU2613+/7G5QLcC6seTeRm7m8C77nv7x0GMUdLHq1G6+
	 x4D91oeCsp3SxBamxM9E/n1sT8QB7oAzc9a2/V44YJaKPEB+L/8D5Oan955VIrycdd
	 OGyvRRVRJmeqFdEziThnVoKDgjbYF1i0m93tYBV6+jAdl45o27eeJanYrhpZA+Ru9i
	 Usc/g542Bk+Uw==
Date: Thu, 3 Oct 2024 10:29:47 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Jason Chen <jason.z.chen@intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Sergey Senozhatsky <senozhatsky@chromium.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH v3 2/4] media: dt-bindings: Add OmniVision OV08X40
Message-ID: <t4fajppdqagkl7wr2krcucsga4zocz6liar64odk2mnasdyfms@5fp7bfwalson>
References: <20241002-b4-master-24-11-25-ov08x40-v3-0-483bcdcf8886@linaro.org>
 <20241002-b4-master-24-11-25-ov08x40-v3-2-483bcdcf8886@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241002-b4-master-24-11-25-ov08x40-v3-2-483bcdcf8886@linaro.org>

On Wed, Oct 02, 2024 at 02:58:44PM +0100, Bryan O'Donoghue wrote:
> +        properties:
> +          data-lanes:
> +            oneOf:
> +              - items:
> +                  - const: 1
> +                  - const: 2
> +              - items:
> +                  - const: 1
> +                  - const: 2
> +                  - const: 3
> +                  - const: 4
> +
> +          link-frequencies: true

Not much changed here and you did not continued discussion about it.

Best regards,
Krzysztof


