Return-Path: <linux-media+bounces-24204-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 123E39FF791
	for <lists+linux-media@lfdr.de>; Thu,  2 Jan 2025 10:41:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3C7C01882B99
	for <lists+linux-media@lfdr.de>; Thu,  2 Jan 2025 09:41:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DF031A0714;
	Thu,  2 Jan 2025 09:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="O3Es2wxp"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 283D1192B9D;
	Thu,  2 Jan 2025 09:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735810868; cv=none; b=Fg0oI7/yKKaz0cjgi1QjjmQvYcNL5me1LTEgnExbp+SopVbyL7JKXHVkL0Q8KyclU/pDhRuWROT1E01XhCQexbEdaOV/Fr5q+v6Gh/9nvOA/sE+v6Z0p12iUxiR4MaGEIRqx25lzoU8DfloOtINdNl5ux69stA9A1vKAEV1IEHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735810868; c=relaxed/simple;
	bh=fFwEobIvrp9LyWBkORtJ/uRW7oOSs64PJjo+Ffia/Po=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eank4N7vf03mnFLc0UYF2XPcbnFV8NjdTTe1lMDBHumL/W8YmNLNVg9IuRM5RqxY3pqGynf3AyJDghorOmcPWSqJaT4KmhCH9vEgXq9uuerywQa7sy/yB49y+yYV5Xq409TGduWQ9txvi4N5EPp1Gw0shc1jI/pFTgHYKElubZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=O3Es2wxp; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id AC76275A;
	Thu,  2 Jan 2025 10:40:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1735810816;
	bh=fFwEobIvrp9LyWBkORtJ/uRW7oOSs64PJjo+Ffia/Po=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O3Es2wxpDcrkmTnCTZSFuVAHRGUvGh8Mi1f7KVhkFUiegmVT7Bqf+wqVsGTXV42zM
	 Z6LtfFcI1sib2E92aLcnTFRrRjZ+6ER9cAZZp0oK63oUHfZJ3rmTL96nZDnm+/YdD1
	 x6vNPytQPUNbAjINh8Iu58KZxp3CNaPlI1UwU1P8=
Date: Thu, 2 Jan 2025 11:41:05 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: yuji2.ishikawa@toshiba.co.jp, mchehab@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	sakari.ailus@linux.intel.com, hverkuil-cisco@xs4all.nl,
	nobuhiro1.iwamatsu@toshiba.co.jp, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v12 2/8] dt-bindings: media: platform: visconti: Add
 Toshiba Visconti Video Input Interface
Message-ID: <20250102094105.GD554@pendragon.ideasonboard.com>
References: <20241125092146.1561901-1-yuji2.ishikawa@toshiba.co.jp>
 <20241125092146.1561901-3-yuji2.ishikawa@toshiba.co.jp>
 <04a7ebf7-2924-4894-bc53-ba77e2f64fae@kernel.org>
 <TY3PR01MB99822E6161ED319B4DE855B492042@TY3PR01MB9982.jpnprd01.prod.outlook.com>
 <d5294015-4790-490e-8136-615039a5c733@kernel.org>
 <20241217094508.GD11445@pendragon.ideasonboard.com>
 <7e50e257-9e13-4d32-8de9-8deb53fd30e4@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7e50e257-9e13-4d32-8de9-8deb53fd30e4@kernel.org>

On Tue, Dec 17, 2024 at 01:51:54PM +0100, Krzysztof Kozlowski wrote:
> On 17/12/2024 10:45, Laurent Pinchart wrote:
> > On Tue, Dec 17, 2024 at 06:43:22AM +0100, Krzysztof Kozlowski wrote:
> >> On 17/12/2024 01:00, yuji2.ishikawa@toshiba.co.jp wrote:
> >>> Hello Krzysztof
> >>>
> >>> Thank you for your review
> >>>
> >>>> -----Original Message-----
> >>>> From: Krzysztof Kozlowski <krzk@kernel.org>
> >>>> Sent: Monday, November 25, 2024 7:08 PM
> >>>> To: ishikawa yuji(石川 悠司 ○ＲＤＣ□ＡＩＴＣ○ＥＡ開)
> >>>> <yuji2.ishikawa@toshiba.co.jp>; Laurent Pinchart
> >>>> <laurent.pinchart@ideasonboard.com>; Mauro Carvalho Chehab
> >>>> <mchehab@kernel.org>; Rob Herring <robh@kernel.org>; Krzysztof Kozlowski
> >>>> <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>; Sakari Ailus
> >>>> <sakari.ailus@linux.intel.com>; Hans Verkuil <hverkuil-cisco@xs4all.nl>;
> >>>> iwamatsu nobuhiro(岩松 信洋 ○ＤＩＴＣ□ＤＩＴ○ＯＳＴ)
> >>>> <nobuhiro1.iwamatsu@toshiba.co.jp>
> >>>> Cc: linux-media@vger.kernel.org; linux-kernel@vger.kernel.org;
> >>>> linux-arm-kernel@lists.infradead.org; devicetree@vger.kernel.org
> >>>> Subject: Re: [PATCH v12 2/8] dt-bindings: media: platform: visconti: Add
> >>>> Toshiba Visconti Video Input Interface
> >>>>
> >>>> On 25/11/2024 10:21, Yuji Ishikawa wrote:
> >>>>> Adds the Device Tree binding documentation that allows to describe the
> >>>>> Video Input Interface found in Toshiba Visconti SoCs.
> >>>>>
> >>>>> Signed-off-by: Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
> >>>>> Reviewed-by: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
> >>>>
> >>>> Why this tag stayed and other was removed? What was the reason of tag
> >>>> removal?
> >>>>
> >>>
> >>> The stayed tag is due to internal review.
> >>
> >> Did the internal review really happened? How is it that immediately new
> >> version has internal review without any traces?
> >>
> >> I have doubts this review happened in the context of reviewer's
> >> statement of oversight.
> >>
> >>> The removed tag is due to code's change (split of csi2rx part) after the last review.
> >>> If the code is largely changed following the instruction of another reviewer
> >>> after obtaining the tags, how should the tags be handled?
> >>
> >> Drop all reviews and perform reviews on the list.
> >>
> >> Such internal review appearing afterwards is rather a proof it you are
> >> adding just the tags to satisfy your process. I have no way to even
> >> verify whether that person performed any reasonable review or maybe just
> >> acked your patch.
> > 
> > How do you verify that for public reviews ?
> 
> By quality or amount of comments. Or timing. Or reviewing cover letter
> without any feedback on individual patches.
> 
> There are many, many ways. Considering how many companies were adding
> fake manager-review-tags in the past (or fake SoBs), I am pretty picky
> on that.

On the other hand I've heard numerous complains about patches being sent
by new developers from large companies to upstream lists without first
being reviewed internally by more experienced developers. You can't ask
people to review patches internally before submitting them upstream and
at the same time complain about R-b tags coming from internal reviews.

The value of a R-b tag, regardless of whether or not it comes from an
internal review, ultimately depends on the trust you have on the
reviewer. You can take that into account to decide when you consider a
patch to be ready to be merged, or to skip reviewing it if enough
reviewers you trust have looked at it first.

-- 
Regards,

Laurent Pinchart

