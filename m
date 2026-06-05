Return-Path: <linux-media+bounces-63898-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id lxEcLaLGImo5dgEAu9opvQ
	(envelope-from <linux-media+bounces-63898-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 05 Jun 2026 14:52:50 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E9AB64855A
	for <lists+linux-media@lfdr.de>; Fri, 05 Jun 2026 14:52:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=gm99anZ7;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63898-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-63898-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 29579302E325
	for <lists+linux-media@lfdr.de>; Fri,  5 Jun 2026 12:46:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CE674DA555;
	Fri,  5 Jun 2026 12:46:27 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBF2D4D90DD;
	Fri,  5 Jun 2026 12:46:22 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780663585; cv=none; b=liymmPXYiRvzSimBA6j7WWBlWQ4TZNjDFJ/uvuXMTtbC2DcZSScD5qIzEbGqkaNT6QxtjpKHGqEiox413lvEa35P8S7k8T4vaL70diVO+NF6cObiOAvsX4+FRUQ3gpxsGSP4poicrRSuM2SCVHCtXBUGxspE4tmpAPirsv77sIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780663585; c=relaxed/simple;
	bh=HS4vT1LK2ObIJQMChuYYpeUPcpK7uaSCLPp9fS2rFuI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LXPHzGKzMoLNJVJ/WkELGesuunmsg3F5hlk7JRCPk0AeEzKVHwvI6XA/BBSKEaXQ0d7LEGPW5sQwi0gq178alqpERqaWuZoSkxYEPrxtl8qMRo4tFuQ3JcTZtBD7sz2THm0vikmw/Mg695pvimtJCQjvzHnsP51D9FTRahS/FCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gm99anZ7; arc=none smtp.client-ip=192.198.163.17
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780663583; x=1812199583;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HS4vT1LK2ObIJQMChuYYpeUPcpK7uaSCLPp9fS2rFuI=;
  b=gm99anZ7/p3mDeKMiAknFIWFxS4EWt67v0wtThCps27+YRGhIdVIiCR/
   bruk4+J5vWgtCZ0X+bKB/IkKcAt3dLSI/QKl4TB6yMNxq6SpNIxpaRxOA
   rirLc4U06OBUjTc8qwJnVfJLIUR42xWyyDES16gsZWcqhp4uvzhTw2XKu
   ZHa/oTa1GCP7RQtQXvePFfQHTHHkq5HrhkeUA+07RH6u5F6I/9rBNjJef
   dQiqgr12fjmwXOKA3ePWmNIQpDLyPI/5imzSQRjunF1gAKIn+I30sYDB4
   7mt79N1JHLUtlqdN8mn6KKQC2X6EDK2CpQSsWrPrIliuNbSHXrIpY1Igk
   A==;
X-CSE-ConnectionGUID: t5ZJhAleSrG4BOrav2EnKQ==
X-CSE-MsgGUID: 1gXro8qhSeGAFGjy08ACEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11807"; a="81352219"
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; 
   d="scan'208";a="81352219"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2026 05:46:22 -0700
X-CSE-ConnectionGUID: bjbHTQQ0SXiCFqT9ytZjSg==
X-CSE-MsgGUID: JuS6m+FrTMmLce+6U/ZwFw==
X-ExtLoop1: 1
Received: from abityuts-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.207])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2026 05:46:19 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 3345E11FC2D;
	Fri, 05 Jun 2026 15:46:18 +0300 (EEST)
Date: Fri, 5 Jun 2026 15:46:18 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: github.com@herrie.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: media: i2c: add aptina,mt9m113
Message-ID: <aiLFGnMJmOG2PG-S@kekkonen.localdomain>
References: <20260605-submit-media-mt9m113-v3-0-dc3e07d5d70b@herrie.org>
 <20260605-submit-media-mt9m113-v3-1-dc3e07d5d70b@herrie.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260605-submit-media-mt9m113-v3-1-dc3e07d5d70b@herrie.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-63898-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:github.com@herrie.org,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:laurent.pinchart@ideasonboard.com,m:hverkuil+cisco@kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,vger.kernel.org:from_smtp,kekkonen.localdomain:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,linux.intel.com:from_mime,herrie.org:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5E9AB64855A

Hi Herman,

On Fri, Jun 05, 2026 at 09:03:00AM +0200, Herman van Hazendonk via B4 Relay wrote:
> From: Herman van Hazendonk <github.com@herrie.org>
> 
> Add the binding for the Aptina (now ON Semiconductor) MT9M113 1.3
> megapixel SoC image sensor with on-die ISP. The chip is used as the
> front (user-facing) camera on the HP TouchPad tablet and connects
> to the host SoC over MIPI CSI-2.
> 
> The binding describes the chip's i2c address, optional reset and
> standby GPIOs, the per-supply regulators (VDD, VDD_IO, VDDA), the
> external clock input, and the CSI-2 endpoint pads exposed via the
> "port" subnode.
> 
> Signed-off-by: Herman van Hazendonk <github.com@herrie.org>
> ---
>  .../bindings/media/i2c/aptina,mt9m113.yaml         | 127 +++++++++++++++++++++
>  1 file changed, 127 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/aptina,mt9m113.yaml b/Documentation/devicetree/bindings/media/i2c/aptina,mt9m113.yaml
> new file mode 100644
> index 000000000000..7fa7cb2fedf9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/aptina,mt9m113.yaml
> @@ -0,0 +1,127 @@

...

> +  port:
> +    $ref: /schemas/graph.yaml#/$defs/port-base
> +    additionalProperties: false
> +
> +    properties:
> +      endpoint:
> +        $ref: /schemas/media/video-interfaces.yaml#
> +        unevaluatedProperties: false
> +
> +        properties:
> +          bus-type:
> +            const: 4
> +            description: MIPI CSI-2 D-PHY
> +
> +          link-frequencies: true
> +          remote-endpoint: true
> +          data-lanes:
> +            minItems: 1
> +            maxItems: 1

If the maximum number of lanes is 1, the data-lanes property is redundant.
Please drop it.

-- 
Kind regards,

Sakari Ailus

