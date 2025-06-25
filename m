Return-Path: <linux-media+bounces-35911-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 51BD2AE8EFF
	for <lists+linux-media@lfdr.de>; Wed, 25 Jun 2025 21:51:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9BEDF4A5B94
	for <lists+linux-media@lfdr.de>; Wed, 25 Jun 2025 19:51:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8EB22641D8;
	Wed, 25 Jun 2025 19:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cCSOhsIW"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A9BB1494C3;
	Wed, 25 Jun 2025 19:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750881102; cv=none; b=gH3JiwfbP4bWAlgrF+6Yx20ExJvWGlHkh51deD+2UAlaOOSwmBMvsx5AIeaH8LD9pJDZxL5WoqDdjL2j2iQZdsN6s8yQZzLYDJNAtY/sPkB3AoGdRAKv4Fg3DYjFEmMgDiU7DKNLUhMKUY7ep9PO7TIJ5OMsV09FeerrBwK3+YM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750881102; c=relaxed/simple;
	bh=pn4yOJ7V8K3SjQEg+pUrZx/VF4fsacmdLeHB0AnwAss=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PvCmxK2tMD7geBi49WbCXCQcp20WJ6FNvsuILnzoE+cAIN5fgOLyJ6dv5jDw1TK8v0pKDlv14brBd6lNYZPguahjdz2+0RS9BVONNZuKsl8F4Ja1ChHfFA3Ij/J8dMfsKUoM5eNttz/5oDEQZF7A4zZ1McytLuI0Y3+e52EMYn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cCSOhsIW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69A81C4CEEA;
	Wed, 25 Jun 2025 19:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750881101;
	bh=pn4yOJ7V8K3SjQEg+pUrZx/VF4fsacmdLeHB0AnwAss=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cCSOhsIWw4JTqOPW8l8XkAyBPtDsA7YopuibZ+ZhlYEPSw004AjmWfIdrrMqbHTz6
	 cUxx2INaN2g8+Pow3iijTA16x/B/C15A7iAH/WRisA7DMEPyf0ZRKmOrngWupjsfy3
	 Wt0rKspsQYJg5NpzCiJNpP51PgCsWbbwfpa5mDlbyCxE6H2CGqFSfeQlVTYJoLh/GM
	 E6SIMCfXLSXEOcS7yMARNugQbJKFkS1YidwRuhiZkTn2JRqX7wnLdO5FKCS4uk26AI
	 gS4MEBEcaalX5A0z8mtsUDsnp8l9FWvI1BPrHzE8jKRuc8uyPqP2abwk+SO0NoNBNQ
	 bOzp6xOZyrz5A==
Date: Wed, 25 Jun 2025 14:51:40 -0500
From: Rob Herring <robh@kernel.org>
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>, linux-arm-msm@vger.kernel.org,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: media: qcom,x1e80100-camss: Sort
 interconnect alphabetically
Message-ID: <20250625195140.GA2102516-robh@kernel.org>
References: <20250610083318.2773727-1-vladimir.zapolskiy@linaro.org>
 <a072d00e-df91-420b-9363-424bcdf1ed8e@linaro.org>
 <3e8f8220-1fad-437e-9fa4-5eb628891110@linaro.org>
 <ae364f1c-5d64-4178-b26c-e58e352feee0@linaro.org>
 <97e51ab0-737b-496e-81df-b73c9f598bb0@linaro.org>
 <35muvo7h7ynfvzjt6jomasr54xaomfgt5etjc3uuczhfxww2ds@u5xsayanthx7>
 <0943821e-603a-4ee6-9bcb-e5fe690358c5@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0943821e-603a-4ee6-9bcb-e5fe690358c5@linaro.org>

On Wed, Jun 11, 2025 at 02:00:48AM +0300, Vladimir Zapolskiy wrote:
> On 6/11/25 01:21, Dmitry Baryshkov wrote:
> > On Tue, Jun 10, 2025 at 06:10:33PM +0300, Vladimir Zapolskiy wrote:
> > > On 6/10/25 18:02, Bryan O'Donoghue wrote:
> > > > On 10/06/2025 13:45, Vladimir Zapolskiy wrote:
> > > > > > 
> > > > > > How is this a Fixes: ?
> > > > > 
> > > > > I call it the fix to the dt-bindings documentation, then what is this
> > > > > change, if it's not a fix?..
> > > > > 
> > > > > Anyway, if there is a strong disagreement about if it's a fix or not,
> > > > > the Fixes tag can be dropped from the change, since it's so secondary.
> > > > 
> > > > Since we don't have a committed upstream user I don't think this is an
> > > > ABI break.
> > > 
> > > Well, Dmitry says it's an ABI break... It would be beneficial to come to
> > > a common understanding here.
> > > 
> > > > But I also don't think it warrants a Fixes: tag either, there's no bug.
> > > 
> > > There is no bug, but there are Documentation/ changes with Fixes tags,
> > > it's okay.
> > 
> > Fixes means that there was a bug / issue that needs to be fixed. For
> > example, if there was a user for the bindings and the user had these
> 
> That's "for example" only, I don't think it's an all-descriptive definition.
> 
> From Documentation/process/submitting-patches.rst:
> 
>   A Fixes: tag indicates that the patch fixes an issue in a previous commit.
> 
> In my opinion this is quite applicable here, the "fixed issue" in the device
> tree binding documentation file is well set, and anyone can get it from
> the provided commit message.

I tend to agree. I would say Fixes should be used anywhere you wish you 
could re-write history and amend the original commit with the fix.

Rob

