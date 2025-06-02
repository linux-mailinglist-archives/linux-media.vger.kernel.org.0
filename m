Return-Path: <linux-media+bounces-33869-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A77AACA9A4
	for <lists+linux-media@lfdr.de>; Mon,  2 Jun 2025 09:00:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E0A733BCAA2
	for <lists+linux-media@lfdr.de>; Mon,  2 Jun 2025 07:00:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0E541A5B99;
	Mon,  2 Jun 2025 07:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="lMQe4meC"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7711E2C3249;
	Mon,  2 Jun 2025 07:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748847630; cv=none; b=rUvI0KVhWtejseW/y1e6L2cPLDUKVCMBEkfrNhjlv+l+7CF21HEAUaByDxpGg10VRuVBNj9nkZL18qEwUY+Nn6W9EJY3PTHws4H07r3jdzaEsY1I1eEBOUQjhmOAiFZWVgHbYJzeWxdGAvYeEE8w0LcqbH/ocS1ekCfKUZ3WL3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748847630; c=relaxed/simple;
	bh=i+EzcvkRvS+bHxxVpksDkwux3E3f/8pvGpHPfDGxjwM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZfHYW3kIW5Uu7YlxT1k1/sYv9A1PqUhgXWmEUb2Fail/UjAqRjmKFAyhCnUyyeunbpUA98wIBTdiZo04joTGtYjWZ4InL0Le7jwL5HcdItBsuv+lA5y0E5niBmzn3cFAXlXN22oEYGV+2zy8MHC4zkXZF/VtYwqjxeaYwdU7kEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=lMQe4meC; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D88EC1648;
	Mon,  2 Jun 2025 09:00:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1748847618;
	bh=i+EzcvkRvS+bHxxVpksDkwux3E3f/8pvGpHPfDGxjwM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=lMQe4meCutzg/Q5FM+79JAdaoOg+VGYFAjQkk0sYPMmBTCte4YS0VNtOgUPgq1oqf
	 G1iM/U5/GRfnlBN3lK+1jo7tsPSWwREFHB0cMCesuH8QgzI1q6u9oIF17MIG+3rDpr
	 CxUmI6vaeP+UQGFed3Exoa1MNzkZ8xsC+t0IaWb0=
Message-ID: <58b309d9-de03-4818-8d38-a27cc68466db@ideasonboard.com>
Date: Mon, 2 Jun 2025 10:00:15 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] media: dt-bindings: ti,ds90ub960: Add bindings for
 DS90UB954-Q1
To: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
Cc: hverkuil@xs4all.nl, sakari.ailus@linux.intel.com,
 laurent.pinchart@ideasonboard.com, vaishnav.a@ti.com, u-kumar1@ti.com,
 jai.luthra@linux.dev, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
References: <20250523083655.3876005-1-y-abhilashchandra@ti.com>
 <20250523083655.3876005-2-y-abhilashchandra@ti.com>
 <b74ebab7-371e-4bc5-a069-8c72e1eb9161@ideasonboard.com>
 <d02d7c3f-adb7-4dda-8178-19af188ff90a@ti.com>
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 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
In-Reply-To: <d02d7c3f-adb7-4dda-8178-19af188ff90a@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 28/05/2025 08:35, Yemike Abhilash Chandra wrote:
> Hi Tomi,
> 
> Thanks for the review.
> 
> On 27/05/25 10:30, Tomi Valkeinen wrote:
>> Hi,
>>
>> On 23/05/2025 11:36, Yemike Abhilash Chandra wrote:
>>> DS90UB954-Q1 is an FPDLink-III deserializer that is mostly register
>>> compatible with DS90UB960-Q1. The main difference is that it supports
>>> half of the RX and TX ports, i.e. 2x FPDLink RX ports and 1x CSI TX
>>> port. Therefore, add support for DS90UB954 within the existing bindings.
>>>
>>> Link: https://www.ti.com/lit/gpn/ds90ub954-q1
>>> Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
>>> ---
>>>   Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml | 1 +
>>>   1 file changed, 1 insertion(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/media/i2c/
>>> ti,ds90ub960.yaml b/Documentation/devicetree/bindings/media/i2c/
>>> ti,ds90ub960.yaml
>>> index 4dcbd2b039a5..b2d4300d7846 100644
>>> --- a/Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml
>>> +++ b/Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml
>>> @@ -19,6 +19,7 @@ allOf:
>>>   properties:
>>>     compatible:
>>>       enum:
>>> +      - ti,ds90ub954-q1
>>>         - ti,ds90ub960-q1
>>>         - ti,ds90ub9702-q1
>>>   
>>
>> Does this pass the dt checks? The binding lists ports 0-5 as required.
> 
> Thanks for pointing this out. It is passing DT checks since we have marked
> port 4 and port 5 as disabled in DT, but I now understand that approach is
> not acceptable.
> 
> Ports 0–3 are documented as FPD-Link inputs, but on UB954, only ports 0
> and 1 are inputs,
> while port 2 is CSI TX. Should I conditionally modify required ports for
> UB954(0-2) and
> UB960/UB9702 (0-5), even though port 2's description would mismatch?
> (In bindings it would be described as FPD-Link input but it will be
> modeled as CSI TX in DT).
> 
> Alternatively, we can describe the ports block separately for each
> compatible to
> ensure correctness. Please let me know which approach you prefer.

I think you have two options here: either use ports 0, 1, 2 for UB954,
or use ports 0, 1, 4 for UB954. I think the first option makes more sense.

The bindings have to be correct, you can't do "even though port 2's
description would mismatch". Probably the clearest way is just to have a
conditional and define all the ports separately for ub954 and for the rest.

You can check e.g. renesas,du.yaml, which does rather complex conditionals.

I do wonder, though, if the port definitions could be more brief by
somehow defining the RX and TX port details only once, instead of
replicating the same for every port.

Note that the bindings also allow link0-3, which for UB954 should be
link0-1.

 Tomi


