Return-Path: <linux-media+bounces-66133-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 76FcOTryQ2r1lwoAu9opvQ
	(envelope-from <linux-media+bounces-66133-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 18:43:38 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 564FA6E692D
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 18:43:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=mess.org header.s=2020 header.b=EbaKLHDH;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66133-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-66133-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=mess.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7877F30C4B3E
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 16:39:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACDD93CA4B6;
	Tue, 30 Jun 2026 16:39:58 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from extorris.mess.org (extorris.mess.org [92.243.27.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D725D25B0B7;
	Tue, 30 Jun 2026 16:39:56 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782837598; cv=none; b=pK1LnhSsT7p0sn/TjFFmQoO/X8+rEXKsQp0Z5Iw6K4MgKo1KRrLETfIplrGHTtogpTJP6cd1Z5ce38SS8iPhHEjViufyx+HEKQwjzWEM+ko/7mgrn5PVlv96Zc+YPsY/yLes1kutex+XXnCJ+8ywXGCUoLwHYoF5gWYeW26v70Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782837598; c=relaxed/simple;
	bh=62Pps94gRIXRxKym5mdviKPCi6q8yM4B6mt9tZ7ALpM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PQ1LQMq3D1D8NW6PSPF3TYbqQkE75RHaBRST/238rcG7zjV/YOMzmNEftfCfNrZZzCtpr2jW60kYRPwNZaDBSeDRd6u00Cpfw8dLL06W8pMZ2HYl7jMYS4NhTJLokrY+RNQg/oXTNwa2EjRNEeg64WgeWR3u+JPwVflAKadqoXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org; spf=pass smtp.mailfrom=mess.org; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=EbaKLHDH; arc=none smtp.client-ip=92.243.27.206
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1782837589; bh=62Pps94gRIXRxKym5mdviKPCi6q8yM4B6mt9tZ7ALpM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EbaKLHDHkfZ+RG9y1FeeJy240F/CWdrHRnc1kkfvgethjk7wDidEUzEFHpY5AlL5y
	 ThN05uFWGeDImscud35QuYO+2007X1wKYONTaIsQ7GhwoeX3xIxjCON9Q7PCzoxZP0
	 ZnmrcudowQgTstoZphkELy+BW113uE1zBV3aJynrw2DbVOIM+U4q/vtmoWl4gJA5EG
	 XVLbhiIEP2maGeu/3SaKfcRoo15LTTMZxWZgSGsym0yUta7FQTKnrGpkpWCNduUtNy
	 C6OUDdrg1Cm5V6vJy1lvX/LztZ/uDXe2h3gs5eajblci0qMiThnXMM4fLBCCVQEwlZ
	 v5oJTKo6MgogQ==
Received: by extorris.mess.org (Postfix, from userid 1001)
	id 0969D41567; Tue, 30 Jun 2026 17:39:48 +0100 (BST)
Date: Tue, 30 Jun 2026 17:39:48 +0100
From: Sean Young <sean@mess.org>
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-media@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] media: dt-bindings: rc: Sync keymap list with latest
 list
Message-ID: <akPxVG7pA7gbN_An@extorris.mess.org>
References: <cover.1782300922.git.sean@mess.org>
 <2d87b050777b95ffe8adbdf156d2fb1de14c4dfb.1782300922.git.sean@mess.org>
 <akO_XqVQ-S72dveD@extorris.mess.org>
 <20260630161703.GA3798331-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260630161703.GA3798331-robh@kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mess.org,none];
	R_DKIM_ALLOW(-0.20)[mess.org:s=2020];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-66133-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:krzk+dt@kernel.org,m:linux-media@vger.kernel.org,m:mchehab@kernel.org,m:conor+dt@kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[sean@mess.org,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[mess.org:+];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sean@mess.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,mess.org:dkim,mess.org:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 564FA6E692D

On Tue, Jun 30, 2026 at 11:17:03AM -0500, Rob Herring wrote:
> On Tue, Jun 30, 2026 at 02:06:38PM +0100, Sean Young wrote:
> > Hi Rob, Krzysztof,
> >  
> > Could I have an Acked-by: please?
> 
> You can look at patchwork and see where you are in the queue. No 
> need to ping us. Plus, don't expect quick reviews during the merge 
> window.

Ok, understood. Will do next time.

Thanks,

Sean

