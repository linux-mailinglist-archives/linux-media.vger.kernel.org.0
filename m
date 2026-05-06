Return-Path: <linux-media+bounces-60512-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aJlfDTHh+mmGTgMAu9opvQ
	(envelope-from <linux-media+bounces-60512-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 08:35:29 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A2FBB4D6A3C
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 08:35:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 66650303DAF2
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2026 06:34:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9276430E84E;
	Wed,  6 May 2026 06:34:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HIyZlqRL"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 676D730E0FB;
	Wed,  6 May 2026 06:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778049249; cv=none; b=ND/MbGk+/9vLUXPb2O4G3YXtzos0HHWt2ON+VphGwUZbKSkND2jZrnbEgpB2nlH08QNItnHJMqB/GHNV/fKSUAJFLQ6wIQD+FxdsbG/h+1k4ZVE5ABA1ilHdB/iTrFWO8hBDuHOeToNEpPt0/1Yn/C2tJIrPjvES5tGk3Tz763I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778049249; c=relaxed/simple;
	bh=N1gPF6I24WAX3b2agM4B9Zi9qI5BrXsXLnYKtaxwyG8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eiuiFaA95g70783U5yWgz9zw3pQsAj/3uTC6Do+nMQXeBQKDYYtIpdAeSnBMawiRLYm8a5xLc7YS9kiBmFbawZVARtk4ovWQONUVWIU8XxJ5fvsG4bW4lKy/wWijigvohDWdaeukLMg+KYEWrsgxZjvRBHpPm1cZqpNScAfangA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HIyZlqRL; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778049247; x=1809585247;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=N1gPF6I24WAX3b2agM4B9Zi9qI5BrXsXLnYKtaxwyG8=;
  b=HIyZlqRLZTW41zoGXpbJZR0jAKox0wD4d0y4SQqVSlffOMc5C6Axz3iK
   A90x6WwiiQqrhrrgoc6+RhDCyVgHThIVF4BSVMreqbw1PZGhmcHpg1UEK
   j/ezKJ/CKn7hK/+2ZoK9ua8UnlfW+RrZo3LJQq3zVU2Po7/RVJ/kOub/0
   Bt8sTIpZuPFjh8oz/hjMclZYaHqk+oc9ddAfHFh2FVehIgY1wpwwUHcbA
   zHPrbKt3Fn/ov6dhCO5q+aaP0QB7yBNMQoi6p8n0MB5q7JpEQDwQfNx3I
   6dbhrIra1BQcC92UfZuw6HspZV7JYWzLCyuRqxu2I1y198IyfoqUE9zhs
   w==;
X-CSE-ConnectionGUID: T56nFJm0T/y5E9KlrfFDVQ==
X-CSE-MsgGUID: Q+i/E1OcQkqNfr18hgitPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11777"; a="66476343"
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; 
   d="scan'208";a="66476343"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2026 23:31:05 -0700
X-CSE-ConnectionGUID: GFRo0gviTBedg75rJlVcpA==
X-CSE-MsgGUID: chnJEj+/Q16lp0Pg/ZnV9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; 
   d="scan'208";a="233386119"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.191])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2026 23:31:03 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 67130121CAF;
	Wed, 06 May 2026 09:31:04 +0300 (EEST)
Date: Wed, 6 May 2026 09:31:04 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Svyatoslav Ryhel <clamor95@gmail.com>, Rob Herring <robh@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/1] dt-bindings: media: mt9m114: document common
 video device properties
Message-ID: <afrgKNZYdsfsbZC8@kekkonen.localdomain>
References: <20260406081330.30362-1-clamor95@gmail.com>
 <20260406081330.30362-2-clamor95@gmail.com>
 <20260416214025.GG1824072@killaraus.ideasonboard.com>
 <CAPVz0n0uEsJg94GUky8cF7LNpejfpYxY9vLCY1iv5HYoxE_WeQ@mail.gmail.com>
 <20260505233032.GH1598374@killaraus.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260505233032.GH1598374@killaraus.ideasonboard.com>
X-Rspamd-Queue-Id: A2FBB4D6A3C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-60512-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,kekkonen.localdomain:mid]

On Wed, May 06, 2026 at 02:30:32AM +0300, Laurent Pinchart wrote:
> On Tue, May 05, 2026 at 08:29:30AM +0300, Svyatoslav Ryhel wrote:
> > пт, 17 квіт. 2026 р. о 00:40 Laurent Pinchart пише:
> > > On Mon, Apr 06, 2026 at 11:13:30AM +0300, Svyatoslav Ryhel wrote:
> > > > Document common video interface device properties, such as rotation and
> > > > orientation.
> > > >
> > > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > >
> > > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > >
> > > > ---
> > > >  .../devicetree/bindings/media/i2c/onnn,mt9m114.yaml          | 5 ++++-
> > > >  1 file changed, 4 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/media/i2c/onnn,mt9m114.yaml b/Documentation/devicetree/bindings/media/i2c/onnn,mt9m114.yaml
> > > > index e896f4db2421..2b39614f5cbf 100644
> > > > --- a/Documentation/devicetree/bindings/media/i2c/onnn,mt9m114.yaml
> > > > +++ b/Documentation/devicetree/bindings/media/i2c/onnn,mt9m114.yaml
> > > > @@ -15,6 +15,9 @@ description: |-
> > > >    an I2C interface and outputs image data over a 8-bit parallel or 1-lane MIPI
> > > >    CSI-2 connection.
> > > >
> > > > +allOf:
> > > > +  - $ref: /schemas/media/video-interface-devices.yaml#
> > > > +
> > > >  properties:
> > > >    compatible:
> > > >      enum:
> > > > @@ -90,7 +93,7 @@ required:
> > > >    - vaa-supply
> > > >    - port
> > > >
> > > > -additionalProperties: false
> > > > +unevaluatedProperties: false
> > > >
> > > >  examples:
> > > >    - |
> > >
> > > --
> > > Regards,
> > >
> > > Laurent Pinchart
> > 
> > I am looping in Sakari since they are i2c media devices maintainer and
> > this patch touches i2c camera binding (get_maintainer for some reason
> > did not include them).
> > 
> > Hello Sakari, Rob!
> > 
> > This patch hangs in the LKML for quite a while, and if no one has any
> > objections may it be applied?
> 
> This should normally go through Sakari's tree.

I'm in the process of picking these up. Please be patient. :-)

-- 
Sakari Ailus

