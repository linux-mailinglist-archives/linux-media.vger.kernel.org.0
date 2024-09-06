Return-Path: <linux-media+bounces-17788-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 159C396F812
	for <lists+linux-media@lfdr.de>; Fri,  6 Sep 2024 17:18:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C72DB286E92
	for <lists+linux-media@lfdr.de>; Fri,  6 Sep 2024 15:18:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5AAE1D2F47;
	Fri,  6 Sep 2024 15:18:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="S+EdQEtr";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="asFxAByW"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh7-smtp.messagingengine.com (fhigh7-smtp.messagingengine.com [103.168.172.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A67A41C86E4
	for <linux-media@vger.kernel.org>; Fri,  6 Sep 2024 15:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725635911; cv=none; b=GAgU76JF+w1w3GHUHL8VRz7cdZU3IrfFBv6pTpn7jvJCSBQSdTZPeE/ExkMb7Oqy1Hwfw3kwjyF5ZWiCqvqN7VtnBymM7iwG5yCQwrbpoFOZmyBQRZ7VsBiyTGoxrQZdZWtyPl4Yo7BbPawhRBx1q4HVyiWObZjWMeJ4hAo0EP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725635911; c=relaxed/simple;
	bh=ek7kzw4h5Y5JHBwKX5Y2NX9mcSYQuqasCNRaVSteDcw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aNObtBFje6uv81mf+CQeCI+KywObYjQ2dEelqEZJu+FRzhThdCFWRttI/b/InxYgTV5Lt2QsQ8v+UTRlgGcKP8p1Kp8VUX98KxY1184Imz0zUjqJhsxNVboU2ILfJHB8S5sMdcvYtu5Ycon8F2B3jA6FZ8lf+Zfsokpudx9XJnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=S+EdQEtr; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=asFxAByW; arc=none smtp.client-ip=103.168.172.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 767E011401F1;
	Fri,  6 Sep 2024 11:18:25 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Fri, 06 Sep 2024 11:18:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1725635905;
	 x=1725722305; bh=7Q2RaDM4u6FUExtA3HCdf0uMXCPOc9TS9hc7g7lOL+k=; b=
	S+EdQEtrhgbpJjkwWxEMNvWXS3eP7HOfUXYgBJkcHHwveJyU8sX3Wwh156788fAy
	Oxgif2qityEdHOvMexjOo8TnrtBNeilAnqUVIFkseSkL6H8EzvB2HP5gV///1n05
	viNRlTHPrrqyH1dKL8oRXTE7V52S3ANMXnB9z5gwpiopI9fKC84szdEn0X3FMbP6
	j/9wD0kt/oMPZxjHkPebsf4CQ/KzmMEYPAm61sD/1iMXWhDAzdz4sRavAIQBACpS
	CakeIgJY3gCCX33nXXkQMHXgUBBdUmO6pAUy1QG/n9FWnUrE1cp8wtzlffb5vnMh
	ByiVM0cB54dom1NixD/hNw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1725635905; x=
	1725722305; bh=7Q2RaDM4u6FUExtA3HCdf0uMXCPOc9TS9hc7g7lOL+k=; b=a
	sFxAByWMRJwfR+TER8hJqtXd6AR2VROS7klN8StthILyvcO+uMZohBM0tt2WPA6R
	kmfPMb+LvMM2mxjG2CiL/OktFUTaOSt2V8bUV6VDKWqX1QmzDW3VGwTCc6v8E1RN
	ZSIpI3f2xmVPJS7lamyJs9Ic/Pg1YEPC9axicKViWxOqvJ4dUGhihf9RcCSfy1Zk
	XB9/xksaMEszUdVBpqq4n8Gpck/FPytNbta2ot31WJPkE332P2zJypxVcHgapCjd
	2ZKT/mnp9cXTgcd6Sl9MMHpUPtTFoVNxTaIDKwQbVpjZwRg5WP1gmsWGbZzS1HSX
	B5ez5oeZqMeXus3Y1GhVQ==
X-ME-Sender: <xms:QR3bZv7W5tuYGeTJwrs541vN-8fCjCsw4VibGpn3c0JubzwwwiYROQ>
    <xme:QR3bZk7aj8T15HTW4HnG0mxe_hURrx_lRBB3iEYHTfsLhAZYTBsv-VxncybJJ3XD1
    -36tldsWSnvzP1YbI4>
X-ME-Received: <xmr:QR3bZmdfqspOpz1BIA0ZlJJsMeR8tfnDuU_O-xNX9LOQo1HLIsbGIQzxnw_1-OoUyG9A7RZhEU4i9SrfkbMneRgXDqIjzdK7OA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudeiuddgkeekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdej
    necuhfhrohhmpefpihhklhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhoug
    gvrhhluhhnugesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeevteeg
    tddvvdfhtdekgefhfeefheetheekkeegfeejudeiudeuleegtdehkeekteenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshho
    uggvrhhluhhnugesrhgrghhnrghtvggthhdrshgvpdhnsggprhgtphhtthhopedvpdhmoh
    guvgepshhmthhpohhuthdprhgtphhtthhopehtohhmihdrvhgrlhhkvghinhgvnhesihgu
    vggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtoheplhhinhhugidqmhgvughirgesvh
    hgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:QR3bZgKVGOZnsrOhRHCqKv74tGAsA58QuOxYHBDTJNvm2lA0Jqq1Ww>
    <xmx:QR3bZjICc2Sa4O8dgkktQf09cZqzwYRP9UaNrx4H2kiVzUOBHLHOhA>
    <xmx:QR3bZpx37_sWhsRvFJERj4VovaiZRr9AKvp0N5RtQ6u2UhzbHMBXUA>
    <xmx:QR3bZvKm2WhuDk_4dlhg_R-epZCtQh3I_W7ATSEi93HHm7I9gChdEw>
    <xmx:QR3bZqVjNX1VltLhyj9fMs6CYfyJ0ACawHyoFKhiW5ey1JdTWLdXhcSq>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 6 Sep 2024 11:18:24 -0400 (EDT)
Date: Fri, 6 Sep 2024 17:18:22 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: linux-media@vger.kernel.org
Subject: Re: Race in rcar-v4l2.c
Message-ID: <20240906151822.GV3708622@fsdn.se>
References: <af3f0b7c-d184-4b2e-bb75-6349ef32e4c3@ideasonboard.com>
 <20240906101446.GS3708622@fsdn.se>
 <fbb2f448-c253-44b0-82ae-e9d751b469e2@ideasonboard.com>
 <c8feb1c4-ec6a-4ea9-b8cd-cb10d99e09ca@ideasonboard.com>
 <ff998461-29fc-4e8c-8a59-dadbe971bf63@ideasonboard.com>
 <20240906134604.GT3708622@fsdn.se>
 <144b60f7-70f7-4f8e-936d-9689cf6d1120@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <144b60f7-70f7-4f8e-936d-9689cf6d1120@ideasonboard.com>

On 2024-09-06 17:13:28 +0300, Tomi Valkeinen wrote:
> > Awesome! I will try to find some time soon and rebase that series, I
> > think I have an idea on how to avoid having to mock around in the
> > v4l-async core and still achieve the same thing.
> 
> Hmm, do you mean "[PATCH] media: v4l: async: Fix completion of chained
> subnotifiers"? I only now noticed that. I did not apply that... Should I
> have?

If you got video nodes from rcar-vin then there is no need. Without it 
there is a dependency on probe order for the VIN instances, if done in 
"incorrect" order the complete callback is not called and no video 
device nodes are registered.

-- 
Kind Regards,
Niklas Söderlund

