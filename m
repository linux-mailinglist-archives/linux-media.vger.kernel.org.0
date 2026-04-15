Return-Path: <linux-media+bounces-58812-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YBChBxdf32m5SAAAu9opvQ
	(envelope-from <linux-media+bounces-58812-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2026 11:49:11 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 94632402D50
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2026 11:49:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 19742300E286
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2026 09:49:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88C2A33F360;
	Wed, 15 Apr 2026 09:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jHSYmTew"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E687E49620;
	Wed, 15 Apr 2026 09:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776246545; cv=none; b=E9qybaUXyvRZKeim66zzkNDePm7FA+5ocaywTqtZ+Oehksw8AfleatSrHC531kFOoz18/Hk6ZCAv0JkoZnofmBXiPsL8GX0O2STQp/+mjAhrLyMQmQT4yc9cmbt7wPaA4iHSlU16oW9PHIwqBbwt7AyJDpDmkP8h4O91MAxmmaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776246545; c=relaxed/simple;
	bh=OPSManH+jTZmiMkHIrnnuu40Oe35ldc++5hslhv84s8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q7MZiLSHw0iGB1GC5nO1JrU23pjCCH0jd58tKosFCMV2VOvcpe4taUDneC2h6c99h7/45fDbgLsg1ZLbHBuJ1kIaiKCrgQ8dlg3IzzSfJEWpaC5EcP2xRyCKfzszxPqlAH8Nm8HQwZ2jF1CAbD6FF8PyHKFwbggQ7No9zY7v0qM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jHSYmTew; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776246543; x=1807782543;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OPSManH+jTZmiMkHIrnnuu40Oe35ldc++5hslhv84s8=;
  b=jHSYmTewacOqCLYtjgKcwW3rYEvYElybpkJGnO6aa1hcDyO2MGj3vOgD
   ISCKUcQ6MNhXOg8a63jyMAPt1Ov0nYiTa15rUwEeceue7eqL9v4vLls48
   YNHgHa+HT5hTfcfBYOaEaHCwSJuSb7ZgcfNoOJ/KPjBxm+BnPhy2QsPZA
   tY9rrsq9Zspqk/cfNsn1KKAJpWgFC5CY08Ep4hbNs8RMkK252MfpyNsbs
   PgqBbX6ZCdYwY5scxZVMx6gc9W8B5oQjSd9mCuWSq0BBdMD+jTr8M5wYV
   w3dfjwZwT0KTtQ4hEcgQFzH/v5CVdHz3WruOyowyCOPFl1chRUfYyBpPx
   w==;
X-CSE-ConnectionGUID: HyntHTdhQAeKBmHIO5a2Iw==
X-CSE-MsgGUID: MrVESaDJTAiRgw4npMv3SA==
X-IronPort-AV: E=McAfee;i="6800,10657,11759"; a="80815273"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="80815273"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2026 02:49:02 -0700
X-CSE-ConnectionGUID: A6qVCW9bRLGDOxkJmud2ww==
X-CSE-MsgGUID: E6Cp6JlaTOGjxIUxqLR9kQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="268366630"
Received: from rvuia-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.58])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2026 02:48:57 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 5DD6311FBE3;
	Wed, 15 Apr 2026 12:49:15 +0300 (EEST)
Date: Wed, 15 Apr 2026 12:49:15 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
	tarang.raval@siliconsignals.io,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Jingjing Xiong <jingjing.xiong@intel.com>,
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Svyatoslav Ryhel <clamor95@gmail.com>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: media: i2c: Add os02g10 sensor
Message-ID: <ad9fG7PpyQzlCNKd@kekkonen.localdomain>
References: <20260414084952.217215-1-elgin.perumbilly@siliconsignals.io>
 <20260414084952.217215-2-elgin.perumbilly@siliconsignals.io>
 <63b6d2a0-c67c-4099-8477-f3b7241e3885@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <63b6d2a0-c67c-4099-8477-f3b7241e3885@kernel.org>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[siliconsignals.io,kernel.org,oss.qualcomm.com,linaro.org,linux.intel.com,ideasonboard.com,foss.st.com,gmail.com,intel.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-58812-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,intel.com:dkim]
X-Rspamd-Queue-Id: 94632402D50
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Krzysztof,

On Wed, Apr 15, 2026 at 11:03:51AM +0200, Krzysztof Kozlowski wrote:
> On 14/04/2026 10:49, Elgin Perumbilly wrote:
> > +
> > +    properties:
> > +      endpoint:
> > +        $ref: /schemas/media/video-interfaces.yaml#
> > +        unevaluatedProperties: false
> > +
> > +        properties:
> > +          data-lanes:
> > +            items:
> > +              - const: 1
> > +              - const: 2
> 
> This looks completely fixed per model. If device cannot work with four
> lanes, then you simply don't need this property. It's deducible from the
> compatible.

Presumably one lane is enough for the sensor even if the driver only
supports two lane operation.

-- 
Regards,

Sakari Ailus

