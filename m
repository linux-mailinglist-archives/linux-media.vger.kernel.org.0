Return-Path: <linux-media+bounces-23556-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 71B619F47DD
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 10:45:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 818307A3655
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 09:45:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AFC51DED74;
	Tue, 17 Dec 2024 09:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="rY8dfRyy"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B4301DE4FF;
	Tue, 17 Dec 2024 09:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734428719; cv=none; b=s3ImZHCS3kwdte+/i9qWCztUujRw7/Vr9dwQ90l9g0hHb3xLmBhwYZEC/hmzkYxU8QnYVTujVi1yjNbZJfUrSuYSTEt17eIsXOU5EYGYu3VBkL4JhnrKm5D2t/OjNAez33+ysj0mLYY5GZdCSlLsYg/Wod4N2BRqzC36CHLIPok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734428719; c=relaxed/simple;
	bh=2eGNr4it5La5zFwKqlI0alnEBzdjh2a45amMsSoLjTA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TtXCGOkeg/SEyTcxGQUKATf4XbeKFX+o1O+jAden06kjw9sg5k/pAOwHDirbNfTUFbBZ16NIrbtDClMBvu7DFxKH009SPbt9XCYoMsocr3JUGgd0nRycW+OtsL6lqdHE3xTM+fO/0EN/haW3aSRZgEt72R4gkEPksYyYQK9988Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=rY8dfRyy; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 04FE73E;
	Tue, 17 Dec 2024 10:44:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1734428673;
	bh=2eGNr4it5La5zFwKqlI0alnEBzdjh2a45amMsSoLjTA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rY8dfRyyCgdvx1c8RZkwkEeBnkbD2AdLaXHCCD/fdzKpnISry8Pg/KVfPCXlKlzj6
	 7yCQzh7V5u9oivMMud8WJMJ11Ho49fMscu9aRKqscpryAFbyVQdcQiwHpzRIyAt1co
	 hVBzlL6c3CxZJdlylFC4n/EXCZ7YjWkQZpXlvHPY=
Date: Tue, 17 Dec 2024 11:45:08 +0200
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
Message-ID: <20241217094508.GD11445@pendragon.ideasonboard.com>
References: <20241125092146.1561901-1-yuji2.ishikawa@toshiba.co.jp>
 <20241125092146.1561901-3-yuji2.ishikawa@toshiba.co.jp>
 <04a7ebf7-2924-4894-bc53-ba77e2f64fae@kernel.org>
 <TY3PR01MB99822E6161ED319B4DE855B492042@TY3PR01MB9982.jpnprd01.prod.outlook.com>
 <d5294015-4790-490e-8136-615039a5c733@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d5294015-4790-490e-8136-615039a5c733@kernel.org>

On Tue, Dec 17, 2024 at 06:43:22AM +0100, Krzysztof Kozlowski wrote:
> On 17/12/2024 01:00, yuji2.ishikawa@toshiba.co.jp wrote:
> > Hello Krzysztof
> > 
> > Thank you for your review
> > 
> >> -----Original Message-----
> >> From: Krzysztof Kozlowski <krzk@kernel.org>
> >> Sent: Monday, November 25, 2024 7:08 PM
> >> To: ishikawa yuji(石川 悠司 ○ＲＤＣ□ＡＩＴＣ○ＥＡ開)
> >> <yuji2.ishikawa@toshiba.co.jp>; Laurent Pinchart
> >> <laurent.pinchart@ideasonboard.com>; Mauro Carvalho Chehab
> >> <mchehab@kernel.org>; Rob Herring <robh@kernel.org>; Krzysztof Kozlowski
> >> <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>; Sakari Ailus
> >> <sakari.ailus@linux.intel.com>; Hans Verkuil <hverkuil-cisco@xs4all.nl>;
> >> iwamatsu nobuhiro(岩松 信洋 ○ＤＩＴＣ□ＤＩＴ○ＯＳＴ)
> >> <nobuhiro1.iwamatsu@toshiba.co.jp>
> >> Cc: linux-media@vger.kernel.org; linux-kernel@vger.kernel.org;
> >> linux-arm-kernel@lists.infradead.org; devicetree@vger.kernel.org
> >> Subject: Re: [PATCH v12 2/8] dt-bindings: media: platform: visconti: Add
> >> Toshiba Visconti Video Input Interface
> >>
> >> On 25/11/2024 10:21, Yuji Ishikawa wrote:
> >>> Adds the Device Tree binding documentation that allows to describe the
> >>> Video Input Interface found in Toshiba Visconti SoCs.
> >>>
> >>> Signed-off-by: Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
> >>> Reviewed-by: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
> >>
> >> Why this tag stayed and other was removed? What was the reason of tag
> >> removal?
> >>
> > 
> > The stayed tag is due to internal review.
> 
> Did the internal review really happened? How is it that immediately new
> version has internal review without any traces?
> 
> I have doubts this review happened in the context of reviewer's
> statement of oversight.
> 
> > The removed tag is due to code's change (split of csi2rx part) after the last review.
> > If the code is largely changed following the instruction of another reviewer
> > after obtaining the tags, how should the tags be handled?
> 
> Drop all reviews and perform reviews on the list.
> 
> Such internal review appearing afterwards is rather a proof it you are
> adding just the tags to satisfy your process. I have no way to even
> verify whether that person performed any reasonable review or maybe just
> acked your patch.

How do you verify that for public reviews ?

> I cannot even verify that that person understands the
> reviewer's statement of oversight.
> 
> 
> ...
> 
> >>>
> >>> Changelog v11:
> >>> - no change
> >>>
> >>> Changelog v12:
> >>> - remove property "clock-noncontinuous" as VIIF switches both modes
> >>> automatically
> >>> - remove property "link-frequencies" as VIIF does not use the
> >>> information
> >>
> >> Driver does not use or hardware supports only one frequency?
> > 
> > My comment was incorrect.
> > It should be "Driver does not use the information"
> 
> Then this is not that helping. Maybe hardware supports only one frequency?

-- 
Regards,

Laurent Pinchart

