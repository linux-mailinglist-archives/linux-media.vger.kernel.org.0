Return-Path: <linux-media+bounces-13753-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 983F190F68B
	for <lists+linux-media@lfdr.de>; Wed, 19 Jun 2024 20:56:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0DC572830BE
	for <lists+linux-media@lfdr.de>; Wed, 19 Jun 2024 18:56:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F01E158869;
	Wed, 19 Jun 2024 18:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="BF7cQI6D";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Yv5miaMC"
X-Original-To: linux-media@vger.kernel.org
Received: from fout3-smtp.messagingengine.com (fout3-smtp.messagingengine.com [103.168.172.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39245524C4;
	Wed, 19 Jun 2024 18:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718823376; cv=none; b=HbUzOOylpUkZjFurWHcmrCiNMmA6Zq9mS3oWBV/9sKkNISV+FSyp47Ja+Zw3m+OHLmH+ygwRzSQko/gh55sByak+hP5dDkd/YZcn4EtS2U3I3I6I0Jde3Eo1yyz9mOVIRF/d4bvCw7c9Dc+E088XPzZE2Oc3CRuXQut6UsKOjBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718823376; c=relaxed/simple;
	bh=BXaBrly0Edxx0iSo+w3G8w3LlyVGw8jS0iBVypyeI7I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CxhqxXChqqd77qElyv2ViAQQq3TmB0tpYGJR6GWp0xyGDLgiH8Y4kQ3e+JaT5cW0VELWp96X0S3XFt9gOW3a/G3a2m+wmnnklYyDnv7XrbSSJckAXTwJtQZ5B8wLW7srEpq5hsptU43DscNKtTWyzRIkWJjw10q68ynO/sle7Xs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=BF7cQI6D; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Yv5miaMC; arc=none smtp.client-ip=103.168.172.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from compute7.internal (compute7.nyi.internal [10.202.2.48])
	by mailfout.nyi.internal (Postfix) with ESMTP id 0A81913801A1;
	Wed, 19 Jun 2024 14:56:11 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute7.internal (MEProxy); Wed, 19 Jun 2024 14:56:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1718823371;
	 x=1718909771; bh=jmPIQR1Ww2PZOtZ6FHeU+kqz22qvRT7bktPdDN2Y7F0=; b=
	BF7cQI6DTOIt4RVbDxTjHqGBtQUWq8zBvpIRUZv1ctjvqAm/U2Te1J3cjSNQGjkR
	bSDbudnhftw7UwaUTth+w280oUFvRyI38dAZxfRoP3poQZjX1LzmOjU8qStN2QaV
	EO4Z019+zKPwRsNEpiQAyVUOzxHk5PvjydrZayVmdg35XrKaNbKmWRdMH/bFJ1Ti
	jfJ+7mshP9VVXefEGpQ7lKFkin/uTm6rjd5lHxlP4JbRj9kB3IXffb3bzym7M32A
	WcflghJtVUhdDVtP+Cmnj+r97tX1slRD9LoDmztqkh6yz7GDyx7fZmYZ4UFkzQaw
	K8AfavoznDOkZadflykX4Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1718823371; x=
	1718909771; bh=jmPIQR1Ww2PZOtZ6FHeU+kqz22qvRT7bktPdDN2Y7F0=; b=Y
	v5miaMCSmyip1W+x/4REt7THR/vy3JqwrHHZQR1cwPfcfNko/MhJTJM+ZqqgsC+H
	HVq61D1GFs/HRqzPqHPiCElMRtRF5yIhbJEswZfOz+rfXQ1cdSiuMSWS5ZixEjJD
	+lh5C1l9culOwbBumsEc5TI5pxscmsoFMh9r+It5WX8oyggY+g8tJTEmjvfSJiAU
	+CuULWVhfu/F5jAKE65OmhMDfKvnhItzLkP1MJLZjd7hwjd8kk+YfY4yxy85Cvy+
	K9dv2QTl5Xi0hn43Tl2BA3r4s/13c4PMzPINDgyHw1eQ17O7btAZSIr8EKQYbC14
	qGBwvFQIFUC9rhl5Whycg==
X-ME-Sender: <xms:yilzZvLw6SlhRWbSaci6QSBpUgJOKhmg2SDOF1VdZo0PbquDwd4NOQ>
    <xme:yilzZjIfI0qLT6WbavIdgZCumVsNvSKRmOCDWinvfHfiEcyt3DYyjH2GcTO0wTn0x
    YocrdgL8dN-khobxek>
X-ME-Received: <xmr:yilzZnuMczSs7biNs6IqAeQWhzuUupkiYT4N5t15jJM1VkKQhlIMzSCI9zKc1WBHtHGks6G06riDM-jSD8M63ozsltl44gM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfeeftddgudeftdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefukfhfgggtugfgjgesthekredttddtjeenucfhrhhomheppfhi
    khhlrghsucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsohguvghrlhhunhguodhrvg
    hnvghsrghssehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgrthhtvghrnhepfefhleel
    hfffjefgfedugfegjeelhfevheeikefhueelgfdtfeeuhefftddvleeinecuvehluhhsth
    gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepnhhikhhlrghsrdhsohgu
    vghrlhhunhguodhrvghnvghsrghssehrrghgnhgrthgvtghhrdhsvg
X-ME-Proxy: <xmx:yilzZoa-sJXJehPcUkEcJSt3m_muhqLyJ_vMWnD9Ql1IiDiA1o48Jw>
    <xmx:yilzZmZHOZuc7Plifp-UEdXK8hnDup6Jw1FqG9OCeTIPex9YHPLBvg>
    <xmx:yilzZsCmd1QV4yI-SlA1lD02kcoD9VvZz_8XrPFmGxhsMPPpKqxS0w>
    <xmx:yilzZkYRYCIyNRuc5Z63YNL9rmMDOnAksEkq9W3XBgOD_lJbOF7A2g>
    <xmx:yylzZjR_uAYwUtHQkYL8Plkpf4c86zsJ_LjC4KK_sDpWxiTPpfrTISb3>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 19 Jun 2024 14:56:10 -0400 (EDT)
Date: Wed, 19 Jun 2024 20:56:07 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Conor Dooley <conor@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: media: renesas,vin: Add binding for
 V4M
Message-ID: <20240619185607.GT382677@ragnatech.se>
References: <20240619153559.1647957-1-niklas.soderlund+renesas@ragnatech.se>
 <20240619153559.1647957-2-niklas.soderlund+renesas@ragnatech.se>
 <20240619-passage-iodine-9f944b26a30d@spud>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240619-passage-iodine-9f944b26a30d@spud>

Hi Conor,

On 2024-06-19 18:33:37 +0100, Conor Dooley wrote:
> On Wed, Jun 19, 2024 at 05:35:58PM +0200, Niklas Söderlund wrote:
> > Document support for the VIN module in the Renesas V4M (r8a779h0) SoC.
> > 
> > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> Didn't we just have a conversation about this, yet nothing has changed?
> NAK. Either you need a fallback or to explain why a fallback is not
> suitable _in this patch_.

Sorry, I'm confused from the conclusion of our conversation in v2. I did 
add an explanation to why not fallback is used, but I added it to patch 
2/2 which adds the compatible to the driver.

It was my understanding that a SoC specific compatible was needed in 
either case so, at lest to me, made more sens to explain why in the 
driver patch the reason go into detail about the register differences 
between the two. Sorry if I misunderstood. I can add the same 
explanation to both patches, would this help explain why only a SoC 
specific value is added?

  The datasheet for the two SoCs have small nuances around the Pre-Clip
  registers ELPrC and EPPrC in three use-cases, interlaced images,
  embedded data and RAW8 input. On V4H the values written to the registers
  are based on odd numbers while on V4M they are even numbers, based on
  the input image size.

  No board that uses these SoCs which also have the external peripherals
  to test these nuances exists. Most likely this is an issue in the
  datasheet, but to make this easy to address in the future do not add a
  common Gen4 fallback compatible. Instead uses SoC specific compatibles
  for both SoCs. This is what was done for Gen3 SoCs, which also had
  similar nuances in the register documentation.

> 
> Thanks,
> Conor.
> 
> > ---
> >  Documentation/devicetree/bindings/media/renesas,vin.yaml | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/media/renesas,vin.yaml b/Documentation/devicetree/bindings/media/renesas,vin.yaml
> > index 5539d0f8e74d..168cb02f8abe 100644
> > --- a/Documentation/devicetree/bindings/media/renesas,vin.yaml
> > +++ b/Documentation/devicetree/bindings/media/renesas,vin.yaml
> > @@ -54,6 +54,7 @@ properties:
> >                - renesas,vin-r8a77995 # R-Car D3
> >                - renesas,vin-r8a779a0 # R-Car V3U
> >                - renesas,vin-r8a779g0 # R-Car V4H
> > +              - renesas,vin-r8a779h0 # R-Car V4M
> >  
> >    reg:
> >      maxItems: 1
> > -- 
> > 2.45.2
> > 



-- 
Kind Regards,
Niklas Söderlund

